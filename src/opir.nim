import strutils, os, json, posix, options, tables
import clang, termstyle

proc `$`(cxstr: CXString): string =
  result = $getCString(cxstr)
  disposeString(cxstr)

proc getName(cc: CXCursor): string =
  ($cc.getCursorUSR).rsplit('@', 1)[^1]

proc getPointerInfo(ct: CXType): tuple[depth: int, baseType: CXType] =
  result.baseType = ct
  result.depth = 0
  while result.baseType.kind == CXType_Pointer:
    result.baseType = result.baseType.getPointeeType
    inc result.depth

proc getLocation(c: CXCursor): tuple[filename: string, line, column: cuint] =
  var filename: CXString
  c.getCursorLocation.getPresumedLocation(filename.addr, result.line.addr, result.column.addr)
  result.filename = $filename

proc getRange(c: CXCursor): tuple[filename: string, line, column: cuint, endline, endcolumn: cuint] =
  var filename: CXString
  let ext = c.getCursorExtent
  ext.getRangeStart.getPresumedLocation(filename.addr, result.line.addr, result.column.addr)
  ext.getRangeEnd.getPresumedLocation(filename.addr, result.endline.addr, result.endcolumn.addr)
  result.filename = $filename

proc toNimCallingConv(cc: CXCallingConv): string =
  case cc:
  of CXCallingConv_Default: "noconv"
  of CXCallingConv_C: "cdecl"
  of CXCallingConv_X86StdCall: "stdcall"
  of CXCallingConv_X86FastCall: "fastcall"
  of CXCallingConv_X86ThisCall: "thiscall"
  of CXCallingConv_X86Pascal, CXCallingConv_AAPCS, CXCallingConv_AAPCS_VFP,
    CXCallingConv_X86RegCall, CXCallingConv_IntelOclBicc, CXCallingConv_Win64,
    CXCallingConv_X86_64SysV, CXCallingConv_X86VectorCall,
    CXCallingConv_Swift, CXCallingConv_PreserveMost,
    CXCallingConv_PreserveAll, CXCallingConv_AArch64VectorCall: "unknownCallingConv"
  of CXCallingConv_Invalid: "invalidCallingConv"
  of CXCallingConv_Unexposed: "unexposedCallingConv"

proc genStructDecl(struct: CXCursor): JsonNode
proc genProcDecl(funcDeclType: CXType, funcDecl = none(CXCursor)): JsonNode

