import macros, strutils, os, json, tables, sets, sugar, hashes, std/compilesettings
import macroutils except Lit

var
  # TODO: Rethink this..
  typeRenames {.compileTime.} = {"addr": (name: "addr_t", uses: 0), "and": (name: "and_t", uses: 0), "as": (name: "as_t", uses: 0), "asm": (name: "asm_t", uses: 0),
    "bind": (name: "bind_t", uses: 0), "block": (name: "block_t", uses: 0), "break": (name: "break_t", uses: 0),
    "case": (name: "case_t", uses: 0), "cast": (name: "cast_t", uses: 0), "concept": (name: "concept_t", uses: 0), "const": (name: "const_t", uses: 0), "continue": (name: "continue_t", uses: 0), "converter": (name: "converter_t", uses: 0),
    "defer": (name: "defer_t", uses: 0), "discard": (name: "discard_t", uses: 0), "distinct": (name: "distinct_t", uses: 0), "div": (name: "div_t", uses: 0), "do": (name: "do_t", uses: 0),
    "elif": (name: "elif_t", uses: 0), "else": (name: "else_t", uses: 0), "end": (name: "end_t", uses: 0), "enum": (name: "enum_t", uses: 0), "except": (name: "except_t", uses: 0), "export": (name: "export_t", uses: 0),
    "finally": (name: "finally_t", uses: 0), "for": (name: "for_t", uses: 0), "from": (name: "from_t", uses: 0), "func": (name: "func_t", uses: 0),
    "if": (name: "if_t", uses: 0), "import": (name: "import_t", uses: 0), "in": (name: "in_t", uses: 0), "include": (name: "include_t", uses: 0), "interface": (name: "interface_t", uses: 0), "is": (name: "is_t", uses: 0), "isnot": (name: "isnot_t", uses: 0), "iterator": (name: "iterator_t", uses: 0),
    "let": (name: "let_t", uses: 0),
    "macro": (name: "macro_t", uses: 0), "method": (name: "method_t", uses: 0), "mixin": (name: "mixin_t", uses: 0), "mod": (name: "mod_t", uses: 0),
    "nil": (name: "nil_t", uses: 0), "not": (name: "not_t", uses: 0), "notin": (name: "notin_t", uses: 0),
    "object": (name: "object_t", uses: 0), "of": (name: "of_t", uses: 0), "or": (name: "or_t", uses: 0), "out": (name: "out_t", uses: 0),
    "proc": (name: "proc_t", uses: 0), "ptr": (name: "ptr_t", uses: 0),
    "raise": (name: "raise_t", uses: 0), "ref": (name: "ref_t", uses: 0), "return": (name: "return_t", uses: 0),
    "shl": (name: "shl_t", uses: 0), "shr": (name: "shr_t", uses: 0), "static": (name: "static_t", uses: 0),
    "template": (name: "template_t", uses: 0), "try": (name: "try_t", uses: 0), "tuple": (name: "tuple_t", uses: 0), "type": (name: "type_t", uses: 0),
    "using": (name: "using_t", uses: 0),
    "var": (name: "var_t", uses: 0),
    "when": (name: "when_t", uses: 0), "while": (name: "while_t", uses: 0),
    "xor": (name: "xor_t", uses: 0),
    "yield": (name: "yield_t", uses: 0)}.toTable
  argRenames {.compileTime.} = {"addr": "addra", "and": "anda", "as": "asa", "asm": "asma",
    "bind": "binda", "block": "blocka", "break": "breaka",
    "case": "casea", "cast": "casta", "concept": "concepta", "const": "consta", "continue": "continuea", "converter": "convertera",
    "defer": "defera", "discard": "discarda", "distinct": "distincta", "div": "diva", "do": "doa",
    "elif": "elifa", "else": "elsea", "end": "enda", "enum": "enuma", "except": "excepta", "export": "exporta",
    "finally": "finallya", "for": "fora", "from": "froma", "func": "funca",
    "if": "ifa", "import": "importa", "in": "ina", "include": "includea", "interface": "interfacea", "is": "isa", "isnot": "isnota", "iterator": "iteratora",
    "let": "leta",
    "macro": "macroa", "method": "methoda", "mixin": "mixina", "mod": "moda",
    "nil": "nila", "not": "nota", "notin": "notina",
    "object": "objecta", "of": "ofa", "or": "ora", "out": "outa",
    "proc": "proca", "ptr": "ptra",
    "raise": "raisea", "ref": "refa", "return": "returna",
    "shl": "shla", "shr": "shra", "static": "statica",
    "template": "templatea", "try": "trya", "tuple": "tuplea", "type": "typea",
    "using": "usinga",
    "var": "vara",
    "when": "whena", "while": "whilea",
    "xor": "xora",
    "yield": "yielda"}.toTable

