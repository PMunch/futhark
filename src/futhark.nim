import macros, strutils, os, json, tables, sets, sugar, hashes, std/compilesettings
import macroutils except Lit

const
  Stringable = {nnkStrLit..nnkTripleStrLit, nnkCommentStmt, nnkIdent, nnkSym}
  VERSION = "0.6.1"
  builtins = ["addr", "and", "as", "asm",
    "bind", "block", "break",
    "case", "cast", "concept", "const", "continue", "converter",
    "defer", "discard", "distinct", "div", "do",
    "elif", "else", "end", "enum", "except", "export",
    "finally", "for", "from", "func",
    "if", "import", "in", "include", "interface", "is", "isnot", "iterator",
    "let",
    "macro", "method", "mixin", "mod",
    "nil", "not", "notin",
    "object", "of", "or", "out",
    "proc", "ptr",
    "raise", "ref", "return",
    "shl", "shr", "static",
    "template", "try", "tuple", "type",
    "using",
    "var",
    "when", "while",
    "xor",
    "yield"]

template strCmp(node, value: untyped): untyped = node.kind in Stringable and node.strVal == value

type
  RenameCallback = proc(name: string, kind: string, partof = ""): string
  State = object
    entities: OrderedTable[string, JsonNode]
    opaqueTypes: HashSet[string]
    retypes: Table[string, Table[string, NimNode]]
    fieldRenames: Table[string, Table[string, string]]
    typeDefMap: Table[string, NimNode]
    typeNameMap: Table[string, NimNode]
    renamed: Table[string, string]
    usedNames: HashSet[string]
    used: HashSet[string]
    knownValues: HashSet[string]
    types: NimNode
    procs: NimNode
    extraTypes: NimNode
    renameCallback: RenameCallback

proc sanitizeName(usedNames: var HashSet[string], origName: string, kind: string, renameCallback: RenameCallback, partof = ""): string {.compileTime.} =
  result = origName
  if not renameCallback.isNil:
    result = result.renameCallback(kind, partof)
  if result.startsWith("_"):
    if result.startsWith("__"):
      result = "compiler_" & result[2..^1]
    else:
      result = "internal_" & result[1..^1]
  result = result.nimIdentNormalize()
  var renamed = false
  if usedNames.contains(result) or result in builtins:
    result.add kind
    renamed = true
  if usedNames.contains(result) or result in builtins:
    result.add hash(origName).toHex
    renamed = true
  if renamed:
    hint "Renaming \"" & origName & "\" to \"" & result & "\"" & (if partof.len != 0: " in " & partof else: "")
  usedNames.incl result

proc sanitizeName(state: var State, origName: string, kind: string): string {.compileTime.} =
  if not state.renamed.hasKey(origName):
    result = sanitizeName(state.usedNames, origName, kind, state.renameCallback)
    state.renamed[origName] = result
  else:
    result = state.renamed[origName]

proc sanitizeName(state: var State, x: JsonNode): string {.compileTime.} =
  state.sanitizeName(x["name"].str, x["kind"].str)

proc findAlias(kind: JsonNode): string =
  case kind["kind"].str:
  of "alias": kind["value"].str
  of "base", "special": ""
  of "pointer": findAlias(kind["base"])
  of "array": (if kind["value"].kind == JNull: "" else: findAlias(kind["value"]))
  of "struct", "union", "enum": (if kind.hasKey("name"): kind["name"].str else: "")
  of "proc": (if kind.hasKey("name"): kind["name"].str else: "")
  else:
    error("Unknown kind in findAlias: " & $kind)
    ""

