import strutils, os, json, posix, options
import clang, termstyle

proc `$`(cxstr: CXString): string =
  result = $getCString(cxstr)
  disposeString(cxstr)

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

proc toNimType(ct: CXType): JsonNode =
  case ct.kind:
  of CXType_Invalid: %*{"kind": "invalid", "value": "invalid?"}
  of CXType_Unexposed: %*{"kind": "invalid", "value": "unexposed?"}
  of CXType_Void: %*{"kind": "base", "value": "void"}
  of CXType_Bool: %*{"kind": "base", "value": "bool"}
  of CXType_Char_U, CXType_UChar: %*{"kind": "base", "value": "cuchar"} # TODO: Difference between Char_U and UChar?
  of CXType_Char16: %*{"kind": "base", "value": "int16"}
  of CXType_Char32: %*{"kind": "base", "value": "int32"}
  of CXType_UShort: %*{"kind": "base", "value": "cushort"}
  of CXType_UInt: %*{"kind": "base", "value": "cuint"}
  of CXType_ULong: %*{"kind": "base", "value": "culong"}
  of CXType_ULongLong: %*{"kind": "base", "value": "culonglong"}
  of CXType_UInt128: %*{"kind": "invalid", "value": "uint128"}
  of CXType_Char_S, CXType_SChar: %*{"kind": "base", "value": "cschar"}
  of CXType_WChar: %*{"kind": "base", "value": "Utf16Char"}
  of CXType_Short: %*{"kind": "base", "value": "cshort"}
  of CXType_Int: %*{"kind": "base", "value": "cint"}
  of CXType_Long: %*{"kind": "base", "value": "clong"}
  of CXType_LongLong: %*{"kind": "base", "value": "clonglong"}
  of CXType_Int128: %*{"kind": "invalid", "value": "int128"}
  of CXType_Float: %*{"kind": "base", "value": "cfloat"}
  of CXType_Double: %*{"kind": "base", "value": "cdouble"}
  of CXType_LongDouble: %*{"kind": "base", "value": "clongdouble"}
  of CXType_NullPtr: %*{"kind": "base", "value": "pointer"}
  of CXType_Overload, CXType_Dependent, CXType_ObjCId, CXType_ObjCClass, CXType_ObjCSel, CXType_Float128, CXType_Half, CXType_Float16, CXType_ShortAccum, CXType_Accum,
    CXType_LongAccum, CXType_UShortAccum, CXType_UAccum, CXType_ULongAccum, CXType_Complex: %*{"kind": "invalid", "value": "???"}
  of CXType_Pointer:
    let info = ct.getPointerInfo
    if info.depth == 1 and info.baseType.kind == CXType_CharS:
      %*{"kind": "base", "value": "cstring"}
    else:
      %*{"kind": "pointer", "depth": info.depth, "base": info.baseType.toNimType}
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
    #echo $ct.getTypedefName
    #echo $ct.getTypeDeclaration.getCursorSpelling
    #%*{"kind": "invalid", "value": "record?"}
    let value = $ct.getTypeDeclaration.getCursorSpelling
    if value.len != 0:
      %*{"kind": "alias", "value": value}
    else:
      newJNull()
  of CXType_LValueReference, CXType_RValueReference, CXType_ObjCInterface, CXType_ObjCObjectPointer: %*{"kind": "invalid", "value": "???"}
  of CXType_Enum: %*{"kind": "invalid", "value": "inline enum?"}
  of CXType_FunctionNoProto: %*{"kind": "invalid", "value": "func_noproto?"}
  of CXType_FunctionProto:
    # TODO: Move to use genProcDecl? Or at least share code
    let retType = ct.getResultType
    var args: seq[JsonNode]
    for i in 0.cuint..<ct.getNumArgTypes.cuint:
      args.add ct.getArgType(i).toNimType
    %*{"kind": "proc", "return": retType.toNimType, "arguments": args, "callingConvention": ct.getFunctionTypeCallingConv.toNimCallingConv, "variadic": (ct.isFunctionTypeVariadic != 0) }
  of CXType_ConstantArray:
    %*{"kind": "array", "size": ct.getNumElements, "value": ct.getElementType.toNimType}
  of CXType_IncompleteArray:
    %*{"kind": "array", "value": ct.getElementType.toNimType}
  of CXType_Vector, CXType_VariableArray, CXType_DependentSizedArray: %*{"kind": "invalid", "value": "array?"}
  of CXType_Elaborated:
    let value = $ct.getTypeDeclaration.getCursorSpelling
    if value.len != 0:
      %*{"kind": "alias", "value": value}
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
    underlying = typedef.getTypeDefDeclUnderlyingType
    name = $typedef.getCursorSpelling
    theType = if underlying.kind == CXType_Pointer:
      underlying.getPointerInfo.baseType.toNimType
    else:
      underlying.toNimType
    location = typedef.getLocation
  if theType.kind != JNull and not (theType["kind"].str == "alias" and theType["value"].str == name):
    return %*{"kind": "typedef", "file": location.filename, "position": {"column": location.column, "line": location.line}, "name": name, "type": theType}

proc genEnumDecl(enumdecl: CXCursor): JsonNode