proc sanitizeName(x: string, checkOnly = false): string {.compileTime.} =
  result = x
  if result.startsWith("_"):
    if result.startsWith("__"):
      result = "compiler_" & result[2..^1]
    else:
      result = "internal_" & result[1..^1]
  result = result.nimIdentNormalize()
  if typeRenames.hasKey(result):
    let orig = result
    result = typeRenames[result].name
    if typeRenames[orig].uses != 0:
      result.add "_" & $typeRenames[orig].uses
    if not checkOnly:
      typeRenames[orig].uses.inc
  else:
    if not checkOnly:
      typeRenames[result] = (name: result, uses: 1)

proc sanitizeArgName(x: string): string {.compileTime.} =
  result = x
  if result.startsWith("_"):
    if result.startsWith("__"):
      result = "internal_" & result[2..^1]
    else:
      result = "private_" & result[1..^1]
  result = result.nimIdentNormalize()
  if argRenames.hasKey(result):
    result = argRenames[result]

proc findAlias(kind: JsonNode): string =
  case kind["kind"].str:
  of "alias": kind["value"].str
  of "base": ""
  of "pointer": findAlias(kind["base"])
  of "array": findAlias(kind["value"])
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
      if field["type"]["kind"].str in ["struct", "union"]:
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
  of "alias":
    used.incl node.findAlias
  of "enum", "base": discard
  of "array":
    used.addUsings(node["value"])
  else:
    error("Unknown node in addUsings: " & $node)

type
  State = object
    entities: OrderedTable[string, JsonNode]
    opaqueTypes: HashSet[string]
    retypes: Table[string, Table[string, NimNode]]
    fieldRenames: Table[string, Table[string, string]]
    typeDefMap: Table[string, NimNode]
    typeNameMap: Table[string, NimNode]
    used: HashSet[string]
    types: NimNode
    procs: NimNode
    extraTypes: NimNode

proc toNimType(json: JsonNode, state: var State): NimNode =
  result = case json["kind"].str:
    of "base": json["value"].str.ident
    of "pointer":
      if json["base"]["kind"].str == "alias":
        var node = state.typeNameMap[json["base"]["value"].str]
        for i in 0..<json["depth"].num:
          node = nnkPtrTy.newTree(node)
        node
      elif json["base"]["kind"].str == "proc":
        var node = json["base"].toNimType(state)
        for i in 0..<json["depth"].num - 1:
          node = nnkPtrTy.newTree(node)
        node
      elif json["base"]["kind"].str == "base":
        var node = json["base"].toNimType(state)
        if node.strVal == "void":
          node = "pointer".ident
        for i in 0..<json["depth"].num - (if node.strVal == "pointer": 1 else: 0):
          node = nnkPtrTy.newTree(node)
        node
      else:
        var node = "pointer".ident
        for i in 0..<json["depth"].num - 1:
          node = nnkPtrTy.newTree(node)
        node
    of "proc":
      var procTy = nnkProcTy.newTree(
        nnkFormalParams.newTree(json["return"].toNimType(state)),
        nnkPragma.newTree(json["callingConvention"].str.ident))
      if json["return"]["kind"].str == "pointer" and json["return"]["base"]["kind"].str == "alias" and not state.entities.hasKey(json["return"]["base"]["value"].str):
        state.opaqueTypes.incl json["return"]["base"]["value"].str
      var i = 0
      for arg in json["arguments"]:
        let
          aname = if arg.hasKey("name"): sanitizeArgName(arg["name"].str) else: "a" & $i
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
      state.typeNameMap[json["value"].str]
    of "enum":
      error "Unable to resolve nested enums from here"
      "invalidNestedEnum".ident
    of "struct", "union":
      error "Unable to resolve nested struct/union from here"
      "invalidNestedStruct".ident
    else:
      warning "Unknown: " & $json
      "pointer".idenT