proc toNimType(ct: CXType): JsonNode =
  #echo ct.kind
  case ct.kind:
  of CXType_Invalid: %*{"kind": "invalid", "value": "invalid?"}
  of CXType_Unexposed: %*{"kind": "invalid", "value": "unexposed?"}
  of CXType_Void: %*{"kind": "base", "value": "void"}
  of CXType_Bool: %*{"kind": "base", "value": "bool"}
  of CXType_Char_U, CXType_UChar: %*{"kind": "base", "value": "uint8"} # TODO: Difference between Char_U and UChar? cuchar is deprecated, use uint8 instead
  of CXType_Char16: %*{"kind": "base", "value": "int16"}
  of CXType_Char32: %*{"kind": "base", "value": "int32"}
  of CXType_UShort: %*{"kind": "base", "value": "cushort"}
  of CXType_UInt: %*{"kind": "base", "value": "cuint"}
  of CXType_ULong: %*{"kind": "base", "value": "culong"}
  of CXType_ULongLong: %*{"kind": "base", "value": "culonglong"}
  of CXType_UInt128: %*{"kind": "special", "value": "uint128"}
  of CXType_Char_S, CXType_SChar: %*{"kind": "base", "value": "cschar"}
  of CXType_WChar: %*{"kind": "base", "value": "Utf16Char"}
  of CXType_Short: %*{"kind": "base", "value": "cshort"}
  of CXType_Int: %*{"kind": "base", "value": "cint"}
  of CXType_Long: %*{"kind": "base", "value": "clong"}
  of CXType_LongLong: %*{"kind": "base", "value": "clonglong"}
  of CXType_Int128: %*{"kind": "special", "value": "int128"}
  of CXType_Float: %*{"kind": "base", "value": "cfloat"}
  of CXType_Double: %*{"kind": "base", "value": "cdouble"}
  of CXType_LongDouble: %*{"kind": "base", "value": "clongdouble"}
  of CXType_NullPtr: %*{"kind": "base", "value": "pointer"}
  of CXType_Overload, CXType_Dependent, CXType_ObjCId, CXType_ObjCClass, CXType_ObjCSel, CXType_Float128, CXType_Half, CXType_Float16, CXType_ShortAccum, CXType_Accum,
    CXType_LongAccum, CXType_UShortAccum, CXType_UAccum, CXType_ULongAccum, CXType_Complex: %*{"kind": "invalid", "value": "???"}
  of CXType_Pointer:
    let
      info = ct.getPointerInfo
      kind = info.baseType.kind
      baseType = info.baseType.toNimType
      underlyingType =
        if kind in [CXType_Typedef, CXType_Elaborated]:
          info.baseType.getTypeDeclaration.getTypedefDeclUnderlyingType.toNimType
        else:
          baseType
    if underlyingType["kind"].str == "base" and underlyingType["value"].str == "cschar": # in {CXType_Char_S, CXType_SChar}:
      if info.depth == 1:
        %*{"kind": "base", "value": "cstring"}
      else:
        %*{"kind": "pointer", "depth": info.depth - 1, "base": {"kind": "base", "value": "cstring"}}
    elif underlyingType["kind"].str == "proc":
      if info.depth == 1:
        if baseType.kind != JNull: baseType else: %*{"kind": "base", "value": "void"}
      else:
        %*{"kind": "pointer", "depth": info.depth - 1, "base": if baseType.kind != JNull: baseType else: %*{"kind": "base", "value": "void"}}
    else:
      %*{"kind": "pointer", "depth": info.depth, "base": if baseType.kind != JNull: baseType else: %*{"kind": "base", "value": "void"}}
  of CXType_BlockPointer: %*{"kind": "pointer", "depth": 0}
  of CXType_Typedef:
    let name = $ct.getTypedefName
    let base = case name:
      of "int8_t": "int8"
      of "int16_t": "int16"
      of "int32_t": "int32"
      of "int64_t": "int64"
      of "uint8_t": "uint8"
      of "uint16_t": "uint16"
      of "uint32_t": "uint32"
      of "uint64_t": "uint64"
      of "size_t": "csize_t"
      else: ""
    if base.len == 0:
      if name.len != 0:
        %*{"kind": "alias", "value": name}
      else:
        newJNull()
    else:
      %*{"kind": "base", "value": base}
  of CXType_Record:
    let value = ct.getTypeDeclaration.getName
    if value.len != 0:
      %*{"kind": "alias", "value": value}
    else:
      newJNull()
  of CXType_LValueReference, CXType_RValueReference, CXType_ObjCInterface, CXType_ObjCObjectPointer: %*{"kind": "invalid", "value": "???"}
  of CXType_Enum: %*{"kind": "invalid", "value": "inline enum?"}
  of CXType_FunctionProto, CXType_FunctionNoProto:
    ct.genProcDecl()
  of CXType_ConstantArray:
    %*{"kind": "array", "size": ct.getNumElements, "value": ct.getElementType.toNimType}
  of CXType_IncompleteArray:
    %*{"kind": "array", "value": ct.getElementType.toNimType}
  of CXType_Vector:
    %*{"kind": "vector"}
  of CXType_VariableArray, CXType_DependentSizedArray:
    %*{"kind": "invalid", "value": "array?"}
  of CXType_Elaborated:
    let typeDecl = ct.getTypeDeclaration
    let value = typeDecl.getName
    if typeDecl.getCursorType.kind == CXType_Typedef:
      typeDecl.getCursorType.toNimType
    elif value.len != 0:
      #echo "Creating alias with name ", value, " to type ", $ct.getTypeDeclaration.getCursorKind
      let prefix = case typeDecl.getCursorKind:
        of CXCursor_StructDecl: "struct_"
        of CXCursor_UnionDecl: "union_"
        of CXCursor_EnumDecl: "enum_"
        else: ""
      %*{"kind": "alias", "value": prefix & value}
    else:
      #if ct.getTypeDeclaration.kind == CXCursor_StructDecl:
      #  ct.getTypeDeclaration.genStructDecl
      #else:
      newJNull()
  else: %*{"kind": "invalid", "value": "???"}