proc addUsings(used: var HashSet[string], node: JsonNode) =
  case node["kind"].str:
  of "proc":
    let alias = node["return"].findAlias
    if alias.len != 0:
      used.incl alias
    for arg in node["arguments"]:
      var alias: string
      if arg.hasKey("type"):
        used.addUsings arg["type"]
        alias = arg["type"].findAlias
      else:
        used.addUsings arg
        alias = arg.findAlias
      if alias.len != 0:
        used.incl alias
  of "struct", "union":
    for field in node["fields"]:
      if field["type"].kind != JNull:
        case field["type"]["kind"].str:
        of "struct", "union", "pointer", "proc":
          used.addUsings field["type"]
        let alias = field["type"].findAlias
        if alias.len != 0:
          used.incl alias
  of "typedef":
    let alias = node["type"].findAlias
    if alias.len != 0:
      used.incl alias
    used.addUsings(node["type"])
  of "pointer":
    let alias = node["base"].findAlias
    if alias.len != 0:
      used.incl alias
    elif node["base"]["kind"].str == "proc":
      used.addUsings(node["base"])
  of "alias":
    used.incl node.findAlias
  of "enum", "base", "special": discard
  of "array":
    used.addUsings(node["value"])
  of "var":
    used.addUsings(node["type"])
  of "const":
    if node["type"]["kind"].str != "unknown":
      used.addUsings(node["type"])
  else:
    error("Unknown node in addUsings: " & $node)

proc toNimType(json: JsonNode, state: var State): NimNode =
  result = case json["kind"].str:
    of "base": json["value"].str.ident
    of "pointer":
      var node =
        case json["base"]["kind"].str:
        of "alias", "proc", "base":
          var node = json["base"].toNimType(state)
          if node.strCmp "void":
            node = "pointer".ident
          node
        else:
          "pointer".ident
      for i in 0..<json["depth"].num - (if node.strCmp("pointer") or json["base"]["kind"].str == "proc": 1 else: 0):
        node = nnkPtrTy.newTree(node)
      node
    of "proc":
      var procTy = nnkProcTy.newTree(
        nnkFormalParams.newTree(json["return"].toNimType(state)),
        nnkPragma.newTree(json["callingConvention"].str.ident))
      if json["variadic"].bval:
        procTy[^1].add "varargs".ident
      if json["return"]["kind"].str == "pointer" and json["return"]["base"]["kind"].str == "alias" and not state.entities.hasKey(json["return"]["base"]["value"].str):
        state.opaqueTypes.incl json["return"]["base"]["value"].str
      var
        i = 0
        usedFields: HashSet[string]
      for arg in json["arguments"]:
        let
          aname = if arg.hasKey("name"): usedFields.sanitizeName(arg["name"].str, "arg", state.renameCallback) else: "a" & $i
          atype = (if arg.hasKey("type"): arg["type"] else: arg).toNimType(state)
        if arg.hasKey("type"):
          if arg["type"]["kind"].str == "pointer" and arg["type"]["base"]["kind"].str == "alias" and not state.entities.hasKey(arg["type"]["base"]["value"].str):
            state.opaqueTypes.incl arg["type"]["base"]["value"].str
        procTy[0].add nnkIdentDefs.newTree(aname.ident, atype, newEmptyNode())
        inc i
      procTy
    of "array":
      if json.hasKey("size"):
        nnkBracketExpr.newTree("array".ident, json["size"].num.newLit, json["value"].toNimType(state))
      else:
        nnkPtrTy.newTree(nnkBracketExpr.newTree("UncheckedArray".ident, json["value"].toNimType(state)))
    of "alias":
      if not state.entities.hasKey(json["value"].str):
        state.opaqueTypes.incl json["value"].str
      state.typeNameMap[json["value"].str]
    of "enum":
      error "Unable to resolve nested enums from here"
      "invalidNestedEnum".ident
    of "struct", "union":
      error "Unable to resolve nested struct/union from here"
      "invalidNestedStruct".ident
    of "special":
      nnkTupleTy.newTree(
        newIdentDefs("low".ident, "uint64".ident),
        newIdentDefs("high".ident, (if json["value"].str == "uint128": "uint64" else: "int64").ident))
    else:
      warning "Unknown: " & $json
      "pointer".ident