proc createEnum(origName: string, node: JsonNode, state: var State, comment: string) =
  let
    name = origName.ident
    baseType = node["base"].toNimType(state)
  var
    enumTy = nnkEnumTy.newTree(newEmptyNode())
    values: OrderedTable[int, NimNode]
    consts = newStmtList()
  for field in node["fields"]:
    let
      value = parseInt(field["value"].str)
      fname = field["name"].str.ident
    if not values.hasKey(value):
      values[value] = fname
    else:
      let oldIdent = values[value]
      consts.add quote do:
        const `fname` = `oldIdent`
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
  let
    name =
      if node["kind"].str == "struct":
        state.typeDefMap.getOrDefault(origName, origName.ident).postfix "*"
      else:
        nnkPragmaExpr.newTree(state.typeDefMap.getOrDefault(origName, origName.ident).postfix "*", nnkPragma.newTree("union".ident))
  # This is a bit of a hack, but the only way to get a comment into an object..
  var newType = parseStmt("""
  type
    dummy = object
      ## """ & comment)[0][0]
  newType[0] = name
  for field in node["fields"]:
    if field.hasKey("name"):
      let
        saneFieldName = sanitizeArgName(field["name"].str)
        fname =
          if state.fieldRenames.hasKey(saneName):
            state.fieldRenames[saneName].getOrDefault(saneFieldName, saneFieldName)
          else: saneFieldName
      if state.retypes.hasKey(saneName) and state.retypes[saneName].hasKey(fname):
        newType[^1][^1].add newIdentDefs(fname.ident.postfix "*", state.retypes[saneName][fname])
      else:
        if field["type"]["kind"].str == "pointer" and field["type"]["base"]["kind"].str == "alias" and not state.entities.hasKey(field["type"]["base"]["value"].str):
          state.opaqueTypes.incl field["type"]["base"]["value"].str
        if field["type"]["kind"].str == "enum":
          let enumName = saneName & "_" & saneFieldName & "_t"
          createEnum(enumName, field["type"], state, "")
          newType[^1][^1].add newIdentDefs(fname.ident.postfix "*", enumName.ident)
        elif field["type"]["kind"].str in ["struct", "union"]:
          let
            structName = saneName & "_" & saneFieldName & "_t"
          createStruct(structName, structName, field["type"], state, "")
          newType[^1][^1].add newIdentDefs(fname.ident.postfix "*", structName.ident)
        else:
          newType[^1][^1].add newIdentDefs(fname.ident.postfix "*", field["type"].toNimType(state))
    else:
      if field["type"]["kind"].str == "struct":
        if not state.entities.hasKey(field["type"]["name"].str):
          state.opaqueTypes.incl field["type"]["name"].str
      else:
        warning "Unhandled anonymous field: " & $field
  state.types.add newType

proc createProc(origName: string, node: JsonNode, state: var State) =
  let nameIdent = sanitizeName(origName).ident
  var def = node.toNimType(state)
  def[1].add "importc".ident
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

converter toStr(x: NimNode): string = x.lisprepr

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
    cargs = nnkBracket.newTree()
    renames: seq[FromTo]
    retypes: seq[FromTo]
  for node in nodes:
    case node.kind:
    of nnkStrLit:
      defs = nnkInfix.newTree("&".ident, defs, newLit("#include \"" & node.strVal & "\"\n"))
      files.add newLit(node.strVal)
    of nnkCallKinds:
      case node[0].strVal.toLower:
      of "define":
        defs = nnkInfix.newTree("&".ident, defs, newLit("#define " & node[1].strVal & " " & node[2].repr & "\n"))
      of "undef":
        defs = nnkInfix.newTree("&".ident, defs, newLit("#undef " & node[1].strVal & "\n"))
      of "path":
        cargs.add superQuote do: "-I" & absolutePath(`node[1]`, getProjectPath())
      of "abspath":
        cargs.add superQuote do: "-I" & `node[1]`
      of "compilerarg":
        cargs.add node[1]
      of "rename":
        renames.add (f: node[1].repr, t: node[2].repr)
      of "retype":
        assert node[1].kind == nnkDotExpr, "Retypes must target a field within an object"
        retypes.add (f: node[1].repr, t: node[2].repr)
      else:
        let toImport = genSym(nskConst)
        result.add quote do:
          const `toImport` = `node`
        defs = quote do: `defs` & ("#include " & `toImport` & "\n")
        files.add toImport
    else: error "Unknown argument passed to importc: " & $node.repr
  result.add quote do: importcImpl(`defs`, `cargs`, `files`, `renames`, `retypes`)