proc toNimType(ct: CXCursor): JsonNode =
  case ct.getCursorType.kind:
  else: ct.getCursorType.toNimType

if paramCount() == 0:
  echo "Usage: opir <C compiler arguments> <header files>"
  quit -1

var
  index = createIndex(0, 0)
  commandLine = allocCStringArray(commandLineParams())
  args = 0
  fname = getTempDir() / "imports-" & $getPid() & ".h"
while commandLineParams()[args].startsWith "-": inc args

try:
  var file = open(fname, fmWrite)
  try:
    for i in (args + 1)..paramCount():
      file.writeLine "#include \"" & paramStr(i) & "\""
  finally:
    file.close()
except Exception as e:
  stderr.writeLine red "Error:", " unable to open temporary file for translation: ", fname
  stderr.writeLine e.msg
  quit 1

var unit = parseTranslationUnit(index, fname.cstring,
                              commandLine, args.cint, nil, 0, CXTranslationUnit_DetailedPreprocessingRecord.cuint or CXTranslationUnit_SkipFunctionBodies.cuint)
deallocCStringArray(commandLine)

var fatal = false
for i in 0..<unit.getNumDiagnostics:
  let diagnostic = unit.getDiagnostic(i)
  case diagnostic.getDiagnosticSeverity():
  of CXDiagnostic_Ignored: discard
  of CXDiagnostic_Note: stderr.writeLine "\t", diagnostic.getDiagnosticSpelling()
  of CXDiagnostic_Warning: stderr.writeLine yellow "Warning: ", diagnostic.getDiagnosticSpelling()
  of CXDiagnostic_Error: stderr.writeLine red "Error: ", diagnostic.getDiagnosticSpelling()
  of CXDiagnostic_Fatal:
    stderr.writeLine red "Fatal: ", diagnostic.getDiagnosticSpelling()
    fatal = true

if unit.isNil or fatal:
  stderr.writeLine yellow "Tried to parse: ", commandLineParams()[args..^1].join " "
  stderr.writeLine yellow "With arguments: ", commandLineParams()[0..<args].join " "
  stderr.writeLine "Unable to parse translation unit succesfully. Quitting"
  quit(-1)

proc genTypedefDecl(typedef: CXCursor): JsonNode =
  let
    name = typedef.getName
    theType = typedef.getTypeDefDeclUnderlyingType.toNimType
    location = typedef.getLocation
  if theType.kind != JNull and not (theType["kind"].str == "alias" and theType["value"].str == name):
    return %*{"kind": "typedef", "file": location.filename, "position": {"column": location.column, "line": location.line}, "name": name, "type": theType}

proc genEnumDecl(enumdecl: CXCursor): JsonNode