proc createEnum(origName: string, node: JsonNode, state: var State, comment: string) =
  let
    name = state.sanitizeName(origName, "enum").ident
    baseType = node["base"].toNimType(state)
  var
    enumTy = nnkEnumTy.newTree(newEmptyNode())
    values: OrderedTable[int, NimNode]
    consts = newStmtList()
  for field in node["fields"]:
    let
      value = parseInt(field["value"].str)
      fname = state.sanitizeName(field["name"].str, "enumval").ident
    if origName.len == 0:
      consts.add superQuote do:
        const `fname`*: `baseType` = `newLit(value)`
    else:
      if not values.hasKey(value):
        values[value] = fname
      else:
        consts.add superQuote do:
          const `fname`* = `values[value]`
    state.knownValues.incl fname.strVal
  if origName.len != 0:
    values.sort(system.cmp)
    for value, name in values:
      enumTy.add nnkEnumFieldDef.newTree(name, value.newLit)
    var typedef = parseStmt("""
    type
      dummy = enum ## """ & comment & """
        ## This doesn't work for some reason
        dummy""")[0][0]
    typedef[0] = nnkPragmaExpr.newTree(name.postfix "*", nnkPragma.newTree(nnkExprColonExpr.newTree("size".ident, nnkCall.newTree("sizeof".ident, baseType))))
    typedef[2] = enumTy
    state.extraTypes.add quote do:
      when not declared(`name`):
        type
          `name`* {.size: sizeof(`baseType`).} = `enumTy`
      else:
        static: hint("Declaration of " & `origName` & " already exists, not redeclaring")
  state.extraTypes.add consts

proc createStruct(origName, saneName: string, node: JsonNode, state: var State, comment: string) =
  let name = block:
    let coreName = state.typeDefMap.getOrDefault(origName, origName.ident).postfix "*"
    var pragmas = @[ident"pure", ident"inheritable"]
    if node["kind"].str == "union":
      pragmas.add "union".ident
    if node.hasKey("packed") and node["packed"].bval == true:
      pragmas.add "packed".ident
    if pragmas.len > 0:
      nnkPragmaExpr.newTree(coreName, nnkPragma.newTree(pragmas))
    else:
      coreName
  # This is a bit of a hack, but the only way to get a comment into an object..
  var newType = parseStmt("""
  type
    dummy = object
      ## """ & comment)[0][0]
  newType[0] = name
  var
    lastFieldType: JsonNode
    usedFieldNames: HashSet[string]
    anons = 0
  for field in node["fields"]:
    let fieldType =
      if field["type"].kind == JNull:
        lastFieldType
      elif field["type"]["kind"].str == "array" and field["type"]["value"].kind == JNull:
        var nFieldType = field["type"]
        nFieldType["value"] = lastFieldType
        nFieldType
      else:
        field["type"]
    let (saneFieldName, fname) =
      if field.hasKey("name"):
        let
          saneFieldName = usedFieldNames.sanitizeName(field["name"].str, "field", state.renameCallback, partof = saneName)
          fname =
            if state.fieldRenames.hasKey(origName):
              state.fieldRenames[origName].getOrDefault(field["name"].str, saneFieldName)
            else: saneFieldName
        (saneFieldName, fname)
      else:
        let name = usedFieldNames.sanitizeName("anon" & $anons, "field", state.renameCallback, partof = saneName)
        inc anons
        (name, name)
    let fident =
      if node.hasKey("alignment"):
        nnkPragmaExpr.newTree(fname.ident.postfix "*", nnkPragma.newTree(nnkCall.newTree("align".ident, newLit(node["alignment"].num))))
      else:
        fname.ident.postfix "*"
    if state.retypes.hasKey(saneName) and state.retypes[saneName].hasKey(fname):
      newType[^1][^1].add newIdentDefs(fident, state.retypes[saneName][fname])
    else:
      if fieldType["kind"].str == "pointer" and fieldType["base"]["kind"].str == "alias" and not state.entities.hasKey(fieldType["base"]["value"].str):
        state.opaqueTypes.incl fieldType["base"]["value"].str
      if fieldType["kind"].str == "enum":
        let enumName = saneName & "_" & fname & "_t"
        createEnum(enumName, fieldType, state, "")
        newType[^1][^1].add newIdentDefs(fident, enumName.ident)
      elif fieldType["kind"].str in ["struct", "union"]:
        let
          structName = saneName & "_" & fname & "_t"
        createStruct(structName, structName, fieldType, state, "")
        newType[^1][^1].add newIdentDefs(fident, structName.ident)
      elif fieldType["kind"].str == "array" and fieldType["value"]["kind"].str in ["struct", "union"]:
        let
          structName = saneName & "_" & fname & "_t"
        createStruct(structName, structName, fieldType["value"], state, "")
        # Kind of a hack, rename the array to a base kind to just have it use the name directly
        var generated = fieldType
        generated["value"] = %*{"kind": "base", "value": structName}
        newType[^1][^1].add newIdentDefs(fident, generated.toNimType(state))
      else:
        newType[^1][^1].add newIdentDefs(fident, fieldType.toNimType(state))
    #else:
    #  if fieldType["kind"].str in ["struct", "union"] and fieldType.hasKey("name"):
    #    if not state.entities.hasKey(fieldType["name"].str):
    #      state.opaqueTypes.incl fieldType["name"].str
    #  else:
    #    warning "Unhandled anonymous field: " & $field
    lastFieldType = fieldType
  state.types.add newType