macro importcImpl*(defs: static[string], compilerArguments, files: static[openArray[string]], renames, retypes: static[openArray[FromTo]]): untyped =
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
    opirHash = hash(defs) !& hash(cmd)
    fullHash = !$(hash(renames) !& hash(retypes) !& opirHash)
    futharkCache = cacheDir / "futhark_" & fullHash.toHex & ".nim"
    opirCache = cacheDir / "opir_" & (!$opirHash).toHex & ".json"

  # Check if everything can be skipped and we can simply include our cached results
  if fileExists(futharkCache):
    hint "Using cached Futhark output: " & futharkCache
    return quote do:
      include `futharkCache`

  # Check if we have an old Opir output and the user just specified different post-processing steps
  let output =
    if fileExists(opirCache):
      hint "Using cached Opir output: " & opirCache
      staticRead(opirCache)
    else:
      discard staticExec("mkdir " & fname.parentDir)
      writeFile(fname, defs)
      hint "Running: " & cmd
      staticExec(cmd)

  # TODO: Clear out old cache files?
  let
    fut = try:
      output.parseJson
    except JsonParsingError:
      nil
  if fut == nil:
    error "Unable to parse output of opir:\n" & output

  if not fileExists(opirCache):
    writeFile(opirCache, output)

  var state = State(
    types: newNimNode(nnkTypeSection),
    procs: newStmtList(),
    extraTypes: newStmtList())

  # Gather symbols from first level of hierarchy
  for node in fut:
    if node.hasKey("name"):
      state.entities[node["name"].str] = node
    for file in files:
      if node["file"].str.endsWith(file):
        if node.hasKey("name"):
          state.used.incl node["name"].str
          state.used.addUsings node
        else:
          warning "Anonymous global: " & $node
        break

  # Find all imported symbols we need
  var usedLen = 0
  while state.used.len > usedLen:
    usedLen = state.used.len
    for name in state.used:
      if state.entities.hasKey(name):
        state.used.addUsings(state.entities[name])

  # Generate temporary names to allow overriding definitions
  for name in state.used:
    if state.entities.hasKey(name):
      if state.entities[name]["kind"].str != "proc":
        state.typeDefMap[name] = genSym(nskType, sanitizeName(name, true))
        state.typeNameMap[name] = genSym(nskType, sanitizeName(name, true))
    else:
      state.typeNameMap[name] = name.ident

  # Add explicit type name changes
  for retype in retypes:
    var newType = parseExpr(retype.t)
    newType.forNode(nnkIdent, (x) => state.typeNameMap.getOrDefault(x.strVal, x))
    var fieldName = retype.f.split('.')
    state.retypes.mgetOrPut(sanitizeName(fieldName[0], true), default(Table[string, NimNode]))[sanitizeName(fieldName[1], true)] = newType

  # Add explicit field renames
  for rename in renames:
    let oldName = rename.f.split('.')
    if oldName.len == 2:
      state.fieldRenames.mgetOrPut(oldName[0].sanitizeName(true), default(Table[string, string]))[oldName[1].sanitizeArgName] = rename.t
    else:
      typeRenames[oldName[0].nimIdentNormalize()] = (name: rename.t, uses: 0)

  # Generate Nim code from Opir output with applicable post-processing
  for elem in state.used:
    if state.entities.hasKey elem:
      let
        node = state.entities[elem]
        comment = "Generated based on " & node["file"].str & ":" & $node["position"]["line"].num & ":" & $node["position"]["column"].num
      case node["kind"].str:
      of "struct", "union":
        createStruct(node["name"].str, sanitizeName(node["name"].str, true), node, state, comment)
      of "typedef":
        var newType = parseStmt("type dummy = dummy ## " & comment)[0][0]
        newType[0] = state.typeDefMap[node["name"].str].postfix "*"
        newType[^1] = node["type"].toNimType(state)
        state.types.add newType
      of "enum":
        createEnum(node["name"].str, node, state, comment)
      of "proc":
        createProc(elem, node, state)
      else:
        warning "Unknown node kind: " & $node["kind"]
      #else:
      #  echo "Unknown name: ", elem

  # Add non-dependant types and auxilary types
  result = newStmtList()
  result.add state.extraTypes

  # Generate required opaque types
  for o in state.opaqueTypes:
    let
      origIdent = sanitizeName(o, true).ident
      ident = state.typeDefMap.getOrDefault(o, origIdent)
    result.add quote do:
      when not declared(`origIdent`):
        type
          `ident`* = distinct object
      else:
        static: hint("Declaration of " & `o` & " already exists, not redeclaring")

  # Generate conditionals to define inner object types if not previously defined
  for name, defIdent in state.typeDefMap:
    let
      origIdent = sanitizeName(name, true).ident
      nameIdent = state.typeNameMap[name]
    state.types.add (quote do:
      type
        `nameIdent`* = (when declared(`origIdent`): `origIdent` else: `defIdent`))[0]
  result.add state.types

  # Generate conditionals to define objects if not previously defined
  for name, defIdent in state.typeDefMap:
    let origIdent = sanitizeName(name).ident
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
  writeFile(futharkCache, result.repr)