proc genStructDecl(struct: CXCursor): JsonNode =
  var name = $struct.getCursorType.getTypeSpelling
  let
    location = getLocation(struct)
    kind =
      if struct.getCursorKind == CXCursor_UnionDecl:
        "union"
      else:
        "struct"
  if name.startsWith(kind & " "):
    name = name[len(kind & " ")..^1]
  result =
    if struct.Cursor_isAnonymous != 0:
      %*{"kind": kind, "file": location.filename, "position": {"column": location.column, "line": location.line}, "fields": []}
    else:
      %*{"kind": kind, "file": location.filename, "position": {"column": location.column, "line": location.line}, "name": name, "fields": []}
  discard visitChildren(struct, proc (field, parent: CXCursor, clientData: CXClientData): CXChildVisitResult {.cdecl.} =
    var mainObj = cast[ptr JsonNode](clientData)
    if field.getCursorType.kind == CXType_Record:
      if field.getCursorKind == CXCursor_UnionDecl or field.getCursorKind == CXCursor_StructDecl:
        mainObj[]["fields"].add %*{"type": genStructDecl(field)}
    elif field.getCursorType.kind == CXType_Enum:
      mainObj[]["fields"].add %*{"type": genEnumDecl(field)}
    else:
      if field.getCursorType.kind == CXType_Elaborated:
        if mainObj[]["fields"].elems.len != 0 and not mainObj[]["fields"].elems[^1].hasKey("name"):
          mainObj[]["fields"].elems[^1]["name"] = %($field.getCursorSpelling)
        else:
          mainObj[]["fields"].add %*{"name": $field.getCursorSpelling, "type": field.toNimType}
      else:
        mainObj[]["fields"].add %*{"name": $field.getCursorSpelling, "type": field.toNimType}

    return CXChildVisitContinue
  , result.addr)

proc genEnumDecl(enumdecl: CXCursor): JsonNode =
  var name = $enumdecl.getCursorType.getTypeSpelling
  let location = getLocation(enumDecl)
  if name.startsWith("enum "):
    name = name[len("enum ")..^1]
  result = %*{"kind": "enum", "file": location.filename, "position": {"column": location.column, "line": location.line}, "base": enumdecl.getEnumDeclIntegerType.toNimType, "fields": []}
  if enumdecl.Cursor_isAnonymous == 0:
    result["name"] = %name
  discard visitChildren(enumDecl, proc (field, parent: CXCursor, clientData: CXClientData): CXChildVisitResult {.cdecl.} =
    var mainObj = cast[ptr JsonNode](clientData)
    mainObj[]["fields"].add %*{"name": $field.getCursorSpelling, "value": $field.getEnumConstantDeclValue}
    CXChildVisitContinue
  , result.addr)

proc genVarDecl(vardecl: CXCursor): JsonNode =
  var pragmas: seq[string]
  let location = getLocation(vardecl)
  if varDecl.getCursorLinkage == CXLinkage_External:
    # TODO: This is C `extern`, convert to something in Nim
    discard
  %*{"kind": "var", "file": location.filename, "position": {"column": location.column, "line": location.line}, "name": $varDecl.getCursorSpelling, "pragmas": pragmas, "type": varDecl.getCursorType.toNimType}

proc genProcDecl(funcDecl: CXCursor): JsonNode =
  let funcDeclType = funcDecl.getCursorType
  let name = $funcDecl.getCursorSpelling
  let retType = funcDeclType.getResultType
  let location = getLocation(funcdecl)
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
          kind = %*{"kind": "alias", "value": $funcDeclType.getArgType(i).getTypeDeclaration.getCursorSpelling}
    var aname = $funcDecl.Cursor_getArgument(i).getCursorSpelling
    if aname == "":
      aname = "a" & $i
    args.add %*{"name": aname, "type": kind}
  %*{"kind": "proc", "file": location.filename, "position": {"column": location.column, "line": location.line}, "name": name, "return": retType.toNimType, "arguments": args, "callingConvention": funcDeclType.getFunctionTypeCallingConv.toNimCallingConv, "variadic": variadic}

proc genMacroDecl(macroDef: CXCursor): JsonNode =
  let name = $macroDef.getCursorSpelling
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
        let def = readFile(fname)[startOffset+name.len.cuint..<offset].strip
        let value = try:
            some(parseInt(def))
          except:
            try:
              some(parseHexInt(def))
            except:
              # TODO: Implement parsing of simple statements like "10*1024", "(1 << 2)", and "0x07U", along with identifiers
              if def.allCharsInSet({'a'..'z', 'A'..'Z', '0'..'9', '_'}):
                return %*{"kind": "const", "file": fname, "position": {"column": column, "line": line}, "name": name, "value": {"kind": "alias", "value": def}}
              else:
                none(int)
        if value.isSome:
          return %*{"kind": "const", "file": fname, "position": {"column": column, "line": line}, "name": name, "value": value.get}
  # Might be useful to read a function signature for function like macros
  #for i in 0..<macroDef.getCursorCompletionString.getNumCompletionChunks:
  #  echo "\t", macroDef.getCursorCompletionString.getCompletionChunkText(i)
  #  echo "\t", macroDef.getCursorCompletionString.getCompletionChunkKind(i)
  discard visitChildren(macroDef.getCursorDefinition, proc (field, parent: CXCursor, clientData: CXClientData): CXChildVisitResult {.cdecl.} =
    var mainObj = cast[ptr JsonNode](clientData)
    echo "name: ", field.getCursorSpelling
    echo "kind: ", field.kind
    CXChildVisitContinue
  , result.addr)
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
      stderr.writeLine yellow "Unknown cursor", " '", getCursorSpelling(c), "' of kind '", getCursorKindSpelling(getCursorKind(c)), "' and type '", getTypeSpelling(c.getCursorType), "'"
      nil
  if decl != nil:
    output.add decl
  return CXChildVisitContinue
, nil
)

for elem in output:
  if not (elem.hasKey("kind") and elem.hasKey("file")):
    stderr.writeLine red "Invalid element: ", elem
echo output

disposeTranslationUnit(unit)
disposeIndex(index)
removeFile(fname)