proc createProc(origName: string, node: JsonNode, state: var State) =
  if node["inlined"].getBool: return
  let nameIdent = state.renamed[origName].ident
  var def = node.toNimType(state)
  def[1].add nnkExprColonExpr.newTree("importc".ident, newLit(origName))
  def = nnkProcDef.newTree(
    nameIdent.postfix "*",
    newEmptyNode(),
    newEmptyNode(),
    def[0],
    def[1],
    newEmptyNode(),
    newEmptyNode()
  )
  state.procs.add quote do:
    when not declared(`nameIdent`):
      `def`
    else:
      static: hint("Declaration of " & `origName` & " already exists, not redeclaring")

proc createVar(origName: string, node: JsonNode, state: var State) =
  let
    nameIdent = state.renamed[origName].ident
    typeIdent = node["type"].toNimType(state)
  if node["pragmas"].len == 0:
    state.procs.add quote do:
      when not declared(`nameIdent`):
        var `nameIdent`*: `typeIdent`
      else:
        static: hint("Declaration of " & `origName` & " already exists, not redeclaring")
  else:
    var pragmaExpr = nnkPragmaExpr.newTree(nameIdent, nnkPragma.newTree())
    for pragma in node["pragmas"]:
      pragmaExpr[^1].add pragma.str.ident
    state.procs.add quote do:
      when not declared(`nameIdent`):
        var `pragmaExpr`*: `typeIdent`
      else:
        static: hint("Declaration of " & `origName` & " already exists, not redeclaring")

proc createConst(origName: string, node: JsonNode, state: var State, comment: string) =
  let
    nameIdent = state.renamed[origName].ident
    value =
      if node["type"]["kind"].str == "alias":
        if state.typeNameMap.hasKey(node["type"]["value"].str):
          node["type"].toNimType(state)
        else:
          state.renamed[node["type"]["value"].str].ident
      elif node["type"]["kind"].str == "unknown":
        if node["value"].kind == JInt:
          let intNode = newNimNode(nnkIntLit)
          intNode.intVal = node["value"].num
          intNode
        else: return
      elif node["value"].kind == JInt:
        nnkCast.newTree(node["type"].toNimType(state), newLit(node["value"].num))
      else: return
  let
    newConstValueStmt = parseStmt("const " & state.renamed[origName] & "* = " & value.repr & " ## " & comment)
    newLetValueStmt = parseStmt("let " & state.renamed[origName] & "* = " & value.repr & " ## " & comment)
  if node["type"]["kind"].str == "alias":
    if value == nameIdent: return
    let newConstTypeStmt = parseStmt("type " & state.renamed[origName] & "* = " & value.repr & " ## " & comment)
    if (state.typeNameMap.hasKey(node["type"]["value"].str) or state.knownValues.contains node["type"]["value"].str):
      state.procs.add quote do:
        when not declared(`nameIdent`):
          when `value` is typedesc:
            `newConstTypeStmt`
          else:
            when `value` is static:
              `newConstValueStmt`
            else:
              `newLetValueStmt`
        else:
          static: hint("Declaration of " & `origName` & " already exists, not redeclaring")
  else:
    state.knownValues.incl nameIdent.strVal
    state.procs.add quote do:
      when not declared(`nameIdent`):
        when `value` is static:
          `newConstValueStmt`
        else:
          `newLetValueStmt`
      else:
        static: hint("Declaration of " & `origName` & " already exists, not redeclaring")

