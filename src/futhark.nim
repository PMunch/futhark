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

macro importc*(defs: static[string], includePaths: static[string], files: static[seq[string]], fieldRenames: static[Table[string, Table[string, string]]], typeRenames: static[Table[string, string]], retypes: static[Table[string, Table[string, NimNode]]]): untyped =
  discard

macro importc*(imports: varargs[untyped]): untyped =
  var
    nodes = imports
    defs = ""
    paths: seq[string]
    files: seq[string]
    fullHash: Hash
    state: State
  if imports[0].kind == nnkStmtList:
    nodes = imports[0]
  for node in nodes:
    case node.kind:
    of nnkStrLit:
      defs &= "#include \"" & node.strVal & "\"\n"
      files.add node.strVal
    of nnkCallKinds:
      case node[0].strVal.toLower:
      of "define":
        defs &= "#define " & node[1].strVal & " " & node[2].repr & "\n"
      of "undef":
        defs &= "#undef " & node[1].strVal & " " & node[2].repr & "\n"
      of "path":
        echo node.treeRepr
        if node[1].kind == nnkStrLit:
          paths.add "-I" & absolutePath(node[1].strVal, getProjectPath())
        else:
          echo expandMacros(node[1]).treeRepr
      of "rename":
        fullHash = fullHash !& hash(node.repr)
        if node[1].kind == nnkDotExpr:
          state.fieldRenames.mgetOrPut(node[1][0].strVal.sanitizeName(true), default(Table[string, string]))[node[1][1].strVal.sanitizeArgName] = node[2].strVal
        else:
          typeRenames[node[1].strVal.nimIdentNormalize()] = (name: node[2].strVal, uses: 0)
      of "retype":
        fullHash = fullHash !& hash(node.repr)
        assert node[1].kind == nnkDotExpr, "Retypes must target a field within an object"
    else: discard
  let
    cacheDir = querySetting(nimcacheDir)
    fname = cacheDir / "futhark-includes.h"
    cmd = "opir " & paths.join(" ") & " " & fname
    opirHash = hash(defs) !& hash(cmd)
  fullHash = fullHash !& opirHash
  let
    futharkCache = cacheDir / "futhark_" & (!$fullHash).toHex & ".nim"
    opirCache = cacheDir / "opir_" & (!$opirHash).toHex & ".json"
  if fileExists(futharkCache):
    hint "Using cached Futhark output: " & futharkCache
    return quote do:
      include `futharkCache`
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

  state.types = newNimNode(nnkTypeSection)
  state.procs = newStmtList()
  state.extraTypes = newStmtList()

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
  var usedLen = 0
  while state.used.len > usedLen:
    usedLen = state.used.len
    for name in state.used:
      if state.entities.hasKey(name):
        state.used.addUsings(state.entities[name])
  for name in state.used:
    if state.entities.hasKey(name):
      if state.entities[name]["kind"].str != "proc":
        state.typeDefMap[name] = genSym(nskType, sanitizeName(name, true))
        state.typeNameMap[name] = genSym(nskType, sanitizeName(name, true))
    else:
      state.typeNameMap[name] = name.ident
  for node in nodes:
    if node.kind in nnkCallKinds and node[0].strVal.toLower == "retype":
      node[2].forNode(nnkIdent, (x) => state.typeNameMap.getOrDefault(x.strVal, x))
      state.retypes.mgetOrPut(sanitizeName(node[1][0].strVal, true), default(Table[string, NimNode]))[sanitizeName(node[1][1].strVal, true)] = node[2]
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
  result = newStmtList()
  result.add state.extraTypes
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
  for name, defIdent in state.typeDefMap:
    let
      origIdent = sanitizeName(name, true).ident
      nameIdent = state.typeNameMap[name]
    state.types.add nnkTypeDef.newTree(
      nameIdent.postfix "*",
      newEmptyNode(),
      nnkPar.newTree(
        nnkWhenStmt.newTree(
          nnkElifExpr.newTree(
            nnkCall.newTree(
              newIdentNode("declared"),
              origIdent
            ),
            nnkStmtList.newTree(
              origIdent
            )
          ),
          nnkElseExpr.newTree(
            nnkStmtList.newTree(
              defIdent
            )
          )
        )
      )
    )
  result.add state.types
  for name, defIdent in state.typeDefMap:
    let origIdent = sanitizeName(name).ident
    if state.entities[name]["kind"].str != "enum":
      result.add quote do:
        when not declared(`origIdent`):
          type
             `origIdent`* = `defIdent`
        else:
          static: hint("Declaration of " & `name` & " already exists, not redeclaring")
  result.add state.procs
  writeFile(futharkCache, result.repr)