proc genStructDecl(struct: CXCursor): JsonNode =
  let
    location = getLocation(struct)
    name = "struct_" & struct.getName
    kind =
      if struct.getCursorKind == CXCursor_UnionDecl:
        "union"
      else:
        "struct"
  result =
    if struct.Cursor_isAnonymous != 0:
      %*{"kind": kind, "file": location.filename, "position": {"column": location.column, "line": location.line}, "fields": []}
    else:
      %*{"kind": kind, "file": location.filename, "position": {"column": location.column, "line": location.line}, "name": name, "fields": []}
  discard visitChildren(struct, proc (field, parent: CXCursor, clientData: CXClientData): CXChildVisitResult {.cdecl.} =
    var mainObj = cast[ptr JsonNode](clientData)
    case field.getCursorKind:
    of CXCursor_FieldDecl, CXCursor_StructDecl, CXCursor_UnionDecl, CXCursor_EnumDecl:
      case field.getCursorType.kind:
      of CXType_Record:
        mainObj[]["fields"].add %*{"type": genStructDecl(field)}
      of CXType_Enum:
        mainObj[]["fields"].add %*{"type": genEnumDecl(field)}
      of CXType_Elaborated:
        if mainObj[]["fields"].elems.len != 0 and not mainObj[]["fields"].elems[^1].hasKey("name"):
          mainObj[]["fields"].elems[^1]["name"] = %field.getName
        else:
          mainObj[]["fields"].add %*{"name": field.getName, "type": field.toNimType}
      of CXType_ConstantArray:
        var val = %*{"name": field.getName, "type": field.toNimType}
        template innerKind: untyped = mainObj[]["fields"].elems[^1]["type"]["kind"].str
        if mainObj[]["fields"].elems.len != 0 and not mainObj[]["fields"].elems[^1].hasKey("name") and
          startsWith($(field.getCursorType.getElementType.getTypeSpelling), innerKind & " (unnamed " & innerKind & " at"):
          val["type"]["value"] = mainObj[]["fields"].elems[^1]["type"]
          mainObj[]["fields"].elems[^1] = val
        else:
          mainObj[]["fields"].add val
      else:
        mainObj[]["fields"].add %*{"name": field.getName, "type": field.toNimType}
    of CXCursor_PackedAttr:
      mainObj[]["packed"] = %true
    of CXCursor_AlignedAttr:
      mainObj[]["alignment"] = %parent.getCursorType.Type_getAlignOf()
    of CXCursor_FirstAttr: discard # This should really be CXCursor_UnexposedAttr, but that's not exported from the module
    of CXCursor_VisibilityAttr: stderr.writeLine "Ignoring visibility attribute on ", mainObj[]["name"]," set to \"", field.getName, "\": ", field.getLocation()
    else:
      stderr.writeLine "Unknown element in structure or union: ", field.getCursorKind, " ", field.getLocation()
      quit(-1)

    return CXChildVisitContinue
  , result.addr)

proc genEnumDecl(enumdecl: CXCursor): JsonNode =
  let
    location = getLocation(enumDecl)
    name = "enum_" & enumdecl.getName
  result = %*{"kind": "enum", "file": location.filename, "position": {"column": location.column, "line": location.line}, "base": enumdecl.getEnumDeclIntegerType.toNimType, "fields": []}
  if enumdecl.Cursor_isAnonymous == 0 and not name.startsWith("enum_(anonymous"):
    result["name"] = %name
  discard visitChildren(enumDecl, proc (field, parent: CXCursor, clientData: CXClientData): CXChildVisitResult {.cdecl.} =
    var mainObj = cast[ptr JsonNode](clientData)
    mainObj[]["fields"].add %*{"name": field.getName, "value": $field.getEnumConstantDeclValue}
    CXChildVisitContinue
  , result.addr)

proc genVarDecl(vardecl: CXCursor): JsonNode =
  let location = getLocation(vardecl)
  let linkage = case varDecl.getCursorLinkage:
    of CXLinkage_Invalid: "invalid"
    of CXLinkage_NoLinkage: "static"
    of CXLinkage_Internal: "internal"
    of CXLinkage_UniqueExternal: "unique"
    of CXLinkage_External: "external" # This is C `extern`
  %*{"kind": "var", "file": location.filename, "position": {"column": location.column, "line": location.line}, "name": varDecl.getName, "linkage": linkage, "type": varDecl.getCursorType.toNimType}