type
  FromTo = tuple[f, t: string]

macro importc*(imports: varargs[untyped]): untyped =
  ## Generate code from C imports. String literals will be treated as files to
  ## `#include`. Paths can be added with `path <string literal>`, which are
  ## relative to your project folder, `absPath` can be used to supply absolute
  ## paths. Defines and undefines can be done with `define <name> <value>` and
  ## `undef <name>` respectively. Arguments for the compiler can be passed with
  ## `compilerarg <argument>`. To rename a structure or a field within a
  ## structure you can use `rename <name or name.field> <new name>`. And fields
  ## can be defined to have a different type with
  ## `retype <name.field> <new type>`, this is to allow more specific types to
  ## resolve `ptr`/`UncheckedArray` ambiguity and stricter types for e.g.
  ## overloading.
  result = newStmtList()
  var nodes = imports
  if imports[0].kind == nnkStmtList:
    nodes = imports[0]
  var
    defs = newLit("")
    files = nnkBracket.newTree()
    importDirs = nnkBracket.newTree()
    cargs = nnkBracket.newTree()
    renames: seq[FromTo]
    retypes: seq[FromTo]
    renameCallback = newNilLit()
  for node in nodes:
    case node.kind:
    of nnkStrLit:
      defs = nnkInfix.newTree("&".ident, defs, newLit("#include \"" & node.strVal & "\"\n"))
      files.add newLit(node.strVal)
    of nnkCallKinds:
      case node[0].strVal.toLower:
      of "define":
        if node.len == 3:
          defs = nnkInfix.newTree("&".ident, defs, newLit("#define " & node[1].strVal & " " & node[2].repr & "\n"))
        else:
          defs = nnkInfix.newTree("&".ident, defs, newLit("#define " & node[1].strVal & "\n"))
      of "undef":
        defs = nnkInfix.newTree("&".ident, defs, newLit("#undef " & node[1].strVal & "\n"))
      of "path":
        cargs.add superQuote do: "-I" & absolutePath(`node[1]`, getProjectPath())
        importDirs.add superQuote do: absolutePath(`node[1]`, getProjectPath())
      of "syspath":
        cargs.add superQuote do: "-I" & absolutePath(`node[1]`, getProjectPath())
      of "compilerarg":
        cargs.add node[1]
      of "rename":
        let
          f = if node[1].kind in Stringable: node[1].strVal else: node[1].repr
          t = if node[2].kind in Stringable: node[2].strVal else: node[2].repr
        renames.add (f: f, t: t)
      of "retype":
        assert node[1].kind == nnkDotExpr, "Retypes must target a field within an object"
        retypes.add (f: node[1].repr, t: node[2].repr)
      of "renamecallback":
        renameCallback = node[1]
      else:
        let toImport = genSym(nskConst)
        result.add quote do:
          const `toImport` = `node`
        defs = quote do: `defs` & ("#include " & `toImport` & "\n")
        files.add toImport
    else: error "Unknown argument passed to importc: " & $node.repr
  result.add quote do: importcImpl(`defs`, `cargs`, `files`, `importDirs`, `renames`, `retypes`, RenameCallback(`renameCallback`))