proc genProcDecl(funcDeclType: CXType, funcDecl = none(CXCursor)): JsonNode =
  let retType = funcDeclType.getResultType
  var args: seq[JsonNode]
  var variadic = (funcDeclType.isFunctionTypeVariadic != 0)
  for i in 0.cuint..<funcDeclType.getNumArgTypes.cuint:
    var kind = funcDeclType.getArgType(i).toNimType
    if kind["kind"].str == "alias" and kind["value"].str == "va_list" and i == funcDeclType.getNumArgTypes.cuint - 1:
      variadic = true
      continue
    if kind["kind"].str == "invalid":
      if funcDeclType.getArgType(i).kind == CXType_Elaborated:
        if funcDeclType.getArgType(i).getTypeDeclaration.kind == CXCursor_EnumDecl:
          kind = %*{"kind": "alias", "value": funcDeclType.getArgType(i).getTypeDeclaration.getName}
    var aname = ""
    if funcDecl.isSome:
      aname = funcDecl.get.Cursor_getArgument(i).getName
    if aname == "":
      aname = "a" & $i
    args.add %*{"name": aname, "type": kind}
  result = %*{"kind": "proc", "return": retType.toNimType, "arguments": args,
              "callingConvention": funcDeclType.getFunctionTypeCallingConv.toNimCallingConv,
              "variadic": variadic, "proto": funcDeclType.kind == CXType_FunctionProto }
  if funcDecl.isSome:
    let
      name = if funcDecl.isSome: funcDecl.get.getName else: ""
      location = getLocation(funcDecl.get)
    result["file"] = %location.filename
    result["position"] = %*{"column": location.column, "line": location.line}
    result["name"] = %name
    result["inlined"] = %(funcDecl.get.Cursor_isFunctionInlined() == 1)

proc genProcDecl(funcDecl: CXCursor): JsonNode =
  let funcDeclType = funcDecl.getCursorType
  genProcDecl(funcDeclType, some(funcDecl))

var fileCache: Table[string, string] # TODO: Is there some way to get the macro body so we don't have to do this?
proc genMacroDecl(macroDef: CXCursor): JsonNode =
  let name = macroDef.getName
  # Hard to get any usable data from this
  # TODO: Figure out handling of macros..
  # Options:
  # importc, but what should be given as type? Maybe all have to be retyped?
  # Try to guess type, but has to be able to read macro body (maybe get the range and read C source file directly?)
  let extent = macroDef.getCursorExtent()
  var
    file: CXFile
    line: cuint
    column: cuint
    offset: cuint
  # Might be more information to be gathered
  #echo macroDef.getCursorType()
  #echo macroDef.CursorHasAttrs, ": ", name
  #echo macroDef.CursorIsMacroFunctionLike, ": ", name
  extent.getRangeStart.getExpansionLocation(file.addr, line.addr, column.addr, offset.addr)
  let startOffset = offset
  extent.getRangeEnd.getExpansionLocation(file.addr, nil, nil, offset.addr)
  if offset - startOffset != name.len.uint32:
    if macroDef.CursorIsMacroFunctionLike == 0:
      let fname = $file.getFileName
      if fname.len != 0:
        var kind = "unknown"
        let def = block:
          var def = fileCache.mgetOrPut(fname, readFile(fname))[startOffset+name.len.cuint..<offset].strip
          if def.len > 1:
            # stdint.h macro parser: INT8_C(-5), UINT32_C(123) for example
            let ucpPos = def.find("_C(")
            if ucpPos > 3 and def[^1] == ')':
              let unsignedOffset = if def[0] == 'U': 1 else: 0
              if def.continuesWith("INT", unsignedOffset):
                let size = def[unsignedOffset + 3 .. ucpPos - 1]
                if size in ["8", "16", "32", "64"]:
                  def = def[unsignedOffset + 3 + size.len + 3 .. ^2].strip
                  if unsignedOffset == 1:
                    def.add "U"
                  if size == "8": kind = if unsignedOffset == 0: "int8" else: "uint8"
                  if size == "32": def.add "L"
                  if size == "64": def.add "LL"

            if def[0] == '(' and def[^1] == ')': def[1..^2].strip
            else: def
          else: def
        template parseReturn(x, defIn: untyped; kindIn: string): untyped =
          let def = defIn
          try:
            var
              unsigned = false
              long = false
              longlong = false
              size = false
              pos = def.high
            while def[pos] in {'u', 'U', 'l', 'L', 'z', 'Z'}:
              case def[pos]:
              of 'u', 'U': unsigned = true
              of 'l', 'L': (if long: longlong = true else: long = true)
              of 'z', 'Z': size = true
              else: discard
              dec pos
            let
              value = `parse x`(def[0..pos]) # calls parseInt, parseHexInt, parseFloat...
              kind =
                if kindIn != "unknown":
                  %*{"kind":"base", "value": kindIn}
                elif unsigned or long or size:
                  %*{"kind":"base", "value": ("c" & (if unsigned: "u" else: "") & (if long or size: (if long: (if longlong: "longlong" else: "long") else: "size") else: "int"))}
                else:
                  %*{"kind":"unknown"}
            return %*{"kind": "const", "file": fname, "position": {"column": column, "line": line}, "name": name, "value": value, "type": kind}
          except: discard
        if def.len == 0: return nil

        # Integer parsing
        case def[0]:
        of '0':
          if def.len == 1: parseReturn(BiggestInt, def, kind)
          case def[1]:
          of 'x', 'X': parseReturn(HexInt, def.replace("'", ""), kind)
          of 'b', 'B': parseReturn(BinInt, def.replace("'", ""), kind)
          of '1'..'9': parseReturn(OctInt, def[1..^1].replace("'", ""), kind)
          of 'u', 'U', 'l', 'L', 'z', 'Z': parseReturn(BiggestInt, def, kind)
          else: discard
        of '-': parseReturn(BiggestInt, def.replace("'", ""), kind)
        of '1'..'9': parseReturn(BiggestInt, def.replace("'", ""), kind); parseReturn(BiggestUInt, def.replace("'", ""), kind)
        else: discard

        # Float parsing
        if def.contains('.'):
          if def[^1] in ['f', 'F', 'l', 'L']:
            parseReturn(Float, def.replace("'", "")[0..^2], kind)
          else:
            parseReturn(Float, def.replace("'", ""), kind)
        # TODO; Look at already defined stuff and ensure this is not a type
        if def.allCharsInSet({'a'..'z', 'A'..'Z', '0'..'9', '_'}) and def[0] notin '0'..'9':
          return %*{"kind": "const", "file": fname, "position": {"column": column, "line": line}, "name": name, "type": {"kind": "alias", "value": def}}
  # Might be useful to read a function signature for function like macros
  #for i in 0..<macroDef.getCursorCompletionString.getNumCompletionChunks:
  #  echo "\t", macroDef.getCursorCompletionString.getCompletionChunkText(i)
  #  echo "\t", macroDef.getCursorCompletionString.getCompletionChunkKind(i)
  return nil

var cursor = getTranslationUnitCursor(unit)

var output = newJArray()
discard visitChildren(cursor, proc (c, parent: CXCursor, clientData: CXClientData): CXChildVisitResult {.cdecl.} =
  var decl =
    case c.getCursorKind:
    of CXCursor_TypedefDecl:
      c.genTypedefDecl()
    of CXCursor_StructDecl, CXCursor_UnionDecl:
      let struct = c.genStructDecl()
      if struct["fields"].len != 0:
        struct
      else: nil
    of CXCursor_FunctionDecl:
      c.genProcDecl()
    of CXCursor_EnumDecl:
      c.genEnumDecl()
    of CXCursor_VarDecl:
      c.genVarDecl()
    of CXCursor_MacroDefinition:
      c.genMacroDecl()
    of CXCursor_MacroExpansion:
      nil
    of CXCursor_InclusionDirective:
      # This could potentially be used to give more context for definitions
      nil
    else:
      # Unknown cursor kind
      stderr.writeLine yellow "Unknown cursor", " '", getCursorSpelling(c), "' of kind '", getCursorKindSpelling(getCursorKind(c)), "' and type '", getTypeSpelling(c.getCursorType), "' at original position: ", getLocation(c)
      nil
  if decl != nil:
    output.add decl
  return CXChildVisitContinue
, nil
)

for elem in output:
  if not (elem.hasKey("kind") and elem.hasKey("file")):
    stderr.writeLine red "Invalid element: ", elem

stderr.flushFile()
stdout.flushFile()
echo output

disposeTranslationUnit(unit)
disposeIndex(index)
removeFile(fname)