macro importcImpl*(defs: static[string], compilerArguments, files: static[openArray[string]], importDirs: static[openArray[string]], renames, retypes: static[openArray[FromTo]], renameCallback: static[RenameCallback]): untyped =
  ## Generate code from C header file. A string, `defs`, containing a header
  ## file with `#include` statements, preprocessor defines and rules, etc. to
  ## be converted is compiled with `compilerArguments` passed directly to clang.
  ## All the symbols defined in any of the `files` listed and all their
  ## dependant types will be declared. To rename a type or field pass a series
  ## of tuples to `renames`. And to declare a different type for a field in a
  ## struct pass a series of tuples to `retypes`. See the module documentation
  ## for the format. This is used by `importc` internally.
  ##
  ## See also:
  ## * `importc(varargs[untyped]) <#importc,varargs[untyped]>`_

  let
    cacheDir = querySetting(nimcacheDir)
    fname = cacheDir / "futhark-includes.h"
    cmd = "opir " & compilerArguments.join(" ") & " " & fname
    opirHash = hash(defs) !& hash(cmd) !& hash(VERSION)
    renameCallbackSym = quote: `renameCallback`
    fullHash = !$(hash(renames) !& hash(retypes) !& opirHash !& hash(if renameCallback.isNil: "" else: renameCallbackSym[0].symBodyHash))
    futharkCache = cacheDir / "futhark_" & fullHash.toHex & ".nim"
    opirCache = cacheDir / "opir_" & (!$opirHash).toHex & ".json"
    extraFiles = block:
      var files: HashSet[string]
      for dir in importDirs:
        for file in dir.walkDirRec:
          files.incl file
      files

  # Check if everything can be skipped and we can simply include our cached results
  if fileExists(futharkCache) and not defined(futharkRebuild):
    hint "Using cached Futhark output: " & futharkCache
    return quote do:
      include `futharkCache`

  # Check if we have an old Opir output and the user just specified different post-processing steps
  let output =
    if fileExists(opirCache) and not defined(opirRebuild):
      hint "Using cached Opir output: " & opirCache
      staticRead(opirCache)
    else:
      discard staticExec("mkdir " & fname.parentDir)
      writeFile(fname, defs)
      hint "Running: " & cmd
      let opirRes = gorgeEx(cmd)
      if opirRes.exitCode != 0:
        var err = "Opir exited with non-zero exit code $1." % $opirRes.exitCode
        if opirRes.output != "":
          err.add "\nOpir output: \n" & opirRes.output
        # Seems like opir wasn't found (gorgeEx returns -1 exit code on OSError/IOError)
        if opirRes.output == "" and opirRes.exitCode == -1:
          err.add " Are you sure opir is in PATH?"
        error err
        "" # error is not noreturn
      else:
        let opirOutput = opirRes.output.strip(chars=Whitespace).splitLines
        for i in 0..<opirOutput.high:
          echo opirOutput[i]
        opirOutput[^1]


  hint "Parsing Opir output"
  # TODO: Clear out old cache files?
  let
    fut = try:
      output.parseJson
    except JsonParsingError:
      nil
  if fut == nil:
    error "Unable to parse output of opir:\n" & output

  if not fileExists(opirCache) or defined(opirRebuild):
    hint "Caching Opir output in " & opirCache
    writeFile(opirCache, output)

  hint "Generating Futhark output"
  var state = State(
    types: newNimNode(nnkTypeSection),
    procs: newStmtList(),
    extraTypes: newStmtList(),
    renameCallback: renameCallback)

  # Add explicit field renames
  for rename in renames:
    let oldName = rename.f.split('.')
    if oldName.len == 2:
      state.fieldRenames.mgetOrPut(oldName[0], default(Table[string, string]))[oldName[1]] = rename.t.nimIdentNormalize()
    else:
      state.renamed[oldname[0]] = rename.t.nimIdentNormalize()

  # Gather symbols from first level of hierarchy
  for node in fut:
    let name = if node.hasKey("name"): node["name"].str else: ""
    if node.hasKey("name"):
      state.entities[name] = node
    # This triggers an error in the example, it needs to be compiled twice for it to work
    #if node["kind"].str == "const":
    #  state.used.incl node["name"].str
    var shouldImport = node["file"].str in extraFiles
    if not shouldImport:
      for file in files:
        if node["file"].str.endsWith file:
          shouldImport = true
          break
    if shouldImport:
      if node.hasKey("name"):
        if not state.used.contains name:
          discard state.sanitizeName(node)
        state.used.incl name
        state.used.addUsings node
      else:
        if node["kind"].str == "enum":
          createEnum("", node, state, "")
        else:
          warning "Anonymous global: " & $node

  # Find all imported symbols we need
  var usedLen = 0
  while state.used.len > usedLen:
    usedLen = state.used.len
    var newUsed = initHashSet[string]()
    for name in state.used:
      if state.entities.hasKey(name):
        newUsed.addUsings(state.entities[name])
    state.used.incl newUsed

  # Generate temporary names to allow overriding definitions
  for name in state.used:
    if state.entities.hasKey(name):
      let saneName = if state.renamed.hasKey(name): state.renamed[name] else: state.sanitizeName(state.entities[name])
      if state.entities[name]["kind"].str notin ["proc", "var", "const"]:
        state.typeDefMap[name] = genSym(nskType, saneName)
        state.typeNameMap[name] = genSym(nskType, saneName)

      if state.entities[name]["kind"].str == "typedef":
        if state.entities[name]["type"]["kind"].str == "base" and state.entities[name]["type"]["value"].str == "void":
          state.typeDefMap[name] = bindSym("void")
          state.typeNameMap[name] = bindSym("void")
    else:
      state.typeNameMap[name] = state.sanitizeName(name, "anon").ident

  # Add explicit type name changes
  for retype in retypes:
    var newType = parseExpr(retype.t)
    newType.forNode(nnkIdent, (x) => state.typeNameMap.getOrDefault(x.strVal, x))
    var fieldName = retype.f.split('.')
    state.retypes.mgetOrPut(fieldName[0].nimIdentNormalize, default(Table[string, NimNode]))[fieldName[1].nimIdentNormalize] = newType

  # Generate Nim code from Opir output with applicable post-processing
  for elem in state.used:
    if state.entities.hasKey elem:
      let
        node = state.entities[elem]
        comment = "Generated based on " & node["file"].str & ":" & $node["position"]["line"].num & ":" & $node["position"]["column"].num
      case node["kind"].str:
      of "struct", "union":
        createStruct(node["name"].str, state.renamed[node["name"].str], node, state, comment)
      of "typedef":
        var newType = parseStmt("type dummy = dummy ## " & comment)[0][0]
        newType[0] = state.typeDefMap[node["name"].str].postfix "*"
        newType[^1] = node["type"].toNimType(state)
        if newType[^1].kind == nnkIdent and newType[^1].strVal == "void":
          continue
        state.types.add newType
      of "enum":
        createEnum(node["name"].str, node, state, comment)
      of "proc":
        createProc(elem, node, state)
      of "var":
        createVar(elem, node, state)
      of "const":
        createConst(elem, node, state, comment)
      else:
        warning "Unknown node kind: " & $node["kind"]
      #else:
      #  echo "Unknown name: ", elem

  # Add non-dependant types and auxilary types
  result = newStmtList()
  result.add quote do:
    from macros import hint
  result.add state.extraTypes

  # Generate required opaque types
  for o in state.opaqueTypes:
    let
      origIdent = state.renamed[o].ident
      ident = state.typeDefMap.getOrDefault(o, origIdent)
    result.add quote do:
      when not declared(`origIdent`):
        type
          `ident`* = distinct object
      else:
        static: hint("Declaration of " & `o` & " already exists, not redeclaring")

  # Generate conditionals to define inner object types if not previously defined
  for name, defIdent in state.typeDefMap:
    if defIdent.strVal == "void": continue
    let
      origIdent = state.renamed[name].ident
      nameIdent = state.typeNameMap[name]
    state.types.add (quote do:
      type
        `nameIdent`* = (when declared(`origIdent`): `origIdent` else: `defIdent`))[0]
  result.add state.types

  # Generate conditionals to define objects if not previously defined
  for name, defIdent in state.typeDefMap:
    if defIdent.strVal == "void": continue
    let origIdent = state.renamed[name].ident
    if state.entities[name]["kind"].str != "enum":
      result.add quote do:
        when not declared(`origIdent`):
          type
             `origIdent`* = `defIdent`
        else:
          static: hint("Declaration of " & `name` & " already exists, not redeclaring")

  # Add generated procedures
  result.add state.procs

  # Cache results
  hint "Caching Futhark output in " & futharkCache
  writeFile(futharkCache, result.repr)
