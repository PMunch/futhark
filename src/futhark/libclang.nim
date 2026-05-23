
{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from std / macros import hint, warning, newLit, getSize

from std / os import parentDir

when not declared(ownSizeOf):
  macro ownSizeof(x: typed): untyped =
    newLit(x.getSize)

type
  enum_CXErrorCode_553648588* {.size: sizeof(cuint).} = enum
    CXError_Success = 0, CXError_Failure = 1, CXError_Crashed = 2,
    CXError_InvalidArguments = 3, CXError_ASTReadError = 4
type
  enum_CXCompilationDatabase_Error_553648608* {.size: sizeof(cuint).} = enum
    CXCompilationDatabase_NoError = 0,
    CXCompilationDatabase_CanNotLoadDatabase = 1
type
  enum_CXDiagnosticSeverity_553648632* {.size: sizeof(cuint).} = enum
    CXDiagnostic_Ignored = 0, CXDiagnostic_Note = 1, CXDiagnostic_Warning = 2,
    CXDiagnostic_Error = 3, CXDiagnostic_Fatal = 4
type
  enum_CXLoadDiag_Error_553648638* {.size: sizeof(cuint).} = enum
    CXLoadDiag_None = 0, CXLoadDiag_Unknown = 1, CXLoadDiag_CannotLoad = 2,
    CXLoadDiag_InvalidFile = 3
type
  enum_CXDiagnosticDisplayOptions_553648640* {.size: sizeof(cuint).} = enum
    CXDiagnostic_DisplaySourceLocation = 1, CXDiagnostic_DisplayColumn = 2,
    CXDiagnostic_DisplaySourceRanges = 4, CXDiagnostic_DisplayOption = 8,
    CXDiagnostic_DisplayCategoryId = 16, CXDiagnostic_DisplayCategoryName = 32
type
  enum_CXAvailabilityKind_553648652* {.size: sizeof(cuint).} = enum
    CXAvailability_Available = 0, CXAvailability_Deprecated = 1,
    CXAvailability_NotAvailable = 2, CXAvailability_NotAccessible = 3
type
  enum_CXCursor_ExceptionSpecificationKind_553648658* {.size: sizeof(cuint).} = enum
    CXCursor_ExceptionSpecificationKind_None = 0,
    CXCursor_ExceptionSpecificationKind_DynamicNone = 1,
    CXCursor_ExceptionSpecificationKind_Dynamic = 2,
    CXCursor_ExceptionSpecificationKind_MSAny = 3,
    CXCursor_ExceptionSpecificationKind_BasicNoexcept = 4,
    CXCursor_ExceptionSpecificationKind_ComputedNoexcept = 5,
    CXCursor_ExceptionSpecificationKind_Unevaluated = 6,
    CXCursor_ExceptionSpecificationKind_Uninstantiated = 7,
    CXCursor_ExceptionSpecificationKind_Unparsed = 8,
    CXCursor_ExceptionSpecificationKind_NoThrow = 9
type
  enum_CXChoice_553648660* {.size: sizeof(cuint).} = enum
    CXChoice_Default = 0, CXChoice_Enabled = 1, CXChoice_Disabled = 2
type
  enum_CXGlobalOptFlags_553648664* {.size: sizeof(cuint).} = enum
    CXGlobalOpt_None = 0, CXGlobalOpt_ThreadBackgroundPriorityForIndexing = 1,
    CXGlobalOpt_ThreadBackgroundPriorityForEditing = 2,
    CXGlobalOpt_ThreadBackgroundPriorityForAll = 3
type
  enum_CXTranslationUnit_Flags_553648679* {.size: sizeof(cuint).} = enum
    CXTranslationUnit_None = 0,
    CXTranslationUnit_DetailedPreprocessingRecord = 1,
    CXTranslationUnit_Incomplete = 2, CXTranslationUnit_PrecompiledPreamble = 4,
    CXTranslationUnit_CacheCompletionResults = 8,
    CXTranslationUnit_ForSerialization = 16,
    CXTranslationUnit_CXXChainedPCH = 32,
    CXTranslationUnit_SkipFunctionBodies = 64,
    CXTranslationUnit_IncludeBriefCommentsInCodeCompletion = 128,
    CXTranslationUnit_CreatePreambleOnFirstParse = 256,
    CXTranslationUnit_KeepGoing = 512, CXTranslationUnit_SingleFileParse = 1024,
    CXTranslationUnit_LimitSkipFunctionBodiesToPreamble = 2048,
    CXTranslationUnit_IncludeAttributedTypes = 4096,
    CXTranslationUnit_VisitImplicitAttributes = 8192,
    CXTranslationUnit_IgnoreNonErrorsFromIncludedFiles = 16384,
    CXTranslationUnit_RetainExcludedConditionalBlocks = 32768
type
  enum_CXSaveTranslationUnit_Flags_553648681* {.size: sizeof(cuint).} = enum
    CXSaveTranslationUnit_None = 0
type
  enum_CXSaveError_553648683* {.size: sizeof(cuint).} = enum
    CXSaveError_None = 0, CXSaveError_Unknown = 1,
    CXSaveError_TranslationErrors = 2, CXSaveError_InvalidTU = 3
type
  enum_CXReparse_Flags_553648685* {.size: sizeof(cuint).} = enum
    CXReparse_None = 0
type
  enum_CXTUResourceUsageKind_553648687* {.size: sizeof(cuint).} = enum
    CXTUResourceUsage_AST = 1, CXTUResourceUsage_Identifiers = 2,
    CXTUResourceUsage_Selectors = 3,
    CXTUResourceUsage_GlobalCompletionResults = 4,
    CXTUResourceUsage_SourceManagerContentCache = 5,
    CXTUResourceUsage_AST_SideTables = 6,
    CXTUResourceUsage_SourceManager_Membuffer_Malloc = 7,
    CXTUResourceUsage_SourceManager_Membuffer_MMap = 8,
    CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc = 9,
    CXTUResourceUsage_ExternalASTSource_Membuffer_MMap = 10,
    CXTUResourceUsage_Preprocessor = 11,
    CXTUResourceUsage_PreprocessingRecord = 12,
    CXTUResourceUsage_SourceManager_DataStructures = 13,
    CXTUResourceUsage_Preprocessor_HeaderSearch = 14
when not declared(CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN):
  const
    CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN* = enum_CXTUResourceUsageKind_553648687.CXTUResourceUsage_AST
else:
  static :
    hint("Declaration of " & "CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN" &
        " already exists, not redeclaring")
when not declared(CXTUResourceUsage_MEMORY_IN_BYTES_END):
  const
    CXTUResourceUsage_MEMORY_IN_BYTES_END* = enum_CXTUResourceUsageKind_553648687.CXTUResourceUsage_Preprocessor_HeaderSearch
else:
  static :
    hint("Declaration of " & "CXTUResourceUsage_MEMORY_IN_BYTES_END" &
        " already exists, not redeclaring")
when not declared(CXTUResourceUsage_First):
  const
    CXTUResourceUsage_First* = enum_CXTUResourceUsageKind_553648687.CXTUResourceUsage_AST
else:
  static :
    hint("Declaration of " & "CXTUResourceUsage_First" &
        " already exists, not redeclaring")
when not declared(CXTUResourceUsage_Last):
  const
    CXTUResourceUsage_Last* = enum_CXTUResourceUsageKind_553648687.CXTUResourceUsage_Preprocessor_HeaderSearch
else:
  static :
    hint("Declaration of " & "CXTUResourceUsage_Last" &
        " already exists, not redeclaring")
type
  enum_CXCursorKind_553648697* {.size: sizeof(cuint).} = enum
    CXCursor_UnexposedDecl = 1, CXCursor_StructDecl = 2, CXCursor_UnionDecl = 3,
    CXCursor_ClassDecl = 4, CXCursor_EnumDecl = 5, CXCursor_FieldDecl = 6,
    CXCursor_EnumConstantDecl = 7, CXCursor_FunctionDecl = 8,
    CXCursor_VarDecl = 9, CXCursor_ParmDecl = 10,
    CXCursor_ObjCInterfaceDecl = 11, CXCursor_ObjCCategoryDecl = 12,
    CXCursor_ObjCProtocolDecl = 13, CXCursor_ObjCPropertyDecl = 14,
    CXCursor_ObjCIvarDecl = 15, CXCursor_ObjCInstanceMethodDecl = 16,
    CXCursor_ObjCClassMethodDecl = 17, CXCursor_ObjCImplementationDecl = 18,
    CXCursor_ObjCCategoryImplDecl = 19, CXCursor_TypedefDecl = 20,
    CXCursor_CXXMethod = 21, CXCursor_Namespace = 22, CXCursor_LinkageSpec = 23,
    CXCursor_Constructor = 24, CXCursor_Destructor = 25,
    CXCursor_ConversionFunction = 26, CXCursor_TemplateTypeParameter = 27,
    CXCursor_NonTypeTemplateParameter = 28,
    CXCursor_TemplateTemplateParameter = 29, CXCursor_FunctionTemplate = 30,
    CXCursor_ClassTemplate = 31,
    CXCursor_ClassTemplatePartialSpecialization = 32,
    CXCursor_NamespaceAlias = 33, CXCursor_UsingDirective = 34,
    CXCursor_UsingDeclaration = 35, CXCursor_TypeAliasDecl = 36,
    CXCursor_ObjCSynthesizeDecl = 37, CXCursor_ObjCDynamicDecl = 38,
    CXCursor_CXXAccessSpecifier = 39, CXCursor_FirstRef = 40,
    CXCursor_ObjCProtocolRef = 41, CXCursor_ObjCClassRef = 42,
    CXCursor_TypeRef = 43, CXCursor_CXXBaseSpecifier = 44,
    CXCursor_TemplateRef = 45, CXCursor_NamespaceRef = 46,
    CXCursor_MemberRef = 47, CXCursor_LabelRef = 48,
    CXCursor_OverloadedDeclRef = 49, CXCursor_VariableRef = 50,
    CXCursor_FirstInvalid = 70, CXCursor_NoDeclFound = 71,
    CXCursor_NotImplemented = 72, CXCursor_InvalidCode = 73,
    CXCursor_FirstExpr = 100, CXCursor_DeclRefExpr = 101,
    CXCursor_MemberRefExpr = 102, CXCursor_CallExpr = 103,
    CXCursor_ObjCMessageExpr = 104, CXCursor_BlockExpr = 105,
    CXCursor_IntegerLiteral = 106, CXCursor_FloatingLiteral = 107,
    CXCursor_ImaginaryLiteral = 108, CXCursor_StringLiteral = 109,
    CXCursor_CharacterLiteral = 110, CXCursor_ParenExpr = 111,
    CXCursor_UnaryOperator = 112, CXCursor_ArraySubscriptExpr = 113,
    CXCursor_BinaryOperator = 114, CXCursor_CompoundAssignOperator = 115,
    CXCursor_ConditionalOperator = 116, CXCursor_CStyleCastExpr = 117,
    CXCursor_CompoundLiteralExpr = 118, CXCursor_InitListExpr = 119,
    CXCursor_AddrLabelExpr = 120, CXCursor_StmtExpr = 121,
    CXCursor_GenericSelectionExpr = 122, CXCursor_GNUNullExpr = 123,
    CXCursor_CXXStaticCastExpr = 124, CXCursor_CXXDynamicCastExpr = 125,
    CXCursor_CXXReinterpretCastExpr = 126, CXCursor_CXXConstCastExpr = 127,
    CXCursor_CXXFunctionalCastExpr = 128, CXCursor_CXXTypeidExpr = 129,
    CXCursor_CXXBoolLiteralExpr = 130, CXCursor_CXXNullPtrLiteralExpr = 131,
    CXCursor_CXXThisExpr = 132, CXCursor_CXXThrowExpr = 133,
    CXCursor_CXXNewExpr = 134, CXCursor_CXXDeleteExpr = 135,
    CXCursor_UnaryExpr = 136, CXCursor_ObjCStringLiteral = 137,
    CXCursor_ObjCEncodeExpr = 138, CXCursor_ObjCSelectorExpr = 139,
    CXCursor_ObjCProtocolExpr = 140, CXCursor_ObjCBridgedCastExpr = 141,
    CXCursor_PackExpansionExpr = 142, CXCursor_SizeOfPackExpr = 143,
    CXCursor_LambdaExpr = 144, CXCursor_ObjCBoolLiteralExpr = 145,
    CXCursor_ObjCSelfExpr = 146, CXCursor_ArraySectionExpr = 147,
    CXCursor_ObjCAvailabilityCheckExpr = 148, CXCursor_FixedPointLiteral = 149,
    CXCursor_OMPArrayShapingExpr = 150, CXCursor_OMPIteratorExpr = 151,
    CXCursor_CXXAddrspaceCastExpr = 152,
    CXCursor_ConceptSpecializationExpr = 153, CXCursor_RequiresExpr = 154,
    CXCursor_CXXParenListInitExpr = 155, CXCursor_PackIndexingExpr = 156,
    CXCursor_FirstStmt = 200, CXCursor_LabelStmt = 201,
    CXCursor_CompoundStmt = 202, CXCursor_CaseStmt = 203,
    CXCursor_DefaultStmt = 204, CXCursor_IfStmt = 205,
    CXCursor_SwitchStmt = 206, CXCursor_WhileStmt = 207, CXCursor_DoStmt = 208,
    CXCursor_ForStmt = 209, CXCursor_GotoStmt = 210,
    CXCursor_IndirectGotoStmt = 211, CXCursor_ContinueStmt = 212,
    CXCursor_BreakStmt = 213, CXCursor_ReturnStmt = 214,
    CXCursor_GCCAsmStmt = 215, CXCursor_ObjCAtTryStmt = 216,
    CXCursor_ObjCAtCatchStmt = 217, CXCursor_ObjCAtFinallyStmt = 218,
    CXCursor_ObjCAtThrowStmt = 219, CXCursor_ObjCAtSynchronizedStmt = 220,
    CXCursor_ObjCAutoreleasePoolStmt = 221,
    CXCursor_ObjCForCollectionStmt = 222, CXCursor_CXXCatchStmt = 223,
    CXCursor_CXXTryStmt = 224, CXCursor_CXXForRangeStmt = 225,
    CXCursor_SEHTryStmt = 226, CXCursor_SEHExceptStmt = 227,
    CXCursor_SEHFinallyStmt = 228, CXCursor_MSAsmStmt = 229,
    CXCursor_NullStmt = 230, CXCursor_DeclStmt = 231,
    CXCursor_OMPParallelDirective = 232, CXCursor_OMPSimdDirective = 233,
    CXCursor_OMPForDirective = 234, CXCursor_OMPSectionsDirective = 235,
    CXCursor_OMPSectionDirective = 236, CXCursor_OMPSingleDirective = 237,
    CXCursor_OMPParallelForDirective = 238,
    CXCursor_OMPParallelSectionsDirective = 239,
    CXCursor_OMPTaskDirective = 240, CXCursor_OMPMasterDirective = 241,
    CXCursor_OMPCriticalDirective = 242, CXCursor_OMPTaskyieldDirective = 243,
    CXCursor_OMPBarrierDirective = 244, CXCursor_OMPTaskwaitDirective = 245,
    CXCursor_OMPFlushDirective = 246, CXCursor_SEHLeaveStmt = 247,
    CXCursor_OMPOrderedDirective = 248, CXCursor_OMPAtomicDirective = 249,
    CXCursor_OMPForSimdDirective = 250,
    CXCursor_OMPParallelForSimdDirective = 251,
    CXCursor_OMPTargetDirective = 252, CXCursor_OMPTeamsDirective = 253,
    CXCursor_OMPTaskgroupDirective = 254,
    CXCursor_OMPCancellationPointDirective = 255,
    CXCursor_OMPCancelDirective = 256, CXCursor_OMPTargetDataDirective = 257,
    CXCursor_OMPTaskLoopDirective = 258,
    CXCursor_OMPTaskLoopSimdDirective = 259,
    CXCursor_OMPDistributeDirective = 260,
    CXCursor_OMPTargetEnterDataDirective = 261,
    CXCursor_OMPTargetExitDataDirective = 262,
    CXCursor_OMPTargetParallelDirective = 263,
    CXCursor_OMPTargetParallelForDirective = 264,
    CXCursor_OMPTargetUpdateDirective = 265,
    CXCursor_OMPDistributeParallelForDirective = 266,
    CXCursor_OMPDistributeParallelForSimdDirective = 267,
    CXCursor_OMPDistributeSimdDirective = 268,
    CXCursor_OMPTargetParallelForSimdDirective = 269,
    CXCursor_OMPTargetSimdDirective = 270,
    CXCursor_OMPTeamsDistributeDirective = 271,
    CXCursor_OMPTeamsDistributeSimdDirective = 272,
    CXCursor_OMPTeamsDistributeParallelForSimdDirective = 273,
    CXCursor_OMPTeamsDistributeParallelForDirective = 274,
    CXCursor_OMPTargetTeamsDirective = 275,
    CXCursor_OMPTargetTeamsDistributeDirective = 276,
    CXCursor_OMPTargetTeamsDistributeParallelForDirective = 277,
    CXCursor_OMPTargetTeamsDistributeParallelForSimdDirective = 278,
    CXCursor_OMPTargetTeamsDistributeSimdDirective = 279,
    CXCursor_BuiltinBitCastExpr = 280,
    CXCursor_OMPMasterTaskLoopDirective = 281,
    CXCursor_OMPParallelMasterTaskLoopDirective = 282,
    CXCursor_OMPMasterTaskLoopSimdDirective = 283,
    CXCursor_OMPParallelMasterTaskLoopSimdDirective = 284,
    CXCursor_OMPParallelMasterDirective = 285,
    CXCursor_OMPDepobjDirective = 286, CXCursor_OMPScanDirective = 287,
    CXCursor_OMPTileDirective = 288, CXCursor_OMPCanonicalLoop = 289,
    CXCursor_OMPInteropDirective = 290, CXCursor_OMPDispatchDirective = 291,
    CXCursor_OMPMaskedDirective = 292, CXCursor_OMPUnrollDirective = 293,
    CXCursor_OMPMetaDirective = 294, CXCursor_OMPGenericLoopDirective = 295,
    CXCursor_OMPTeamsGenericLoopDirective = 296,
    CXCursor_OMPTargetTeamsGenericLoopDirective = 297,
    CXCursor_OMPParallelGenericLoopDirective = 298,
    CXCursor_OMPTargetParallelGenericLoopDirective = 299,
    CXCursor_OMPParallelMaskedDirective = 300,
    CXCursor_OMPMaskedTaskLoopDirective = 301,
    CXCursor_OMPMaskedTaskLoopSimdDirective = 302,
    CXCursor_OMPParallelMaskedTaskLoopDirective = 303,
    CXCursor_OMPParallelMaskedTaskLoopSimdDirective = 304,
    CXCursor_OMPErrorDirective = 305, CXCursor_OMPScopeDirective = 306,
    CXCursor_OMPReverseDirective = 307, CXCursor_OMPInterchangeDirective = 308,
    CXCursor_OMPAssumeDirective = 309, CXCursor_OMPStripeDirective = 310,
    CXCursor_OMPFuseDirective = 311, CXCursor_OpenACCComputeConstruct = 320,
    CXCursor_OpenACCLoopConstruct = 321,
    CXCursor_OpenACCCombinedConstruct = 322,
    CXCursor_OpenACCDataConstruct = 323,
    CXCursor_OpenACCEnterDataConstruct = 324,
    CXCursor_OpenACCExitDataConstruct = 325,
    CXCursor_OpenACCHostDataConstruct = 326,
    CXCursor_OpenACCWaitConstruct = 327, CXCursor_OpenACCInitConstruct = 328,
    CXCursor_OpenACCShutdownConstruct = 329, CXCursor_OpenACCSetConstruct = 330,
    CXCursor_OpenACCUpdateConstruct = 331,
    CXCursor_OpenACCAtomicConstruct = 332, CXCursor_OpenACCCacheConstruct = 333,
    CXCursor_TranslationUnit = 350, CXCursor_FirstAttr = 400,
    CXCursor_IBActionAttr = 401, CXCursor_IBOutletAttr = 402,
    CXCursor_IBOutletCollectionAttr = 403, CXCursor_CXXFinalAttr = 404,
    CXCursor_CXXOverrideAttr = 405, CXCursor_AnnotateAttr = 406,
    CXCursor_AsmLabelAttr = 407, CXCursor_PackedAttr = 408,
    CXCursor_PureAttr = 409, CXCursor_ConstAttr = 410,
    CXCursor_NoDuplicateAttr = 411, CXCursor_CUDAConstantAttr = 412,
    CXCursor_CUDADeviceAttr = 413, CXCursor_CUDAGlobalAttr = 414,
    CXCursor_CUDAHostAttr = 415, CXCursor_CUDASharedAttr = 416,
    CXCursor_VisibilityAttr = 417, CXCursor_DLLExport = 418,
    CXCursor_DLLImport = 419, CXCursor_NSReturnsRetained = 420,
    CXCursor_NSReturnsNotRetained = 421, CXCursor_NSReturnsAutoreleased = 422,
    CXCursor_NSConsumesSelf = 423, CXCursor_NSConsumed = 424,
    CXCursor_ObjCException = 425, CXCursor_ObjCNSObject = 426,
    CXCursor_ObjCIndependentClass = 427, CXCursor_ObjCPreciseLifetime = 428,
    CXCursor_ObjCReturnsInnerPointer = 429, CXCursor_ObjCRequiresSuper = 430,
    CXCursor_ObjCRootClass = 431, CXCursor_ObjCSubclassingRestricted = 432,
    CXCursor_ObjCExplicitProtocolImpl = 433,
    CXCursor_ObjCDesignatedInitializer = 434, CXCursor_ObjCRuntimeVisible = 435,
    CXCursor_ObjCBoxable = 436, CXCursor_FlagEnum = 437,
    CXCursor_ConvergentAttr = 438, CXCursor_WarnUnusedAttr = 439,
    CXCursor_WarnUnusedResultAttr = 440, CXCursor_AlignedAttr = 441,
    CXCursor_PreprocessingDirective = 500, CXCursor_MacroDefinition = 501,
    CXCursor_MacroExpansion = 502, CXCursor_InclusionDirective = 503,
    CXCursor_ModuleImportDecl = 600, CXCursor_TypeAliasTemplateDecl = 601,
    CXCursor_StaticAssert = 602, CXCursor_FriendDecl = 603,
    CXCursor_ConceptDecl = 604, CXCursor_OverloadCandidate = 700
when not declared(CXCursor_FirstDecl):
  const
    CXCursor_FirstDecl* = enum_CXCursorKind_553648697.CXCursor_UnexposedDecl
else:
  static :
    hint("Declaration of " & "CXCursor_FirstDecl" &
        " already exists, not redeclaring")
when not declared(CXCursor_LastDecl):
  const
    CXCursor_LastDecl* = enum_CXCursorKind_553648697.CXCursor_CXXAccessSpecifier
else:
  static :
    hint("Declaration of " & "CXCursor_LastDecl" &
        " already exists, not redeclaring")
when not declared(CXCursor_ObjCSuperClassRef):
  const
    CXCursor_ObjCSuperClassRef* = enum_CXCursorKind_553648697.CXCursor_FirstRef
else:
  static :
    hint("Declaration of " & "CXCursor_ObjCSuperClassRef" &
        " already exists, not redeclaring")
when not declared(CXCursor_LastRef):
  const
    CXCursor_LastRef* = enum_CXCursorKind_553648697.CXCursor_VariableRef
else:
  static :
    hint("Declaration of " & "CXCursor_LastRef" &
        " already exists, not redeclaring")
when not declared(CXCursor_InvalidFile):
  const
    CXCursor_InvalidFile* = enum_CXCursorKind_553648697.CXCursor_FirstInvalid
else:
  static :
    hint("Declaration of " & "CXCursor_InvalidFile" &
        " already exists, not redeclaring")
when not declared(CXCursor_LastInvalid):
  const
    CXCursor_LastInvalid* = enum_CXCursorKind_553648697.CXCursor_InvalidCode
else:
  static :
    hint("Declaration of " & "CXCursor_LastInvalid" &
        " already exists, not redeclaring")
when not declared(CXCursor_UnexposedExpr):
  const
    CXCursor_UnexposedExpr* = enum_CXCursorKind_553648697.CXCursor_FirstExpr
else:
  static :
    hint("Declaration of " & "CXCursor_UnexposedExpr" &
        " already exists, not redeclaring")
when not declared(CXCursor_LastExpr):
  const
    CXCursor_LastExpr* = enum_CXCursorKind_553648697.CXCursor_PackIndexingExpr
else:
  static :
    hint("Declaration of " & "CXCursor_LastExpr" &
        " already exists, not redeclaring")
when not declared(CXCursor_UnexposedStmt):
  const
    CXCursor_UnexposedStmt* = enum_CXCursorKind_553648697.CXCursor_FirstStmt
else:
  static :
    hint("Declaration of " & "CXCursor_UnexposedStmt" &
        " already exists, not redeclaring")
when not declared(CXCursor_AsmStmt):
  const
    CXCursor_AsmStmt* = enum_CXCursorKind_553648697.CXCursor_GCCAsmStmt
else:
  static :
    hint("Declaration of " & "CXCursor_AsmStmt" &
        " already exists, not redeclaring")
when not declared(CXCursor_LastStmt):
  const
    CXCursor_LastStmt* = enum_CXCursorKind_553648697.CXCursor_OpenACCCacheConstruct
else:
  static :
    hint("Declaration of " & "CXCursor_LastStmt" &
        " already exists, not redeclaring")
when not declared(CXCursor_UnexposedAttr):
  const
    CXCursor_UnexposedAttr* = enum_CXCursorKind_553648697.CXCursor_FirstAttr
else:
  static :
    hint("Declaration of " & "CXCursor_UnexposedAttr" &
        " already exists, not redeclaring")
when not declared(CXCursor_LastAttr):
  const
    CXCursor_LastAttr* = enum_CXCursorKind_553648697.CXCursor_AlignedAttr
else:
  static :
    hint("Declaration of " & "CXCursor_LastAttr" &
        " already exists, not redeclaring")
when not declared(CXCursor_MacroInstantiation):
  const
    CXCursor_MacroInstantiation* = enum_CXCursorKind_553648697.CXCursor_MacroExpansion
else:
  static :
    hint("Declaration of " & "CXCursor_MacroInstantiation" &
        " already exists, not redeclaring")
when not declared(CXCursor_FirstPreprocessing):
  const
    CXCursor_FirstPreprocessing* = enum_CXCursorKind_553648697.CXCursor_PreprocessingDirective
else:
  static :
    hint("Declaration of " & "CXCursor_FirstPreprocessing" &
        " already exists, not redeclaring")
when not declared(CXCursor_LastPreprocessing):
  const
    CXCursor_LastPreprocessing* = enum_CXCursorKind_553648697.CXCursor_InclusionDirective
else:
  static :
    hint("Declaration of " & "CXCursor_LastPreprocessing" &
        " already exists, not redeclaring")
when not declared(CXCursor_FirstExtraDecl):
  const
    CXCursor_FirstExtraDecl* = enum_CXCursorKind_553648697.CXCursor_ModuleImportDecl
else:
  static :
    hint("Declaration of " & "CXCursor_FirstExtraDecl" &
        " already exists, not redeclaring")
when not declared(CXCursor_LastExtraDecl):
  const
    CXCursor_LastExtraDecl* = enum_CXCursorKind_553648697.CXCursor_ConceptDecl
else:
  static :
    hint("Declaration of " & "CXCursor_LastExtraDecl" &
        " already exists, not redeclaring")
type
  enum_CXLinkageKind_553648703* {.size: sizeof(cuint).} = enum
    CXLinkage_Invalid = 0, CXLinkage_NoLinkage = 1, CXLinkage_Internal = 2,
    CXLinkage_UniqueExternal = 3, CXLinkage_External = 4
type
  enum_CXVisibilityKind_553648705* {.size: sizeof(cuint).} = enum
    CXVisibility_Invalid = 0, CXVisibility_Hidden = 1,
    CXVisibility_Protected = 2, CXVisibility_Default = 3
type
  enum_CXLanguageKind_553648711* {.size: sizeof(cuint).} = enum
    CXLanguage_Invalid = 0, CXLanguage_C = 1, CXLanguage_ObjC = 2,
    CXLanguage_CPlusPlus = 3
type
  enum_CXTLSKind_553648713* {.size: sizeof(cuint).} = enum
    CXTLS_None = 0, CXTLS_Dynamic = 1, CXTLS_Static = 2
type
  enum_CXTypeKind_553648717* {.size: sizeof(cuint).} = enum
    CXType_Invalid = 0, CXType_Unexposed = 1, CXType_Void = 2, CXType_Bool = 3,
    CXType_Char_U = 4, CXType_UChar = 5, CXType_Char16 = 6, CXType_Char32 = 7,
    CXType_UShort = 8, CXType_UInt = 9, CXType_ULong = 10,
    CXType_ULongLong = 11, CXType_UInt128 = 12, CXType_Char_S = 13,
    CXType_SChar = 14, CXType_WChar = 15, CXType_Short = 16, CXType_Int = 17,
    CXType_Long = 18, CXType_LongLong = 19, CXType_Int128 = 20,
    CXType_Float = 21, CXType_Double = 22, CXType_LongDouble = 23,
    CXType_NullPtr = 24, CXType_Overload = 25, CXType_Dependent = 26,
    CXType_ObjCId = 27, CXType_ObjCClass = 28, CXType_ObjCSel = 29,
    CXType_Float128 = 30, CXType_Half = 31, CXType_Float16 = 32,
    CXType_ShortAccum = 33, CXType_Accum = 34, CXType_LongAccum = 35,
    CXType_UShortAccum = 36, CXType_UAccum = 37, CXType_ULongAccum = 38,
    CXType_BFloat16 = 39, CXType_Ibm128 = 40, CXType_Complex = 100,
    CXType_Pointer = 101, CXType_BlockPointer = 102,
    CXType_LValueReference = 103, CXType_RValueReference = 104,
    CXType_Record = 105, CXType_Enum = 106, CXType_Typedef = 107,
    CXType_ObjCInterface = 108, CXType_ObjCObjectPointer = 109,
    CXType_FunctionNoProto = 110, CXType_FunctionProto = 111,
    CXType_ConstantArray = 112, CXType_Vector = 113,
    CXType_IncompleteArray = 114, CXType_VariableArray = 115,
    CXType_DependentSizedArray = 116, CXType_MemberPointer = 117,
    CXType_Auto = 118, CXType_Elaborated = 119, CXType_Pipe = 120,
    CXType_OCLImage1dRO = 121, CXType_OCLImage1dArrayRO = 122,
    CXType_OCLImage1dBufferRO = 123, CXType_OCLImage2dRO = 124,
    CXType_OCLImage2dArrayRO = 125, CXType_OCLImage2dDepthRO = 126,
    CXType_OCLImage2dArrayDepthRO = 127, CXType_OCLImage2dMSAARO = 128,
    CXType_OCLImage2dArrayMSAARO = 129, CXType_OCLImage2dMSAADepthRO = 130,
    CXType_OCLImage2dArrayMSAADepthRO = 131, CXType_OCLImage3dRO = 132,
    CXType_OCLImage1dWO = 133, CXType_OCLImage1dArrayWO = 134,
    CXType_OCLImage1dBufferWO = 135, CXType_OCLImage2dWO = 136,
    CXType_OCLImage2dArrayWO = 137, CXType_OCLImage2dDepthWO = 138,
    CXType_OCLImage2dArrayDepthWO = 139, CXType_OCLImage2dMSAAWO = 140,
    CXType_OCLImage2dArrayMSAAWO = 141, CXType_OCLImage2dMSAADepthWO = 142,
    CXType_OCLImage2dArrayMSAADepthWO = 143, CXType_OCLImage3dWO = 144,
    CXType_OCLImage1dRW = 145, CXType_OCLImage1dArrayRW = 146,
    CXType_OCLImage1dBufferRW = 147, CXType_OCLImage2dRW = 148,
    CXType_OCLImage2dArrayRW = 149, CXType_OCLImage2dDepthRW = 150,
    CXType_OCLImage2dArrayDepthRW = 151, CXType_OCLImage2dMSAARW = 152,
    CXType_OCLImage2dArrayMSAARW = 153, CXType_OCLImage2dMSAADepthRW = 154,
    CXType_OCLImage2dArrayMSAADepthRW = 155, CXType_OCLImage3dRW = 156,
    CXType_OCLSampler = 157, CXType_OCLEvent = 158, CXType_OCLQueue = 159,
    CXType_OCLReserveID = 160, CXType_ObjCObject = 161,
    CXType_ObjCTypeParam = 162, CXType_Attributed = 163,
    CXType_OCLIntelSubgroupAVCMcePayload = 164,
    CXType_OCLIntelSubgroupAVCImePayload = 165,
    CXType_OCLIntelSubgroupAVCRefPayload = 166,
    CXType_OCLIntelSubgroupAVCSicPayload = 167,
    CXType_OCLIntelSubgroupAVCMceResult = 168,
    CXType_OCLIntelSubgroupAVCImeResult = 169,
    CXType_OCLIntelSubgroupAVCRefResult = 170,
    CXType_OCLIntelSubgroupAVCSicResult = 171,
    CXType_OCLIntelSubgroupAVCImeResultSingleReferenceStreamout = 172,
    CXType_OCLIntelSubgroupAVCImeResultDualReferenceStreamout = 173,
    CXType_OCLIntelSubgroupAVCImeSingleReferenceStreamin = 174,
    CXType_OCLIntelSubgroupAVCImeDualReferenceStreamin = 175,
    CXType_ExtVector = 176, CXType_Atomic = 177, CXType_BTFTagAttributed = 178,
    CXType_HLSLResource = 179, CXType_HLSLAttributedResource = 180,
    CXType_HLSLInlineSpirv = 181
when not declared(CXType_FirstBuiltin):
  const
    CXType_FirstBuiltin* = enum_CXTypeKind_553648717.CXType_Void
else:
  static :
    hint("Declaration of " & "CXType_FirstBuiltin" &
        " already exists, not redeclaring")
when not declared(CXType_LastBuiltin):
  const
    CXType_LastBuiltin* = enum_CXTypeKind_553648717.CXType_Ibm128
else:
  static :
    hint("Declaration of " & "CXType_LastBuiltin" &
        " already exists, not redeclaring")
when not declared(CXType_OCLIntelSubgroupAVCImeResultSingleRefStreamout):
  const
    CXType_OCLIntelSubgroupAVCImeResultSingleRefStreamout* = enum_CXTypeKind_553648717.CXType_OCLIntelSubgroupAVCImeResultSingleReferenceStreamout
else:
  static :
    hint("Declaration of " &
        "CXType_OCLIntelSubgroupAVCImeResultSingleRefStreamout" &
        " already exists, not redeclaring")
when not declared(CXType_OCLIntelSubgroupAVCImeResultDualRefStreamout):
  const
    CXType_OCLIntelSubgroupAVCImeResultDualRefStreamout* = enum_CXTypeKind_553648717.CXType_OCLIntelSubgroupAVCImeResultDualReferenceStreamout
else:
  static :
    hint("Declaration of " &
        "CXType_OCLIntelSubgroupAVCImeResultDualRefStreamout" &
        " already exists, not redeclaring")
when not declared(CXType_OCLIntelSubgroupAVCImeSingleRefStreamin):
  const
    CXType_OCLIntelSubgroupAVCImeSingleRefStreamin* = enum_CXTypeKind_553648717.CXType_OCLIntelSubgroupAVCImeSingleReferenceStreamin
else:
  static :
    hint("Declaration of " & "CXType_OCLIntelSubgroupAVCImeSingleRefStreamin" &
        " already exists, not redeclaring")
when not declared(CXType_OCLIntelSubgroupAVCImeDualRefStreamin):
  const
    CXType_OCLIntelSubgroupAVCImeDualRefStreamin* = enum_CXTypeKind_553648717.CXType_OCLIntelSubgroupAVCImeDualReferenceStreamin
else:
  static :
    hint("Declaration of " & "CXType_OCLIntelSubgroupAVCImeDualRefStreamin" &
        " already exists, not redeclaring")
type
  enum_CXCallingConv_553648719* {.size: sizeof(cuint).} = enum
    CXCallingConv_Default = 0, CXCallingConv_C = 1,
    CXCallingConv_X86StdCall = 2, CXCallingConv_X86FastCall = 3,
    CXCallingConv_X86ThisCall = 4, CXCallingConv_X86Pascal = 5,
    CXCallingConv_AAPCS = 6, CXCallingConv_AAPCS_VFP = 7,
    CXCallingConv_X86RegCall = 8, CXCallingConv_IntelOclBicc = 9,
    CXCallingConv_Win64 = 10, CXCallingConv_X86_64SysV = 11,
    CXCallingConv_X86VectorCall = 12, CXCallingConv_Swift = 13,
    CXCallingConv_PreserveMost = 14, CXCallingConv_PreserveAll = 15,
    CXCallingConv_AArch64VectorCall = 16, CXCallingConv_SwiftAsync = 17,
    CXCallingConv_AArch64SVEPCS = 18, CXCallingConv_M68kRTD = 19,
    CXCallingConv_PreserveNone = 20, CXCallingConv_RISCVVectorCall = 21,
    CXCallingConv_RISCVVLSCall_32 = 22, CXCallingConv_RISCVVLSCall_64 = 23,
    CXCallingConv_RISCVVLSCall_128 = 24, CXCallingConv_RISCVVLSCall_256 = 25,
    CXCallingConv_RISCVVLSCall_512 = 26, CXCallingConv_RISCVVLSCall_1024 = 27,
    CXCallingConv_RISCVVLSCall_2048 = 28, CXCallingConv_RISCVVLSCall_4096 = 29,
    CXCallingConv_RISCVVLSCall_8192 = 30, CXCallingConv_RISCVVLSCall_16384 = 31,
    CXCallingConv_RISCVVLSCall_32768 = 32,
    CXCallingConv_RISCVVLSCall_65536 = 33, CXCallingConv_Invalid = 100,
    CXCallingConv_Unexposed = 200
when not declared(CXCallingConv_X86_64Win64):
  const
    CXCallingConv_X86_64Win64* = enum_CXCallingConv_553648719.CXCallingConv_Win64
else:
  static :
    hint("Declaration of " & "CXCallingConv_X86_64Win64" &
        " already exists, not redeclaring")
type
  enum_CXTemplateArgumentKind_553648725* {.size: sizeof(cuint).} = enum
    CXTemplateArgumentKind_Null = 0, CXTemplateArgumentKind_Type = 1,
    CXTemplateArgumentKind_Declaration = 2, CXTemplateArgumentKind_NullPtr = 3,
    CXTemplateArgumentKind_Integral = 4, CXTemplateArgumentKind_Template = 5,
    CXTemplateArgumentKind_TemplateExpansion = 6,
    CXTemplateArgumentKind_Expression = 7, CXTemplateArgumentKind_Pack = 8,
    CXTemplateArgumentKind_Invalid = 9
type
  enum_CXTypeNullabilityKind_553648727* {.size: sizeof(cuint).} = enum
    CXTypeNullability_NonNull = 0, CXTypeNullability_Nullable = 1,
    CXTypeNullability_Unspecified = 2, CXTypeNullability_Invalid = 3,
    CXTypeNullability_NullableResult = 4
type
  enum_CXTypeLayoutError_553648729* {.size: sizeof(cint).} = enum
    CXTypeLayoutError_Undeduced = -6, CXTypeLayoutError_InvalidFieldName = -5,
    CXTypeLayoutError_NotConstantSize = -4, CXTypeLayoutError_Dependent = -3,
    CXTypeLayoutError_Incomplete = -2, CXTypeLayoutError_Invalid = -1
type
  enum_CXRefQualifierKind_553648731* {.size: sizeof(cuint).} = enum
    CXRefQualifier_None = 0, CXRefQualifier_LValue = 1,
    CXRefQualifier_RValue = 2
type
  enum_CX_CXXAccessSpecifier_553648733* {.size: sizeof(cuint).} = enum
    CX_CXXInvalidAccessSpecifier = 0, CX_CXXPublic = 1, CX_CXXProtected = 2,
    CX_CXXPrivate = 3
type
  enum_CX_StorageClass_553648735* {.size: sizeof(cuint).} = enum
    CX_SC_Invalid = 0, CX_SC_None = 1, CX_SC_Extern = 2, CX_SC_Static = 3,
    CX_SC_PrivateExtern = 4, CX_SC_OpenCLWorkGroupLocal = 5, CX_SC_Auto = 6,
    CX_SC_Register = 7
type
  enum_CX_BinaryOperatorKind_553648737* {.size: sizeof(cuint).} = enum
    CX_BO_Invalid = 0, CX_BO_PtrMemD = 1, CX_BO_PtrMemI = 2, CX_BO_Mul = 3,
    CX_BO_Div = 4, CX_BO_Rem = 5, CX_BO_Add = 6, CX_BO_Sub = 7, CX_BO_Shl = 8,
    CX_BO_Shr = 9, CX_BO_Cmp = 10, CX_BO_LT = 11, CX_BO_GT = 12, CX_BO_LE = 13,
    CX_BO_GE = 14, CX_BO_EQ = 15, CX_BO_NE = 16, CX_BO_And = 17, CX_BO_Xor = 18,
    CX_BO_Or = 19, CX_BO_LAnd = 20, CX_BO_LOr = 21, CX_BO_Assign = 22,
    CX_BO_MulAssign = 23, CX_BO_DivAssign = 24, CX_BO_RemAssign = 25,
    CX_BO_AddAssign = 26, CX_BO_SubAssign = 27, CX_BO_ShlAssign = 28,
    CX_BO_ShrAssign = 29, CX_BO_AndAssign = 30, CX_BO_XorAssign = 31,
    CX_BO_OrAssign = 32, CX_BO_Comma = 33
when not declared(CX_BO_LAST):
  const
    CX_BO_LAST* = enum_CX_BinaryOperatorKind_553648737.CX_BO_Comma
else:
  static :
    hint("Declaration of " & "CX_BO_LAST" & " already exists, not redeclaring")
type
  enum_CXChildVisitResult_553648739* {.size: sizeof(cuint).} = enum
    CXChildVisit_Break = 0, CXChildVisit_Continue = 1, CXChildVisit_Recurse = 2
type
  enum_CXPrintingPolicyProperty_553648747* {.size: sizeof(cuint).} = enum
    CXPrintingPolicy_Indentation = 0, CXPrintingPolicy_SuppressSpecifiers = 1,
    CXPrintingPolicy_SuppressTagKeyword = 2,
    CXPrintingPolicy_IncludeTagDefinition = 3,
    CXPrintingPolicy_SuppressScope = 4,
    CXPrintingPolicy_SuppressUnwrittenScope = 5,
    CXPrintingPolicy_SuppressInitializers = 6,
    CXPrintingPolicy_ConstantArraySizeAsWritten = 7,
    CXPrintingPolicy_AnonymousTagLocations = 8,
    CXPrintingPolicy_SuppressStrongLifetime = 9,
    CXPrintingPolicy_SuppressLifetimeQualifiers = 10,
    CXPrintingPolicy_SuppressTemplateArgsInCXXConstructors = 11,
    CXPrintingPolicy_Bool = 12, CXPrintingPolicy_Restrict = 13,
    CXPrintingPolicy_Alignof = 14, CXPrintingPolicy_UnderscoreAlignof = 15,
    CXPrintingPolicy_UseVoidForZeroParams = 16,
    CXPrintingPolicy_TerseOutput = 17,
    CXPrintingPolicy_PolishForDeclaration = 18, CXPrintingPolicy_Half = 19,
    CXPrintingPolicy_MSWChar = 20, CXPrintingPolicy_IncludeNewlines = 21,
    CXPrintingPolicy_MSVCFormatting = 22,
    CXPrintingPolicy_ConstantsAsWritten = 23,
    CXPrintingPolicy_SuppressImplicitBase = 24,
    CXPrintingPolicy_FullyQualifiedName = 25
when not declared(CXPrintingPolicy_LastProperty):
  const
    CXPrintingPolicy_LastProperty* = enum_CXPrintingPolicyProperty_553648747.CXPrintingPolicy_FullyQualifiedName
else:
  static :
    hint("Declaration of " & "CXPrintingPolicy_LastProperty" &
        " already exists, not redeclaring")
type
  enum_CXObjCPropertyAttrKind_553648749* {.size: sizeof(cuint).} = enum
    CXObjCPropertyAttr_noattr = 0, CXObjCPropertyAttr_readonly = 1,
    CXObjCPropertyAttr_getter = 2, CXObjCPropertyAttr_assign = 4,
    CXObjCPropertyAttr_readwrite = 8, CXObjCPropertyAttr_retain = 16,
    CXObjCPropertyAttr_copy = 32, CXObjCPropertyAttr_nonatomic = 64,
    CXObjCPropertyAttr_setter = 128, CXObjCPropertyAttr_atomic = 256,
    CXObjCPropertyAttr_weak = 512, CXObjCPropertyAttr_strong = 1024,
    CXObjCPropertyAttr_unsafe_unretained = 2048, CXObjCPropertyAttr_class = 4096
type
  enum_CXObjCDeclQualifierKind_553648753* {.size: sizeof(cuint).} = enum
    CXObjCDeclQualifier_None = 0, CXObjCDeclQualifier_In = 1,
    CXObjCDeclQualifier_Inout = 2, CXObjCDeclQualifier_Out = 4,
    CXObjCDeclQualifier_Bycopy = 8, CXObjCDeclQualifier_Byref = 16,
    CXObjCDeclQualifier_Oneway = 32
type
  enum_CXNameRefFlags_553648759* {.size: sizeof(cuint).} = enum
    CXNameRange_WantQualifier = 1, CXNameRange_WantTemplateArgs = 2,
    CXNameRange_WantSinglePiece = 4
type
  enum_CXTokenKind_553648761* {.size: sizeof(cuint).} = enum
    CXToken_Punctuation = 0, CXToken_Keyword = 1, CXToken_Identifier = 2,
    CXToken_Literal = 3, CXToken_Comment = 4
type
  enum_CXCompletionChunkKind_553648775* {.size: sizeof(cuint).} = enum
    CXCompletionChunk_Optional = 0, CXCompletionChunk_TypedText = 1,
    CXCompletionChunk_Text = 2, CXCompletionChunk_Placeholder = 3,
    CXCompletionChunk_Informative = 4, CXCompletionChunk_CurrentParameter = 5,
    CXCompletionChunk_LeftParen = 6, CXCompletionChunk_RightParen = 7,
    CXCompletionChunk_LeftBracket = 8, CXCompletionChunk_RightBracket = 9,
    CXCompletionChunk_LeftBrace = 10, CXCompletionChunk_RightBrace = 11,
    CXCompletionChunk_LeftAngle = 12, CXCompletionChunk_RightAngle = 13,
    CXCompletionChunk_Comma = 14, CXCompletionChunk_ResultType = 15,
    CXCompletionChunk_Colon = 16, CXCompletionChunk_SemiColon = 17,
    CXCompletionChunk_Equal = 18, CXCompletionChunk_HorizontalSpace = 19,
    CXCompletionChunk_VerticalSpace = 20
type
  enum_CXCodeComplete_Flags_553648781* {.size: sizeof(cuint).} = enum
    CXCodeComplete_IncludeMacros = 1, CXCodeComplete_IncludeCodePatterns = 2,
    CXCodeComplete_IncludeBriefComments = 4, CXCodeComplete_SkipPreamble = 8,
    CXCodeComplete_IncludeCompletionsWithFixIts = 16
type
  enum_CXCompletionContext_553648783* {.size: sizeof(cuint).} = enum
    CXCompletionContext_Unexposed = 0, CXCompletionContext_AnyType = 1,
    CXCompletionContext_AnyValue = 2, CXCompletionContext_ObjCObjectValue = 4,
    CXCompletionContext_ObjCSelectorValue = 8,
    CXCompletionContext_CXXClassTypeValue = 16,
    CXCompletionContext_DotMemberAccess = 32,
    CXCompletionContext_ArrowMemberAccess = 64,
    CXCompletionContext_ObjCPropertyAccess = 128,
    CXCompletionContext_EnumTag = 256, CXCompletionContext_UnionTag = 512,
    CXCompletionContext_StructTag = 1024, CXCompletionContext_ClassTag = 2048,
    CXCompletionContext_Namespace = 4096,
    CXCompletionContext_NestedNameSpecifier = 8192,
    CXCompletionContext_ObjCInterface = 16384,
    CXCompletionContext_ObjCProtocol = 32768,
    CXCompletionContext_ObjCCategory = 65536,
    CXCompletionContext_ObjCInstanceMessage = 131072,
    CXCompletionContext_ObjCClassMessage = 262144,
    CXCompletionContext_ObjCSelectorName = 524288,
    CXCompletionContext_MacroName = 1048576,
    CXCompletionContext_NaturalLanguage = 2097152,
    CXCompletionContext_IncludedFile = 4194304,
    CXCompletionContext_Unknown = 8388607
type
  enum_CXEvalResultKind_553648787* {.size: sizeof(cuint).} = enum
    CXEval_UnExposed = 0, CXEval_Int = 1, CXEval_Float = 2,
    CXEval_ObjCStrLiteral = 3, CXEval_StrLiteral = 4, CXEval_CFStr = 5,
    CXEval_Other = 6
type
  enum_CXVisitorResult_553648793* {.size: sizeof(cuint).} = enum
    CXVisit_Break = 0, CXVisit_Continue = 1
type
  enum_CXResult_553648799* {.size: sizeof(cuint).} = enum
    CXResult_Success = 0, CXResult_Invalid = 1, CXResult_VisitBreak = 2
type
  enum_CXIdxEntityKind_553648825* {.size: sizeof(cuint).} = enum
    CXIdxEntity_Unexposed = 0, CXIdxEntity_Typedef = 1,
    CXIdxEntity_Function = 2, CXIdxEntity_Variable = 3, CXIdxEntity_Field = 4,
    CXIdxEntity_EnumConstant = 5, CXIdxEntity_ObjCClass = 6,
    CXIdxEntity_ObjCProtocol = 7, CXIdxEntity_ObjCCategory = 8,
    CXIdxEntity_ObjCInstanceMethod = 9, CXIdxEntity_ObjCClassMethod = 10,
    CXIdxEntity_ObjCProperty = 11, CXIdxEntity_ObjCIvar = 12,
    CXIdxEntity_Enum = 13, CXIdxEntity_Struct = 14, CXIdxEntity_Union = 15,
    CXIdxEntity_CXXClass = 16, CXIdxEntity_CXXNamespace = 17,
    CXIdxEntity_CXXNamespaceAlias = 18, CXIdxEntity_CXXStaticVariable = 19,
    CXIdxEntity_CXXStaticMethod = 20, CXIdxEntity_CXXInstanceMethod = 21,
    CXIdxEntity_CXXConstructor = 22, CXIdxEntity_CXXDestructor = 23,
    CXIdxEntity_CXXConversionFunction = 24, CXIdxEntity_CXXTypeAlias = 25,
    CXIdxEntity_CXXInterface = 26, CXIdxEntity_CXXConcept = 27
type
  enum_CXIdxEntityLanguage_553648829* {.size: sizeof(cuint).} = enum
    CXIdxEntityLang_None = 0, CXIdxEntityLang_C = 1, CXIdxEntityLang_ObjC = 2,
    CXIdxEntityLang_CXX = 3, CXIdxEntityLang_Swift = 4
type
  enum_CXIdxEntityCXXTemplateKind_553648833* {.size: sizeof(cuint).} = enum
    CXIdxEntity_NonTemplate = 0, CXIdxEntity_Template = 1,
    CXIdxEntity_TemplatePartialSpecialization = 2,
    CXIdxEntity_TemplateSpecialization = 3
type
  enum_CXIdxAttrKind_553648837* {.size: sizeof(cuint).} = enum
    CXIdxAttr_Unexposed = 0, CXIdxAttr_IBAction = 1, CXIdxAttr_IBOutlet = 2,
    CXIdxAttr_IBOutletCollection = 3
type
  enum_CXIdxDeclInfoFlags_553648857* {.size: sizeof(cuint).} = enum
    CXIdxDeclFlag_Skipped = 1
type
  enum_CXIdxObjCContainerKind_553648865* {.size: sizeof(cuint).} = enum
    CXIdxObjCContainer_ForwardRef = 0, CXIdxObjCContainer_Interface = 1,
    CXIdxObjCContainer_Implementation = 2
type
  enum_CXIdxEntityRefKind_553648901* {.size: sizeof(cuint).} = enum
    CXIdxEntityRef_Direct = 1, CXIdxEntityRef_Implicit = 2
type
  enum_CXSymbolRole_553648905* {.size: sizeof(cuint).} = enum
    CXSymbolRole_None = 0, CXSymbolRole_Declaration = 1,
    CXSymbolRole_Definition = 2, CXSymbolRole_Reference = 4,
    CXSymbolRole_Read = 8, CXSymbolRole_Write = 16, CXSymbolRole_Call = 32,
    CXSymbolRole_Dynamic = 64, CXSymbolRole_AddressOf = 128,
    CXSymbolRole_Implicit = 256
type
  enum_CXIndexOptFlags_553648919* {.size: sizeof(cuint).} = enum
    CXIndexOpt_None = 0, CXIndexOpt_SuppressRedundantRefs = 1,
    CXIndexOpt_IndexFunctionLocalSymbols = 2,
    CXIndexOpt_IndexImplicitTemplateInstantiations = 4,
    CXIndexOpt_SuppressWarnings = 8, CXIndexOpt_SkipParsedBodiesInSession = 16
type
  enum_CXBinaryOperatorKind_enum_553648925* {.size: sizeof(cuint).} = enum
    CXBinaryOperator_Invalid = 0, CXBinaryOperator_PtrMemD = 1,
    CXBinaryOperator_PtrMemI = 2, CXBinaryOperator_Mul = 3,
    CXBinaryOperator_Div = 4, CXBinaryOperator_Rem = 5,
    CXBinaryOperator_Add = 6, CXBinaryOperator_Sub = 7,
    CXBinaryOperator_Shl = 8, CXBinaryOperator_Shr = 9,
    CXBinaryOperator_Cmp = 10, CXBinaryOperator_LT = 11,
    CXBinaryOperator_GT = 12, CXBinaryOperator_LE = 13,
    CXBinaryOperator_GE = 14, CXBinaryOperator_EQ = 15,
    CXBinaryOperator_NE = 16, CXBinaryOperator_And = 17,
    CXBinaryOperator_Xor = 18, CXBinaryOperator_Or = 19,
    CXBinaryOperator_LAnd = 20, CXBinaryOperator_LOr = 21,
    CXBinaryOperator_Assign = 22, CXBinaryOperator_MulAssign = 23,
    CXBinaryOperator_DivAssign = 24, CXBinaryOperator_RemAssign = 25,
    CXBinaryOperator_AddAssign = 26, CXBinaryOperator_SubAssign = 27,
    CXBinaryOperator_ShlAssign = 28, CXBinaryOperator_ShrAssign = 29,
    CXBinaryOperator_AndAssign = 30, CXBinaryOperator_XorAssign = 31,
    CXBinaryOperator_OrAssign = 32, CXBinaryOperator_Comma = 33
when not declared(CXBinaryOperator_Last):
  const
    CXBinaryOperator_Last* = enum_CXBinaryOperatorKind_enum_553648925.CXBinaryOperator_Comma
else:
  static :
    hint("Declaration of " & "CXBinaryOperator_Last" &
        " already exists, not redeclaring")
type
  enum_CXUnaryOperatorKind_553648927* {.size: sizeof(cuint).} = enum
    CXUnaryOperator_Invalid = 0, CXUnaryOperator_PostInc = 1,
    CXUnaryOperator_PostDec = 2, CXUnaryOperator_PreInc = 3,
    CXUnaryOperator_PreDec = 4, CXUnaryOperator_AddrOf = 5,
    CXUnaryOperator_Deref = 6, CXUnaryOperator_Plus = 7,
    CXUnaryOperator_Minus = 8, CXUnaryOperator_Not = 9,
    CXUnaryOperator_LNot = 10, CXUnaryOperator_Real = 11,
    CXUnaryOperator_Imag = 12, CXUnaryOperator_Extension = 13,
    CXUnaryOperator_Coawait = 14
type
  enum_CXCommentKind_553648935* {.size: sizeof(cuint).} = enum
    CXComment_Null = 0, CXComment_Text = 1, CXComment_InlineCommand = 2,
    CXComment_HTMLStartTag = 3, CXComment_HTMLEndTag = 4,
    CXComment_Paragraph = 5, CXComment_BlockCommand = 6,
    CXComment_ParamCommand = 7, CXComment_TParamCommand = 8,
    CXComment_VerbatimBlockCommand = 9, CXComment_VerbatimBlockLine = 10,
    CXComment_VerbatimLine = 11, CXComment_FullComment = 12
type
  enum_CXCommentInlineCommandRenderKind_553648937* {.size: sizeof(cuint).} = enum
    CXCommentInlineCommandRenderKind_Normal = 0,
    CXCommentInlineCommandRenderKind_Bold = 1,
    CXCommentInlineCommandRenderKind_Monospaced = 2,
    CXCommentInlineCommandRenderKind_Emphasized = 3,
    CXCommentInlineCommandRenderKind_Anchor = 4
type
  enum_CXCommentParamPassDirection_553648939* {.size: sizeof(cuint).} = enum
    CXCommentParamPassDirection_In = 0, CXCommentParamPassDirection_Out = 1,
    CXCommentParamPassDirection_InOut = 2
when not declared(struct_CXChildVisitResult):
  type
    struct_CXChildVisitResult* = object
else:
  static :
    hint("Declaration of " & "struct_CXChildVisitResult" &
        " already exists, not redeclaring")
when not declared(struct_CXModuleMapDescriptorImpl):
  type
    struct_CXModuleMapDescriptorImpl* = object
else:
  static :
    hint("Declaration of " & "struct_CXModuleMapDescriptorImpl" &
        " already exists, not redeclaring")
when not declared(struct_CXCursorSetImpl):
  type
    struct_CXCursorSetImpl* = object
else:
  static :
    hint("Declaration of " & "struct_CXCursorSetImpl" &
        " already exists, not redeclaring")
when not declared(LLVM_CLANG_C_STRICT_PROTOTYPES_BEGIN):
  type
    LLVM_CLANG_C_STRICT_PROTOTYPES_BEGIN* = object
else:
  static :
    hint("Declaration of " & "LLVM_CLANG_C_STRICT_PROTOTYPES_BEGIN" &
        " already exists, not redeclaring")
when not declared(struct_CXVirtualFileOverlayImpl):
  type
    struct_CXVirtualFileOverlayImpl* = object
else:
  static :
    hint("Declaration of " & "struct_CXVirtualFileOverlayImpl" &
        " already exists, not redeclaring")
when not declared(struct_CXAPISetImpl):
  type
    struct_CXAPISetImpl* = object
else:
  static :
    hint("Declaration of " & "struct_CXAPISetImpl" &
        " already exists, not redeclaring")
when not declared(LLVM_CLANG_C_STRICT_PROTOTYPES_END):
  type
    LLVM_CLANG_C_STRICT_PROTOTYPES_END* = object
else:
  static :
    hint("Declaration of " & "LLVM_CLANG_C_STRICT_PROTOTYPES_END" &
        " already exists, not redeclaring")
when not declared(struct_CXCursorAndRangeVisitorBlock):
  type
    struct_CXCursorAndRangeVisitorBlock* = object
else:
  static :
    hint("Declaration of " & "struct_CXCursorAndRangeVisitorBlock" &
        " already exists, not redeclaring")
when not declared(struct_CXTranslationUnitImpl):
  type
    struct_CXTranslationUnitImpl* = object
else:
  static :
    hint("Declaration of " & "struct_CXTranslationUnitImpl" &
        " already exists, not redeclaring")
when not declared(struct_CXTargetInfoImpl):
  type
    struct_CXTargetInfoImpl* = object
else:
  static :
    hint("Declaration of " & "struct_CXTargetInfoImpl" &
        " already exists, not redeclaring")
type
  struct_CXString_553648590 {.pure, inheritable, bycopy.} = object
    data*: pointer           ## Generated based on /usr/include/clang-c/CXString.h:37:9
    private_flags*: cuint
  CXString_553648592 = struct_CXString_553648591 ## Generated based on /usr/include/clang-c/CXString.h:40:3
  struct_CXStringSet_553648594 {.pure, inheritable, bycopy.} = object
    Strings*: ptr CXString_553648593 ## Generated based on /usr/include/clang-c/CXString.h:42:9
    Count*: cuint
  CXStringSet_553648596 = struct_CXStringSet_553648595 ## Generated based on /usr/include/clang-c/CXString.h:45:3
  CXVirtualFileOverlay_553648598 = ptr struct_CXVirtualFileOverlayImpl ## Generated based on /usr/include/clang-c/BuildSystem.h:39:42
  CXModuleMapDescriptor_553648600 = ptr struct_CXModuleMapDescriptorImpl ## Generated based on /usr/include/clang-c/BuildSystem.h:100:43
  CXCompilationDatabase_553648602 = pointer ## Generated based on /usr/include/clang-c/CXCompilationDatabase.h:37:16
  CXCompileCommands_553648604 = pointer ## Generated based on /usr/include/clang-c/CXCompilationDatabase.h:48:16
  CXCompileCommand_553648606 = pointer ## Generated based on /usr/include/clang-c/CXCompilationDatabase.h:53:16
  CXCompilationDatabase_Error_553648610 = enum_CXCompilationDatabase_Error_553648609 ## Generated based on /usr/include/clang-c/CXCompilationDatabase.h:69:3
  CXFile_553648612 = pointer ## Generated based on /usr/include/clang-c/CXFile.h:34:15
  time_t_553648614 = compiler_time_t_553648949 ## Generated based on /usr/include/bits/types/time_t.h:10:18
  struct_CXFileUniqueID_553648616 {.pure, inheritable, bycopy.} = object
    data*: array[3'i64, culonglong] ## Generated based on /usr/include/clang-c/CXFile.h:50:9
  CXFileUniqueID_553648618 = struct_CXFileUniqueID_553648617 ## Generated based on /usr/include/clang-c/CXFile.h:52:3
  struct_CXSourceLocation_553648620 {.pure, inheritable, bycopy.} = object
    ptr_data*: array[2'i64, pointer] ## Generated based on /usr/include/clang-c/CXSourceLocation.h:44:9
    int_data*: cuint
  CXSourceLocation_553648622 = struct_CXSourceLocation_553648621 ## Generated based on /usr/include/clang-c/CXSourceLocation.h:47:3
  struct_CXSourceRange_553648624 {.pure, inheritable, bycopy.} = object
    ptr_data*: array[2'i64, pointer] ## Generated based on /usr/include/clang-c/CXSourceLocation.h:55:9
    begin_int_data*: cuint
    end_int_data*: cuint
  CXSourceRange_553648626 = struct_CXSourceRange_553648625 ## Generated based on /usr/include/clang-c/CXSourceLocation.h:59:3
  struct_CXSourceRangeList_553648628 {.pure, inheritable, bycopy.} = object
    count*: cuint            ## Generated based on /usr/include/clang-c/CXSourceLocation.h:276:9
    ranges*: ptr CXSourceRange_553648627
  CXSourceRangeList_553648630 = struct_CXSourceRangeList_553648629 ## Generated based on /usr/include/clang-c/CXSourceLocation.h:283:3
  CXDiagnostic_553648634 = pointer ## Generated based on /usr/include/clang-c/CXDiagnostic.h:69:15
  CXDiagnosticSet_553648636 = pointer ## Generated based on /usr/include/clang-c/CXDiagnostic.h:74:15
  CXIndex_553648642 = pointer ## Generated based on /usr/include/clang-c/Index.h:80:15
  CXTargetInfo_553648644 = ptr struct_CXTargetInfoImpl ## Generated based on /usr/include/clang-c/Index.h:86:34
  CXTranslationUnit_553648646 = ptr struct_CXTranslationUnitImpl ## Generated based on /usr/include/clang-c/Index.h:91:39
  CXClientData_553648648 = pointer ## Generated based on /usr/include/clang-c/Index.h:97:15
  struct_CXUnsavedFile_553648650 {.pure, inheritable, bycopy.} = object
    Filename*: cstring       ## Generated based on /usr/include/clang-c/Index.h:106:8
    Contents*: cstring
    Length*: culong
  struct_CXVersion_553648654 {.pure, inheritable, bycopy.} = object
    Major*: cint             ## Generated based on /usr/include/clang-c/Index.h:154:16
    Minor*: cint
    Subminor*: cint
  CXVersion_553648656 = struct_CXVersion_553648655 ## Generated based on /usr/include/clang-c/Index.h:172:3
  CXChoice_553648662 = enum_CXChoice_553648661 ## Generated based on /usr/include/clang-c/Index.h:296:3
  CXGlobalOptFlags_553648673 = enum_CXGlobalOptFlags_553648665 ## Generated based on /usr/include/clang-c/Index.h:330:3
  struct_CXIndexOptions_553648675 {.pure, inheritable, bycopy.} = object
    Size*: cuint             ## Generated based on /usr/include/clang-c/Index.h:353:16
    ThreadBackgroundPriorityForIndexing*: uint8
    ThreadBackgroundPriorityForEditing*: uint8
    ExcludeDeclarationsFromPCH* {.bitsize: 1'i64.}: cuint
    DisplayDiagnostics* {.bitsize: 1'i64.}: cuint
    StorePreamblesInMemory* {.bitsize: 1'i64.}: cuint
    anon0* {.bitsize: 13'i64.}: cuint
    PreambleStoragePath*: cstring
    InvocationEmissionPath*: cstring
  CXIndexOptions_553648677 = struct_CXIndexOptions_553648676 ## Generated based on /usr/include/clang-c/Index.h:401:3
  struct_CXTUResourceUsageEntry_553648689 {.pure, inheritable, bycopy.} = object
    kind*: enum_CXTUResourceUsageKind_553648688 ## Generated based on /usr/include/clang-c/Index.h:1119:16
    amount*: culong
  CXTUResourceUsageEntry_553648691 = struct_CXTUResourceUsageEntry_553648690 ## Generated based on /usr/include/clang-c/Index.h:1125:3
  struct_CXTUResourceUsage_553648693 {.pure, inheritable, bycopy.} = object
    data*: pointer           ## Generated based on /usr/include/clang-c/Index.h:1130:16
    numEntries*: cuint
    entries*: ptr CXTUResourceUsageEntry_553648692
  CXTUResourceUsage_553648695 = struct_CXTUResourceUsage_553648694 ## Generated based on /usr/include/clang-c/Index.h:1141:3
  struct_CXCursor_553648699 {.pure, inheritable, bycopy.} = object
    kind*: enum_CXCursorKind_553648698 ## Generated based on /usr/include/clang-c/Index.h:2341:9
    xdata*: cint
    data*: array[3'i64, pointer]
  CXCursor_553648701 = struct_CXCursor_553648700 ## Generated based on /usr/include/clang-c/Index.h:2345:3
  struct_CXPlatformAvailability_553648707 {.pure, inheritable, bycopy.} = object
    Platform*: CXString_553648593 ## Generated based on /usr/include/clang-c/Index.h:2522:16
    Introduced*: CXVersion_553648657
    Deprecated*: CXVersion_553648657
    Obsoleted*: CXVersion_553648657
    Unavailable*: cint
    Message*: CXString_553648593
  CXPlatformAvailability_553648709 = struct_CXPlatformAvailability_553648708 ## Generated based on /usr/include/clang-c/Index.h:2553:3
  CXCursorSet_553648715 = ptr struct_CXCursorSetImpl ## Generated based on /usr/include/clang-c/Index.h:2657:33
  struct_CXType_553648721 {.pure, inheritable, bycopy.} = object
    kind*: enum_CXTypeKind_553648718 ## Generated based on /usr/include/clang-c/Index.h:3094:9
    data*: array[2'i64, pointer]
  CXType_553648723 = struct_CXType_553648722 ## Generated based on /usr/include/clang-c/Index.h:3097:3
  CXCursorVisitor_553648741 = proc (a0: CXCursor_553648702; a1: CXCursor_553648702;
                                    a2: CXClientData_553648649): enum_CXChildVisitResult_553648740 {.
      cdecl.}                ## Generated based on /usr/include/clang-c/Index.h:4006:35
  CXCursorVisitorBlock_553648743 = ptr struct_CXChildVisitResult ## Generated based on /usr/include/clang-c/Index.h:4049:37
  CXPrintingPolicy_553648745 = pointer ## Generated based on /usr/include/clang-c/Index.h:4147:15
  CXObjCPropertyAttrKind_553648751 = enum_CXObjCPropertyAttrKind_553648750 ## Generated based on /usr/include/clang-c/Index.h:4380:3
  CXObjCDeclQualifierKind_553648755 = enum_CXObjCDeclQualifierKind_553648754 ## Generated based on /usr/include/clang-c/Index.h:4416:3
  CXModule_553648757 = pointer ## Generated based on /usr/include/clang-c/Index.h:4637:15
  CXTokenKind_553648763 = enum_CXTokenKind_553648762 ## Generated based on /usr/include/clang-c/Index.h:5024:3
  struct_CXToken_553648765 {.pure, inheritable, bycopy.} = object
    int_data*: array[4'i64, cuint] ## Generated based on /usr/include/clang-c/Index.h:5029:9
    ptr_data*: pointer
  CXToken_553648767 = struct_CXToken_553648766 ## Generated based on /usr/include/clang-c/Index.h:5032:3
  CXCompletionString_553648769 = pointer ## Generated based on /usr/include/clang-c/Index.h:5182:15
  struct_CXCompletionResult_553648771 {.pure, inheritable, bycopy.} = object
    CursorKind*: enum_CXCursorKind_553648698 ## Generated based on /usr/include/clang-c/Index.h:5187:9
    CompletionString*: CXCompletionString_553648770
  CXCompletionResult_553648773 = struct_CXCompletionResult_553648772 ## Generated based on /usr/include/clang-c/Index.h:5205:3
  struct_CXCodeCompleteResults_553648777 {.pure, inheritable, bycopy.} = object
    Results*: ptr CXCompletionResult_553648774 ## Generated based on /usr/include/clang-c/Index.h:5521:9
    NumResults*: cuint
  CXCodeCompleteResults_553648779 = struct_CXCodeCompleteResults_553648778 ## Generated based on /usr/include/clang-c/Index.h:5532:3
  CXInclusionVisitor_553648785 = proc (a0: CXFile_553648613;
                                       a1: ptr CXSourceLocation_553648623;
                                       a2: cuint; a3: CXClientData_553648649): void {.
      cdecl.}                ## Generated based on /usr/include/clang-c/Index.h:5987:16
  CXEvalResultKind_553648789 = enum_CXEvalResultKind_553648788 ## Generated based on /usr/include/clang-c/Index.h:6012:3
  CXEvalResult_553648791 = pointer ## Generated based on /usr/include/clang-c/Index.h:6017:15
  struct_CXCursorAndRangeVisitor_553648795 {.pure, inheritable, bycopy.} = object
    context*: pointer        ## Generated based on /usr/include/clang-c/Index.h:6087:16
    visit*: proc (a0: pointer; a1: CXCursor_553648702; a2: CXSourceRange_553648627): enum_CXVisitorResult_553648794 {.
        cdecl.}
  CXCursorAndRangeVisitor_553648797 = struct_CXCursorAndRangeVisitor_553648796 ## Generated based on /usr/include/clang-c/Index.h:6090:3
  CXResult_553648801 = enum_CXResult_553648800 ## Generated based on /usr/include/clang-c/Index.h:6107:3
  CXCursorAndRangeVisitorBlock_553648803 = ptr struct_CXCursorAndRangeVisitorBlock ## Generated based on /usr/include/clang-c/Index.h:6145:47
  CXIdxClientFile_553648805 = pointer ## Generated based on /usr/include/clang-c/Index.h:6159:15
  CXIdxClientEntity_553648807 = pointer ## Generated based on /usr/include/clang-c/Index.h:6164:15
  CXIdxClientContainer_553648809 = pointer ## Generated based on /usr/include/clang-c/Index.h:6170:15
  CXIdxClientASTFile_553648811 = pointer ## Generated based on /usr/include/clang-c/Index.h:6176:15
  struct_CXIdxLoc_553648813 {.pure, inheritable, bycopy.} = object
    ptr_data*: array[2'i64, pointer] ## Generated based on /usr/include/clang-c/Index.h:6181:9
    int_data*: cuint
  CXIdxLoc_553648815 = struct_CXIdxLoc_553648814 ## Generated based on /usr/include/clang-c/Index.h:6184:3
  struct_CXIdxIncludedFileInfo_553648817 {.pure, inheritable, bycopy.} = object
    hashLoc*: CXIdxLoc_553648816 ## Generated based on /usr/include/clang-c/Index.h:6189:9
    filename*: cstring
    file*: CXFile_553648613
    isImport*: cint
    isAngled*: cint
    isModuleImport*: cint
  CXIdxIncludedFileInfo_553648819 = struct_CXIdxIncludedFileInfo_553648818 ## Generated based on /usr/include/clang-c/Index.h:6209:3
  struct_CXIdxImportedASTFileInfo_553648821 {.pure, inheritable, bycopy.} = object
    file*: CXFile_553648613  ## Generated based on /usr/include/clang-c/Index.h:6214:9
    module*: CXModule_553648758
    loc*: CXIdxLoc_553648816
    isImplicit*: cint
  CXIdxImportedASTFileInfo_553648823 = struct_CXIdxImportedASTFileInfo_553648822 ## Generated based on /usr/include/clang-c/Index.h:6233:3
  CXIdxEntityKind_553648827 = enum_CXIdxEntityKind_553648826 ## Generated based on /usr/include/clang-c/Index.h:6269:3
  CXIdxEntityLanguage_553648831 = enum_CXIdxEntityLanguage_553648830 ## Generated based on /usr/include/clang-c/Index.h:6277:3
  CXIdxEntityCXXTemplateKind_553648835 = enum_CXIdxEntityCXXTemplateKind_553648834 ## Generated based on /usr/include/clang-c/Index.h:6294:3
  CXIdxAttrKind_553648839 = enum_CXIdxAttrKind_553648838 ## Generated based on /usr/include/clang-c/Index.h:6301:3
  struct_CXIdxAttrInfo_553648841 {.pure, inheritable, bycopy.} = object
    kind*: CXIdxAttrKind_553648840 ## Generated based on /usr/include/clang-c/Index.h:6303:9
    cursor*: CXCursor_553648702
    loc*: CXIdxLoc_553648816
  CXIdxAttrInfo_553648843 = struct_CXIdxAttrInfo_553648842 ## Generated based on /usr/include/clang-c/Index.h:6307:3
  struct_CXIdxEntityInfo_553648845 {.pure, inheritable, bycopy.} = object
    kind*: CXIdxEntityKind_553648828 ## Generated based on /usr/include/clang-c/Index.h:6309:9
    templateKind*: CXIdxEntityCXXTemplateKind_553648836
    lang*: CXIdxEntityLanguage_553648832
    name*: cstring
    USR*: cstring
    cursor*: CXCursor_553648702
    attributes*: ptr ptr CXIdxAttrInfo_553648844
    numAttributes*: cuint
  CXIdxEntityInfo_553648847 = struct_CXIdxEntityInfo_553648846 ## Generated based on /usr/include/clang-c/Index.h:6318:3
  struct_CXIdxContainerInfo_553648849 {.pure, inheritable, bycopy.} = object
    cursor*: CXCursor_553648702 ## Generated based on /usr/include/clang-c/Index.h:6320:9
  CXIdxContainerInfo_553648851 = struct_CXIdxContainerInfo_553648850 ## Generated based on /usr/include/clang-c/Index.h:6322:3
  struct_CXIdxIBOutletCollectionAttrInfo_553648853 {.pure, inheritable, bycopy.} = object
    attrInfo*: ptr CXIdxAttrInfo_553648844 ## Generated based on /usr/include/clang-c/Index.h:6324:9
    objcClass*: ptr CXIdxEntityInfo_553648848
    classCursor*: CXCursor_553648702
    classLoc*: CXIdxLoc_553648816
  CXIdxIBOutletCollectionAttrInfo_553648855 = struct_CXIdxIBOutletCollectionAttrInfo_553648854 ## Generated based on /usr/include/clang-c/Index.h:6329:3
  CXIdxDeclInfoFlags_553648859 = enum_CXIdxDeclInfoFlags_553648858 ## Generated based on /usr/include/clang-c/Index.h:6331:46
  struct_CXIdxDeclInfo_553648861 {.pure, inheritable, bycopy.} = object
    entityInfo*: ptr CXIdxEntityInfo_553648848 ## Generated based on /usr/include/clang-c/Index.h:6333:9
    cursor*: CXCursor_553648702
    loc*: CXIdxLoc_553648816
    semanticContainer*: ptr CXIdxContainerInfo_553648852
    lexicalContainer*: ptr CXIdxContainerInfo_553648852
    isRedeclaration*: cint
    isDefinition*: cint
    isContainer*: cint
    declAsContainer*: ptr CXIdxContainerInfo_553648852
    isImplicit*: cint
    attributes*: ptr ptr CXIdxAttrInfo_553648844
    numAttributes*: cuint
    flags*: cuint
  CXIdxDeclInfo_553648863 = struct_CXIdxDeclInfo_553648862 ## Generated based on /usr/include/clang-c/Index.h:6357:3
  CXIdxObjCContainerKind_553648867 = enum_CXIdxObjCContainerKind_553648866 ## Generated based on /usr/include/clang-c/Index.h:6363:3
  struct_CXIdxObjCContainerDeclInfo_553648869 {.pure, inheritable, bycopy.} = object
    declInfo*: ptr CXIdxDeclInfo_553648864 ## Generated based on /usr/include/clang-c/Index.h:6365:9
    kind*: CXIdxObjCContainerKind_553648868
  CXIdxObjCContainerDeclInfo_553648871 = struct_CXIdxObjCContainerDeclInfo_553648870 ## Generated based on /usr/include/clang-c/Index.h:6368:3
  struct_CXIdxBaseClassInfo_553648873 {.pure, inheritable, bycopy.} = object
    base*: ptr CXIdxEntityInfo_553648848 ## Generated based on /usr/include/clang-c/Index.h:6370:9
    cursor*: CXCursor_553648702
    loc*: CXIdxLoc_553648816
  CXIdxBaseClassInfo_553648875 = struct_CXIdxBaseClassInfo_553648874 ## Generated based on /usr/include/clang-c/Index.h:6374:3
  struct_CXIdxObjCProtocolRefInfo_553648877 {.pure, inheritable, bycopy.} = object
    protocol*: ptr CXIdxEntityInfo_553648848 ## Generated based on /usr/include/clang-c/Index.h:6376:9
    cursor*: CXCursor_553648702
    loc*: CXIdxLoc_553648816
  CXIdxObjCProtocolRefInfo_553648879 = struct_CXIdxObjCProtocolRefInfo_553648878 ## Generated based on /usr/include/clang-c/Index.h:6380:3
  struct_CXIdxObjCProtocolRefListInfo_553648881 {.pure, inheritable, bycopy.} = object
    protocols*: ptr ptr CXIdxObjCProtocolRefInfo_553648880 ## Generated based on /usr/include/clang-c/Index.h:6382:9
    numProtocols*: cuint
  CXIdxObjCProtocolRefListInfo_553648883 = struct_CXIdxObjCProtocolRefListInfo_553648882 ## Generated based on /usr/include/clang-c/Index.h:6385:3
  struct_CXIdxObjCInterfaceDeclInfo_553648885 {.pure, inheritable, bycopy.} = object
    containerInfo*: ptr CXIdxObjCContainerDeclInfo_553648872 ## Generated based on /usr/include/clang-c/Index.h:6387:9
    superInfo*: ptr CXIdxBaseClassInfo_553648876
    protocols*: ptr CXIdxObjCProtocolRefListInfo_553648884
  CXIdxObjCInterfaceDeclInfo_553648887 = struct_CXIdxObjCInterfaceDeclInfo_553648886 ## Generated based on /usr/include/clang-c/Index.h:6391:3
  struct_CXIdxObjCCategoryDeclInfo_553648889 {.pure, inheritable, bycopy.} = object
    containerInfo*: ptr CXIdxObjCContainerDeclInfo_553648872 ## Generated based on /usr/include/clang-c/Index.h:6393:9
    objcClass*: ptr CXIdxEntityInfo_553648848
    classCursor*: CXCursor_553648702
    classLoc*: CXIdxLoc_553648816
    protocols*: ptr CXIdxObjCProtocolRefListInfo_553648884
  CXIdxObjCCategoryDeclInfo_553648891 = struct_CXIdxObjCCategoryDeclInfo_553648890 ## Generated based on /usr/include/clang-c/Index.h:6399:3
  struct_CXIdxObjCPropertyDeclInfo_553648893 {.pure, inheritable, bycopy.} = object
    declInfo*: ptr CXIdxDeclInfo_553648864 ## Generated based on /usr/include/clang-c/Index.h:6401:9
    getter*: ptr CXIdxEntityInfo_553648848
    setter*: ptr CXIdxEntityInfo_553648848
  CXIdxObjCPropertyDeclInfo_553648895 = struct_CXIdxObjCPropertyDeclInfo_553648894 ## Generated based on /usr/include/clang-c/Index.h:6405:3
  struct_CXIdxCXXClassDeclInfo_553648897 {.pure, inheritable, bycopy.} = object
    declInfo*: ptr CXIdxDeclInfo_553648864 ## Generated based on /usr/include/clang-c/Index.h:6407:9
    bases*: ptr ptr CXIdxBaseClassInfo_553648876
    numBases*: cuint
  CXIdxCXXClassDeclInfo_553648899 = struct_CXIdxCXXClassDeclInfo_553648898 ## Generated based on /usr/include/clang-c/Index.h:6411:3
  CXIdxEntityRefKind_553648903 = enum_CXIdxEntityRefKind_553648902 ## Generated based on /usr/include/clang-c/Index.h:6429:3
  CXSymbolRole_553648907 = enum_CXSymbolRole_553648906 ## Generated based on /usr/include/clang-c/Index.h:6448:3
  struct_CXIdxEntityRefInfo_553648909 {.pure, inheritable, bycopy.} = object
    kind*: CXIdxEntityRefKind_553648904 ## Generated based on /usr/include/clang-c/Index.h:6453:9
    cursor*: CXCursor_553648702
    loc*: CXIdxLoc_553648816
    referencedEntity*: ptr CXIdxEntityInfo_553648848
    parentEntity*: ptr CXIdxEntityInfo_553648848
    container*: ptr CXIdxContainerInfo_553648852
    role*: CXSymbolRole_553648908
  CXIdxEntityRefInfo_553648911 = struct_CXIdxEntityRefInfo_553648910 ## Generated based on /usr/include/clang-c/Index.h:6484:3
  struct_IndexerCallbacks_553648913 {.pure, inheritable, bycopy.} = object
    abortQuery*: proc (a0: CXClientData_553648649; a1: pointer): cint {.cdecl.} ## Generated based on /usr/include/clang-c/Index.h:6490:9
    diagnostic*: proc (a0: CXClientData_553648649; a1: CXDiagnosticSet_553648637;
                       a2: pointer): void {.cdecl.}
    enteredMainFile*: proc (a0: CXClientData_553648649; a1: CXFile_553648613;
                            a2: pointer): CXIdxClientFile_553648806 {.cdecl.}
    ppIncludedFile*: proc (a0: CXClientData_553648649;
                           a1: ptr CXIdxIncludedFileInfo_553648820): CXIdxClientFile_553648806 {.
        cdecl.}
    importedASTFile*: proc (a0: CXClientData_553648649;
                            a1: ptr CXIdxImportedASTFileInfo_553648824): CXIdxClientASTFile_553648812 {.
        cdecl.}
    startedTranslationUnit*: proc (a0: CXClientData_553648649; a1: pointer): CXIdxClientContainer_553648810 {.
        cdecl.}
    indexDeclaration*: proc (a0: CXClientData_553648649; a1: ptr CXIdxDeclInfo_553648864): void {.
        cdecl.}
    indexEntityReference*: proc (a0: CXClientData_553648649;
                                 a1: ptr CXIdxEntityRefInfo_553648912): void {.
        cdecl.}
  IndexerCallbacks_553648915 = struct_IndexerCallbacks_553648914 ## Generated based on /usr/include/clang-c/Index.h:6536:3
  CXIndexAction_553648917 = pointer ## Generated based on /usr/include/clang-c/Index.h:6591:15
  CXIndexOptFlags_553648921 = enum_CXIndexOptFlags_553648920 ## Generated based on /usr/include/clang-c/Index.h:6646:3
  CXFieldVisitor_553648923 = proc (a0: CXCursor_553648702; a1: CXClientData_553648649): enum_CXVisitorResult_553648794 {.
      cdecl.}                ## Generated based on /usr/include/clang-c/Index.h:6743:32
  CXRemapping_553648929 = pointer ## Generated based on /usr/include/clang-c/Index.h:6961:15
  struct_CXComment_553648931 {.pure, inheritable, bycopy.} = object
    ASTNode*: pointer        ## Generated based on /usr/include/clang-c/Documentation.h:37:9
    TranslationUnit*: CXTranslationUnit_553648647
  CXComment_553648933 = struct_CXComment_553648932 ## Generated based on /usr/include/clang-c/Documentation.h:40:3
  CXAPISet_553648941 = ptr struct_CXAPISetImpl ## Generated based on /usr/include/clang-c/Documentation.h:554:30
  CXRewriter_553648943 = pointer ## Generated based on /usr/include/clang-c/Rewrite.h:20:15
  compiler_time_t_553648948 = clong ## Generated based on /usr/include/bits/types.h:160:26
  CXVirtualFileOverlay_553648599 = (when declared(CXVirtualFileOverlay):
    when ownSizeof(CXVirtualFileOverlay) != ownSizeof(CXVirtualFileOverlay_553648598):
      static :
        warning("Declaration of " & "CXVirtualFileOverlay" &
            " exists but with different size")
    CXVirtualFileOverlay
  else:
    CXVirtualFileOverlay_553648598)
  enum_CXCompilationDatabase_Error_553648609 = (when declared(
      enum_CXCompilationDatabase_Error):
    when ownSizeof(enum_CXCompilationDatabase_Error) !=
        ownSizeof(enum_CXCompilationDatabase_Error_553648608):
      static :
        warning("Declaration of " & "enum_CXCompilationDatabase_Error" &
            " exists but with different size")
    enum_CXCompilationDatabase_Error
  else:
    enum_CXCompilationDatabase_Error_553648608)
  CXDiagnosticSet_553648637 = (when declared(CXDiagnosticSet):
    when ownSizeof(CXDiagnosticSet) != ownSizeof(CXDiagnosticSet_553648636):
      static :
        warning("Declaration of " & "CXDiagnosticSet" &
            " exists but with different size")
    CXDiagnosticSet
  else:
    CXDiagnosticSet_553648636)
  CXModuleMapDescriptor_553648601 = (when declared(CXModuleMapDescriptor):
    when ownSizeof(CXModuleMapDescriptor) != ownSizeof(CXModuleMapDescriptor_553648600):
      static :
        warning("Declaration of " & "CXModuleMapDescriptor" &
            " exists but with different size")
    CXModuleMapDescriptor
  else:
    CXModuleMapDescriptor_553648600)
  CXIdxLoc_553648816 = (when declared(CXIdxLoc):
    when ownSizeof(CXIdxLoc) != ownSizeof(CXIdxLoc_553648815):
      static :
        warning("Declaration of " & "CXIdxLoc" &
            " exists but with different size")
    CXIdxLoc
  else:
    CXIdxLoc_553648815)
  CXAPISet_553648942 = (when declared(CXAPISet):
    when ownSizeof(CXAPISet) != ownSizeof(CXAPISet_553648941):
      static :
        warning("Declaration of " & "CXAPISet" &
            " exists but with different size")
    CXAPISet
  else:
    CXAPISet_553648941)
  enum_CXChoice_553648661 = (when declared(enum_CXChoice):
    when ownSizeof(enum_CXChoice) != ownSizeof(enum_CXChoice_553648660):
      static :
        warning("Declaration of " & "enum_CXChoice" &
            " exists but with different size")
    enum_CXChoice
  else:
    enum_CXChoice_553648660)
  struct_CXFileUniqueID_553648617 = (when declared(struct_CXFileUniqueID):
    when ownSizeof(struct_CXFileUniqueID) != ownSizeof(struct_CXFileUniqueID_553648616):
      static :
        warning("Declaration of " & "struct_CXFileUniqueID" &
            " exists but with different size")
    struct_CXFileUniqueID
  else:
    struct_CXFileUniqueID_553648616)
  CXComment_553648934 = (when declared(CXComment):
    when ownSizeof(CXComment) != ownSizeof(CXComment_553648933):
      static :
        warning("Declaration of " & "CXComment" &
            " exists but with different size")
    CXComment
  else:
    CXComment_553648933)
  CXFile_553648613 = (when declared(CXFile):
    when ownSizeof(CXFile) != ownSizeof(CXFile_553648612):
      static :
        warning("Declaration of " & "CXFile" & " exists but with different size")
    CXFile
  else:
    CXFile_553648612)
  struct_CXCursorAndRangeVisitor_553648796 = (when declared(
      struct_CXCursorAndRangeVisitor):
    when ownSizeof(struct_CXCursorAndRangeVisitor) !=
        ownSizeof(struct_CXCursorAndRangeVisitor_553648795):
      static :
        warning("Declaration of " & "struct_CXCursorAndRangeVisitor" &
            " exists but with different size")
    struct_CXCursorAndRangeVisitor
  else:
    struct_CXCursorAndRangeVisitor_553648795)
  CXIdxEntityLanguage_553648832 = (when declared(CXIdxEntityLanguage):
    when ownSizeof(CXIdxEntityLanguage) != ownSizeof(CXIdxEntityLanguage_553648831):
      static :
        warning("Declaration of " & "CXIdxEntityLanguage" &
            " exists but with different size")
    CXIdxEntityLanguage
  else:
    CXIdxEntityLanguage_553648831)
  enum_CXIdxObjCContainerKind_553648866 = (when declared(
      enum_CXIdxObjCContainerKind):
    when ownSizeof(enum_CXIdxObjCContainerKind) !=
        ownSizeof(enum_CXIdxObjCContainerKind_553648865):
      static :
        warning("Declaration of " & "enum_CXIdxObjCContainerKind" &
            " exists but with different size")
    enum_CXIdxObjCContainerKind
  else:
    enum_CXIdxObjCContainerKind_553648865)
  CXIdxDeclInfo_553648864 = (when declared(CXIdxDeclInfo):
    when ownSizeof(CXIdxDeclInfo) != ownSizeof(CXIdxDeclInfo_553648863):
      static :
        warning("Declaration of " & "CXIdxDeclInfo" &
            " exists but with different size")
    CXIdxDeclInfo
  else:
    CXIdxDeclInfo_553648863)
  CXIdxEntityRefKind_553648904 = (when declared(CXIdxEntityRefKind):
    when ownSizeof(CXIdxEntityRefKind) != ownSizeof(CXIdxEntityRefKind_553648903):
      static :
        warning("Declaration of " & "CXIdxEntityRefKind" &
            " exists but with different size")
    CXIdxEntityRefKind
  else:
    CXIdxEntityRefKind_553648903)
  enum_CXTypeNullabilityKind_553648728 = (when declared(
      enum_CXTypeNullabilityKind):
    when ownSizeof(enum_CXTypeNullabilityKind) !=
        ownSizeof(enum_CXTypeNullabilityKind_553648727):
      static :
        warning("Declaration of " & "enum_CXTypeNullabilityKind" &
            " exists but with different size")
    enum_CXTypeNullabilityKind
  else:
    enum_CXTypeNullabilityKind_553648727)
  enum_CXSaveTranslationUnit_Flags_553648682 = (when declared(
      enum_CXSaveTranslationUnit_Flags):
    when ownSizeof(enum_CXSaveTranslationUnit_Flags) !=
        ownSizeof(enum_CXSaveTranslationUnit_Flags_553648681):
      static :
        warning("Declaration of " & "enum_CXSaveTranslationUnit_Flags" &
            " exists but with different size")
    enum_CXSaveTranslationUnit_Flags
  else:
    enum_CXSaveTranslationUnit_Flags_553648681)
  enum_CXResult_553648800 = (when declared(enum_CXResult):
    when ownSizeof(enum_CXResult) != ownSizeof(enum_CXResult_553648799):
      static :
        warning("Declaration of " & "enum_CXResult" &
            " exists but with different size")
    enum_CXResult
  else:
    enum_CXResult_553648799)
  CXFieldVisitor_553648924 = (when declared(CXFieldVisitor):
    when ownSizeof(CXFieldVisitor) != ownSizeof(CXFieldVisitor_553648923):
      static :
        warning("Declaration of " & "CXFieldVisitor" &
            " exists but with different size")
    CXFieldVisitor
  else:
    CXFieldVisitor_553648923)
  enum_CXEvalResultKind_553648788 = (when declared(enum_CXEvalResultKind):
    when ownSizeof(enum_CXEvalResultKind) != ownSizeof(enum_CXEvalResultKind_553648787):
      static :
        warning("Declaration of " & "enum_CXEvalResultKind" &
            " exists but with different size")
    enum_CXEvalResultKind
  else:
    enum_CXEvalResultKind_553648787)
  struct_CXCompletionResult_553648772 = (when declared(struct_CXCompletionResult):
    when ownSizeof(struct_CXCompletionResult) !=
        ownSizeof(struct_CXCompletionResult_553648771):
      static :
        warning("Declaration of " & "struct_CXCompletionResult" &
            " exists but with different size")
    struct_CXCompletionResult
  else:
    struct_CXCompletionResult_553648771)
  struct_CXUnsavedFile_553648651 = (when declared(struct_CXUnsavedFile):
    when ownSizeof(struct_CXUnsavedFile) != ownSizeof(struct_CXUnsavedFile_553648650):
      static :
        warning("Declaration of " & "struct_CXUnsavedFile" &
            " exists but with different size")
    struct_CXUnsavedFile
  else:
    struct_CXUnsavedFile_553648650)
  enum_CX_StorageClass_553648736 = (when declared(enum_CX_StorageClass):
    when ownSizeof(enum_CX_StorageClass) != ownSizeof(enum_CX_StorageClass_553648735):
      static :
        warning("Declaration of " & "enum_CX_StorageClass" &
            " exists but with different size")
    enum_CX_StorageClass
  else:
    enum_CX_StorageClass_553648735)
  CXCursorAndRangeVisitor_553648798 = (when declared(CXCursorAndRangeVisitor):
    when ownSizeof(CXCursorAndRangeVisitor) !=
        ownSizeof(CXCursorAndRangeVisitor_553648797):
      static :
        warning("Declaration of " & "CXCursorAndRangeVisitor" &
            " exists but with different size")
    CXCursorAndRangeVisitor
  else:
    CXCursorAndRangeVisitor_553648797)
  struct_CXIdxIncludedFileInfo_553648818 = (when declared(
      struct_CXIdxIncludedFileInfo):
    when ownSizeof(struct_CXIdxIncludedFileInfo) !=
        ownSizeof(struct_CXIdxIncludedFileInfo_553648817):
      static :
        warning("Declaration of " & "struct_CXIdxIncludedFileInfo" &
            " exists but with different size")
    struct_CXIdxIncludedFileInfo
  else:
    struct_CXIdxIncludedFileInfo_553648817)
  enum_CXCommentKind_553648936 = (when declared(enum_CXCommentKind):
    when ownSizeof(enum_CXCommentKind) != ownSizeof(enum_CXCommentKind_553648935):
      static :
        warning("Declaration of " & "enum_CXCommentKind" &
            " exists but with different size")
    enum_CXCommentKind
  else:
    enum_CXCommentKind_553648935)
  CXIdxContainerInfo_553648852 = (when declared(CXIdxContainerInfo):
    when ownSizeof(CXIdxContainerInfo) != ownSizeof(CXIdxContainerInfo_553648851):
      static :
        warning("Declaration of " & "CXIdxContainerInfo" &
            " exists but with different size")
    CXIdxContainerInfo
  else:
    CXIdxContainerInfo_553648851)
  CXType_553648724 = (when declared(CXType):
    when ownSizeof(CXType) != ownSizeof(CXType_553648723):
      static :
        warning("Declaration of " & "CXType" & " exists but with different size")
    CXType
  else:
    CXType_553648723)
  enum_CXSaveError_553648684 = (when declared(enum_CXSaveError):
    when ownSizeof(enum_CXSaveError) != ownSizeof(enum_CXSaveError_553648683):
      static :
        warning("Declaration of " & "enum_CXSaveError" &
            " exists but with different size")
    enum_CXSaveError
  else:
    enum_CXSaveError_553648683)
  struct_CXTUResourceUsageEntry_553648690 = (when declared(
      struct_CXTUResourceUsageEntry):
    when ownSizeof(struct_CXTUResourceUsageEntry) !=
        ownSizeof(struct_CXTUResourceUsageEntry_553648689):
      static :
        warning("Declaration of " & "struct_CXTUResourceUsageEntry" &
            " exists but with different size")
    struct_CXTUResourceUsageEntry
  else:
    struct_CXTUResourceUsageEntry_553648689)
  CXIdxObjCInterfaceDeclInfo_553648888 = (when declared(
      CXIdxObjCInterfaceDeclInfo):
    when ownSizeof(CXIdxObjCInterfaceDeclInfo) !=
        ownSizeof(CXIdxObjCInterfaceDeclInfo_553648887):
      static :
        warning("Declaration of " & "CXIdxObjCInterfaceDeclInfo" &
            " exists but with different size")
    CXIdxObjCInterfaceDeclInfo
  else:
    CXIdxObjCInterfaceDeclInfo_553648887)
  CXChoice_553648663 = (when declared(CXChoice):
    when ownSizeof(CXChoice) != ownSizeof(CXChoice_553648662):
      static :
        warning("Declaration of " & "CXChoice" &
            " exists but with different size")
    CXChoice
  else:
    CXChoice_553648662)
  CXIdxObjCContainerDeclInfo_553648872 = (when declared(
      CXIdxObjCContainerDeclInfo):
    when ownSizeof(CXIdxObjCContainerDeclInfo) !=
        ownSizeof(CXIdxObjCContainerDeclInfo_553648871):
      static :
        warning("Declaration of " & "CXIdxObjCContainerDeclInfo" &
            " exists but with different size")
    CXIdxObjCContainerDeclInfo
  else:
    CXIdxObjCContainerDeclInfo_553648871)
  struct_CXIdxImportedASTFileInfo_553648822 = (when declared(
      struct_CXIdxImportedASTFileInfo):
    when ownSizeof(struct_CXIdxImportedASTFileInfo) !=
        ownSizeof(struct_CXIdxImportedASTFileInfo_553648821):
      static :
        warning("Declaration of " & "struct_CXIdxImportedASTFileInfo" &
            " exists but with different size")
    struct_CXIdxImportedASTFileInfo
  else:
    struct_CXIdxImportedASTFileInfo_553648821)
  struct_CXSourceLocation_553648621 = (when declared(struct_CXSourceLocation):
    when ownSizeof(struct_CXSourceLocation) !=
        ownSizeof(struct_CXSourceLocation_553648620):
      static :
        warning("Declaration of " & "struct_CXSourceLocation" &
            " exists but with different size")
    struct_CXSourceLocation
  else:
    struct_CXSourceLocation_553648620)
  CXStringSet_553648597 = (when declared(CXStringSet):
    when ownSizeof(CXStringSet) != ownSizeof(CXStringSet_553648596):
      static :
        warning("Declaration of " & "CXStringSet" &
            " exists but with different size")
    CXStringSet
  else:
    CXStringSet_553648596)
  struct_CXIdxAttrInfo_553648842 = (when declared(struct_CXIdxAttrInfo):
    when ownSizeof(struct_CXIdxAttrInfo) != ownSizeof(struct_CXIdxAttrInfo_553648841):
      static :
        warning("Declaration of " & "struct_CXIdxAttrInfo" &
            " exists but with different size")
    struct_CXIdxAttrInfo
  else:
    struct_CXIdxAttrInfo_553648841)
  CXIdxEntityKind_553648828 = (when declared(CXIdxEntityKind):
    when ownSizeof(CXIdxEntityKind) != ownSizeof(CXIdxEntityKind_553648827):
      static :
        warning("Declaration of " & "CXIdxEntityKind" &
            " exists but with different size")
    CXIdxEntityKind
  else:
    CXIdxEntityKind_553648827)
  CXCursorVisitorBlock_553648744 = (when declared(CXCursorVisitorBlock):
    when ownSizeof(CXCursorVisitorBlock) != ownSizeof(CXCursorVisitorBlock_553648743):
      static :
        warning("Declaration of " & "CXCursorVisitorBlock" &
            " exists but with different size")
    CXCursorVisitorBlock
  else:
    CXCursorVisitorBlock_553648743)
  CXCursor_553648702 = (when declared(CXCursor):
    when ownSizeof(CXCursor) != ownSizeof(CXCursor_553648701):
      static :
        warning("Declaration of " & "CXCursor" &
            " exists but with different size")
    CXCursor
  else:
    CXCursor_553648701)
  struct_CXIdxIBOutletCollectionAttrInfo_553648854 = (when declared(
      struct_CXIdxIBOutletCollectionAttrInfo):
    when ownSizeof(struct_CXIdxIBOutletCollectionAttrInfo) !=
        ownSizeof(struct_CXIdxIBOutletCollectionAttrInfo_553648853):
      static :
        warning("Declaration of " & "struct_CXIdxIBOutletCollectionAttrInfo" &
            " exists but with different size")
    struct_CXIdxIBOutletCollectionAttrInfo
  else:
    struct_CXIdxIBOutletCollectionAttrInfo_553648853)
  CXIdxClientFile_553648806 = (when declared(CXIdxClientFile):
    when ownSizeof(CXIdxClientFile) != ownSizeof(CXIdxClientFile_553648805):
      static :
        warning("Declaration of " & "CXIdxClientFile" &
            " exists but with different size")
    CXIdxClientFile
  else:
    CXIdxClientFile_553648805)
  CXDiagnostic_553648635 = (when declared(CXDiagnostic):
    when ownSizeof(CXDiagnostic) != ownSizeof(CXDiagnostic_553648634):
      static :
        warning("Declaration of " & "CXDiagnostic" &
            " exists but with different size")
    CXDiagnostic
  else:
    CXDiagnostic_553648634)
  struct_CXIdxContainerInfo_553648850 = (when declared(struct_CXIdxContainerInfo):
    when ownSizeof(struct_CXIdxContainerInfo) !=
        ownSizeof(struct_CXIdxContainerInfo_553648849):
      static :
        warning("Declaration of " & "struct_CXIdxContainerInfo" &
            " exists but with different size")
    struct_CXIdxContainerInfo
  else:
    struct_CXIdxContainerInfo_553648849)
  CXSourceRangeList_553648631 = (when declared(CXSourceRangeList):
    when ownSizeof(CXSourceRangeList) != ownSizeof(CXSourceRangeList_553648630):
      static :
        warning("Declaration of " & "CXSourceRangeList" &
            " exists but with different size")
    CXSourceRangeList
  else:
    CXSourceRangeList_553648630)
  CXModule_553648758 = (when declared(CXModule):
    when ownSizeof(CXModule) != ownSizeof(CXModule_553648757):
      static :
        warning("Declaration of " & "CXModule" &
            " exists but with different size")
    CXModule
  else:
    CXModule_553648757)
  struct_CXType_553648722 = (when declared(struct_CXType):
    when ownSizeof(struct_CXType) != ownSizeof(struct_CXType_553648721):
      static :
        warning("Declaration of " & "struct_CXType" &
            " exists but with different size")
    struct_CXType
  else:
    struct_CXType_553648721)
  CXIdxClientEntity_553648808 = (when declared(CXIdxClientEntity):
    when ownSizeof(CXIdxClientEntity) != ownSizeof(CXIdxClientEntity_553648807):
      static :
        warning("Declaration of " & "CXIdxClientEntity" &
            " exists but with different size")
    CXIdxClientEntity
  else:
    CXIdxClientEntity_553648807)
  struct_CXIdxBaseClassInfo_553648874 = (when declared(struct_CXIdxBaseClassInfo):
    when ownSizeof(struct_CXIdxBaseClassInfo) !=
        ownSizeof(struct_CXIdxBaseClassInfo_553648873):
      static :
        warning("Declaration of " & "struct_CXIdxBaseClassInfo" &
            " exists but with different size")
    struct_CXIdxBaseClassInfo
  else:
    struct_CXIdxBaseClassInfo_553648873)
  struct_CXIdxObjCPropertyDeclInfo_553648894 = (when declared(
      struct_CXIdxObjCPropertyDeclInfo):
    when ownSizeof(struct_CXIdxObjCPropertyDeclInfo) !=
        ownSizeof(struct_CXIdxObjCPropertyDeclInfo_553648893):
      static :
        warning("Declaration of " & "struct_CXIdxObjCPropertyDeclInfo" &
            " exists but with different size")
    struct_CXIdxObjCPropertyDeclInfo
  else:
    struct_CXIdxObjCPropertyDeclInfo_553648893)
  CXCompilationDatabase_553648603 = (when declared(CXCompilationDatabase):
    when ownSizeof(CXCompilationDatabase) != ownSizeof(CXCompilationDatabase_553648602):
      static :
        warning("Declaration of " & "CXCompilationDatabase" &
            " exists but with different size")
    CXCompilationDatabase
  else:
    CXCompilationDatabase_553648602)
  enum_CXReparse_Flags_553648686 = (when declared(enum_CXReparse_Flags):
    when ownSizeof(enum_CXReparse_Flags) != ownSizeof(enum_CXReparse_Flags_553648685):
      static :
        warning("Declaration of " & "enum_CXReparse_Flags" &
            " exists but with different size")
    enum_CXReparse_Flags
  else:
    enum_CXReparse_Flags_553648685)
  struct_CXToken_553648766 = (when declared(struct_CXToken):
    when ownSizeof(struct_CXToken) != ownSizeof(struct_CXToken_553648765):
      static :
        warning("Declaration of " & "struct_CXToken" &
            " exists but with different size")
    struct_CXToken
  else:
    struct_CXToken_553648765)
  CXIdxObjCPropertyDeclInfo_553648896 = (when declared(CXIdxObjCPropertyDeclInfo):
    when ownSizeof(CXIdxObjCPropertyDeclInfo) !=
        ownSizeof(CXIdxObjCPropertyDeclInfo_553648895):
      static :
        warning("Declaration of " & "CXIdxObjCPropertyDeclInfo" &
            " exists but with different size")
    CXIdxObjCPropertyDeclInfo
  else:
    CXIdxObjCPropertyDeclInfo_553648895)
  CXTUResourceUsageEntry_553648692 = (when declared(CXTUResourceUsageEntry):
    when ownSizeof(CXTUResourceUsageEntry) != ownSizeof(CXTUResourceUsageEntry_553648691):
      static :
        warning("Declaration of " & "CXTUResourceUsageEntry" &
            " exists but with different size")
    CXTUResourceUsageEntry
  else:
    CXTUResourceUsageEntry_553648691)
  enum_CXIdxEntityRefKind_553648902 = (when declared(enum_CXIdxEntityRefKind):
    when ownSizeof(enum_CXIdxEntityRefKind) !=
        ownSizeof(enum_CXIdxEntityRefKind_553648901):
      static :
        warning("Declaration of " & "enum_CXIdxEntityRefKind" &
            " exists but with different size")
    enum_CXIdxEntityRefKind
  else:
    enum_CXIdxEntityRefKind_553648901)
  enum_CXTranslationUnit_Flags_553648680 = (when declared(
      enum_CXTranslationUnit_Flags):
    when ownSizeof(enum_CXTranslationUnit_Flags) !=
        ownSizeof(enum_CXTranslationUnit_Flags_553648679):
      static :
        warning("Declaration of " & "enum_CXTranslationUnit_Flags" &
            " exists but with different size")
    enum_CXTranslationUnit_Flags
  else:
    enum_CXTranslationUnit_Flags_553648679)
  CXIdxEntityCXXTemplateKind_553648836 = (when declared(
      CXIdxEntityCXXTemplateKind):
    when ownSizeof(CXIdxEntityCXXTemplateKind) !=
        ownSizeof(CXIdxEntityCXXTemplateKind_553648835):
      static :
        warning("Declaration of " & "CXIdxEntityCXXTemplateKind" &
            " exists but with different size")
    CXIdxEntityCXXTemplateKind
  else:
    CXIdxEntityCXXTemplateKind_553648835)
  enum_CXTypeLayoutError_553648730 = (when declared(enum_CXTypeLayoutError):
    when ownSizeof(enum_CXTypeLayoutError) != ownSizeof(enum_CXTypeLayoutError_553648729):
      static :
        warning("Declaration of " & "enum_CXTypeLayoutError" &
            " exists but with different size")
    enum_CXTypeLayoutError
  else:
    enum_CXTypeLayoutError_553648729)
  struct_CXComment_553648932 = (when declared(struct_CXComment):
    when ownSizeof(struct_CXComment) != ownSizeof(struct_CXComment_553648931):
      static :
        warning("Declaration of " & "struct_CXComment" &
            " exists but with different size")
    struct_CXComment
  else:
    struct_CXComment_553648931)
  enum_CXIdxEntityCXXTemplateKind_553648834 = (when declared(
      enum_CXIdxEntityCXXTemplateKind):
    when ownSizeof(enum_CXIdxEntityCXXTemplateKind) !=
        ownSizeof(enum_CXIdxEntityCXXTemplateKind_553648833):
      static :
        warning("Declaration of " & "enum_CXIdxEntityCXXTemplateKind" &
            " exists but with different size")
    enum_CXIdxEntityCXXTemplateKind
  else:
    enum_CXIdxEntityCXXTemplateKind_553648833)
  enum_CXIdxDeclInfoFlags_553648858 = (when declared(enum_CXIdxDeclInfoFlags):
    when ownSizeof(enum_CXIdxDeclInfoFlags) !=
        ownSizeof(enum_CXIdxDeclInfoFlags_553648857):
      static :
        warning("Declaration of " & "enum_CXIdxDeclInfoFlags" &
            " exists but with different size")
    enum_CXIdxDeclInfoFlags
  else:
    enum_CXIdxDeclInfoFlags_553648857)
  enum_CXLinkageKind_553648704 = (when declared(enum_CXLinkageKind):
    when ownSizeof(enum_CXLinkageKind) != ownSizeof(enum_CXLinkageKind_553648703):
      static :
        warning("Declaration of " & "enum_CXLinkageKind" &
            " exists but with different size")
    enum_CXLinkageKind
  else:
    enum_CXLinkageKind_553648703)
  CXTargetInfo_553648645 = (when declared(CXTargetInfo):
    when ownSizeof(CXTargetInfo) != ownSizeof(CXTargetInfo_553648644):
      static :
        warning("Declaration of " & "CXTargetInfo" &
            " exists but with different size")
    CXTargetInfo
  else:
    CXTargetInfo_553648644)
  enum_CXNameRefFlags_553648760 = (when declared(enum_CXNameRefFlags):
    when ownSizeof(enum_CXNameRefFlags) != ownSizeof(enum_CXNameRefFlags_553648759):
      static :
        warning("Declaration of " & "enum_CXNameRefFlags" &
            " exists but with different size")
    enum_CXNameRefFlags
  else:
    enum_CXNameRefFlags_553648759)
  enum_CXBinaryOperatorKind_enum_553648926 = (when declared(
      enum_CXBinaryOperatorKind_enum):
    when ownSizeof(enum_CXBinaryOperatorKind_enum) !=
        ownSizeof(enum_CXBinaryOperatorKind_enum_553648925):
      static :
        warning("Declaration of " & "enum_CXBinaryOperatorKind_enum" &
            " exists but with different size")
    enum_CXBinaryOperatorKind_enum
  else:
    enum_CXBinaryOperatorKind_enum_553648925)
  CXIdxObjCProtocolRefInfo_553648880 = (when declared(CXIdxObjCProtocolRefInfo):
    when ownSizeof(CXIdxObjCProtocolRefInfo) !=
        ownSizeof(CXIdxObjCProtocolRefInfo_553648879):
      static :
        warning("Declaration of " & "CXIdxObjCProtocolRefInfo" &
            " exists but with different size")
    CXIdxObjCProtocolRefInfo
  else:
    CXIdxObjCProtocolRefInfo_553648879)
  CXCompileCommands_553648605 = (when declared(CXCompileCommands):
    when ownSizeof(CXCompileCommands) != ownSizeof(CXCompileCommands_553648604):
      static :
        warning("Declaration of " & "CXCompileCommands" &
            " exists but with different size")
    CXCompileCommands
  else:
    CXCompileCommands_553648604)
  enum_CXCodeComplete_Flags_553648782 = (when declared(enum_CXCodeComplete_Flags):
    when ownSizeof(enum_CXCodeComplete_Flags) !=
        ownSizeof(enum_CXCodeComplete_Flags_553648781):
      static :
        warning("Declaration of " & "enum_CXCodeComplete_Flags" &
            " exists but with different size")
    enum_CXCodeComplete_Flags
  else:
    enum_CXCodeComplete_Flags_553648781)
  struct_CXIdxLoc_553648814 = (when declared(struct_CXIdxLoc):
    when ownSizeof(struct_CXIdxLoc) != ownSizeof(struct_CXIdxLoc_553648813):
      static :
        warning("Declaration of " & "struct_CXIdxLoc" &
            " exists but with different size")
    struct_CXIdxLoc
  else:
    struct_CXIdxLoc_553648813)
  enum_CXTypeKind_553648718 = (when declared(enum_CXTypeKind):
    when ownSizeof(enum_CXTypeKind) != ownSizeof(enum_CXTypeKind_553648717):
      static :
        warning("Declaration of " & "enum_CXTypeKind" &
            " exists but with different size")
    enum_CXTypeKind
  else:
    enum_CXTypeKind_553648717)
  enum_CX_BinaryOperatorKind_553648738 = (when declared(
      enum_CX_BinaryOperatorKind):
    when ownSizeof(enum_CX_BinaryOperatorKind) !=
        ownSizeof(enum_CX_BinaryOperatorKind_553648737):
      static :
        warning("Declaration of " & "enum_CX_BinaryOperatorKind" &
            " exists but with different size")
    enum_CX_BinaryOperatorKind
  else:
    enum_CX_BinaryOperatorKind_553648737)
  struct_CXIdxObjCProtocolRefInfo_553648878 = (when declared(
      struct_CXIdxObjCProtocolRefInfo):
    when ownSizeof(struct_CXIdxObjCProtocolRefInfo) !=
        ownSizeof(struct_CXIdxObjCProtocolRefInfo_553648877):
      static :
        warning("Declaration of " & "struct_CXIdxObjCProtocolRefInfo" &
            " exists but with different size")
    struct_CXIdxObjCProtocolRefInfo
  else:
    struct_CXIdxObjCProtocolRefInfo_553648877)
  IndexerCallbacks_553648916 = (when declared(IndexerCallbacks):
    when ownSizeof(IndexerCallbacks) != ownSizeof(IndexerCallbacks_553648915):
      static :
        warning("Declaration of " & "IndexerCallbacks" &
            " exists but with different size")
    IndexerCallbacks
  else:
    IndexerCallbacks_553648915)
  enum_CXUnaryOperatorKind_553648928 = (when declared(enum_CXUnaryOperatorKind):
    when ownSizeof(enum_CXUnaryOperatorKind) !=
        ownSizeof(enum_CXUnaryOperatorKind_553648927):
      static :
        warning("Declaration of " & "enum_CXUnaryOperatorKind" &
            " exists but with different size")
    enum_CXUnaryOperatorKind
  else:
    enum_CXUnaryOperatorKind_553648927)
  CXIdxClientContainer_553648810 = (when declared(CXIdxClientContainer):
    when ownSizeof(CXIdxClientContainer) != ownSizeof(CXIdxClientContainer_553648809):
      static :
        warning("Declaration of " & "CXIdxClientContainer" &
            " exists but with different size")
    CXIdxClientContainer
  else:
    CXIdxClientContainer_553648809)
  CXIdxAttrKind_553648840 = (when declared(CXIdxAttrKind):
    when ownSizeof(CXIdxAttrKind) != ownSizeof(CXIdxAttrKind_553648839):
      static :
        warning("Declaration of " & "CXIdxAttrKind" &
            " exists but with different size")
    CXIdxAttrKind
  else:
    CXIdxAttrKind_553648839)
  enum_CXTUResourceUsageKind_553648688 = (when declared(
      enum_CXTUResourceUsageKind):
    when ownSizeof(enum_CXTUResourceUsageKind) !=
        ownSizeof(enum_CXTUResourceUsageKind_553648687):
      static :
        warning("Declaration of " & "enum_CXTUResourceUsageKind" &
            " exists but with different size")
    enum_CXTUResourceUsageKind
  else:
    enum_CXTUResourceUsageKind_553648687)
  CXIdxBaseClassInfo_553648876 = (when declared(CXIdxBaseClassInfo):
    when ownSizeof(CXIdxBaseClassInfo) != ownSizeof(CXIdxBaseClassInfo_553648875):
      static :
        warning("Declaration of " & "CXIdxBaseClassInfo" &
            " exists but with different size")
    CXIdxBaseClassInfo
  else:
    CXIdxBaseClassInfo_553648875)
  enum_CXCommentParamPassDirection_553648940 = (when declared(
      enum_CXCommentParamPassDirection):
    when ownSizeof(enum_CXCommentParamPassDirection) !=
        ownSizeof(enum_CXCommentParamPassDirection_553648939):
      static :
        warning("Declaration of " & "enum_CXCommentParamPassDirection" &
            " exists but with different size")
    enum_CXCommentParamPassDirection
  else:
    enum_CXCommentParamPassDirection_553648939)
  enum_CXTemplateArgumentKind_553648726 = (when declared(
      enum_CXTemplateArgumentKind):
    when ownSizeof(enum_CXTemplateArgumentKind) !=
        ownSizeof(enum_CXTemplateArgumentKind_553648725):
      static :
        warning("Declaration of " & "enum_CXTemplateArgumentKind" &
            " exists but with different size")
    enum_CXTemplateArgumentKind
  else:
    enum_CXTemplateArgumentKind_553648725)
  CXIdxCXXClassDeclInfo_553648900 = (when declared(CXIdxCXXClassDeclInfo):
    when ownSizeof(CXIdxCXXClassDeclInfo) != ownSizeof(CXIdxCXXClassDeclInfo_553648899):
      static :
        warning("Declaration of " & "CXIdxCXXClassDeclInfo" &
            " exists but with different size")
    CXIdxCXXClassDeclInfo
  else:
    CXIdxCXXClassDeclInfo_553648899)
  CXFileUniqueID_553648619 = (when declared(CXFileUniqueID):
    when ownSizeof(CXFileUniqueID) != ownSizeof(CXFileUniqueID_553648618):
      static :
        warning("Declaration of " & "CXFileUniqueID" &
            " exists but with different size")
    CXFileUniqueID
  else:
    CXFileUniqueID_553648618)
  struct_CXCodeCompleteResults_553648778 = (when declared(
      struct_CXCodeCompleteResults):
    when ownSizeof(struct_CXCodeCompleteResults) !=
        ownSizeof(struct_CXCodeCompleteResults_553648777):
      static :
        warning("Declaration of " & "struct_CXCodeCompleteResults" &
            " exists but with different size")
    struct_CXCodeCompleteResults
  else:
    struct_CXCodeCompleteResults_553648777)
  struct_CXSourceRange_553648625 = (when declared(struct_CXSourceRange):
    when ownSizeof(struct_CXSourceRange) != ownSizeof(struct_CXSourceRange_553648624):
      static :
        warning("Declaration of " & "struct_CXSourceRange" &
            " exists but with different size")
    struct_CXSourceRange
  else:
    struct_CXSourceRange_553648624)
  enum_CXErrorCode_553648589 = (when declared(enum_CXErrorCode):
    when ownSizeof(enum_CXErrorCode) != ownSizeof(enum_CXErrorCode_553648588):
      static :
        warning("Declaration of " & "enum_CXErrorCode" &
            " exists but with different size")
    enum_CXErrorCode
  else:
    enum_CXErrorCode_553648588)
  CXIdxDeclInfoFlags_553648860 = (when declared(CXIdxDeclInfoFlags):
    when ownSizeof(CXIdxDeclInfoFlags) != ownSizeof(CXIdxDeclInfoFlags_553648859):
      static :
        warning("Declaration of " & "CXIdxDeclInfoFlags" &
            " exists but with different size")
    CXIdxDeclInfoFlags
  else:
    CXIdxDeclInfoFlags_553648859)
  CXVersion_553648657 = (when declared(CXVersion):
    when ownSizeof(CXVersion) != ownSizeof(CXVersion_553648656):
      static :
        warning("Declaration of " & "CXVersion" &
            " exists but with different size")
    CXVersion
  else:
    CXVersion_553648656)
  struct_CXIdxObjCProtocolRefListInfo_553648882 = (when declared(
      struct_CXIdxObjCProtocolRefListInfo):
    when ownSizeof(struct_CXIdxObjCProtocolRefListInfo) !=
        ownSizeof(struct_CXIdxObjCProtocolRefListInfo_553648881):
      static :
        warning("Declaration of " & "struct_CXIdxObjCProtocolRefListInfo" &
            " exists but with different size")
    struct_CXIdxObjCProtocolRefListInfo
  else:
    struct_CXIdxObjCProtocolRefListInfo_553648881)
  CXPrintingPolicy_553648746 = (when declared(CXPrintingPolicy):
    when ownSizeof(CXPrintingPolicy) != ownSizeof(CXPrintingPolicy_553648745):
      static :
        warning("Declaration of " & "CXPrintingPolicy" &
            " exists but with different size")
    CXPrintingPolicy
  else:
    CXPrintingPolicy_553648745)
  CXIdxObjCContainerKind_553648868 = (when declared(CXIdxObjCContainerKind):
    when ownSizeof(CXIdxObjCContainerKind) != ownSizeof(CXIdxObjCContainerKind_553648867):
      static :
        warning("Declaration of " & "CXIdxObjCContainerKind" &
            " exists but with different size")
    CXIdxObjCContainerKind
  else:
    CXIdxObjCContainerKind_553648867)
  CXIdxIBOutletCollectionAttrInfo_553648856 = (when declared(
      CXIdxIBOutletCollectionAttrInfo):
    when ownSizeof(CXIdxIBOutletCollectionAttrInfo) !=
        ownSizeof(CXIdxIBOutletCollectionAttrInfo_553648855):
      static :
        warning("Declaration of " & "CXIdxIBOutletCollectionAttrInfo" &
            " exists but with different size")
    CXIdxIBOutletCollectionAttrInfo
  else:
    CXIdxIBOutletCollectionAttrInfo_553648855)
  struct_CXIdxObjCContainerDeclInfo_553648870 = (when declared(
      struct_CXIdxObjCContainerDeclInfo):
    when ownSizeof(struct_CXIdxObjCContainerDeclInfo) !=
        ownSizeof(struct_CXIdxObjCContainerDeclInfo_553648869):
      static :
        warning("Declaration of " & "struct_CXIdxObjCContainerDeclInfo" &
            " exists but with different size")
    struct_CXIdxObjCContainerDeclInfo
  else:
    struct_CXIdxObjCContainerDeclInfo_553648869)
  CXRewriter_553648944 = (when declared(CXRewriter):
    when ownSizeof(CXRewriter) != ownSizeof(CXRewriter_553648943):
      static :
        warning("Declaration of " & "CXRewriter" &
            " exists but with different size")
    CXRewriter
  else:
    CXRewriter_553648943)
  struct_CXIndexOptions_553648676 = (when declared(struct_CXIndexOptions):
    when ownSizeof(struct_CXIndexOptions) != ownSizeof(struct_CXIndexOptions_553648675):
      static :
        warning("Declaration of " & "struct_CXIndexOptions" &
            " exists but with different size")
    struct_CXIndexOptions
  else:
    struct_CXIndexOptions_553648675)
  enum_CXVisitorResult_553648794 = (when declared(enum_CXVisitorResult):
    when ownSizeof(enum_CXVisitorResult) != ownSizeof(enum_CXVisitorResult_553648793):
      static :
        warning("Declaration of " & "enum_CXVisitorResult" &
            " exists but with different size")
    enum_CXVisitorResult
  else:
    enum_CXVisitorResult_553648793)
  CXIdxObjCProtocolRefListInfo_553648884 = (when declared(
      CXIdxObjCProtocolRefListInfo):
    when ownSizeof(CXIdxObjCProtocolRefListInfo) !=
        ownSizeof(CXIdxObjCProtocolRefListInfo_553648883):
      static :
        warning("Declaration of " & "CXIdxObjCProtocolRefListInfo" &
            " exists but with different size")
    CXIdxObjCProtocolRefListInfo
  else:
    CXIdxObjCProtocolRefListInfo_553648883)
  enum_CXGlobalOptFlags_553648665 = (when declared(enum_CXGlobalOptFlags):
    when ownSizeof(enum_CXGlobalOptFlags) != ownSizeof(enum_CXGlobalOptFlags_553648664):
      static :
        warning("Declaration of " & "enum_CXGlobalOptFlags" &
            " exists but with different size")
    enum_CXGlobalOptFlags
  else:
    enum_CXGlobalOptFlags_553648664)
  struct_CXIdxCXXClassDeclInfo_553648898 = (when declared(
      struct_CXIdxCXXClassDeclInfo):
    when ownSizeof(struct_CXIdxCXXClassDeclInfo) !=
        ownSizeof(struct_CXIdxCXXClassDeclInfo_553648897):
      static :
        warning("Declaration of " & "struct_CXIdxCXXClassDeclInfo" &
            " exists but with different size")
    struct_CXIdxCXXClassDeclInfo
  else:
    struct_CXIdxCXXClassDeclInfo_553648897)
  struct_CXIdxEntityInfo_553648846 = (when declared(struct_CXIdxEntityInfo):
    when ownSizeof(struct_CXIdxEntityInfo) != ownSizeof(struct_CXIdxEntityInfo_553648845):
      static :
        warning("Declaration of " & "struct_CXIdxEntityInfo" &
            " exists but with different size")
    struct_CXIdxEntityInfo
  else:
    struct_CXIdxEntityInfo_553648845)
  CXCursorSet_553648716 = (when declared(CXCursorSet):
    when ownSizeof(CXCursorSet) != ownSizeof(CXCursorSet_553648715):
      static :
        warning("Declaration of " & "CXCursorSet" &
            " exists but with different size")
    CXCursorSet
  else:
    CXCursorSet_553648715)
  CXSourceLocation_553648623 = (when declared(CXSourceLocation):
    when ownSizeof(CXSourceLocation) != ownSizeof(CXSourceLocation_553648622):
      static :
        warning("Declaration of " & "CXSourceLocation" &
            " exists but with different size")
    CXSourceLocation
  else:
    CXSourceLocation_553648622)
  enum_CX_CXXAccessSpecifier_553648734 = (when declared(
      enum_CX_CXXAccessSpecifier):
    when ownSizeof(enum_CX_CXXAccessSpecifier) !=
        ownSizeof(enum_CX_CXXAccessSpecifier_553648733):
      static :
        warning("Declaration of " & "enum_CX_CXXAccessSpecifier" &
            " exists but with different size")
    enum_CX_CXXAccessSpecifier
  else:
    enum_CX_CXXAccessSpecifier_553648733)
  CXObjCDeclQualifierKind_553648756 = (when declared(CXObjCDeclQualifierKind):
    when ownSizeof(CXObjCDeclQualifierKind) !=
        ownSizeof(CXObjCDeclQualifierKind_553648755):
      static :
        warning("Declaration of " & "CXObjCDeclQualifierKind" &
            " exists but with different size")
    CXObjCDeclQualifierKind
  else:
    CXObjCDeclQualifierKind_553648755)
  CXIdxObjCCategoryDeclInfo_553648892 = (when declared(CXIdxObjCCategoryDeclInfo):
    when ownSizeof(CXIdxObjCCategoryDeclInfo) !=
        ownSizeof(CXIdxObjCCategoryDeclInfo_553648891):
      static :
        warning("Declaration of " & "CXIdxObjCCategoryDeclInfo" &
            " exists but with different size")
    CXIdxObjCCategoryDeclInfo
  else:
    CXIdxObjCCategoryDeclInfo_553648891)
  CXEvalResultKind_553648790 = (when declared(CXEvalResultKind):
    when ownSizeof(CXEvalResultKind) != ownSizeof(CXEvalResultKind_553648789):
      static :
        warning("Declaration of " & "CXEvalResultKind" &
            " exists but with different size")
    CXEvalResultKind
  else:
    CXEvalResultKind_553648789)
  CXPlatformAvailability_553648710 = (when declared(CXPlatformAvailability):
    when ownSizeof(CXPlatformAvailability) != ownSizeof(CXPlatformAvailability_553648709):
      static :
        warning("Declaration of " & "CXPlatformAvailability" &
            " exists but with different size")
    CXPlatformAvailability
  else:
    CXPlatformAvailability_553648709)
  CXIdxImportedASTFileInfo_553648824 = (when declared(CXIdxImportedASTFileInfo):
    when ownSizeof(CXIdxImportedASTFileInfo) !=
        ownSizeof(CXIdxImportedASTFileInfo_553648823):
      static :
        warning("Declaration of " & "CXIdxImportedASTFileInfo" &
            " exists but with different size")
    CXIdxImportedASTFileInfo
  else:
    CXIdxImportedASTFileInfo_553648823)
  CXIndexOptions_553648678 = (when declared(CXIndexOptions):
    when ownSizeof(CXIndexOptions) != ownSizeof(CXIndexOptions_553648677):
      static :
        warning("Declaration of " & "CXIndexOptions" &
            " exists but with different size")
    CXIndexOptions
  else:
    CXIndexOptions_553648677)
  enum_CXCallingConv_553648720 = (when declared(enum_CXCallingConv):
    when ownSizeof(enum_CXCallingConv) != ownSizeof(enum_CXCallingConv_553648719):
      static :
        warning("Declaration of " & "enum_CXCallingConv" &
            " exists but with different size")
    enum_CXCallingConv
  else:
    enum_CXCallingConv_553648719)
  CXTUResourceUsage_553648696 = (when declared(CXTUResourceUsage):
    when ownSizeof(CXTUResourceUsage) != ownSizeof(CXTUResourceUsage_553648695):
      static :
        warning("Declaration of " & "CXTUResourceUsage" &
            " exists but with different size")
    CXTUResourceUsage
  else:
    CXTUResourceUsage_553648695)
  CXIdxEntityRefInfo_553648912 = (when declared(CXIdxEntityRefInfo):
    when ownSizeof(CXIdxEntityRefInfo) != ownSizeof(CXIdxEntityRefInfo_553648911):
      static :
        warning("Declaration of " & "CXIdxEntityRefInfo" &
            " exists but with different size")
    CXIdxEntityRefInfo
  else:
    CXIdxEntityRefInfo_553648911)
  struct_IndexerCallbacks_553648914 = (when declared(struct_IndexerCallbacks):
    when ownSizeof(struct_IndexerCallbacks) !=
        ownSizeof(struct_IndexerCallbacks_553648913):
      static :
        warning("Declaration of " & "struct_IndexerCallbacks" &
            " exists but with different size")
    struct_IndexerCallbacks
  else:
    struct_IndexerCallbacks_553648913)
  enum_CXIdxEntityKind_553648826 = (when declared(enum_CXIdxEntityKind):
    when ownSizeof(enum_CXIdxEntityKind) != ownSizeof(enum_CXIdxEntityKind_553648825):
      static :
        warning("Declaration of " & "enum_CXIdxEntityKind" &
            " exists but with different size")
    enum_CXIdxEntityKind
  else:
    enum_CXIdxEntityKind_553648825)
  enum_CXTokenKind_553648762 = (when declared(enum_CXTokenKind):
    when ownSizeof(enum_CXTokenKind) != ownSizeof(enum_CXTokenKind_553648761):
      static :
        warning("Declaration of " & "enum_CXTokenKind" &
            " exists but with different size")
    enum_CXTokenKind
  else:
    enum_CXTokenKind_553648761)
  CXGlobalOptFlags_553648674 = (when declared(CXGlobalOptFlags):
    when ownSizeof(CXGlobalOptFlags) != ownSizeof(CXGlobalOptFlags_553648673):
      static :
        warning("Declaration of " & "CXGlobalOptFlags" &
            " exists but with different size")
    CXGlobalOptFlags
  else:
    CXGlobalOptFlags_553648673)
  enum_CXCompletionChunkKind_553648776 = (when declared(
      enum_CXCompletionChunkKind):
    when ownSizeof(enum_CXCompletionChunkKind) !=
        ownSizeof(enum_CXCompletionChunkKind_553648775):
      static :
        warning("Declaration of " & "enum_CXCompletionChunkKind" &
            " exists but with different size")
    enum_CXCompletionChunkKind
  else:
    enum_CXCompletionChunkKind_553648775)
  enum_CXCursorKind_553648698 = (when declared(enum_CXCursorKind):
    when ownSizeof(enum_CXCursorKind) != ownSizeof(enum_CXCursorKind_553648697):
      static :
        warning("Declaration of " & "enum_CXCursorKind" &
            " exists but with different size")
    enum_CXCursorKind
  else:
    enum_CXCursorKind_553648697)
  struct_CXString_553648591 = (when declared(struct_CXString):
    when ownSizeof(struct_CXString) != ownSizeof(struct_CXString_553648590):
      static :
        warning("Declaration of " & "struct_CXString" &
            " exists but with different size")
    struct_CXString
  else:
    struct_CXString_553648590)
  CXEvalResult_553648792 = (when declared(CXEvalResult):
    when ownSizeof(CXEvalResult) != ownSizeof(CXEvalResult_553648791):
      static :
        warning("Declaration of " & "CXEvalResult" &
            " exists but with different size")
    CXEvalResult
  else:
    CXEvalResult_553648791)
  CXInclusionVisitor_553648786 = (when declared(CXInclusionVisitor):
    when ownSizeof(CXInclusionVisitor) != ownSizeof(CXInclusionVisitor_553648785):
      static :
        warning("Declaration of " & "CXInclusionVisitor" &
            " exists but with different size")
    CXInclusionVisitor
  else:
    CXInclusionVisitor_553648785)
  enum_CXCompletionContext_553648784 = (when declared(enum_CXCompletionContext):
    when ownSizeof(enum_CXCompletionContext) !=
        ownSizeof(enum_CXCompletionContext_553648783):
      static :
        warning("Declaration of " & "enum_CXCompletionContext" &
            " exists but with different size")
    enum_CXCompletionContext
  else:
    enum_CXCompletionContext_553648783)
  enum_CXObjCDeclQualifierKind_553648754 = (when declared(
      enum_CXObjCDeclQualifierKind):
    when ownSizeof(enum_CXObjCDeclQualifierKind) !=
        ownSizeof(enum_CXObjCDeclQualifierKind_553648753):
      static :
        warning("Declaration of " & "enum_CXObjCDeclQualifierKind" &
            " exists but with different size")
    enum_CXObjCDeclQualifierKind
  else:
    enum_CXObjCDeclQualifierKind_553648753)
  CXToken_553648768 = (when declared(CXToken):
    when ownSizeof(CXToken) != ownSizeof(CXToken_553648767):
      static :
        warning("Declaration of " & "CXToken" &
            " exists but with different size")
    CXToken
  else:
    CXToken_553648767)
  enum_CXRefQualifierKind_553648732 = (when declared(enum_CXRefQualifierKind):
    when ownSizeof(enum_CXRefQualifierKind) !=
        ownSizeof(enum_CXRefQualifierKind_553648731):
      static :
        warning("Declaration of " & "enum_CXRefQualifierKind" &
            " exists but with different size")
    enum_CXRefQualifierKind
  else:
    enum_CXRefQualifierKind_553648731)
  CXCompletionResult_553648774 = (when declared(CXCompletionResult):
    when ownSizeof(CXCompletionResult) != ownSizeof(CXCompletionResult_553648773):
      static :
        warning("Declaration of " & "CXCompletionResult" &
            " exists but with different size")
    CXCompletionResult
  else:
    CXCompletionResult_553648773)
  CXCursorAndRangeVisitorBlock_553648804 = (when declared(
      CXCursorAndRangeVisitorBlock):
    when ownSizeof(CXCursorAndRangeVisitorBlock) !=
        ownSizeof(CXCursorAndRangeVisitorBlock_553648803):
      static :
        warning("Declaration of " & "CXCursorAndRangeVisitorBlock" &
            " exists but with different size")
    CXCursorAndRangeVisitorBlock
  else:
    CXCursorAndRangeVisitorBlock_553648803)
  struct_CXIdxObjCCategoryDeclInfo_553648890 = (when declared(
      struct_CXIdxObjCCategoryDeclInfo):
    when ownSizeof(struct_CXIdxObjCCategoryDeclInfo) !=
        ownSizeof(struct_CXIdxObjCCategoryDeclInfo_553648889):
      static :
        warning("Declaration of " & "struct_CXIdxObjCCategoryDeclInfo" &
            " exists but with different size")
    struct_CXIdxObjCCategoryDeclInfo
  else:
    struct_CXIdxObjCCategoryDeclInfo_553648889)
  enum_CXCommentInlineCommandRenderKind_553648938 = (when declared(
      enum_CXCommentInlineCommandRenderKind):
    when ownSizeof(enum_CXCommentInlineCommandRenderKind) !=
        ownSizeof(enum_CXCommentInlineCommandRenderKind_553648937):
      static :
        warning("Declaration of " & "enum_CXCommentInlineCommandRenderKind" &
            " exists but with different size")
    enum_CXCommentInlineCommandRenderKind
  else:
    enum_CXCommentInlineCommandRenderKind_553648937)
  CXIdxIncludedFileInfo_553648820 = (when declared(CXIdxIncludedFileInfo):
    when ownSizeof(CXIdxIncludedFileInfo) != ownSizeof(CXIdxIncludedFileInfo_553648819):
      static :
        warning("Declaration of " & "CXIdxIncludedFileInfo" &
            " exists but with different size")
    CXIdxIncludedFileInfo
  else:
    CXIdxIncludedFileInfo_553648819)
  enum_CXIdxAttrKind_553648838 = (when declared(enum_CXIdxAttrKind):
    when ownSizeof(enum_CXIdxAttrKind) != ownSizeof(enum_CXIdxAttrKind_553648837):
      static :
        warning("Declaration of " & "enum_CXIdxAttrKind" &
            " exists but with different size")
    enum_CXIdxAttrKind
  else:
    enum_CXIdxAttrKind_553648837)
  CXTokenKind_553648764 = (when declared(CXTokenKind):
    when ownSizeof(CXTokenKind) != ownSizeof(CXTokenKind_553648763):
      static :
        warning("Declaration of " & "CXTokenKind" &
            " exists but with different size")
    CXTokenKind
  else:
    CXTokenKind_553648763)
  enum_CXLoadDiag_Error_553648639 = (when declared(enum_CXLoadDiag_Error):
    when ownSizeof(enum_CXLoadDiag_Error) != ownSizeof(enum_CXLoadDiag_Error_553648638):
      static :
        warning("Declaration of " & "enum_CXLoadDiag_Error" &
            " exists but with different size")
    enum_CXLoadDiag_Error
  else:
    enum_CXLoadDiag_Error_553648638)
  struct_CXIdxEntityRefInfo_553648910 = (when declared(struct_CXIdxEntityRefInfo):
    when ownSizeof(struct_CXIdxEntityRefInfo) !=
        ownSizeof(struct_CXIdxEntityRefInfo_553648909):
      static :
        warning("Declaration of " & "struct_CXIdxEntityRefInfo" &
            " exists but with different size")
    struct_CXIdxEntityRefInfo
  else:
    struct_CXIdxEntityRefInfo_553648909)
  enum_CXIndexOptFlags_553648920 = (when declared(enum_CXIndexOptFlags):
    when ownSizeof(enum_CXIndexOptFlags) != ownSizeof(enum_CXIndexOptFlags_553648919):
      static :
        warning("Declaration of " & "enum_CXIndexOptFlags" &
            " exists but with different size")
    enum_CXIndexOptFlags
  else:
    enum_CXIndexOptFlags_553648919)
  CXIdxEntityInfo_553648848 = (when declared(CXIdxEntityInfo):
    when ownSizeof(CXIdxEntityInfo) != ownSizeof(CXIdxEntityInfo_553648847):
      static :
        warning("Declaration of " & "CXIdxEntityInfo" &
            " exists but with different size")
    CXIdxEntityInfo
  else:
    CXIdxEntityInfo_553648847)
  CXCompilationDatabase_Error_553648611 = (when declared(
      CXCompilationDatabase_Error):
    when ownSizeof(CXCompilationDatabase_Error) !=
        ownSizeof(CXCompilationDatabase_Error_553648610):
      static :
        warning("Declaration of " & "CXCompilationDatabase_Error" &
            " exists but with different size")
    CXCompilationDatabase_Error
  else:
    CXCompilationDatabase_Error_553648610)
  time_t_553648615 = (when declared(time_t):
    when ownSizeof(time_t) != ownSizeof(time_t_553648614):
      static :
        warning("Declaration of " & "time_t" & " exists but with different size")
    time_t
  else:
    time_t_553648614)
  enum_CXDiagnosticDisplayOptions_553648641 = (when declared(
      enum_CXDiagnosticDisplayOptions):
    when ownSizeof(enum_CXDiagnosticDisplayOptions) !=
        ownSizeof(enum_CXDiagnosticDisplayOptions_553648640):
      static :
        warning("Declaration of " & "enum_CXDiagnosticDisplayOptions" &
            " exists but with different size")
    enum_CXDiagnosticDisplayOptions
  else:
    enum_CXDiagnosticDisplayOptions_553648640)
  enum_CXVisibilityKind_553648706 = (when declared(enum_CXVisibilityKind):
    when ownSizeof(enum_CXVisibilityKind) != ownSizeof(enum_CXVisibilityKind_553648705):
      static :
        warning("Declaration of " & "enum_CXVisibilityKind" &
            " exists but with different size")
    enum_CXVisibilityKind
  else:
    enum_CXVisibilityKind_553648705)
  enum_CXTLSKind_553648714 = (when declared(enum_CXTLSKind):
    when ownSizeof(enum_CXTLSKind) != ownSizeof(enum_CXTLSKind_553648713):
      static :
        warning("Declaration of " & "enum_CXTLSKind" &
            " exists but with different size")
    enum_CXTLSKind
  else:
    enum_CXTLSKind_553648713)
  CXRemapping_553648930 = (when declared(CXRemapping):
    when ownSizeof(CXRemapping) != ownSizeof(CXRemapping_553648929):
      static :
        warning("Declaration of " & "CXRemapping" &
            " exists but with different size")
    CXRemapping
  else:
    CXRemapping_553648929)
  CXCompletionString_553648770 = (when declared(CXCompletionString):
    when ownSizeof(CXCompletionString) != ownSizeof(CXCompletionString_553648769):
      static :
        warning("Declaration of " & "CXCompletionString" &
            " exists but with different size")
    CXCompletionString
  else:
    CXCompletionString_553648769)
  enum_CXObjCPropertyAttrKind_553648750 = (when declared(
      enum_CXObjCPropertyAttrKind):
    when ownSizeof(enum_CXObjCPropertyAttrKind) !=
        ownSizeof(enum_CXObjCPropertyAttrKind_553648749):
      static :
        warning("Declaration of " & "enum_CXObjCPropertyAttrKind" &
            " exists but with different size")
    enum_CXObjCPropertyAttrKind
  else:
    enum_CXObjCPropertyAttrKind_553648749)
  struct_CXIdxObjCInterfaceDeclInfo_553648886 = (when declared(
      struct_CXIdxObjCInterfaceDeclInfo):
    when ownSizeof(struct_CXIdxObjCInterfaceDeclInfo) !=
        ownSizeof(struct_CXIdxObjCInterfaceDeclInfo_553648885):
      static :
        warning("Declaration of " & "struct_CXIdxObjCInterfaceDeclInfo" &
            " exists but with different size")
    struct_CXIdxObjCInterfaceDeclInfo
  else:
    struct_CXIdxObjCInterfaceDeclInfo_553648885)
  struct_CXTUResourceUsage_553648694 = (when declared(struct_CXTUResourceUsage):
    when ownSizeof(struct_CXTUResourceUsage) !=
        ownSizeof(struct_CXTUResourceUsage_553648693):
      static :
        warning("Declaration of " & "struct_CXTUResourceUsage" &
            " exists but with different size")
    struct_CXTUResourceUsage
  else:
    struct_CXTUResourceUsage_553648693)
  struct_CXPlatformAvailability_553648708 = (when declared(
      struct_CXPlatformAvailability):
    when ownSizeof(struct_CXPlatformAvailability) !=
        ownSizeof(struct_CXPlatformAvailability_553648707):
      static :
        warning("Declaration of " & "struct_CXPlatformAvailability" &
            " exists but with different size")
    struct_CXPlatformAvailability
  else:
    struct_CXPlatformAvailability_553648707)
  CXCodeCompleteResults_553648780 = (when declared(CXCodeCompleteResults):
    when ownSizeof(CXCodeCompleteResults) != ownSizeof(CXCodeCompleteResults_553648779):
      static :
        warning("Declaration of " & "CXCodeCompleteResults" &
            " exists but with different size")
    CXCodeCompleteResults
  else:
    CXCodeCompleteResults_553648779)
  struct_CXVersion_553648655 = (when declared(struct_CXVersion):
    when ownSizeof(struct_CXVersion) != ownSizeof(struct_CXVersion_553648654):
      static :
        warning("Declaration of " & "struct_CXVersion" &
            " exists but with different size")
    struct_CXVersion
  else:
    struct_CXVersion_553648654)
  CXCursorVisitor_553648742 = (when declared(CXCursorVisitor):
    when ownSizeof(CXCursorVisitor) != ownSizeof(CXCursorVisitor_553648741):
      static :
        warning("Declaration of " & "CXCursorVisitor" &
            " exists but with different size")
    CXCursorVisitor
  else:
    CXCursorVisitor_553648741)
  CXCompileCommand_553648607 = (when declared(CXCompileCommand):
    when ownSizeof(CXCompileCommand) != ownSizeof(CXCompileCommand_553648606):
      static :
        warning("Declaration of " & "CXCompileCommand" &
            " exists but with different size")
    CXCompileCommand
  else:
    CXCompileCommand_553648606)
  struct_CXStringSet_553648595 = (when declared(struct_CXStringSet):
    when ownSizeof(struct_CXStringSet) != ownSizeof(struct_CXStringSet_553648594):
      static :
        warning("Declaration of " & "struct_CXStringSet" &
            " exists but with different size")
    struct_CXStringSet
  else:
    struct_CXStringSet_553648594)
  enum_CXLanguageKind_553648712 = (when declared(enum_CXLanguageKind):
    when ownSizeof(enum_CXLanguageKind) != ownSizeof(enum_CXLanguageKind_553648711):
      static :
        warning("Declaration of " & "enum_CXLanguageKind" &
            " exists but with different size")
    enum_CXLanguageKind
  else:
    enum_CXLanguageKind_553648711)
  CXClientData_553648649 = (when declared(CXClientData):
    when ownSizeof(CXClientData) != ownSizeof(CXClientData_553648648):
      static :
        warning("Declaration of " & "CXClientData" &
            " exists but with different size")
    CXClientData
  else:
    CXClientData_553648648)
  enum_CXAvailabilityKind_553648653 = (when declared(enum_CXAvailabilityKind):
    when ownSizeof(enum_CXAvailabilityKind) !=
        ownSizeof(enum_CXAvailabilityKind_553648652):
      static :
        warning("Declaration of " & "enum_CXAvailabilityKind" &
            " exists but with different size")
    enum_CXAvailabilityKind
  else:
    enum_CXAvailabilityKind_553648652)
  CXObjCPropertyAttrKind_553648752 = (when declared(CXObjCPropertyAttrKind):
    when ownSizeof(CXObjCPropertyAttrKind) != ownSizeof(CXObjCPropertyAttrKind_553648751):
      static :
        warning("Declaration of " & "CXObjCPropertyAttrKind" &
            " exists but with different size")
    CXObjCPropertyAttrKind
  else:
    CXObjCPropertyAttrKind_553648751)
  CXIdxAttrInfo_553648844 = (when declared(CXIdxAttrInfo):
    when ownSizeof(CXIdxAttrInfo) != ownSizeof(CXIdxAttrInfo_553648843):
      static :
        warning("Declaration of " & "CXIdxAttrInfo" &
            " exists but with different size")
    CXIdxAttrInfo
  else:
    CXIdxAttrInfo_553648843)
  CXIndexOptFlags_553648922 = (when declared(CXIndexOptFlags):
    when ownSizeof(CXIndexOptFlags) != ownSizeof(CXIndexOptFlags_553648921):
      static :
        warning("Declaration of " & "CXIndexOptFlags" &
            " exists but with different size")
    CXIndexOptFlags
  else:
    CXIndexOptFlags_553648921)
  enum_CXChildVisitResult_553648740 = (when declared(enum_CXChildVisitResult):
    when ownSizeof(enum_CXChildVisitResult) !=
        ownSizeof(enum_CXChildVisitResult_553648739):
      static :
        warning("Declaration of " & "enum_CXChildVisitResult" &
            " exists but with different size")
    enum_CXChildVisitResult
  else:
    enum_CXChildVisitResult_553648739)
  struct_CXSourceRangeList_553648629 = (when declared(struct_CXSourceRangeList):
    when ownSizeof(struct_CXSourceRangeList) !=
        ownSizeof(struct_CXSourceRangeList_553648628):
      static :
        warning("Declaration of " & "struct_CXSourceRangeList" &
            " exists but with different size")
    struct_CXSourceRangeList
  else:
    struct_CXSourceRangeList_553648628)
  CXIdxClientASTFile_553648812 = (when declared(CXIdxClientASTFile):
    when ownSizeof(CXIdxClientASTFile) != ownSizeof(CXIdxClientASTFile_553648811):
      static :
        warning("Declaration of " & "CXIdxClientASTFile" &
            " exists but with different size")
    CXIdxClientASTFile
  else:
    CXIdxClientASTFile_553648811)
  CXString_553648593 = (when declared(CXString):
    when ownSizeof(CXString) != ownSizeof(CXString_553648592):
      static :
        warning("Declaration of " & "CXString" &
            " exists but with different size")
    CXString
  else:
    CXString_553648592)
  enum_CXCursor_ExceptionSpecificationKind_553648659 = (when declared(
      enum_CXCursor_ExceptionSpecificationKind):
    when ownSizeof(enum_CXCursor_ExceptionSpecificationKind) !=
        ownSizeof(enum_CXCursor_ExceptionSpecificationKind_553648658):
      static :
        warning("Declaration of " & "enum_CXCursor_ExceptionSpecificationKind" &
            " exists but with different size")
    enum_CXCursor_ExceptionSpecificationKind
  else:
    enum_CXCursor_ExceptionSpecificationKind_553648658)
  enum_CXPrintingPolicyProperty_553648748 = (when declared(
      enum_CXPrintingPolicyProperty):
    when ownSizeof(enum_CXPrintingPolicyProperty) !=
        ownSizeof(enum_CXPrintingPolicyProperty_553648747):
      static :
        warning("Declaration of " & "enum_CXPrintingPolicyProperty" &
            " exists but with different size")
    enum_CXPrintingPolicyProperty
  else:
    enum_CXPrintingPolicyProperty_553648747)
  enum_CXDiagnosticSeverity_553648633 = (when declared(enum_CXDiagnosticSeverity):
    when ownSizeof(enum_CXDiagnosticSeverity) !=
        ownSizeof(enum_CXDiagnosticSeverity_553648632):
      static :
        warning("Declaration of " & "enum_CXDiagnosticSeverity" &
            " exists but with different size")
    enum_CXDiagnosticSeverity
  else:
    enum_CXDiagnosticSeverity_553648632)
  CXSymbolRole_553648908 = (when declared(CXSymbolRole):
    when ownSizeof(CXSymbolRole) != ownSizeof(CXSymbolRole_553648907):
      static :
        warning("Declaration of " & "CXSymbolRole" &
            " exists but with different size")
    CXSymbolRole
  else:
    CXSymbolRole_553648907)
  CXSourceRange_553648627 = (when declared(CXSourceRange):
    when ownSizeof(CXSourceRange) != ownSizeof(CXSourceRange_553648626):
      static :
        warning("Declaration of " & "CXSourceRange" &
            " exists but with different size")
    CXSourceRange
  else:
    CXSourceRange_553648626)
  struct_CXIdxDeclInfo_553648862 = (when declared(struct_CXIdxDeclInfo):
    when ownSizeof(struct_CXIdxDeclInfo) != ownSizeof(struct_CXIdxDeclInfo_553648861):
      static :
        warning("Declaration of " & "struct_CXIdxDeclInfo" &
            " exists but with different size")
    struct_CXIdxDeclInfo
  else:
    struct_CXIdxDeclInfo_553648861)
  compiler_time_t_553648949 = (when declared(compiler_time_t):
    when ownSizeof(compiler_time_t) != ownSizeof(compiler_time_t_553648948):
      static :
        warning("Declaration of " & "compiler_time_t" &
            " exists but with different size")
    compiler_time_t
  else:
    compiler_time_t_553648948)
  enum_CXSymbolRole_553648906 = (when declared(enum_CXSymbolRole):
    when ownSizeof(enum_CXSymbolRole) != ownSizeof(enum_CXSymbolRole_553648905):
      static :
        warning("Declaration of " & "enum_CXSymbolRole" &
            " exists but with different size")
    enum_CXSymbolRole
  else:
    enum_CXSymbolRole_553648905)
  CXIndexAction_553648918 = (when declared(CXIndexAction):
    when ownSizeof(CXIndexAction) != ownSizeof(CXIndexAction_553648917):
      static :
        warning("Declaration of " & "CXIndexAction" &
            " exists but with different size")
    CXIndexAction
  else:
    CXIndexAction_553648917)
  enum_CXIdxEntityLanguage_553648830 = (when declared(enum_CXIdxEntityLanguage):
    when ownSizeof(enum_CXIdxEntityLanguage) !=
        ownSizeof(enum_CXIdxEntityLanguage_553648829):
      static :
        warning("Declaration of " & "enum_CXIdxEntityLanguage" &
            " exists but with different size")
    enum_CXIdxEntityLanguage
  else:
    enum_CXIdxEntityLanguage_553648829)
  CXTranslationUnit_553648647 = (when declared(CXTranslationUnit):
    when ownSizeof(CXTranslationUnit) != ownSizeof(CXTranslationUnit_553648646):
      static :
        warning("Declaration of " & "CXTranslationUnit" &
            " exists but with different size")
    CXTranslationUnit
  else:
    CXTranslationUnit_553648646)
  CXIndex_553648643 = (when declared(CXIndex):
    when ownSizeof(CXIndex) != ownSizeof(CXIndex_553648642):
      static :
        warning("Declaration of " & "CXIndex" &
            " exists but with different size")
    CXIndex
  else:
    CXIndex_553648642)
  CXResult_553648802 = (when declared(CXResult):
    when ownSizeof(CXResult) != ownSizeof(CXResult_553648801):
      static :
        warning("Declaration of " & "CXResult" &
            " exists but with different size")
    CXResult
  else:
    CXResult_553648801)
  struct_CXCursor_553648700 = (when declared(struct_CXCursor):
    when ownSizeof(struct_CXCursor) != ownSizeof(struct_CXCursor_553648699):
      static :
        warning("Declaration of " & "struct_CXCursor" &
            " exists but with different size")
    struct_CXCursor
  else:
    struct_CXCursor_553648699)
when not declared(CXVirtualFileOverlay):
  type
    CXVirtualFileOverlay* = CXVirtualFileOverlay_553648598
else:
  static :
    hint("Declaration of " & "CXVirtualFileOverlay" &
        " already exists, not redeclaring")
when not declared(enum_CXCompilationDatabase_Error):
  type
    enum_CXCompilationDatabase_Error* = enum_CXCompilationDatabase_Error_553648608
else:
  static :
    hint("Declaration of " & "enum_CXCompilationDatabase_Error" &
        " already exists, not redeclaring")
when not declared(CXDiagnosticSet):
  type
    CXDiagnosticSet* = CXDiagnosticSet_553648636
else:
  static :
    hint("Declaration of " & "CXDiagnosticSet" &
        " already exists, not redeclaring")
when not declared(CXModuleMapDescriptor):
  type
    CXModuleMapDescriptor* = CXModuleMapDescriptor_553648600
else:
  static :
    hint("Declaration of " & "CXModuleMapDescriptor" &
        " already exists, not redeclaring")
when not declared(CXIdxLoc):
  type
    CXIdxLoc* = CXIdxLoc_553648815
else:
  static :
    hint("Declaration of " & "CXIdxLoc" & " already exists, not redeclaring")
when not declared(CXAPISet):
  type
    CXAPISet* = CXAPISet_553648941
else:
  static :
    hint("Declaration of " & "CXAPISet" & " already exists, not redeclaring")
when not declared(enum_CXChoice):
  type
    enum_CXChoice* = enum_CXChoice_553648660
else:
  static :
    hint("Declaration of " & "enum_CXChoice" &
        " already exists, not redeclaring")
when not declared(struct_CXFileUniqueID):
  type
    struct_CXFileUniqueID* = struct_CXFileUniqueID_553648616
else:
  static :
    hint("Declaration of " & "struct_CXFileUniqueID" &
        " already exists, not redeclaring")
when not declared(CXComment):
  type
    CXComment* = CXComment_553648933
else:
  static :
    hint("Declaration of " & "CXComment" & " already exists, not redeclaring")
when not declared(CXFile):
  type
    CXFile* = CXFile_553648612
else:
  static :
    hint("Declaration of " & "CXFile" & " already exists, not redeclaring")
when not declared(struct_CXCursorAndRangeVisitor):
  type
    struct_CXCursorAndRangeVisitor* = struct_CXCursorAndRangeVisitor_553648795
else:
  static :
    hint("Declaration of " & "struct_CXCursorAndRangeVisitor" &
        " already exists, not redeclaring")
when not declared(CXIdxEntityLanguage):
  type
    CXIdxEntityLanguage* = CXIdxEntityLanguage_553648831
else:
  static :
    hint("Declaration of " & "CXIdxEntityLanguage" &
        " already exists, not redeclaring")
when not declared(enum_CXIdxObjCContainerKind):
  type
    enum_CXIdxObjCContainerKind* = enum_CXIdxObjCContainerKind_553648865
else:
  static :
    hint("Declaration of " & "enum_CXIdxObjCContainerKind" &
        " already exists, not redeclaring")
when not declared(CXIdxDeclInfo):
  type
    CXIdxDeclInfo* = CXIdxDeclInfo_553648863
else:
  static :
    hint("Declaration of " & "CXIdxDeclInfo" &
        " already exists, not redeclaring")
when not declared(CXIdxEntityRefKind):
  type
    CXIdxEntityRefKind* = CXIdxEntityRefKind_553648903
else:
  static :
    hint("Declaration of " & "CXIdxEntityRefKind" &
        " already exists, not redeclaring")
when not declared(enum_CXTypeNullabilityKind):
  type
    enum_CXTypeNullabilityKind* = enum_CXTypeNullabilityKind_553648727
else:
  static :
    hint("Declaration of " & "enum_CXTypeNullabilityKind" &
        " already exists, not redeclaring")
when not declared(enum_CXSaveTranslationUnit_Flags):
  type
    enum_CXSaveTranslationUnit_Flags* = enum_CXSaveTranslationUnit_Flags_553648681
else:
  static :
    hint("Declaration of " & "enum_CXSaveTranslationUnit_Flags" &
        " already exists, not redeclaring")
when not declared(enum_CXResult):
  type
    enum_CXResult* = enum_CXResult_553648799
else:
  static :
    hint("Declaration of " & "enum_CXResult" &
        " already exists, not redeclaring")
when not declared(CXFieldVisitor):
  type
    CXFieldVisitor* = CXFieldVisitor_553648923
else:
  static :
    hint("Declaration of " & "CXFieldVisitor" &
        " already exists, not redeclaring")
when not declared(enum_CXEvalResultKind):
  type
    enum_CXEvalResultKind* = enum_CXEvalResultKind_553648787
else:
  static :
    hint("Declaration of " & "enum_CXEvalResultKind" &
        " already exists, not redeclaring")
when not declared(struct_CXCompletionResult):
  type
    struct_CXCompletionResult* = struct_CXCompletionResult_553648771
else:
  static :
    hint("Declaration of " & "struct_CXCompletionResult" &
        " already exists, not redeclaring")
when not declared(struct_CXUnsavedFile):
  type
    struct_CXUnsavedFile* = struct_CXUnsavedFile_553648650
else:
  static :
    hint("Declaration of " & "struct_CXUnsavedFile" &
        " already exists, not redeclaring")
when not declared(enum_CX_StorageClass):
  type
    enum_CX_StorageClass* = enum_CX_StorageClass_553648735
else:
  static :
    hint("Declaration of " & "enum_CX_StorageClass" &
        " already exists, not redeclaring")
when not declared(CXCursorAndRangeVisitor):
  type
    CXCursorAndRangeVisitor* = CXCursorAndRangeVisitor_553648797
else:
  static :
    hint("Declaration of " & "CXCursorAndRangeVisitor" &
        " already exists, not redeclaring")
when not declared(struct_CXIdxIncludedFileInfo):
  type
    struct_CXIdxIncludedFileInfo* = struct_CXIdxIncludedFileInfo_553648817
else:
  static :
    hint("Declaration of " & "struct_CXIdxIncludedFileInfo" &
        " already exists, not redeclaring")
when not declared(enum_CXCommentKind):
  type
    enum_CXCommentKind* = enum_CXCommentKind_553648935
else:
  static :
    hint("Declaration of " & "enum_CXCommentKind" &
        " already exists, not redeclaring")
when not declared(CXIdxContainerInfo):
  type
    CXIdxContainerInfo* = CXIdxContainerInfo_553648851
else:
  static :
    hint("Declaration of " & "CXIdxContainerInfo" &
        " already exists, not redeclaring")
when not declared(CXType):
  type
    CXType* = CXType_553648723
else:
  static :
    hint("Declaration of " & "CXType" & " already exists, not redeclaring")
when not declared(enum_CXSaveError):
  type
    enum_CXSaveError* = enum_CXSaveError_553648683
else:
  static :
    hint("Declaration of " & "enum_CXSaveError" &
        " already exists, not redeclaring")
when not declared(struct_CXTUResourceUsageEntry):
  type
    struct_CXTUResourceUsageEntry* = struct_CXTUResourceUsageEntry_553648689
else:
  static :
    hint("Declaration of " & "struct_CXTUResourceUsageEntry" &
        " already exists, not redeclaring")
when not declared(CXIdxObjCInterfaceDeclInfo):
  type
    CXIdxObjCInterfaceDeclInfo* = CXIdxObjCInterfaceDeclInfo_553648887
else:
  static :
    hint("Declaration of " & "CXIdxObjCInterfaceDeclInfo" &
        " already exists, not redeclaring")
when not declared(CXChoice):
  type
    CXChoice* = CXChoice_553648662
else:
  static :
    hint("Declaration of " & "CXChoice" & " already exists, not redeclaring")
when not declared(CXIdxObjCContainerDeclInfo):
  type
    CXIdxObjCContainerDeclInfo* = CXIdxObjCContainerDeclInfo_553648871
else:
  static :
    hint("Declaration of " & "CXIdxObjCContainerDeclInfo" &
        " already exists, not redeclaring")
when not declared(struct_CXIdxImportedASTFileInfo):
  type
    struct_CXIdxImportedASTFileInfo* = struct_CXIdxImportedASTFileInfo_553648821
else:
  static :
    hint("Declaration of " & "struct_CXIdxImportedASTFileInfo" &
        " already exists, not redeclaring")
when not declared(struct_CXSourceLocation):
  type
    struct_CXSourceLocation* = struct_CXSourceLocation_553648620
else:
  static :
    hint("Declaration of " & "struct_CXSourceLocation" &
        " already exists, not redeclaring")
when not declared(CXStringSet):
  type
    CXStringSet* = CXStringSet_553648596
else:
  static :
    hint("Declaration of " & "CXStringSet" & " already exists, not redeclaring")
when not declared(struct_CXIdxAttrInfo):
  type
    struct_CXIdxAttrInfo* = struct_CXIdxAttrInfo_553648841
else:
  static :
    hint("Declaration of " & "struct_CXIdxAttrInfo" &
        " already exists, not redeclaring")
when not declared(CXIdxEntityKind):
  type
    CXIdxEntityKind* = CXIdxEntityKind_553648827
else:
  static :
    hint("Declaration of " & "CXIdxEntityKind" &
        " already exists, not redeclaring")
when not declared(CXCursorVisitorBlock):
  type
    CXCursorVisitorBlock* = CXCursorVisitorBlock_553648743
else:
  static :
    hint("Declaration of " & "CXCursorVisitorBlock" &
        " already exists, not redeclaring")
when not declared(CXCursor):
  type
    CXCursor* = CXCursor_553648701
else:
  static :
    hint("Declaration of " & "CXCursor" & " already exists, not redeclaring")
when not declared(struct_CXIdxIBOutletCollectionAttrInfo):
  type
    struct_CXIdxIBOutletCollectionAttrInfo* = struct_CXIdxIBOutletCollectionAttrInfo_553648853
else:
  static :
    hint("Declaration of " & "struct_CXIdxIBOutletCollectionAttrInfo" &
        " already exists, not redeclaring")
when not declared(CXIdxClientFile):
  type
    CXIdxClientFile* = CXIdxClientFile_553648805
else:
  static :
    hint("Declaration of " & "CXIdxClientFile" &
        " already exists, not redeclaring")
when not declared(CXDiagnostic):
  type
    CXDiagnostic* = CXDiagnostic_553648634
else:
  static :
    hint("Declaration of " & "CXDiagnostic" & " already exists, not redeclaring")
when not declared(struct_CXIdxContainerInfo):
  type
    struct_CXIdxContainerInfo* = struct_CXIdxContainerInfo_553648849
else:
  static :
    hint("Declaration of " & "struct_CXIdxContainerInfo" &
        " already exists, not redeclaring")
when not declared(CXSourceRangeList):
  type
    CXSourceRangeList* = CXSourceRangeList_553648630
else:
  static :
    hint("Declaration of " & "CXSourceRangeList" &
        " already exists, not redeclaring")
when not declared(CXModule):
  type
    CXModule* = CXModule_553648757
else:
  static :
    hint("Declaration of " & "CXModule" & " already exists, not redeclaring")
when not declared(struct_CXType):
  type
    struct_CXType* = struct_CXType_553648721
else:
  static :
    hint("Declaration of " & "struct_CXType" &
        " already exists, not redeclaring")
when not declared(CXIdxClientEntity):
  type
    CXIdxClientEntity* = CXIdxClientEntity_553648807
else:
  static :
    hint("Declaration of " & "CXIdxClientEntity" &
        " already exists, not redeclaring")
when not declared(struct_CXIdxBaseClassInfo):
  type
    struct_CXIdxBaseClassInfo* = struct_CXIdxBaseClassInfo_553648873
else:
  static :
    hint("Declaration of " & "struct_CXIdxBaseClassInfo" &
        " already exists, not redeclaring")
when not declared(struct_CXIdxObjCPropertyDeclInfo):
  type
    struct_CXIdxObjCPropertyDeclInfo* = struct_CXIdxObjCPropertyDeclInfo_553648893
else:
  static :
    hint("Declaration of " & "struct_CXIdxObjCPropertyDeclInfo" &
        " already exists, not redeclaring")
when not declared(CXCompilationDatabase):
  type
    CXCompilationDatabase* = CXCompilationDatabase_553648602
else:
  static :
    hint("Declaration of " & "CXCompilationDatabase" &
        " already exists, not redeclaring")
when not declared(enum_CXReparse_Flags):
  type
    enum_CXReparse_Flags* = enum_CXReparse_Flags_553648685
else:
  static :
    hint("Declaration of " & "enum_CXReparse_Flags" &
        " already exists, not redeclaring")
when not declared(struct_CXToken):
  type
    struct_CXToken* = struct_CXToken_553648765
else:
  static :
    hint("Declaration of " & "struct_CXToken" &
        " already exists, not redeclaring")
when not declared(CXIdxObjCPropertyDeclInfo):
  type
    CXIdxObjCPropertyDeclInfo* = CXIdxObjCPropertyDeclInfo_553648895
else:
  static :
    hint("Declaration of " & "CXIdxObjCPropertyDeclInfo" &
        " already exists, not redeclaring")
when not declared(CXTUResourceUsageEntry):
  type
    CXTUResourceUsageEntry* = CXTUResourceUsageEntry_553648691
else:
  static :
    hint("Declaration of " & "CXTUResourceUsageEntry" &
        " already exists, not redeclaring")
when not declared(enum_CXIdxEntityRefKind):
  type
    enum_CXIdxEntityRefKind* = enum_CXIdxEntityRefKind_553648901
else:
  static :
    hint("Declaration of " & "enum_CXIdxEntityRefKind" &
        " already exists, not redeclaring")
when not declared(enum_CXTranslationUnit_Flags):
  type
    enum_CXTranslationUnit_Flags* = enum_CXTranslationUnit_Flags_553648679
else:
  static :
    hint("Declaration of " & "enum_CXTranslationUnit_Flags" &
        " already exists, not redeclaring")
when not declared(CXIdxEntityCXXTemplateKind):
  type
    CXIdxEntityCXXTemplateKind* = CXIdxEntityCXXTemplateKind_553648835
else:
  static :
    hint("Declaration of " & "CXIdxEntityCXXTemplateKind" &
        " already exists, not redeclaring")
when not declared(enum_CXTypeLayoutError):
  type
    enum_CXTypeLayoutError* = enum_CXTypeLayoutError_553648729
else:
  static :
    hint("Declaration of " & "enum_CXTypeLayoutError" &
        " already exists, not redeclaring")
when not declared(struct_CXComment):
  type
    struct_CXComment* = struct_CXComment_553648931
else:
  static :
    hint("Declaration of " & "struct_CXComment" &
        " already exists, not redeclaring")
when not declared(enum_CXIdxEntityCXXTemplateKind):
  type
    enum_CXIdxEntityCXXTemplateKind* = enum_CXIdxEntityCXXTemplateKind_553648833
else:
  static :
    hint("Declaration of " & "enum_CXIdxEntityCXXTemplateKind" &
        " already exists, not redeclaring")
when not declared(enum_CXIdxDeclInfoFlags):
  type
    enum_CXIdxDeclInfoFlags* = enum_CXIdxDeclInfoFlags_553648857
else:
  static :
    hint("Declaration of " & "enum_CXIdxDeclInfoFlags" &
        " already exists, not redeclaring")
when not declared(enum_CXLinkageKind):
  type
    enum_CXLinkageKind* = enum_CXLinkageKind_553648703
else:
  static :
    hint("Declaration of " & "enum_CXLinkageKind" &
        " already exists, not redeclaring")
when not declared(CXTargetInfo):
  type
    CXTargetInfo* = CXTargetInfo_553648644
else:
  static :
    hint("Declaration of " & "CXTargetInfo" & " already exists, not redeclaring")
when not declared(enum_CXNameRefFlags):
  type
    enum_CXNameRefFlags* = enum_CXNameRefFlags_553648759
else:
  static :
    hint("Declaration of " & "enum_CXNameRefFlags" &
        " already exists, not redeclaring")
when not declared(enum_CXBinaryOperatorKind_enum):
  type
    enum_CXBinaryOperatorKind_enum* = enum_CXBinaryOperatorKind_enum_553648925
else:
  static :
    hint("Declaration of " & "enum_CXBinaryOperatorKind_enum" &
        " already exists, not redeclaring")
when not declared(CXIdxObjCProtocolRefInfo):
  type
    CXIdxObjCProtocolRefInfo* = CXIdxObjCProtocolRefInfo_553648879
else:
  static :
    hint("Declaration of " & "CXIdxObjCProtocolRefInfo" &
        " already exists, not redeclaring")
when not declared(CXCompileCommands):
  type
    CXCompileCommands* = CXCompileCommands_553648604
else:
  static :
    hint("Declaration of " & "CXCompileCommands" &
        " already exists, not redeclaring")
when not declared(enum_CXCodeComplete_Flags):
  type
    enum_CXCodeComplete_Flags* = enum_CXCodeComplete_Flags_553648781
else:
  static :
    hint("Declaration of " & "enum_CXCodeComplete_Flags" &
        " already exists, not redeclaring")
when not declared(struct_CXIdxLoc):
  type
    struct_CXIdxLoc* = struct_CXIdxLoc_553648813
else:
  static :
    hint("Declaration of " & "struct_CXIdxLoc" &
        " already exists, not redeclaring")
when not declared(enum_CXTypeKind):
  type
    enum_CXTypeKind* = enum_CXTypeKind_553648717
else:
  static :
    hint("Declaration of " & "enum_CXTypeKind" &
        " already exists, not redeclaring")
when not declared(enum_CX_BinaryOperatorKind):
  type
    enum_CX_BinaryOperatorKind* = enum_CX_BinaryOperatorKind_553648737
else:
  static :
    hint("Declaration of " & "enum_CX_BinaryOperatorKind" &
        " already exists, not redeclaring")
when not declared(struct_CXIdxObjCProtocolRefInfo):
  type
    struct_CXIdxObjCProtocolRefInfo* = struct_CXIdxObjCProtocolRefInfo_553648877
else:
  static :
    hint("Declaration of " & "struct_CXIdxObjCProtocolRefInfo" &
        " already exists, not redeclaring")
when not declared(IndexerCallbacks):
  type
    IndexerCallbacks* = IndexerCallbacks_553648915
else:
  static :
    hint("Declaration of " & "IndexerCallbacks" &
        " already exists, not redeclaring")
when not declared(enum_CXUnaryOperatorKind):
  type
    enum_CXUnaryOperatorKind* = enum_CXUnaryOperatorKind_553648927
else:
  static :
    hint("Declaration of " & "enum_CXUnaryOperatorKind" &
        " already exists, not redeclaring")
when not declared(CXIdxClientContainer):
  type
    CXIdxClientContainer* = CXIdxClientContainer_553648809
else:
  static :
    hint("Declaration of " & "CXIdxClientContainer" &
        " already exists, not redeclaring")
when not declared(CXIdxAttrKind):
  type
    CXIdxAttrKind* = CXIdxAttrKind_553648839
else:
  static :
    hint("Declaration of " & "CXIdxAttrKind" &
        " already exists, not redeclaring")
when not declared(enum_CXTUResourceUsageKind):
  type
    enum_CXTUResourceUsageKind* = enum_CXTUResourceUsageKind_553648687
else:
  static :
    hint("Declaration of " & "enum_CXTUResourceUsageKind" &
        " already exists, not redeclaring")
when not declared(CXIdxBaseClassInfo):
  type
    CXIdxBaseClassInfo* = CXIdxBaseClassInfo_553648875
else:
  static :
    hint("Declaration of " & "CXIdxBaseClassInfo" &
        " already exists, not redeclaring")
when not declared(enum_CXCommentParamPassDirection):
  type
    enum_CXCommentParamPassDirection* = enum_CXCommentParamPassDirection_553648939
else:
  static :
    hint("Declaration of " & "enum_CXCommentParamPassDirection" &
        " already exists, not redeclaring")
when not declared(enum_CXTemplateArgumentKind):
  type
    enum_CXTemplateArgumentKind* = enum_CXTemplateArgumentKind_553648725
else:
  static :
    hint("Declaration of " & "enum_CXTemplateArgumentKind" &
        " already exists, not redeclaring")
when not declared(CXIdxCXXClassDeclInfo):
  type
    CXIdxCXXClassDeclInfo* = CXIdxCXXClassDeclInfo_553648899
else:
  static :
    hint("Declaration of " & "CXIdxCXXClassDeclInfo" &
        " already exists, not redeclaring")
when not declared(CXFileUniqueID):
  type
    CXFileUniqueID* = CXFileUniqueID_553648618
else:
  static :
    hint("Declaration of " & "CXFileUniqueID" &
        " already exists, not redeclaring")
when not declared(struct_CXCodeCompleteResults):
  type
    struct_CXCodeCompleteResults* = struct_CXCodeCompleteResults_553648777
else:
  static :
    hint("Declaration of " & "struct_CXCodeCompleteResults" &
        " already exists, not redeclaring")
when not declared(struct_CXSourceRange):
  type
    struct_CXSourceRange* = struct_CXSourceRange_553648624
else:
  static :
    hint("Declaration of " & "struct_CXSourceRange" &
        " already exists, not redeclaring")
when not declared(enum_CXErrorCode):
  type
    enum_CXErrorCode* = enum_CXErrorCode_553648588
else:
  static :
    hint("Declaration of " & "enum_CXErrorCode" &
        " already exists, not redeclaring")
when not declared(CXIdxDeclInfoFlags):
  type
    CXIdxDeclInfoFlags* = CXIdxDeclInfoFlags_553648859
else:
  static :
    hint("Declaration of " & "CXIdxDeclInfoFlags" &
        " already exists, not redeclaring")
when not declared(CXVersion):
  type
    CXVersion* = CXVersion_553648656
else:
  static :
    hint("Declaration of " & "CXVersion" & " already exists, not redeclaring")
when not declared(struct_CXIdxObjCProtocolRefListInfo):
  type
    struct_CXIdxObjCProtocolRefListInfo* = struct_CXIdxObjCProtocolRefListInfo_553648881
else:
  static :
    hint("Declaration of " & "struct_CXIdxObjCProtocolRefListInfo" &
        " already exists, not redeclaring")
when not declared(CXPrintingPolicy):
  type
    CXPrintingPolicy* = CXPrintingPolicy_553648745
else:
  static :
    hint("Declaration of " & "CXPrintingPolicy" &
        " already exists, not redeclaring")
when not declared(CXIdxObjCContainerKind):
  type
    CXIdxObjCContainerKind* = CXIdxObjCContainerKind_553648867
else:
  static :
    hint("Declaration of " & "CXIdxObjCContainerKind" &
        " already exists, not redeclaring")
when not declared(CXIdxIBOutletCollectionAttrInfo):
  type
    CXIdxIBOutletCollectionAttrInfo* = CXIdxIBOutletCollectionAttrInfo_553648855
else:
  static :
    hint("Declaration of " & "CXIdxIBOutletCollectionAttrInfo" &
        " already exists, not redeclaring")
when not declared(struct_CXIdxObjCContainerDeclInfo):
  type
    struct_CXIdxObjCContainerDeclInfo* = struct_CXIdxObjCContainerDeclInfo_553648869
else:
  static :
    hint("Declaration of " & "struct_CXIdxObjCContainerDeclInfo" &
        " already exists, not redeclaring")
when not declared(CXRewriter):
  type
    CXRewriter* = CXRewriter_553648943
else:
  static :
    hint("Declaration of " & "CXRewriter" & " already exists, not redeclaring")
when not declared(struct_CXIndexOptions):
  type
    struct_CXIndexOptions* = struct_CXIndexOptions_553648675
else:
  static :
    hint("Declaration of " & "struct_CXIndexOptions" &
        " already exists, not redeclaring")
when not declared(enum_CXVisitorResult):
  type
    enum_CXVisitorResult* = enum_CXVisitorResult_553648793
else:
  static :
    hint("Declaration of " & "enum_CXVisitorResult" &
        " already exists, not redeclaring")
when not declared(CXIdxObjCProtocolRefListInfo):
  type
    CXIdxObjCProtocolRefListInfo* = CXIdxObjCProtocolRefListInfo_553648883
else:
  static :
    hint("Declaration of " & "CXIdxObjCProtocolRefListInfo" &
        " already exists, not redeclaring")
when not declared(enum_CXGlobalOptFlags):
  type
    enum_CXGlobalOptFlags* = enum_CXGlobalOptFlags_553648664
else:
  static :
    hint("Declaration of " & "enum_CXGlobalOptFlags" &
        " already exists, not redeclaring")
when not declared(struct_CXIdxCXXClassDeclInfo):
  type
    struct_CXIdxCXXClassDeclInfo* = struct_CXIdxCXXClassDeclInfo_553648897
else:
  static :
    hint("Declaration of " & "struct_CXIdxCXXClassDeclInfo" &
        " already exists, not redeclaring")
when not declared(struct_CXIdxEntityInfo):
  type
    struct_CXIdxEntityInfo* = struct_CXIdxEntityInfo_553648845
else:
  static :
    hint("Declaration of " & "struct_CXIdxEntityInfo" &
        " already exists, not redeclaring")
when not declared(CXCursorSet):
  type
    CXCursorSet* = CXCursorSet_553648715
else:
  static :
    hint("Declaration of " & "CXCursorSet" & " already exists, not redeclaring")
when not declared(CXSourceLocation):
  type
    CXSourceLocation* = CXSourceLocation_553648622
else:
  static :
    hint("Declaration of " & "CXSourceLocation" &
        " already exists, not redeclaring")
when not declared(enum_CX_CXXAccessSpecifier):
  type
    enum_CX_CXXAccessSpecifier* = enum_CX_CXXAccessSpecifier_553648733
else:
  static :
    hint("Declaration of " & "enum_CX_CXXAccessSpecifier" &
        " already exists, not redeclaring")
when not declared(CXObjCDeclQualifierKind):
  type
    CXObjCDeclQualifierKind* = CXObjCDeclQualifierKind_553648755
else:
  static :
    hint("Declaration of " & "CXObjCDeclQualifierKind" &
        " already exists, not redeclaring")
when not declared(CXIdxObjCCategoryDeclInfo):
  type
    CXIdxObjCCategoryDeclInfo* = CXIdxObjCCategoryDeclInfo_553648891
else:
  static :
    hint("Declaration of " & "CXIdxObjCCategoryDeclInfo" &
        " already exists, not redeclaring")
when not declared(CXEvalResultKind):
  type
    CXEvalResultKind* = CXEvalResultKind_553648789
else:
  static :
    hint("Declaration of " & "CXEvalResultKind" &
        " already exists, not redeclaring")
when not declared(CXPlatformAvailability):
  type
    CXPlatformAvailability* = CXPlatformAvailability_553648709
else:
  static :
    hint("Declaration of " & "CXPlatformAvailability" &
        " already exists, not redeclaring")
when not declared(CXIdxImportedASTFileInfo):
  type
    CXIdxImportedASTFileInfo* = CXIdxImportedASTFileInfo_553648823
else:
  static :
    hint("Declaration of " & "CXIdxImportedASTFileInfo" &
        " already exists, not redeclaring")
when not declared(CXIndexOptions):
  type
    CXIndexOptions* = CXIndexOptions_553648677
else:
  static :
    hint("Declaration of " & "CXIndexOptions" &
        " already exists, not redeclaring")
when not declared(enum_CXCallingConv):
  type
    enum_CXCallingConv* = enum_CXCallingConv_553648719
else:
  static :
    hint("Declaration of " & "enum_CXCallingConv" &
        " already exists, not redeclaring")
when not declared(CXTUResourceUsage):
  type
    CXTUResourceUsage* = CXTUResourceUsage_553648695
else:
  static :
    hint("Declaration of " & "CXTUResourceUsage" &
        " already exists, not redeclaring")
when not declared(CXIdxEntityRefInfo):
  type
    CXIdxEntityRefInfo* = CXIdxEntityRefInfo_553648911
else:
  static :
    hint("Declaration of " & "CXIdxEntityRefInfo" &
        " already exists, not redeclaring")
when not declared(struct_IndexerCallbacks):
  type
    struct_IndexerCallbacks* = struct_IndexerCallbacks_553648913
else:
  static :
    hint("Declaration of " & "struct_IndexerCallbacks" &
        " already exists, not redeclaring")
when not declared(enum_CXIdxEntityKind):
  type
    enum_CXIdxEntityKind* = enum_CXIdxEntityKind_553648825
else:
  static :
    hint("Declaration of " & "enum_CXIdxEntityKind" &
        " already exists, not redeclaring")
when not declared(enum_CXTokenKind):
  type
    enum_CXTokenKind* = enum_CXTokenKind_553648761
else:
  static :
    hint("Declaration of " & "enum_CXTokenKind" &
        " already exists, not redeclaring")
when not declared(CXGlobalOptFlags):
  type
    CXGlobalOptFlags* = CXGlobalOptFlags_553648673
else:
  static :
    hint("Declaration of " & "CXGlobalOptFlags" &
        " already exists, not redeclaring")
when not declared(enum_CXCompletionChunkKind):
  type
    enum_CXCompletionChunkKind* = enum_CXCompletionChunkKind_553648775
else:
  static :
    hint("Declaration of " & "enum_CXCompletionChunkKind" &
        " already exists, not redeclaring")
when not declared(enum_CXCursorKind):
  type
    enum_CXCursorKind* = enum_CXCursorKind_553648697
else:
  static :
    hint("Declaration of " & "enum_CXCursorKind" &
        " already exists, not redeclaring")
when not declared(struct_CXString):
  type
    struct_CXString* = struct_CXString_553648590
else:
  static :
    hint("Declaration of " & "struct_CXString" &
        " already exists, not redeclaring")
when not declared(CXEvalResult):
  type
    CXEvalResult* = CXEvalResult_553648791
else:
  static :
    hint("Declaration of " & "CXEvalResult" & " already exists, not redeclaring")
when not declared(CXInclusionVisitor):
  type
    CXInclusionVisitor* = CXInclusionVisitor_553648785
else:
  static :
    hint("Declaration of " & "CXInclusionVisitor" &
        " already exists, not redeclaring")
when not declared(enum_CXCompletionContext):
  type
    enum_CXCompletionContext* = enum_CXCompletionContext_553648783
else:
  static :
    hint("Declaration of " & "enum_CXCompletionContext" &
        " already exists, not redeclaring")
when not declared(enum_CXObjCDeclQualifierKind):
  type
    enum_CXObjCDeclQualifierKind* = enum_CXObjCDeclQualifierKind_553648753
else:
  static :
    hint("Declaration of " & "enum_CXObjCDeclQualifierKind" &
        " already exists, not redeclaring")
when not declared(CXToken):
  type
    CXToken* = CXToken_553648767
else:
  static :
    hint("Declaration of " & "CXToken" & " already exists, not redeclaring")
when not declared(enum_CXRefQualifierKind):
  type
    enum_CXRefQualifierKind* = enum_CXRefQualifierKind_553648731
else:
  static :
    hint("Declaration of " & "enum_CXRefQualifierKind" &
        " already exists, not redeclaring")
when not declared(CXCompletionResult):
  type
    CXCompletionResult* = CXCompletionResult_553648773
else:
  static :
    hint("Declaration of " & "CXCompletionResult" &
        " already exists, not redeclaring")
when not declared(CXCursorAndRangeVisitorBlock):
  type
    CXCursorAndRangeVisitorBlock* = CXCursorAndRangeVisitorBlock_553648803
else:
  static :
    hint("Declaration of " & "CXCursorAndRangeVisitorBlock" &
        " already exists, not redeclaring")
when not declared(struct_CXIdxObjCCategoryDeclInfo):
  type
    struct_CXIdxObjCCategoryDeclInfo* = struct_CXIdxObjCCategoryDeclInfo_553648889
else:
  static :
    hint("Declaration of " & "struct_CXIdxObjCCategoryDeclInfo" &
        " already exists, not redeclaring")
when not declared(enum_CXCommentInlineCommandRenderKind):
  type
    enum_CXCommentInlineCommandRenderKind* = enum_CXCommentInlineCommandRenderKind_553648937
else:
  static :
    hint("Declaration of " & "enum_CXCommentInlineCommandRenderKind" &
        " already exists, not redeclaring")
when not declared(CXIdxIncludedFileInfo):
  type
    CXIdxIncludedFileInfo* = CXIdxIncludedFileInfo_553648819
else:
  static :
    hint("Declaration of " & "CXIdxIncludedFileInfo" &
        " already exists, not redeclaring")
when not declared(enum_CXIdxAttrKind):
  type
    enum_CXIdxAttrKind* = enum_CXIdxAttrKind_553648837
else:
  static :
    hint("Declaration of " & "enum_CXIdxAttrKind" &
        " already exists, not redeclaring")
when not declared(CXTokenKind):
  type
    CXTokenKind* = CXTokenKind_553648763
else:
  static :
    hint("Declaration of " & "CXTokenKind" & " already exists, not redeclaring")
when not declared(enum_CXLoadDiag_Error):
  type
    enum_CXLoadDiag_Error* = enum_CXLoadDiag_Error_553648638
else:
  static :
    hint("Declaration of " & "enum_CXLoadDiag_Error" &
        " already exists, not redeclaring")
when not declared(struct_CXIdxEntityRefInfo):
  type
    struct_CXIdxEntityRefInfo* = struct_CXIdxEntityRefInfo_553648909
else:
  static :
    hint("Declaration of " & "struct_CXIdxEntityRefInfo" &
        " already exists, not redeclaring")
when not declared(enum_CXIndexOptFlags):
  type
    enum_CXIndexOptFlags* = enum_CXIndexOptFlags_553648919
else:
  static :
    hint("Declaration of " & "enum_CXIndexOptFlags" &
        " already exists, not redeclaring")
when not declared(CXIdxEntityInfo):
  type
    CXIdxEntityInfo* = CXIdxEntityInfo_553648847
else:
  static :
    hint("Declaration of " & "CXIdxEntityInfo" &
        " already exists, not redeclaring")
when not declared(CXCompilationDatabase_Error):
  type
    CXCompilationDatabase_Error* = CXCompilationDatabase_Error_553648610
else:
  static :
    hint("Declaration of " & "CXCompilationDatabase_Error" &
        " already exists, not redeclaring")
when not declared(time_t):
  type
    time_t* = time_t_553648614
else:
  static :
    hint("Declaration of " & "time_t" & " already exists, not redeclaring")
when not declared(enum_CXDiagnosticDisplayOptions):
  type
    enum_CXDiagnosticDisplayOptions* = enum_CXDiagnosticDisplayOptions_553648640
else:
  static :
    hint("Declaration of " & "enum_CXDiagnosticDisplayOptions" &
        " already exists, not redeclaring")
when not declared(enum_CXVisibilityKind):
  type
    enum_CXVisibilityKind* = enum_CXVisibilityKind_553648705
else:
  static :
    hint("Declaration of " & "enum_CXVisibilityKind" &
        " already exists, not redeclaring")
when not declared(enum_CXTLSKind):
  type
    enum_CXTLSKind* = enum_CXTLSKind_553648713
else:
  static :
    hint("Declaration of " & "enum_CXTLSKind" &
        " already exists, not redeclaring")
when not declared(CXRemapping):
  type
    CXRemapping* = CXRemapping_553648929
else:
  static :
    hint("Declaration of " & "CXRemapping" & " already exists, not redeclaring")
when not declared(CXCompletionString):
  type
    CXCompletionString* = CXCompletionString_553648769
else:
  static :
    hint("Declaration of " & "CXCompletionString" &
        " already exists, not redeclaring")
when not declared(enum_CXObjCPropertyAttrKind):
  type
    enum_CXObjCPropertyAttrKind* = enum_CXObjCPropertyAttrKind_553648749
else:
  static :
    hint("Declaration of " & "enum_CXObjCPropertyAttrKind" &
        " already exists, not redeclaring")
when not declared(struct_CXIdxObjCInterfaceDeclInfo):
  type
    struct_CXIdxObjCInterfaceDeclInfo* = struct_CXIdxObjCInterfaceDeclInfo_553648885
else:
  static :
    hint("Declaration of " & "struct_CXIdxObjCInterfaceDeclInfo" &
        " already exists, not redeclaring")
when not declared(struct_CXTUResourceUsage):
  type
    struct_CXTUResourceUsage* = struct_CXTUResourceUsage_553648693
else:
  static :
    hint("Declaration of " & "struct_CXTUResourceUsage" &
        " already exists, not redeclaring")
when not declared(struct_CXPlatformAvailability):
  type
    struct_CXPlatformAvailability* = struct_CXPlatformAvailability_553648707
else:
  static :
    hint("Declaration of " & "struct_CXPlatformAvailability" &
        " already exists, not redeclaring")
when not declared(CXCodeCompleteResults):
  type
    CXCodeCompleteResults* = CXCodeCompleteResults_553648779
else:
  static :
    hint("Declaration of " & "CXCodeCompleteResults" &
        " already exists, not redeclaring")
when not declared(struct_CXVersion):
  type
    struct_CXVersion* = struct_CXVersion_553648654
else:
  static :
    hint("Declaration of " & "struct_CXVersion" &
        " already exists, not redeclaring")
when not declared(CXCursorVisitor):
  type
    CXCursorVisitor* = CXCursorVisitor_553648741
else:
  static :
    hint("Declaration of " & "CXCursorVisitor" &
        " already exists, not redeclaring")
when not declared(CXCompileCommand):
  type
    CXCompileCommand* = CXCompileCommand_553648606
else:
  static :
    hint("Declaration of " & "CXCompileCommand" &
        " already exists, not redeclaring")
when not declared(struct_CXStringSet):
  type
    struct_CXStringSet* = struct_CXStringSet_553648594
else:
  static :
    hint("Declaration of " & "struct_CXStringSet" &
        " already exists, not redeclaring")
when not declared(enum_CXLanguageKind):
  type
    enum_CXLanguageKind* = enum_CXLanguageKind_553648711
else:
  static :
    hint("Declaration of " & "enum_CXLanguageKind" &
        " already exists, not redeclaring")
when not declared(CXClientData):
  type
    CXClientData* = CXClientData_553648648
else:
  static :
    hint("Declaration of " & "CXClientData" & " already exists, not redeclaring")
when not declared(enum_CXAvailabilityKind):
  type
    enum_CXAvailabilityKind* = enum_CXAvailabilityKind_553648652
else:
  static :
    hint("Declaration of " & "enum_CXAvailabilityKind" &
        " already exists, not redeclaring")
when not declared(CXObjCPropertyAttrKind):
  type
    CXObjCPropertyAttrKind* = CXObjCPropertyAttrKind_553648751
else:
  static :
    hint("Declaration of " & "CXObjCPropertyAttrKind" &
        " already exists, not redeclaring")
when not declared(CXIdxAttrInfo):
  type
    CXIdxAttrInfo* = CXIdxAttrInfo_553648843
else:
  static :
    hint("Declaration of " & "CXIdxAttrInfo" &
        " already exists, not redeclaring")
when not declared(CXIndexOptFlags):
  type
    CXIndexOptFlags* = CXIndexOptFlags_553648921
else:
  static :
    hint("Declaration of " & "CXIndexOptFlags" &
        " already exists, not redeclaring")
when not declared(enum_CXChildVisitResult):
  type
    enum_CXChildVisitResult* = enum_CXChildVisitResult_553648739
else:
  static :
    hint("Declaration of " & "enum_CXChildVisitResult" &
        " already exists, not redeclaring")
when not declared(struct_CXSourceRangeList):
  type
    struct_CXSourceRangeList* = struct_CXSourceRangeList_553648628
else:
  static :
    hint("Declaration of " & "struct_CXSourceRangeList" &
        " already exists, not redeclaring")
when not declared(CXIdxClientASTFile):
  type
    CXIdxClientASTFile* = CXIdxClientASTFile_553648811
else:
  static :
    hint("Declaration of " & "CXIdxClientASTFile" &
        " already exists, not redeclaring")
when not declared(CXString):
  type
    CXString* = CXString_553648592
else:
  static :
    hint("Declaration of " & "CXString" & " already exists, not redeclaring")
when not declared(enum_CXCursor_ExceptionSpecificationKind):
  type
    enum_CXCursor_ExceptionSpecificationKind* = enum_CXCursor_ExceptionSpecificationKind_553648658
else:
  static :
    hint("Declaration of " & "enum_CXCursor_ExceptionSpecificationKind" &
        " already exists, not redeclaring")
when not declared(enum_CXPrintingPolicyProperty):
  type
    enum_CXPrintingPolicyProperty* = enum_CXPrintingPolicyProperty_553648747
else:
  static :
    hint("Declaration of " & "enum_CXPrintingPolicyProperty" &
        " already exists, not redeclaring")
when not declared(enum_CXDiagnosticSeverity):
  type
    enum_CXDiagnosticSeverity* = enum_CXDiagnosticSeverity_553648632
else:
  static :
    hint("Declaration of " & "enum_CXDiagnosticSeverity" &
        " already exists, not redeclaring")
when not declared(CXSymbolRole):
  type
    CXSymbolRole* = CXSymbolRole_553648907
else:
  static :
    hint("Declaration of " & "CXSymbolRole" & " already exists, not redeclaring")
when not declared(CXSourceRange):
  type
    CXSourceRange* = CXSourceRange_553648626
else:
  static :
    hint("Declaration of " & "CXSourceRange" &
        " already exists, not redeclaring")
when not declared(struct_CXIdxDeclInfo):
  type
    struct_CXIdxDeclInfo* = struct_CXIdxDeclInfo_553648861
else:
  static :
    hint("Declaration of " & "struct_CXIdxDeclInfo" &
        " already exists, not redeclaring")
when not declared(compiler_time_t):
  type
    compiler_time_t* = compiler_time_t_553648948
else:
  static :
    hint("Declaration of " & "compiler_time_t" &
        " already exists, not redeclaring")
when not declared(enum_CXSymbolRole):
  type
    enum_CXSymbolRole* = enum_CXSymbolRole_553648905
else:
  static :
    hint("Declaration of " & "enum_CXSymbolRole" &
        " already exists, not redeclaring")
when not declared(CXIndexAction):
  type
    CXIndexAction* = CXIndexAction_553648917
else:
  static :
    hint("Declaration of " & "CXIndexAction" &
        " already exists, not redeclaring")
when not declared(enum_CXIdxEntityLanguage):
  type
    enum_CXIdxEntityLanguage* = enum_CXIdxEntityLanguage_553648829
else:
  static :
    hint("Declaration of " & "enum_CXIdxEntityLanguage" &
        " already exists, not redeclaring")
when not declared(CXTranslationUnit):
  type
    CXTranslationUnit* = CXTranslationUnit_553648646
else:
  static :
    hint("Declaration of " & "CXTranslationUnit" &
        " already exists, not redeclaring")
when not declared(CXIndex):
  type
    CXIndex* = CXIndex_553648642
else:
  static :
    hint("Declaration of " & "CXIndex" & " already exists, not redeclaring")
when not declared(CXResult):
  type
    CXResult* = CXResult_553648801
else:
  static :
    hint("Declaration of " & "CXResult" & " already exists, not redeclaring")
when not declared(struct_CXCursor):
  type
    struct_CXCursor* = struct_CXCursor_553648699
else:
  static :
    hint("Declaration of " & "struct_CXCursor" &
        " already exists, not redeclaring")
when not declared(LLVM_CLANG_C_EXTERN_C_BEGIN):
  when LLVM_CLANG_C_STRICT_PROTOTYPES_BEGIN is typedesc:
    type
      LLVM_CLANG_C_EXTERN_C_BEGIN* = LLVM_CLANG_C_STRICT_PROTOTYPES_BEGIN ## Generated based on /usr/include/clang-c/ExternC.h:35:9
  else:
    when LLVM_CLANG_C_STRICT_PROTOTYPES_BEGIN is static:
      const
        LLVM_CLANG_C_EXTERN_C_BEGIN* = LLVM_CLANG_C_STRICT_PROTOTYPES_BEGIN ## Generated based on /usr/include/clang-c/ExternC.h:35:9
    else:
      let LLVM_CLANG_C_EXTERN_C_BEGIN* = LLVM_CLANG_C_STRICT_PROTOTYPES_BEGIN ## Generated based on /usr/include/clang-c/ExternC.h:35:9
else:
  static :
    hint("Declaration of " & "LLVM_CLANG_C_EXTERN_C_BEGIN" &
        " already exists, not redeclaring")
when not declared(LLVM_CLANG_C_EXTERN_C_END):
  when LLVM_CLANG_C_STRICT_PROTOTYPES_END is typedesc:
    type
      LLVM_CLANG_C_EXTERN_C_END* = LLVM_CLANG_C_STRICT_PROTOTYPES_END ## Generated based on /usr/include/clang-c/ExternC.h:36:9
  else:
    when LLVM_CLANG_C_STRICT_PROTOTYPES_END is static:
      const
        LLVM_CLANG_C_EXTERN_C_END* = LLVM_CLANG_C_STRICT_PROTOTYPES_END ## Generated based on /usr/include/clang-c/ExternC.h:36:9
    else:
      let LLVM_CLANG_C_EXTERN_C_END* = LLVM_CLANG_C_STRICT_PROTOTYPES_END ## Generated based on /usr/include/clang-c/ExternC.h:36:9
else:
  static :
    hint("Declaration of " & "LLVM_CLANG_C_EXTERN_C_END" &
        " already exists, not redeclaring")
when not declared(CINDEX_VERSION_MAJOR):
  when 0 is static:
    const
      CINDEX_VERSION_MAJOR* = 0 ## Generated based on /usr/include/clang-c/Index.h:36:9
  else:
    let CINDEX_VERSION_MAJOR* = 0 ## Generated based on /usr/include/clang-c/Index.h:36:9
else:
  static :
    hint("Declaration of " & "CINDEX_VERSION_MAJOR" &
        " already exists, not redeclaring")
when not declared(CINDEX_VERSION_MINOR):
  when 64 is static:
    const
      CINDEX_VERSION_MINOR* = 64 ## Generated based on /usr/include/clang-c/Index.h:37:9
  else:
    let CINDEX_VERSION_MINOR* = 64 ## Generated based on /usr/include/clang-c/Index.h:37:9
else:
  static :
    hint("Declaration of " & "CINDEX_VERSION_MINOR" &
        " already exists, not redeclaring")
when not declared(getCString):
  proc getCString*(string: CXString_553648593): cstring {.cdecl,
      importc: "clang_getCString".}
else:
  static :
    hint("Declaration of " & "getCString" & " already exists, not redeclaring")
when not declared(disposeString):
  proc disposeString*(string: CXString_553648593): void {.cdecl,
      importc: "clang_disposeString".}
else:
  static :
    hint("Declaration of " & "disposeString" &
        " already exists, not redeclaring")
when not declared(disposeStringSet):
  proc disposeStringSet*(set: ptr CXStringSet_553648597): void {.cdecl,
      importc: "clang_disposeStringSet".}
else:
  static :
    hint("Declaration of " & "disposeStringSet" &
        " already exists, not redeclaring")
when not declared(getBuildSessionTimestamp):
  proc getBuildSessionTimestamp*(): culonglong {.cdecl,
      importc: "clang_getBuildSessionTimestamp".}
else:
  static :
    hint("Declaration of " & "getBuildSessionTimestamp" &
        " already exists, not redeclaring")
when not declared(VirtualFileOverlay_create):
  proc VirtualFileOverlay_create*(options: cuint): CXVirtualFileOverlay_553648599 {.
      cdecl, importc: "clang_VirtualFileOverlay_create".}
else:
  static :
    hint("Declaration of " & "VirtualFileOverlay_create" &
        " already exists, not redeclaring")
when not declared(VirtualFileOverlay_addFileMapping):
  proc VirtualFileOverlay_addFileMapping*(a0: CXVirtualFileOverlay_553648599;
      virtualPath: cstring; realPath: cstring): enum_CXErrorCode_553648589 {.
      cdecl, importc: "clang_VirtualFileOverlay_addFileMapping".}
else:
  static :
    hint("Declaration of " & "VirtualFileOverlay_addFileMapping" &
        " already exists, not redeclaring")
when not declared(VirtualFileOverlay_setCaseSensitivity):
  proc VirtualFileOverlay_setCaseSensitivity*(a0: CXVirtualFileOverlay_553648599;
      caseSensitive: cint): enum_CXErrorCode_553648589 {.cdecl,
      importc: "clang_VirtualFileOverlay_setCaseSensitivity".}
else:
  static :
    hint("Declaration of " & "VirtualFileOverlay_setCaseSensitivity" &
        " already exists, not redeclaring")
when not declared(VirtualFileOverlay_writeToBuffer):
  proc VirtualFileOverlay_writeToBuffer*(a0: CXVirtualFileOverlay_553648599;
      options: cuint; out_buffer_ptr: ptr cstring; out_buffer_size: ptr cuint): enum_CXErrorCode_553648589 {.
      cdecl, importc: "clang_VirtualFileOverlay_writeToBuffer".}
else:
  static :
    hint("Declaration of " & "VirtualFileOverlay_writeToBuffer" &
        " already exists, not redeclaring")
when not declared(free):
  proc free*(buffer: pointer): void {.cdecl, importc: "clang_free".}
else:
  static :
    hint("Declaration of " & "free" & " already exists, not redeclaring")
when not declared(VirtualFileOverlay_dispose):
  proc VirtualFileOverlay_dispose*(a0: CXVirtualFileOverlay_553648599): void {.
      cdecl, importc: "clang_VirtualFileOverlay_dispose".}
else:
  static :
    hint("Declaration of " & "VirtualFileOverlay_dispose" &
        " already exists, not redeclaring")
when not declared(ModuleMapDescriptor_create):
  proc ModuleMapDescriptor_create*(options: cuint): CXModuleMapDescriptor_553648601 {.
      cdecl, importc: "clang_ModuleMapDescriptor_create".}
else:
  static :
    hint("Declaration of " & "ModuleMapDescriptor_create" &
        " already exists, not redeclaring")
when not declared(ModuleMapDescriptor_setFrameworkModuleName):
  proc ModuleMapDescriptor_setFrameworkModuleName*(a0: CXModuleMapDescriptor_553648601;
      name: cstring): enum_CXErrorCode_553648589 {.cdecl,
      importc: "clang_ModuleMapDescriptor_setFrameworkModuleName".}
else:
  static :
    hint("Declaration of " & "ModuleMapDescriptor_setFrameworkModuleName" &
        " already exists, not redeclaring")
when not declared(ModuleMapDescriptor_setUmbrellaHeader):
  proc ModuleMapDescriptor_setUmbrellaHeader*(a0: CXModuleMapDescriptor_553648601;
      name: cstring): enum_CXErrorCode_553648589 {.cdecl,
      importc: "clang_ModuleMapDescriptor_setUmbrellaHeader".}
else:
  static :
    hint("Declaration of " & "ModuleMapDescriptor_setUmbrellaHeader" &
        " already exists, not redeclaring")
when not declared(ModuleMapDescriptor_writeToBuffer):
  proc ModuleMapDescriptor_writeToBuffer*(a0: CXModuleMapDescriptor_553648601;
      options: cuint; out_buffer_ptr: ptr cstring; out_buffer_size: ptr cuint): enum_CXErrorCode_553648589 {.
      cdecl, importc: "clang_ModuleMapDescriptor_writeToBuffer".}
else:
  static :
    hint("Declaration of " & "ModuleMapDescriptor_writeToBuffer" &
        " already exists, not redeclaring")
when not declared(ModuleMapDescriptor_dispose):
  proc ModuleMapDescriptor_dispose*(a0: CXModuleMapDescriptor_553648601): void {.
      cdecl, importc: "clang_ModuleMapDescriptor_dispose".}
else:
  static :
    hint("Declaration of " & "ModuleMapDescriptor_dispose" &
        " already exists, not redeclaring")
when not declared(CompilationDatabase_fromDirectory):
  proc CompilationDatabase_fromDirectory*(BuildDir: cstring;
      ErrorCode: ptr CXCompilationDatabase_Error_553648611): CXCompilationDatabase_553648603 {.
      cdecl, importc: "clang_CompilationDatabase_fromDirectory".}
else:
  static :
    hint("Declaration of " & "CompilationDatabase_fromDirectory" &
        " already exists, not redeclaring")
when not declared(CompilationDatabase_dispose):
  proc CompilationDatabase_dispose*(a0: CXCompilationDatabase_553648603): void {.
      cdecl, importc: "clang_CompilationDatabase_dispose".}
else:
  static :
    hint("Declaration of " & "CompilationDatabase_dispose" &
        " already exists, not redeclaring")
when not declared(CompilationDatabase_getCompileCommands):
  proc CompilationDatabase_getCompileCommands*(a0: CXCompilationDatabase_553648603;
      CompleteFileName: cstring): CXCompileCommands_553648605 {.cdecl,
      importc: "clang_CompilationDatabase_getCompileCommands".}
else:
  static :
    hint("Declaration of " & "CompilationDatabase_getCompileCommands" &
        " already exists, not redeclaring")
when not declared(CompilationDatabase_getAllCompileCommands):
  proc CompilationDatabase_getAllCompileCommands*(a0: CXCompilationDatabase_553648603): CXCompileCommands_553648605 {.
      cdecl, importc: "clang_CompilationDatabase_getAllCompileCommands".}
else:
  static :
    hint("Declaration of " & "CompilationDatabase_getAllCompileCommands" &
        " already exists, not redeclaring")
when not declared(CompileCommands_dispose):
  proc CompileCommands_dispose*(a0: CXCompileCommands_553648605): void {.cdecl,
      importc: "clang_CompileCommands_dispose".}
else:
  static :
    hint("Declaration of " & "CompileCommands_dispose" &
        " already exists, not redeclaring")
when not declared(CompileCommands_getSize):
  proc CompileCommands_getSize*(a0: CXCompileCommands_553648605): cuint {.cdecl,
      importc: "clang_CompileCommands_getSize".}
else:
  static :
    hint("Declaration of " & "CompileCommands_getSize" &
        " already exists, not redeclaring")
when not declared(CompileCommands_getCommand):
  proc CompileCommands_getCommand*(a0: CXCompileCommands_553648605; I: cuint): CXCompileCommand_553648607 {.
      cdecl, importc: "clang_CompileCommands_getCommand".}
else:
  static :
    hint("Declaration of " & "CompileCommands_getCommand" &
        " already exists, not redeclaring")
when not declared(CompileCommand_getDirectory):
  proc CompileCommand_getDirectory*(a0: CXCompileCommand_553648607): CXString_553648593 {.
      cdecl, importc: "clang_CompileCommand_getDirectory".}
else:
  static :
    hint("Declaration of " & "CompileCommand_getDirectory" &
        " already exists, not redeclaring")
when not declared(CompileCommand_getFilename):
  proc CompileCommand_getFilename*(a0: CXCompileCommand_553648607): CXString_553648593 {.
      cdecl, importc: "clang_CompileCommand_getFilename".}
else:
  static :
    hint("Declaration of " & "CompileCommand_getFilename" &
        " already exists, not redeclaring")
when not declared(CompileCommand_getNumArgs):
  proc CompileCommand_getNumArgs*(a0: CXCompileCommand_553648607): cuint {.
      cdecl, importc: "clang_CompileCommand_getNumArgs".}
else:
  static :
    hint("Declaration of " & "CompileCommand_getNumArgs" &
        " already exists, not redeclaring")
when not declared(CompileCommand_getArg):
  proc CompileCommand_getArg*(a0: CXCompileCommand_553648607; I: cuint): CXString_553648593 {.
      cdecl, importc: "clang_CompileCommand_getArg".}
else:
  static :
    hint("Declaration of " & "CompileCommand_getArg" &
        " already exists, not redeclaring")
when not declared(CompileCommand_getNumMappedSources):
  proc CompileCommand_getNumMappedSources*(a0: CXCompileCommand_553648607): cuint {.
      cdecl, importc: "clang_CompileCommand_getNumMappedSources".}
else:
  static :
    hint("Declaration of " & "CompileCommand_getNumMappedSources" &
        " already exists, not redeclaring")
when not declared(CompileCommand_getMappedSourcePath):
  proc CompileCommand_getMappedSourcePath*(a0: CXCompileCommand_553648607;
      I: cuint): CXString_553648593 {.cdecl, importc: "clang_CompileCommand_getMappedSourcePath".}
else:
  static :
    hint("Declaration of " & "CompileCommand_getMappedSourcePath" &
        " already exists, not redeclaring")
when not declared(CompileCommand_getMappedSourceContent):
  proc CompileCommand_getMappedSourceContent*(a0: CXCompileCommand_553648607;
      I: cuint): CXString_553648593 {.cdecl, importc: "clang_CompileCommand_getMappedSourceContent".}
else:
  static :
    hint("Declaration of " & "CompileCommand_getMappedSourceContent" &
        " already exists, not redeclaring")
when not declared(getFileName):
  proc getFileName*(SFile: CXFile_553648613): CXString_553648593 {.cdecl,
      importc: "clang_getFileName".}
else:
  static :
    hint("Declaration of " & "getFileName" & " already exists, not redeclaring")
when not declared(getFileTime):
  proc getFileTime*(SFile: CXFile_553648613): time_t_553648615 {.cdecl,
      importc: "clang_getFileTime".}
else:
  static :
    hint("Declaration of " & "getFileTime" & " already exists, not redeclaring")
when not declared(getFileUniqueID):
  proc getFileUniqueID*(file: CXFile_553648613; outID: ptr CXFileUniqueID_553648619): cint {.
      cdecl, importc: "clang_getFileUniqueID".}
else:
  static :
    hint("Declaration of " & "getFileUniqueID" &
        " already exists, not redeclaring")
when not declared(File_isEqual):
  proc File_isEqual*(file1: CXFile_553648613; file2: CXFile_553648613): cint {.
      cdecl, importc: "clang_File_isEqual".}
else:
  static :
    hint("Declaration of " & "File_isEqual" & " already exists, not redeclaring")
when not declared(File_tryGetRealPathName):
  proc File_tryGetRealPathName*(file: CXFile_553648613): CXString_553648593 {.
      cdecl, importc: "clang_File_tryGetRealPathName".}
else:
  static :
    hint("Declaration of " & "File_tryGetRealPathName" &
        " already exists, not redeclaring")
when not declared(getNullLocation):
  proc getNullLocation*(): CXSourceLocation_553648623 {.cdecl,
      importc: "clang_getNullLocation".}
else:
  static :
    hint("Declaration of " & "getNullLocation" &
        " already exists, not redeclaring")
when not declared(equalLocations):
  proc equalLocations*(loc1: CXSourceLocation_553648623; loc2: CXSourceLocation_553648623): cuint {.
      cdecl, importc: "clang_equalLocations".}
else:
  static :
    hint("Declaration of " & "equalLocations" &
        " already exists, not redeclaring")
when not declared(isBeforeInTranslationUnit):
  proc isBeforeInTranslationUnit*(loc1: CXSourceLocation_553648623;
                                  loc2: CXSourceLocation_553648623): cuint {.
      cdecl, importc: "clang_isBeforeInTranslationUnit".}
else:
  static :
    hint("Declaration of " & "isBeforeInTranslationUnit" &
        " already exists, not redeclaring")
when not declared(Location_isInSystemHeader):
  proc Location_isInSystemHeader*(location: CXSourceLocation_553648623): cint {.
      cdecl, importc: "clang_Location_isInSystemHeader".}
else:
  static :
    hint("Declaration of " & "Location_isInSystemHeader" &
        " already exists, not redeclaring")
when not declared(Location_isFromMainFile):
  proc Location_isFromMainFile*(location: CXSourceLocation_553648623): cint {.
      cdecl, importc: "clang_Location_isFromMainFile".}
else:
  static :
    hint("Declaration of " & "Location_isFromMainFile" &
        " already exists, not redeclaring")
when not declared(getNullRange):
  proc getNullRange*(): CXSourceRange_553648627 {.cdecl,
      importc: "clang_getNullRange".}
else:
  static :
    hint("Declaration of " & "getNullRange" & " already exists, not redeclaring")
when not declared(getRange):
  proc getRange*(begin: CXSourceLocation_553648623; end_arg: CXSourceLocation_553648623): CXSourceRange_553648627 {.
      cdecl, importc: "clang_getRange".}
else:
  static :
    hint("Declaration of " & "getRange" & " already exists, not redeclaring")
when not declared(equalRanges):
  proc equalRanges*(range1: CXSourceRange_553648627; range2: CXSourceRange_553648627): cuint {.
      cdecl, importc: "clang_equalRanges".}
else:
  static :
    hint("Declaration of " & "equalRanges" & " already exists, not redeclaring")
when not declared(Range_isNull):
  proc Range_isNull*(range: CXSourceRange_553648627): cint {.cdecl,
      importc: "clang_Range_isNull".}
else:
  static :
    hint("Declaration of " & "Range_isNull" & " already exists, not redeclaring")
when not declared(getExpansionLocation):
  proc getExpansionLocation*(location: CXSourceLocation_553648623;
                             file: ptr CXFile_553648613; line: ptr cuint;
                             column: ptr cuint; offset: ptr cuint): void {.
      cdecl, importc: "clang_getExpansionLocation".}
else:
  static :
    hint("Declaration of " & "getExpansionLocation" &
        " already exists, not redeclaring")
when not declared(getPresumedLocation):
  proc getPresumedLocation*(location: CXSourceLocation_553648623;
                            filename: ptr CXString_553648593; line: ptr cuint;
                            column: ptr cuint): void {.cdecl,
      importc: "clang_getPresumedLocation".}
else:
  static :
    hint("Declaration of " & "getPresumedLocation" &
        " already exists, not redeclaring")
when not declared(getInstantiationLocation):
  proc getInstantiationLocation*(location: CXSourceLocation_553648623;
                                 file: ptr CXFile_553648613; line: ptr cuint;
                                 column: ptr cuint; offset: ptr cuint): void {.
      cdecl, importc: "clang_getInstantiationLocation".}
else:
  static :
    hint("Declaration of " & "getInstantiationLocation" &
        " already exists, not redeclaring")
when not declared(getSpellingLocation):
  proc getSpellingLocation*(location: CXSourceLocation_553648623;
                            file: ptr CXFile_553648613; line: ptr cuint;
                            column: ptr cuint; offset: ptr cuint): void {.cdecl,
      importc: "clang_getSpellingLocation".}
else:
  static :
    hint("Declaration of " & "getSpellingLocation" &
        " already exists, not redeclaring")
when not declared(getFileLocation):
  proc getFileLocation*(location: CXSourceLocation_553648623; file: ptr CXFile_553648613;
                        line: ptr cuint; column: ptr cuint; offset: ptr cuint): void {.
      cdecl, importc: "clang_getFileLocation".}
else:
  static :
    hint("Declaration of " & "getFileLocation" &
        " already exists, not redeclaring")
when not declared(getRangeStart):
  proc getRangeStart*(range: CXSourceRange_553648627): CXSourceLocation_553648623 {.
      cdecl, importc: "clang_getRangeStart".}
else:
  static :
    hint("Declaration of " & "getRangeStart" &
        " already exists, not redeclaring")
when not declared(getRangeEnd):
  proc getRangeEnd*(range: CXSourceRange_553648627): CXSourceLocation_553648623 {.
      cdecl, importc: "clang_getRangeEnd".}
else:
  static :
    hint("Declaration of " & "getRangeEnd" & " already exists, not redeclaring")
when not declared(disposeSourceRangeList):
  proc disposeSourceRangeList*(ranges: ptr CXSourceRangeList_553648631): void {.
      cdecl, importc: "clang_disposeSourceRangeList".}
else:
  static :
    hint("Declaration of " & "disposeSourceRangeList" &
        " already exists, not redeclaring")
when not declared(getNumDiagnosticsInSet):
  proc getNumDiagnosticsInSet*(Diags: CXDiagnosticSet_553648637): cuint {.cdecl,
      importc: "clang_getNumDiagnosticsInSet".}
else:
  static :
    hint("Declaration of " & "getNumDiagnosticsInSet" &
        " already exists, not redeclaring")
when not declared(getDiagnosticInSet):
  proc getDiagnosticInSet*(Diags: CXDiagnosticSet_553648637; Index: cuint): CXDiagnostic_553648635 {.
      cdecl, importc: "clang_getDiagnosticInSet".}
else:
  static :
    hint("Declaration of " & "getDiagnosticInSet" &
        " already exists, not redeclaring")
when not declared(loadDiagnostics):
  proc loadDiagnostics*(file: cstring; error: ptr enum_CXLoadDiag_Error_553648639;
                        errorString: ptr CXString_553648593): CXDiagnosticSet_553648637 {.
      cdecl, importc: "clang_loadDiagnostics".}
else:
  static :
    hint("Declaration of " & "loadDiagnostics" &
        " already exists, not redeclaring")
when not declared(disposeDiagnosticSet):
  proc disposeDiagnosticSet*(Diags: CXDiagnosticSet_553648637): void {.cdecl,
      importc: "clang_disposeDiagnosticSet".}
else:
  static :
    hint("Declaration of " & "disposeDiagnosticSet" &
        " already exists, not redeclaring")
when not declared(getChildDiagnostics):
  proc getChildDiagnostics*(D: CXDiagnostic_553648635): CXDiagnosticSet_553648637 {.
      cdecl, importc: "clang_getChildDiagnostics".}
else:
  static :
    hint("Declaration of " & "getChildDiagnostics" &
        " already exists, not redeclaring")
when not declared(disposeDiagnostic):
  proc disposeDiagnostic*(Diagnostic: CXDiagnostic_553648635): void {.cdecl,
      importc: "clang_disposeDiagnostic".}
else:
  static :
    hint("Declaration of " & "disposeDiagnostic" &
        " already exists, not redeclaring")
when not declared(formatDiagnostic):
  proc formatDiagnostic*(Diagnostic: CXDiagnostic_553648635; Options: cuint): CXString_553648593 {.
      cdecl, importc: "clang_formatDiagnostic".}
else:
  static :
    hint("Declaration of " & "formatDiagnostic" &
        " already exists, not redeclaring")
when not declared(defaultDiagnosticDisplayOptions):
  proc defaultDiagnosticDisplayOptions*(): cuint {.cdecl,
      importc: "clang_defaultDiagnosticDisplayOptions".}
else:
  static :
    hint("Declaration of " & "defaultDiagnosticDisplayOptions" &
        " already exists, not redeclaring")
when not declared(getDiagnosticSeverity):
  proc getDiagnosticSeverity*(a0: CXDiagnostic_553648635): enum_CXDiagnosticSeverity_553648633 {.
      cdecl, importc: "clang_getDiagnosticSeverity".}
else:
  static :
    hint("Declaration of " & "getDiagnosticSeverity" &
        " already exists, not redeclaring")
when not declared(getDiagnosticLocation):
  proc getDiagnosticLocation*(a0: CXDiagnostic_553648635): CXSourceLocation_553648623 {.
      cdecl, importc: "clang_getDiagnosticLocation".}
else:
  static :
    hint("Declaration of " & "getDiagnosticLocation" &
        " already exists, not redeclaring")
when not declared(getDiagnosticSpelling):
  proc getDiagnosticSpelling*(a0: CXDiagnostic_553648635): CXString_553648593 {.
      cdecl, importc: "clang_getDiagnosticSpelling".}
else:
  static :
    hint("Declaration of " & "getDiagnosticSpelling" &
        " already exists, not redeclaring")
when not declared(getDiagnosticOption):
  proc getDiagnosticOption*(Diag: CXDiagnostic_553648635; Disable: ptr CXString_553648593): CXString_553648593 {.
      cdecl, importc: "clang_getDiagnosticOption".}
else:
  static :
    hint("Declaration of " & "getDiagnosticOption" &
        " already exists, not redeclaring")
when not declared(getDiagnosticCategory):
  proc getDiagnosticCategory*(a0: CXDiagnostic_553648635): cuint {.cdecl,
      importc: "clang_getDiagnosticCategory".}
else:
  static :
    hint("Declaration of " & "getDiagnosticCategory" &
        " already exists, not redeclaring")
when not declared(getDiagnosticCategoryName):
  proc getDiagnosticCategoryName*(Category: cuint): CXString_553648593 {.cdecl,
      importc: "clang_getDiagnosticCategoryName".}
else:
  static :
    hint("Declaration of " & "getDiagnosticCategoryName" &
        " already exists, not redeclaring")
when not declared(getDiagnosticCategoryText):
  proc getDiagnosticCategoryText*(a0: CXDiagnostic_553648635): CXString_553648593 {.
      cdecl, importc: "clang_getDiagnosticCategoryText".}
else:
  static :
    hint("Declaration of " & "getDiagnosticCategoryText" &
        " already exists, not redeclaring")
when not declared(getDiagnosticNumRanges):
  proc getDiagnosticNumRanges*(a0: CXDiagnostic_553648635): cuint {.cdecl,
      importc: "clang_getDiagnosticNumRanges".}
else:
  static :
    hint("Declaration of " & "getDiagnosticNumRanges" &
        " already exists, not redeclaring")
when not declared(getDiagnosticRange):
  proc getDiagnosticRange*(Diagnostic: CXDiagnostic_553648635; Range: cuint): CXSourceRange_553648627 {.
      cdecl, importc: "clang_getDiagnosticRange".}
else:
  static :
    hint("Declaration of " & "getDiagnosticRange" &
        " already exists, not redeclaring")
when not declared(getDiagnosticNumFixIts):
  proc getDiagnosticNumFixIts*(Diagnostic: CXDiagnostic_553648635): cuint {.
      cdecl, importc: "clang_getDiagnosticNumFixIts".}
else:
  static :
    hint("Declaration of " & "getDiagnosticNumFixIts" &
        " already exists, not redeclaring")
when not declared(getDiagnosticFixIt):
  proc getDiagnosticFixIt*(Diagnostic: CXDiagnostic_553648635; FixIt: cuint;
                           ReplacementRange: ptr CXSourceRange_553648627): CXString_553648593 {.
      cdecl, importc: "clang_getDiagnosticFixIt".}
else:
  static :
    hint("Declaration of " & "getDiagnosticFixIt" &
        " already exists, not redeclaring")
when not declared(createIndex):
  proc createIndex*(excludeDeclarationsFromPCH: cint; displayDiagnostics: cint): CXIndex_553648643 {.
      cdecl, importc: "clang_createIndex".}
else:
  static :
    hint("Declaration of " & "createIndex" & " already exists, not redeclaring")
when not declared(disposeIndex):
  proc disposeIndex*(index: CXIndex_553648643): void {.cdecl,
      importc: "clang_disposeIndex".}
else:
  static :
    hint("Declaration of " & "disposeIndex" & " already exists, not redeclaring")
when not declared(createIndexWithOptions):
  proc createIndexWithOptions*(options: ptr CXIndexOptions_553648678): CXIndex_553648643 {.
      cdecl, importc: "clang_createIndexWithOptions".}
else:
  static :
    hint("Declaration of " & "createIndexWithOptions" &
        " already exists, not redeclaring")
when not declared(CXIndex_setGlobalOptions):
  proc CXIndex_setGlobalOptions*(a0: CXIndex_553648643; options: cuint): void {.
      cdecl, importc: "clang_CXIndex_setGlobalOptions".}
else:
  static :
    hint("Declaration of " & "CXIndex_setGlobalOptions" &
        " already exists, not redeclaring")
when not declared(CXIndex_getGlobalOptions):
  proc CXIndex_getGlobalOptions*(a0: CXIndex_553648643): cuint {.cdecl,
      importc: "clang_CXIndex_getGlobalOptions".}
else:
  static :
    hint("Declaration of " & "CXIndex_getGlobalOptions" &
        " already exists, not redeclaring")
when not declared(CXIndex_setInvocationEmissionPathOption):
  proc CXIndex_setInvocationEmissionPathOption*(a0: CXIndex_553648643;
      Path: cstring): void {.cdecl, importc: "clang_CXIndex_setInvocationEmissionPathOption".}
else:
  static :
    hint("Declaration of " & "CXIndex_setInvocationEmissionPathOption" &
        " already exists, not redeclaring")
when not declared(isFileMultipleIncludeGuarded):
  proc isFileMultipleIncludeGuarded*(tu: CXTranslationUnit_553648647;
                                     file: CXFile_553648613): cuint {.cdecl,
      importc: "clang_isFileMultipleIncludeGuarded".}
else:
  static :
    hint("Declaration of " & "isFileMultipleIncludeGuarded" &
        " already exists, not redeclaring")
when not declared(getFile):
  proc getFile*(tu: CXTranslationUnit_553648647; file_name: cstring): CXFile_553648613 {.
      cdecl, importc: "clang_getFile".}
else:
  static :
    hint("Declaration of " & "getFile" & " already exists, not redeclaring")
when not declared(getFileContents):
  proc getFileContents*(tu: CXTranslationUnit_553648647; file: CXFile_553648613;
                        size: ptr csize_t): cstring {.cdecl,
      importc: "clang_getFileContents".}
else:
  static :
    hint("Declaration of " & "getFileContents" &
        " already exists, not redeclaring")
when not declared(getLocation):
  proc getLocation*(tu: CXTranslationUnit_553648647; file: CXFile_553648613;
                    line: cuint; column: cuint): CXSourceLocation_553648623 {.
      cdecl, importc: "clang_getLocation".}
else:
  static :
    hint("Declaration of " & "getLocation" & " already exists, not redeclaring")
when not declared(getLocationForOffset):
  proc getLocationForOffset*(tu: CXTranslationUnit_553648647; file: CXFile_553648613;
                             offset: cuint): CXSourceLocation_553648623 {.cdecl,
      importc: "clang_getLocationForOffset".}
else:
  static :
    hint("Declaration of " & "getLocationForOffset" &
        " already exists, not redeclaring")
when not declared(getSkippedRanges):
  proc getSkippedRanges*(tu: CXTranslationUnit_553648647; file: CXFile_553648613): ptr CXSourceRangeList_553648631 {.
      cdecl, importc: "clang_getSkippedRanges".}
else:
  static :
    hint("Declaration of " & "getSkippedRanges" &
        " already exists, not redeclaring")
when not declared(getAllSkippedRanges):
  proc getAllSkippedRanges*(tu: CXTranslationUnit_553648647): ptr CXSourceRangeList_553648631 {.
      cdecl, importc: "clang_getAllSkippedRanges".}
else:
  static :
    hint("Declaration of " & "getAllSkippedRanges" &
        " already exists, not redeclaring")
when not declared(getNumDiagnostics):
  proc getNumDiagnostics*(Unit: CXTranslationUnit_553648647): cuint {.cdecl,
      importc: "clang_getNumDiagnostics".}
else:
  static :
    hint("Declaration of " & "getNumDiagnostics" &
        " already exists, not redeclaring")
when not declared(getDiagnostic):
  proc getDiagnostic*(Unit: CXTranslationUnit_553648647; Index: cuint): CXDiagnostic_553648635 {.
      cdecl, importc: "clang_getDiagnostic".}
else:
  static :
    hint("Declaration of " & "getDiagnostic" &
        " already exists, not redeclaring")
when not declared(getDiagnosticSetFromTU):
  proc getDiagnosticSetFromTU*(Unit: CXTranslationUnit_553648647): CXDiagnosticSet_553648637 {.
      cdecl, importc: "clang_getDiagnosticSetFromTU".}
else:
  static :
    hint("Declaration of " & "getDiagnosticSetFromTU" &
        " already exists, not redeclaring")
when not declared(getTranslationUnitSpelling):
  proc getTranslationUnitSpelling*(CTUnit: CXTranslationUnit_553648647): CXString_553648593 {.
      cdecl, importc: "clang_getTranslationUnitSpelling".}
else:
  static :
    hint("Declaration of " & "getTranslationUnitSpelling" &
        " already exists, not redeclaring")
when not declared(createTranslationUnitFromSourceFile):
  proc createTranslationUnitFromSourceFile*(CIdx: CXIndex_553648643;
      source_filename: cstring; num_clang_command_line_args: cint;
      command_line_args: ptr cstring; num_unsaved_files: cuint;
      unsaved_files: ptr struct_CXUnsavedFile_553648651): CXTranslationUnit_553648647 {.
      cdecl, importc: "clang_createTranslationUnitFromSourceFile".}
else:
  static :
    hint("Declaration of " & "createTranslationUnitFromSourceFile" &
        " already exists, not redeclaring")
when not declared(createTranslationUnit):
  proc createTranslationUnit*(CIdx: CXIndex_553648643; ast_filename: cstring): CXTranslationUnit_553648647 {.
      cdecl, importc: "clang_createTranslationUnit".}
else:
  static :
    hint("Declaration of " & "createTranslationUnit" &
        " already exists, not redeclaring")
when not declared(createTranslationUnit2):
  proc createTranslationUnit2*(CIdx: CXIndex_553648643; ast_filename: cstring;
                               out_TU: ptr CXTranslationUnit_553648647): enum_CXErrorCode_553648589 {.
      cdecl, importc: "clang_createTranslationUnit2".}
else:
  static :
    hint("Declaration of " & "createTranslationUnit2" &
        " already exists, not redeclaring")
when not declared(defaultEditingTranslationUnitOptions):
  proc defaultEditingTranslationUnitOptions*(): cuint {.cdecl,
      importc: "clang_defaultEditingTranslationUnitOptions".}
else:
  static :
    hint("Declaration of " & "defaultEditingTranslationUnitOptions" &
        " already exists, not redeclaring")
when not declared(parseTranslationUnit):
  proc parseTranslationUnit*(CIdx: CXIndex_553648643; source_filename: cstring;
                             command_line_args: ptr cstring;
                             num_command_line_args: cint;
                             unsaved_files: ptr struct_CXUnsavedFile_553648651;
                             num_unsaved_files: cuint; options: cuint): CXTranslationUnit_553648647 {.
      cdecl, importc: "clang_parseTranslationUnit".}
else:
  static :
    hint("Declaration of " & "parseTranslationUnit" &
        " already exists, not redeclaring")
when not declared(parseTranslationUnit2):
  proc parseTranslationUnit2*(CIdx: CXIndex_553648643; source_filename: cstring;
                              command_line_args: ptr cstring;
                              num_command_line_args: cint;
                              unsaved_files: ptr struct_CXUnsavedFile_553648651;
                              num_unsaved_files: cuint; options: cuint;
                              out_TU: ptr CXTranslationUnit_553648647): enum_CXErrorCode_553648589 {.
      cdecl, importc: "clang_parseTranslationUnit2".}
else:
  static :
    hint("Declaration of " & "parseTranslationUnit2" &
        " already exists, not redeclaring")
when not declared(parseTranslationUnit2FullArgv):
  proc parseTranslationUnit2FullArgv*(CIdx: CXIndex_553648643;
                                      source_filename: cstring;
                                      command_line_args: ptr cstring;
                                      num_command_line_args: cint;
                                      unsaved_files: ptr struct_CXUnsavedFile_553648651;
                                      num_unsaved_files: cuint; options: cuint;
                                      out_TU: ptr CXTranslationUnit_553648647): enum_CXErrorCode_553648589 {.
      cdecl, importc: "clang_parseTranslationUnit2FullArgv".}
else:
  static :
    hint("Declaration of " & "parseTranslationUnit2FullArgv" &
        " already exists, not redeclaring")
when not declared(defaultSaveOptions):
  proc defaultSaveOptions*(TU: CXTranslationUnit_553648647): cuint {.cdecl,
      importc: "clang_defaultSaveOptions".}
else:
  static :
    hint("Declaration of " & "defaultSaveOptions" &
        " already exists, not redeclaring")
when not declared(saveTranslationUnit):
  proc saveTranslationUnit*(TU: CXTranslationUnit_553648647; FileName: cstring;
                            options: cuint): cint {.cdecl,
      importc: "clang_saveTranslationUnit".}
else:
  static :
    hint("Declaration of " & "saveTranslationUnit" &
        " already exists, not redeclaring")
when not declared(suspendTranslationUnit):
  proc suspendTranslationUnit*(a0: CXTranslationUnit_553648647): cuint {.cdecl,
      importc: "clang_suspendTranslationUnit".}
else:
  static :
    hint("Declaration of " & "suspendTranslationUnit" &
        " already exists, not redeclaring")
when not declared(disposeTranslationUnit):
  proc disposeTranslationUnit*(a0: CXTranslationUnit_553648647): void {.cdecl,
      importc: "clang_disposeTranslationUnit".}
else:
  static :
    hint("Declaration of " & "disposeTranslationUnit" &
        " already exists, not redeclaring")
when not declared(defaultReparseOptions):
  proc defaultReparseOptions*(TU: CXTranslationUnit_553648647): cuint {.cdecl,
      importc: "clang_defaultReparseOptions".}
else:
  static :
    hint("Declaration of " & "defaultReparseOptions" &
        " already exists, not redeclaring")
when not declared(reparseTranslationUnit):
  proc reparseTranslationUnit*(TU: CXTranslationUnit_553648647;
                               num_unsaved_files: cuint;
                               unsaved_files: ptr struct_CXUnsavedFile_553648651;
                               options: cuint): cint {.cdecl,
      importc: "clang_reparseTranslationUnit".}
else:
  static :
    hint("Declaration of " & "reparseTranslationUnit" &
        " already exists, not redeclaring")
when not declared(getTUResourceUsageName):
  proc getTUResourceUsageName*(kind: enum_CXTUResourceUsageKind_553648688): cstring {.
      cdecl, importc: "clang_getTUResourceUsageName".}
else:
  static :
    hint("Declaration of " & "getTUResourceUsageName" &
        " already exists, not redeclaring")
when not declared(getCXTUResourceUsage):
  proc getCXTUResourceUsage*(TU: CXTranslationUnit_553648647): CXTUResourceUsage_553648696 {.
      cdecl, importc: "clang_getCXTUResourceUsage".}
else:
  static :
    hint("Declaration of " & "getCXTUResourceUsage" &
        " already exists, not redeclaring")
when not declared(disposeCXTUResourceUsage):
  proc disposeCXTUResourceUsage*(usage: CXTUResourceUsage_553648696): void {.
      cdecl, importc: "clang_disposeCXTUResourceUsage".}
else:
  static :
    hint("Declaration of " & "disposeCXTUResourceUsage" &
        " already exists, not redeclaring")
when not declared(getTranslationUnitTargetInfo):
  proc getTranslationUnitTargetInfo*(CTUnit: CXTranslationUnit_553648647): CXTargetInfo_553648645 {.
      cdecl, importc: "clang_getTranslationUnitTargetInfo".}
else:
  static :
    hint("Declaration of " & "getTranslationUnitTargetInfo" &
        " already exists, not redeclaring")
when not declared(TargetInfo_dispose):
  proc TargetInfo_dispose*(Info: CXTargetInfo_553648645): void {.cdecl,
      importc: "clang_TargetInfo_dispose".}
else:
  static :
    hint("Declaration of " & "TargetInfo_dispose" &
        " already exists, not redeclaring")
when not declared(TargetInfo_getTriple):
  proc TargetInfo_getTriple*(Info: CXTargetInfo_553648645): CXString_553648593 {.
      cdecl, importc: "clang_TargetInfo_getTriple".}
else:
  static :
    hint("Declaration of " & "TargetInfo_getTriple" &
        " already exists, not redeclaring")
when not declared(TargetInfo_getPointerWidth):
  proc TargetInfo_getPointerWidth*(Info: CXTargetInfo_553648645): cint {.cdecl,
      importc: "clang_TargetInfo_getPointerWidth".}
else:
  static :
    hint("Declaration of " & "TargetInfo_getPointerWidth" &
        " already exists, not redeclaring")
when not declared(getNullCursor):
  proc getNullCursor*(): CXCursor_553648702 {.cdecl,
      importc: "clang_getNullCursor".}
else:
  static :
    hint("Declaration of " & "getNullCursor" &
        " already exists, not redeclaring")
when not declared(getTranslationUnitCursor):
  proc getTranslationUnitCursor*(a0: CXTranslationUnit_553648647): CXCursor_553648702 {.
      cdecl, importc: "clang_getTranslationUnitCursor".}
else:
  static :
    hint("Declaration of " & "getTranslationUnitCursor" &
        " already exists, not redeclaring")
when not declared(equalCursors):
  proc equalCursors*(a0: CXCursor_553648702; a1: CXCursor_553648702): cuint {.
      cdecl, importc: "clang_equalCursors".}
else:
  static :
    hint("Declaration of " & "equalCursors" & " already exists, not redeclaring")
when not declared(Cursor_isNull):
  proc Cursor_isNull*(cursor: CXCursor_553648702): cint {.cdecl,
      importc: "clang_Cursor_isNull".}
else:
  static :
    hint("Declaration of " & "Cursor_isNull" &
        " already exists, not redeclaring")
when not declared(hashCursor):
  proc hashCursor*(a0: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_hashCursor".}
else:
  static :
    hint("Declaration of " & "hashCursor" & " already exists, not redeclaring")
when not declared(getCursorKind):
  proc getCursorKind*(a0: CXCursor_553648702): enum_CXCursorKind_553648698 {.
      cdecl, importc: "clang_getCursorKind".}
else:
  static :
    hint("Declaration of " & "getCursorKind" &
        " already exists, not redeclaring")
when not declared(isDeclaration):
  proc isDeclaration*(a0: enum_CXCursorKind_553648698): cuint {.cdecl,
      importc: "clang_isDeclaration".}
else:
  static :
    hint("Declaration of " & "isDeclaration" &
        " already exists, not redeclaring")
when not declared(isInvalidDeclaration):
  proc isInvalidDeclaration*(a0: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_isInvalidDeclaration".}
else:
  static :
    hint("Declaration of " & "isInvalidDeclaration" &
        " already exists, not redeclaring")
when not declared(isReference):
  proc isReference*(a0: enum_CXCursorKind_553648698): cuint {.cdecl,
      importc: "clang_isReference".}
else:
  static :
    hint("Declaration of " & "isReference" & " already exists, not redeclaring")
when not declared(isExpression):
  proc isExpression*(a0: enum_CXCursorKind_553648698): cuint {.cdecl,
      importc: "clang_isExpression".}
else:
  static :
    hint("Declaration of " & "isExpression" & " already exists, not redeclaring")
when not declared(isStatement):
  proc isStatement*(a0: enum_CXCursorKind_553648698): cuint {.cdecl,
      importc: "clang_isStatement".}
else:
  static :
    hint("Declaration of " & "isStatement" & " already exists, not redeclaring")
when not declared(isAttribute):
  proc isAttribute*(a0: enum_CXCursorKind_553648698): cuint {.cdecl,
      importc: "clang_isAttribute".}
else:
  static :
    hint("Declaration of " & "isAttribute" & " already exists, not redeclaring")
when not declared(Cursor_hasAttrs):
  proc Cursor_hasAttrs*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_hasAttrs".}
else:
  static :
    hint("Declaration of " & "Cursor_hasAttrs" &
        " already exists, not redeclaring")
when not declared(isInvalid):
  proc isInvalid*(a0: enum_CXCursorKind_553648698): cuint {.cdecl,
      importc: "clang_isInvalid".}
else:
  static :
    hint("Declaration of " & "isInvalid" & " already exists, not redeclaring")
when not declared(isTranslationUnit):
  proc isTranslationUnit*(a0: enum_CXCursorKind_553648698): cuint {.cdecl,
      importc: "clang_isTranslationUnit".}
else:
  static :
    hint("Declaration of " & "isTranslationUnit" &
        " already exists, not redeclaring")
when not declared(isPreprocessing):
  proc isPreprocessing*(a0: enum_CXCursorKind_553648698): cuint {.cdecl,
      importc: "clang_isPreprocessing".}
else:
  static :
    hint("Declaration of " & "isPreprocessing" &
        " already exists, not redeclaring")
when not declared(isUnexposed):
  proc isUnexposed*(a0: enum_CXCursorKind_553648698): cuint {.cdecl,
      importc: "clang_isUnexposed".}
else:
  static :
    hint("Declaration of " & "isUnexposed" & " already exists, not redeclaring")
when not declared(getCursorLinkage):
  proc getCursorLinkage*(cursor: CXCursor_553648702): enum_CXLinkageKind_553648704 {.
      cdecl, importc: "clang_getCursorLinkage".}
else:
  static :
    hint("Declaration of " & "getCursorLinkage" &
        " already exists, not redeclaring")
when not declared(getCursorVisibility):
  proc getCursorVisibility*(cursor: CXCursor_553648702): enum_CXVisibilityKind_553648706 {.
      cdecl, importc: "clang_getCursorVisibility".}
else:
  static :
    hint("Declaration of " & "getCursorVisibility" &
        " already exists, not redeclaring")
when not declared(getCursorAvailability):
  proc getCursorAvailability*(cursor: CXCursor_553648702): enum_CXAvailabilityKind_553648653 {.
      cdecl, importc: "clang_getCursorAvailability".}
else:
  static :
    hint("Declaration of " & "getCursorAvailability" &
        " already exists, not redeclaring")
when not declared(getCursorPlatformAvailability):
  proc getCursorPlatformAvailability*(cursor: CXCursor_553648702;
                                      always_deprecated: ptr cint;
                                      deprecated_message: ptr CXString_553648593;
                                      always_unavailable: ptr cint;
                                      unavailable_message: ptr CXString_553648593;
                                      availability: ptr CXPlatformAvailability_553648710;
                                      availability_size: cint): cint {.cdecl,
      importc: "clang_getCursorPlatformAvailability".}
else:
  static :
    hint("Declaration of " & "getCursorPlatformAvailability" &
        " already exists, not redeclaring")
when not declared(disposeCXPlatformAvailability):
  proc disposeCXPlatformAvailability*(availability: ptr CXPlatformAvailability_553648710): void {.
      cdecl, importc: "clang_disposeCXPlatformAvailability".}
else:
  static :
    hint("Declaration of " & "disposeCXPlatformAvailability" &
        " already exists, not redeclaring")
when not declared(Cursor_getVarDeclInitializer):
  proc Cursor_getVarDeclInitializer*(cursor: CXCursor_553648702): CXCursor_553648702 {.
      cdecl, importc: "clang_Cursor_getVarDeclInitializer".}
else:
  static :
    hint("Declaration of " & "Cursor_getVarDeclInitializer" &
        " already exists, not redeclaring")
when not declared(Cursor_hasVarDeclGlobalStorage):
  proc Cursor_hasVarDeclGlobalStorage*(cursor: CXCursor_553648702): cint {.
      cdecl, importc: "clang_Cursor_hasVarDeclGlobalStorage".}
else:
  static :
    hint("Declaration of " & "Cursor_hasVarDeclGlobalStorage" &
        " already exists, not redeclaring")
when not declared(Cursor_hasVarDeclExternalStorage):
  proc Cursor_hasVarDeclExternalStorage*(cursor: CXCursor_553648702): cint {.
      cdecl, importc: "clang_Cursor_hasVarDeclExternalStorage".}
else:
  static :
    hint("Declaration of " & "Cursor_hasVarDeclExternalStorage" &
        " already exists, not redeclaring")
when not declared(getCursorLanguage):
  proc getCursorLanguage*(cursor: CXCursor_553648702): enum_CXLanguageKind_553648712 {.
      cdecl, importc: "clang_getCursorLanguage".}
else:
  static :
    hint("Declaration of " & "getCursorLanguage" &
        " already exists, not redeclaring")
when not declared(getCursorTLSKind):
  proc getCursorTLSKind*(cursor: CXCursor_553648702): enum_CXTLSKind_553648714 {.
      cdecl, importc: "clang_getCursorTLSKind".}
else:
  static :
    hint("Declaration of " & "getCursorTLSKind" &
        " already exists, not redeclaring")
when not declared(Cursor_getTranslationUnit):
  proc Cursor_getTranslationUnit*(a0: CXCursor_553648702): CXTranslationUnit_553648647 {.
      cdecl, importc: "clang_Cursor_getTranslationUnit".}
else:
  static :
    hint("Declaration of " & "Cursor_getTranslationUnit" &
        " already exists, not redeclaring")
when not declared(createCXCursorSet):
  proc createCXCursorSet*(): CXCursorSet_553648716 {.cdecl,
      importc: "clang_createCXCursorSet".}
else:
  static :
    hint("Declaration of " & "createCXCursorSet" &
        " already exists, not redeclaring")
when not declared(disposeCXCursorSet):
  proc disposeCXCursorSet*(cset: CXCursorSet_553648716): void {.cdecl,
      importc: "clang_disposeCXCursorSet".}
else:
  static :
    hint("Declaration of " & "disposeCXCursorSet" &
        " already exists, not redeclaring")
when not declared(CXCursorSet_contains):
  proc CXCursorSet_contains*(cset: CXCursorSet_553648716; cursor: CXCursor_553648702): cuint {.
      cdecl, importc: "clang_CXCursorSet_contains".}
else:
  static :
    hint("Declaration of " & "CXCursorSet_contains" &
        " already exists, not redeclaring")
when not declared(CXCursorSet_insert):
  proc CXCursorSet_insert*(cset: CXCursorSet_553648716; cursor: CXCursor_553648702): cuint {.
      cdecl, importc: "clang_CXCursorSet_insert".}
else:
  static :
    hint("Declaration of " & "CXCursorSet_insert" &
        " already exists, not redeclaring")
when not declared(getCursorSemanticParent):
  proc getCursorSemanticParent*(cursor: CXCursor_553648702): CXCursor_553648702 {.
      cdecl, importc: "clang_getCursorSemanticParent".}
else:
  static :
    hint("Declaration of " & "getCursorSemanticParent" &
        " already exists, not redeclaring")
when not declared(getCursorLexicalParent):
  proc getCursorLexicalParent*(cursor: CXCursor_553648702): CXCursor_553648702 {.
      cdecl, importc: "clang_getCursorLexicalParent".}
else:
  static :
    hint("Declaration of " & "getCursorLexicalParent" &
        " already exists, not redeclaring")
when not declared(getOverriddenCursors):
  proc getOverriddenCursors*(cursor: CXCursor_553648702;
                             overridden: ptr ptr CXCursor_553648702;
                             num_overridden: ptr cuint): void {.cdecl,
      importc: "clang_getOverriddenCursors".}
else:
  static :
    hint("Declaration of " & "getOverriddenCursors" &
        " already exists, not redeclaring")
when not declared(disposeOverriddenCursors):
  proc disposeOverriddenCursors*(overridden: ptr CXCursor_553648702): void {.
      cdecl, importc: "clang_disposeOverriddenCursors".}
else:
  static :
    hint("Declaration of " & "disposeOverriddenCursors" &
        " already exists, not redeclaring")
when not declared(getIncludedFile):
  proc getIncludedFile*(cursor: CXCursor_553648702): CXFile_553648613 {.cdecl,
      importc: "clang_getIncludedFile".}
else:
  static :
    hint("Declaration of " & "getIncludedFile" &
        " already exists, not redeclaring")
when not declared(getCursor):
  proc getCursor*(a0: CXTranslationUnit_553648647; a1: CXSourceLocation_553648623): CXCursor_553648702 {.
      cdecl, importc: "clang_getCursor".}
else:
  static :
    hint("Declaration of " & "getCursor" & " already exists, not redeclaring")
when not declared(getCursorLocation):
  proc getCursorLocation*(a0: CXCursor_553648702): CXSourceLocation_553648623 {.
      cdecl, importc: "clang_getCursorLocation".}
else:
  static :
    hint("Declaration of " & "getCursorLocation" &
        " already exists, not redeclaring")
when not declared(getCursorExtent):
  proc getCursorExtent*(a0: CXCursor_553648702): CXSourceRange_553648627 {.
      cdecl, importc: "clang_getCursorExtent".}
else:
  static :
    hint("Declaration of " & "getCursorExtent" &
        " already exists, not redeclaring")
when not declared(getCursorType):
  proc getCursorType*(C: CXCursor_553648702): CXType_553648724 {.cdecl,
      importc: "clang_getCursorType".}
else:
  static :
    hint("Declaration of " & "getCursorType" &
        " already exists, not redeclaring")
when not declared(getTypeSpelling):
  proc getTypeSpelling*(CT: CXType_553648724): CXString_553648593 {.cdecl,
      importc: "clang_getTypeSpelling".}
else:
  static :
    hint("Declaration of " & "getTypeSpelling" &
        " already exists, not redeclaring")
when not declared(getTypedefDeclUnderlyingType):
  proc getTypedefDeclUnderlyingType*(C: CXCursor_553648702): CXType_553648724 {.
      cdecl, importc: "clang_getTypedefDeclUnderlyingType".}
else:
  static :
    hint("Declaration of " & "getTypedefDeclUnderlyingType" &
        " already exists, not redeclaring")
when not declared(getEnumDeclIntegerType):
  proc getEnumDeclIntegerType*(C: CXCursor_553648702): CXType_553648724 {.cdecl,
      importc: "clang_getEnumDeclIntegerType".}
else:
  static :
    hint("Declaration of " & "getEnumDeclIntegerType" &
        " already exists, not redeclaring")
when not declared(getEnumConstantDeclValue):
  proc getEnumConstantDeclValue*(C: CXCursor_553648702): clonglong {.cdecl,
      importc: "clang_getEnumConstantDeclValue".}
else:
  static :
    hint("Declaration of " & "getEnumConstantDeclValue" &
        " already exists, not redeclaring")
when not declared(getEnumConstantDeclUnsignedValue):
  proc getEnumConstantDeclUnsignedValue*(C: CXCursor_553648702): culonglong {.
      cdecl, importc: "clang_getEnumConstantDeclUnsignedValue".}
else:
  static :
    hint("Declaration of " & "getEnumConstantDeclUnsignedValue" &
        " already exists, not redeclaring")
when not declared(Cursor_isBitField):
  proc Cursor_isBitField*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_isBitField".}
else:
  static :
    hint("Declaration of " & "Cursor_isBitField" &
        " already exists, not redeclaring")
when not declared(getFieldDeclBitWidth):
  proc getFieldDeclBitWidth*(C: CXCursor_553648702): cint {.cdecl,
      importc: "clang_getFieldDeclBitWidth".}
else:
  static :
    hint("Declaration of " & "getFieldDeclBitWidth" &
        " already exists, not redeclaring")
when not declared(Cursor_getNumArguments):
  proc Cursor_getNumArguments*(C: CXCursor_553648702): cint {.cdecl,
      importc: "clang_Cursor_getNumArguments".}
else:
  static :
    hint("Declaration of " & "Cursor_getNumArguments" &
        " already exists, not redeclaring")
when not declared(Cursor_getArgument):
  proc Cursor_getArgument*(C: CXCursor_553648702; i: cuint): CXCursor_553648702 {.
      cdecl, importc: "clang_Cursor_getArgument".}
else:
  static :
    hint("Declaration of " & "Cursor_getArgument" &
        " already exists, not redeclaring")
when not declared(Cursor_getNumTemplateArguments):
  proc Cursor_getNumTemplateArguments*(C: CXCursor_553648702): cint {.cdecl,
      importc: "clang_Cursor_getNumTemplateArguments".}
else:
  static :
    hint("Declaration of " & "Cursor_getNumTemplateArguments" &
        " already exists, not redeclaring")
when not declared(Cursor_getTemplateArgumentKind):
  proc Cursor_getTemplateArgumentKind*(C: CXCursor_553648702; I: cuint): enum_CXTemplateArgumentKind_553648726 {.
      cdecl, importc: "clang_Cursor_getTemplateArgumentKind".}
else:
  static :
    hint("Declaration of " & "Cursor_getTemplateArgumentKind" &
        " already exists, not redeclaring")
when not declared(Cursor_getTemplateArgumentType):
  proc Cursor_getTemplateArgumentType*(C: CXCursor_553648702; I: cuint): CXType_553648724 {.
      cdecl, importc: "clang_Cursor_getTemplateArgumentType".}
else:
  static :
    hint("Declaration of " & "Cursor_getTemplateArgumentType" &
        " already exists, not redeclaring")
when not declared(Cursor_getTemplateArgumentValue):
  proc Cursor_getTemplateArgumentValue*(C: CXCursor_553648702; I: cuint): clonglong {.
      cdecl, importc: "clang_Cursor_getTemplateArgumentValue".}
else:
  static :
    hint("Declaration of " & "Cursor_getTemplateArgumentValue" &
        " already exists, not redeclaring")
when not declared(Cursor_getTemplateArgumentUnsignedValue):
  proc Cursor_getTemplateArgumentUnsignedValue*(C: CXCursor_553648702; I: cuint): culonglong {.
      cdecl, importc: "clang_Cursor_getTemplateArgumentUnsignedValue".}
else:
  static :
    hint("Declaration of " & "Cursor_getTemplateArgumentUnsignedValue" &
        " already exists, not redeclaring")
when not declared(equalTypes):
  proc equalTypes*(A: CXType_553648724; B: CXType_553648724): cuint {.cdecl,
      importc: "clang_equalTypes".}
else:
  static :
    hint("Declaration of " & "equalTypes" & " already exists, not redeclaring")
when not declared(getCanonicalType):
  proc getCanonicalType*(T: CXType_553648724): CXType_553648724 {.cdecl,
      importc: "clang_getCanonicalType".}
else:
  static :
    hint("Declaration of " & "getCanonicalType" &
        " already exists, not redeclaring")
when not declared(isConstQualifiedType):
  proc isConstQualifiedType*(T: CXType_553648724): cuint {.cdecl,
      importc: "clang_isConstQualifiedType".}
else:
  static :
    hint("Declaration of " & "isConstQualifiedType" &
        " already exists, not redeclaring")
when not declared(Cursor_isMacroFunctionLike):
  proc Cursor_isMacroFunctionLike*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_isMacroFunctionLike".}
else:
  static :
    hint("Declaration of " & "Cursor_isMacroFunctionLike" &
        " already exists, not redeclaring")
when not declared(Cursor_isMacroBuiltin):
  proc Cursor_isMacroBuiltin*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_isMacroBuiltin".}
else:
  static :
    hint("Declaration of " & "Cursor_isMacroBuiltin" &
        " already exists, not redeclaring")
when not declared(Cursor_isFunctionInlined):
  proc Cursor_isFunctionInlined*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_isFunctionInlined".}
else:
  static :
    hint("Declaration of " & "Cursor_isFunctionInlined" &
        " already exists, not redeclaring")
when not declared(isVolatileQualifiedType):
  proc isVolatileQualifiedType*(T: CXType_553648724): cuint {.cdecl,
      importc: "clang_isVolatileQualifiedType".}
else:
  static :
    hint("Declaration of " & "isVolatileQualifiedType" &
        " already exists, not redeclaring")
when not declared(isRestrictQualifiedType):
  proc isRestrictQualifiedType*(T: CXType_553648724): cuint {.cdecl,
      importc: "clang_isRestrictQualifiedType".}
else:
  static :
    hint("Declaration of " & "isRestrictQualifiedType" &
        " already exists, not redeclaring")
when not declared(getAddressSpace):
  proc getAddressSpace*(T: CXType_553648724): cuint {.cdecl,
      importc: "clang_getAddressSpace".}
else:
  static :
    hint("Declaration of " & "getAddressSpace" &
        " already exists, not redeclaring")
when not declared(getTypedefName):
  proc getTypedefName*(CT: CXType_553648724): CXString_553648593 {.cdecl,
      importc: "clang_getTypedefName".}
else:
  static :
    hint("Declaration of " & "getTypedefName" &
        " already exists, not redeclaring")
when not declared(getPointeeType):
  proc getPointeeType*(T: CXType_553648724): CXType_553648724 {.cdecl,
      importc: "clang_getPointeeType".}
else:
  static :
    hint("Declaration of " & "getPointeeType" &
        " already exists, not redeclaring")
when not declared(getUnqualifiedType):
  proc getUnqualifiedType*(CT: CXType_553648724): CXType_553648724 {.cdecl,
      importc: "clang_getUnqualifiedType".}
else:
  static :
    hint("Declaration of " & "getUnqualifiedType" &
        " already exists, not redeclaring")
when not declared(getNonReferenceType):
  proc getNonReferenceType*(CT: CXType_553648724): CXType_553648724 {.cdecl,
      importc: "clang_getNonReferenceType".}
else:
  static :
    hint("Declaration of " & "getNonReferenceType" &
        " already exists, not redeclaring")
when not declared(getTypeDeclaration):
  proc getTypeDeclaration*(T: CXType_553648724): CXCursor_553648702 {.cdecl,
      importc: "clang_getTypeDeclaration".}
else:
  static :
    hint("Declaration of " & "getTypeDeclaration" &
        " already exists, not redeclaring")
when not declared(getDeclObjCTypeEncoding):
  proc getDeclObjCTypeEncoding*(C: CXCursor_553648702): CXString_553648593 {.
      cdecl, importc: "clang_getDeclObjCTypeEncoding".}
else:
  static :
    hint("Declaration of " & "getDeclObjCTypeEncoding" &
        " already exists, not redeclaring")
when not declared(Type_getObjCEncoding):
  proc Type_getObjCEncoding*(type_arg: CXType_553648724): CXString_553648593 {.
      cdecl, importc: "clang_Type_getObjCEncoding".}
else:
  static :
    hint("Declaration of " & "Type_getObjCEncoding" &
        " already exists, not redeclaring")
when not declared(getTypeKindSpelling):
  proc getTypeKindSpelling*(K: enum_CXTypeKind_553648718): CXString_553648593 {.
      cdecl, importc: "clang_getTypeKindSpelling".}
else:
  static :
    hint("Declaration of " & "getTypeKindSpelling" &
        " already exists, not redeclaring")
when not declared(getFunctionTypeCallingConv):
  proc getFunctionTypeCallingConv*(T: CXType_553648724): enum_CXCallingConv_553648720 {.
      cdecl, importc: "clang_getFunctionTypeCallingConv".}
else:
  static :
    hint("Declaration of " & "getFunctionTypeCallingConv" &
        " already exists, not redeclaring")
when not declared(getResultType):
  proc getResultType*(T: CXType_553648724): CXType_553648724 {.cdecl,
      importc: "clang_getResultType".}
else:
  static :
    hint("Declaration of " & "getResultType" &
        " already exists, not redeclaring")
when not declared(getExceptionSpecificationType):
  proc getExceptionSpecificationType*(T: CXType_553648724): cint {.cdecl,
      importc: "clang_getExceptionSpecificationType".}
else:
  static :
    hint("Declaration of " & "getExceptionSpecificationType" &
        " already exists, not redeclaring")
when not declared(getNumArgTypes):
  proc getNumArgTypes*(T: CXType_553648724): cint {.cdecl,
      importc: "clang_getNumArgTypes".}
else:
  static :
    hint("Declaration of " & "getNumArgTypes" &
        " already exists, not redeclaring")
when not declared(getArgType):
  proc getArgType*(T: CXType_553648724; i: cuint): CXType_553648724 {.cdecl,
      importc: "clang_getArgType".}
else:
  static :
    hint("Declaration of " & "getArgType" & " already exists, not redeclaring")
when not declared(Type_getObjCObjectBaseType):
  proc Type_getObjCObjectBaseType*(T: CXType_553648724): CXType_553648724 {.
      cdecl, importc: "clang_Type_getObjCObjectBaseType".}
else:
  static :
    hint("Declaration of " & "Type_getObjCObjectBaseType" &
        " already exists, not redeclaring")
when not declared(Type_getNumObjCProtocolRefs):
  proc Type_getNumObjCProtocolRefs*(T: CXType_553648724): cuint {.cdecl,
      importc: "clang_Type_getNumObjCProtocolRefs".}
else:
  static :
    hint("Declaration of " & "Type_getNumObjCProtocolRefs" &
        " already exists, not redeclaring")
when not declared(Type_getObjCProtocolDecl):
  proc Type_getObjCProtocolDecl*(T: CXType_553648724; i: cuint): CXCursor_553648702 {.
      cdecl, importc: "clang_Type_getObjCProtocolDecl".}
else:
  static :
    hint("Declaration of " & "Type_getObjCProtocolDecl" &
        " already exists, not redeclaring")
when not declared(Type_getNumObjCTypeArgs):
  proc Type_getNumObjCTypeArgs*(T: CXType_553648724): cuint {.cdecl,
      importc: "clang_Type_getNumObjCTypeArgs".}
else:
  static :
    hint("Declaration of " & "Type_getNumObjCTypeArgs" &
        " already exists, not redeclaring")
when not declared(Type_getObjCTypeArg):
  proc Type_getObjCTypeArg*(T: CXType_553648724; i: cuint): CXType_553648724 {.
      cdecl, importc: "clang_Type_getObjCTypeArg".}
else:
  static :
    hint("Declaration of " & "Type_getObjCTypeArg" &
        " already exists, not redeclaring")
when not declared(isFunctionTypeVariadic):
  proc isFunctionTypeVariadic*(T: CXType_553648724): cuint {.cdecl,
      importc: "clang_isFunctionTypeVariadic".}
else:
  static :
    hint("Declaration of " & "isFunctionTypeVariadic" &
        " already exists, not redeclaring")
when not declared(getCursorResultType):
  proc getCursorResultType*(C: CXCursor_553648702): CXType_553648724 {.cdecl,
      importc: "clang_getCursorResultType".}
else:
  static :
    hint("Declaration of " & "getCursorResultType" &
        " already exists, not redeclaring")
when not declared(getCursorExceptionSpecificationType):
  proc getCursorExceptionSpecificationType*(C: CXCursor_553648702): cint {.
      cdecl, importc: "clang_getCursorExceptionSpecificationType".}
else:
  static :
    hint("Declaration of " & "getCursorExceptionSpecificationType" &
        " already exists, not redeclaring")
when not declared(isPODType):
  proc isPODType*(T: CXType_553648724): cuint {.cdecl,
      importc: "clang_isPODType".}
else:
  static :
    hint("Declaration of " & "isPODType" & " already exists, not redeclaring")
when not declared(getElementType):
  proc getElementType*(T: CXType_553648724): CXType_553648724 {.cdecl,
      importc: "clang_getElementType".}
else:
  static :
    hint("Declaration of " & "getElementType" &
        " already exists, not redeclaring")
when not declared(getNumElements):
  proc getNumElements*(T: CXType_553648724): clonglong {.cdecl,
      importc: "clang_getNumElements".}
else:
  static :
    hint("Declaration of " & "getNumElements" &
        " already exists, not redeclaring")
when not declared(getArrayElementType):
  proc getArrayElementType*(T: CXType_553648724): CXType_553648724 {.cdecl,
      importc: "clang_getArrayElementType".}
else:
  static :
    hint("Declaration of " & "getArrayElementType" &
        " already exists, not redeclaring")
when not declared(getArraySize):
  proc getArraySize*(T: CXType_553648724): clonglong {.cdecl,
      importc: "clang_getArraySize".}
else:
  static :
    hint("Declaration of " & "getArraySize" & " already exists, not redeclaring")
when not declared(Type_getNamedType):
  proc Type_getNamedType*(T: CXType_553648724): CXType_553648724 {.cdecl,
      importc: "clang_Type_getNamedType".}
else:
  static :
    hint("Declaration of " & "Type_getNamedType" &
        " already exists, not redeclaring")
when not declared(Type_isTransparentTagTypedef):
  proc Type_isTransparentTagTypedef*(T: CXType_553648724): cuint {.cdecl,
      importc: "clang_Type_isTransparentTagTypedef".}
else:
  static :
    hint("Declaration of " & "Type_isTransparentTagTypedef" &
        " already exists, not redeclaring")
when not declared(Type_getNullability):
  proc Type_getNullability*(T: CXType_553648724): enum_CXTypeNullabilityKind_553648728 {.
      cdecl, importc: "clang_Type_getNullability".}
else:
  static :
    hint("Declaration of " & "Type_getNullability" &
        " already exists, not redeclaring")
when not declared(Type_getAlignOf):
  proc Type_getAlignOf*(T: CXType_553648724): clonglong {.cdecl,
      importc: "clang_Type_getAlignOf".}
else:
  static :
    hint("Declaration of " & "Type_getAlignOf" &
        " already exists, not redeclaring")
when not declared(Type_getClassType):
  proc Type_getClassType*(T: CXType_553648724): CXType_553648724 {.cdecl,
      importc: "clang_Type_getClassType".}
else:
  static :
    hint("Declaration of " & "Type_getClassType" &
        " already exists, not redeclaring")
when not declared(Type_getSizeOf):
  proc Type_getSizeOf*(T: CXType_553648724): clonglong {.cdecl,
      importc: "clang_Type_getSizeOf".}
else:
  static :
    hint("Declaration of " & "Type_getSizeOf" &
        " already exists, not redeclaring")
when not declared(Type_getOffsetOf):
  proc Type_getOffsetOf*(T: CXType_553648724; S: cstring): clonglong {.cdecl,
      importc: "clang_Type_getOffsetOf".}
else:
  static :
    hint("Declaration of " & "Type_getOffsetOf" &
        " already exists, not redeclaring")
when not declared(Type_getModifiedType):
  proc Type_getModifiedType*(T: CXType_553648724): CXType_553648724 {.cdecl,
      importc: "clang_Type_getModifiedType".}
else:
  static :
    hint("Declaration of " & "Type_getModifiedType" &
        " already exists, not redeclaring")
when not declared(Type_getValueType):
  proc Type_getValueType*(CT: CXType_553648724): CXType_553648724 {.cdecl,
      importc: "clang_Type_getValueType".}
else:
  static :
    hint("Declaration of " & "Type_getValueType" &
        " already exists, not redeclaring")
when not declared(Cursor_getOffsetOfField):
  proc Cursor_getOffsetOfField*(C: CXCursor_553648702): clonglong {.cdecl,
      importc: "clang_Cursor_getOffsetOfField".}
else:
  static :
    hint("Declaration of " & "Cursor_getOffsetOfField" &
        " already exists, not redeclaring")
when not declared(Cursor_isAnonymous):
  proc Cursor_isAnonymous*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_isAnonymous".}
else:
  static :
    hint("Declaration of " & "Cursor_isAnonymous" &
        " already exists, not redeclaring")
when not declared(Cursor_isAnonymousRecordDecl):
  proc Cursor_isAnonymousRecordDecl*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_isAnonymousRecordDecl".}
else:
  static :
    hint("Declaration of " & "Cursor_isAnonymousRecordDecl" &
        " already exists, not redeclaring")
when not declared(Cursor_isInlineNamespace):
  proc Cursor_isInlineNamespace*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_isInlineNamespace".}
else:
  static :
    hint("Declaration of " & "Cursor_isInlineNamespace" &
        " already exists, not redeclaring")
when not declared(Type_getNumTemplateArguments):
  proc Type_getNumTemplateArguments*(T: CXType_553648724): cint {.cdecl,
      importc: "clang_Type_getNumTemplateArguments".}
else:
  static :
    hint("Declaration of " & "Type_getNumTemplateArguments" &
        " already exists, not redeclaring")
when not declared(Type_getTemplateArgumentAsType):
  proc Type_getTemplateArgumentAsType*(T: CXType_553648724; i: cuint): CXType_553648724 {.
      cdecl, importc: "clang_Type_getTemplateArgumentAsType".}
else:
  static :
    hint("Declaration of " & "Type_getTemplateArgumentAsType" &
        " already exists, not redeclaring")
when not declared(Type_getCXXRefQualifier):
  proc Type_getCXXRefQualifier*(T: CXType_553648724): enum_CXRefQualifierKind_553648732 {.
      cdecl, importc: "clang_Type_getCXXRefQualifier".}
else:
  static :
    hint("Declaration of " & "Type_getCXXRefQualifier" &
        " already exists, not redeclaring")
when not declared(isVirtualBase):
  proc isVirtualBase*(a0: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_isVirtualBase".}
else:
  static :
    hint("Declaration of " & "isVirtualBase" &
        " already exists, not redeclaring")
when not declared(getOffsetOfBase):
  proc getOffsetOfBase*(Parent: CXCursor_553648702; Base: CXCursor_553648702): clonglong {.
      cdecl, importc: "clang_getOffsetOfBase".}
else:
  static :
    hint("Declaration of " & "getOffsetOfBase" &
        " already exists, not redeclaring")
when not declared(getCXXAccessSpecifier):
  proc getCXXAccessSpecifier*(a0: CXCursor_553648702): enum_CX_CXXAccessSpecifier_553648734 {.
      cdecl, importc: "clang_getCXXAccessSpecifier".}
else:
  static :
    hint("Declaration of " & "getCXXAccessSpecifier" &
        " already exists, not redeclaring")
when not declared(Cursor_getBinaryOpcode):
  proc Cursor_getBinaryOpcode*(C: CXCursor_553648702): enum_CX_BinaryOperatorKind_553648738 {.
      cdecl, importc: "clang_Cursor_getBinaryOpcode".}
else:
  static :
    hint("Declaration of " & "Cursor_getBinaryOpcode" &
        " already exists, not redeclaring")
when not declared(Cursor_getBinaryOpcodeStr):
  proc Cursor_getBinaryOpcodeStr*(Op: enum_CX_BinaryOperatorKind_553648738): CXString_553648593 {.
      cdecl, importc: "clang_Cursor_getBinaryOpcodeStr".}
else:
  static :
    hint("Declaration of " & "Cursor_getBinaryOpcodeStr" &
        " already exists, not redeclaring")
when not declared(Cursor_getStorageClass):
  proc Cursor_getStorageClass*(a0: CXCursor_553648702): enum_CX_StorageClass_553648736 {.
      cdecl, importc: "clang_Cursor_getStorageClass".}
else:
  static :
    hint("Declaration of " & "Cursor_getStorageClass" &
        " already exists, not redeclaring")
when not declared(getNumOverloadedDecls):
  proc getNumOverloadedDecls*(cursor: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_getNumOverloadedDecls".}
else:
  static :
    hint("Declaration of " & "getNumOverloadedDecls" &
        " already exists, not redeclaring")
when not declared(getOverloadedDecl):
  proc getOverloadedDecl*(cursor: CXCursor_553648702; index: cuint): CXCursor_553648702 {.
      cdecl, importc: "clang_getOverloadedDecl".}
else:
  static :
    hint("Declaration of " & "getOverloadedDecl" &
        " already exists, not redeclaring")
when not declared(getIBOutletCollectionType):
  proc getIBOutletCollectionType*(a0: CXCursor_553648702): CXType_553648724 {.
      cdecl, importc: "clang_getIBOutletCollectionType".}
else:
  static :
    hint("Declaration of " & "getIBOutletCollectionType" &
        " already exists, not redeclaring")
when not declared(visitChildren):
  proc visitChildren*(parent: CXCursor_553648702; visitor: CXCursorVisitor_553648742;
                      client_data: CXClientData_553648649): cuint {.cdecl,
      importc: "clang_visitChildren".}
else:
  static :
    hint("Declaration of " & "visitChildren" &
        " already exists, not redeclaring")
when not declared(visitChildrenWithBlock):
  proc visitChildrenWithBlock*(parent: CXCursor_553648702;
                               block_arg: CXCursorVisitorBlock_553648744): cuint {.
      cdecl, importc: "clang_visitChildrenWithBlock".}
else:
  static :
    hint("Declaration of " & "visitChildrenWithBlock" &
        " already exists, not redeclaring")
when not declared(getCursorUSR):
  proc getCursorUSR*(a0: CXCursor_553648702): CXString_553648593 {.cdecl,
      importc: "clang_getCursorUSR".}
else:
  static :
    hint("Declaration of " & "getCursorUSR" & " already exists, not redeclaring")
when not declared(constructUSR_ObjCClass):
  proc constructUSR_ObjCClass*(class_name: cstring): CXString_553648593 {.cdecl,
      importc: "clang_constructUSR_ObjCClass".}
else:
  static :
    hint("Declaration of " & "constructUSR_ObjCClass" &
        " already exists, not redeclaring")
when not declared(constructUSR_ObjCCategory):
  proc constructUSR_ObjCCategory*(class_name: cstring; category_name: cstring): CXString_553648593 {.
      cdecl, importc: "clang_constructUSR_ObjCCategory".}
else:
  static :
    hint("Declaration of " & "constructUSR_ObjCCategory" &
        " already exists, not redeclaring")
when not declared(constructUSR_ObjCProtocol):
  proc constructUSR_ObjCProtocol*(protocol_name: cstring): CXString_553648593 {.
      cdecl, importc: "clang_constructUSR_ObjCProtocol".}
else:
  static :
    hint("Declaration of " & "constructUSR_ObjCProtocol" &
        " already exists, not redeclaring")
when not declared(constructUSR_ObjCIvar):
  proc constructUSR_ObjCIvar*(name: cstring; classUSR: CXString_553648593): CXString_553648593 {.
      cdecl, importc: "clang_constructUSR_ObjCIvar".}
else:
  static :
    hint("Declaration of " & "constructUSR_ObjCIvar" &
        " already exists, not redeclaring")
when not declared(constructUSR_ObjCMethod):
  proc constructUSR_ObjCMethod*(name: cstring; isInstanceMethod: cuint;
                                classUSR: CXString_553648593): CXString_553648593 {.
      cdecl, importc: "clang_constructUSR_ObjCMethod".}
else:
  static :
    hint("Declaration of " & "constructUSR_ObjCMethod" &
        " already exists, not redeclaring")
when not declared(constructUSR_ObjCProperty):
  proc constructUSR_ObjCProperty*(property: cstring; classUSR: CXString_553648593): CXString_553648593 {.
      cdecl, importc: "clang_constructUSR_ObjCProperty".}
else:
  static :
    hint("Declaration of " & "constructUSR_ObjCProperty" &
        " already exists, not redeclaring")
when not declared(getCursorSpelling):
  proc getCursorSpelling*(a0: CXCursor_553648702): CXString_553648593 {.cdecl,
      importc: "clang_getCursorSpelling".}
else:
  static :
    hint("Declaration of " & "getCursorSpelling" &
        " already exists, not redeclaring")
when not declared(Cursor_getSpellingNameRange):
  proc Cursor_getSpellingNameRange*(a0: CXCursor_553648702; pieceIndex: cuint;
                                    options: cuint): CXSourceRange_553648627 {.
      cdecl, importc: "clang_Cursor_getSpellingNameRange".}
else:
  static :
    hint("Declaration of " & "Cursor_getSpellingNameRange" &
        " already exists, not redeclaring")
when not declared(PrintingPolicy_getProperty):
  proc PrintingPolicy_getProperty*(Policy: CXPrintingPolicy_553648746;
                                   Property: enum_CXPrintingPolicyProperty_553648748): cuint {.
      cdecl, importc: "clang_PrintingPolicy_getProperty".}
else:
  static :
    hint("Declaration of " & "PrintingPolicy_getProperty" &
        " already exists, not redeclaring")
when not declared(PrintingPolicy_setProperty):
  proc PrintingPolicy_setProperty*(Policy: CXPrintingPolicy_553648746;
                                   Property: enum_CXPrintingPolicyProperty_553648748;
                                   Value: cuint): void {.cdecl,
      importc: "clang_PrintingPolicy_setProperty".}
else:
  static :
    hint("Declaration of " & "PrintingPolicy_setProperty" &
        " already exists, not redeclaring")
when not declared(getCursorPrintingPolicy):
  proc getCursorPrintingPolicy*(a0: CXCursor_553648702): CXPrintingPolicy_553648746 {.
      cdecl, importc: "clang_getCursorPrintingPolicy".}
else:
  static :
    hint("Declaration of " & "getCursorPrintingPolicy" &
        " already exists, not redeclaring")
when not declared(PrintingPolicy_dispose):
  proc PrintingPolicy_dispose*(Policy: CXPrintingPolicy_553648746): void {.
      cdecl, importc: "clang_PrintingPolicy_dispose".}
else:
  static :
    hint("Declaration of " & "PrintingPolicy_dispose" &
        " already exists, not redeclaring")
when not declared(getCursorPrettyPrinted):
  proc getCursorPrettyPrinted*(Cursor: CXCursor_553648702;
                               Policy: CXPrintingPolicy_553648746): CXString_553648593 {.
      cdecl, importc: "clang_getCursorPrettyPrinted".}
else:
  static :
    hint("Declaration of " & "getCursorPrettyPrinted" &
        " already exists, not redeclaring")
when not declared(getTypePrettyPrinted):
  proc getTypePrettyPrinted*(CT: CXType_553648724; cxPolicy: CXPrintingPolicy_553648746): CXString_553648593 {.
      cdecl, importc: "clang_getTypePrettyPrinted".}
else:
  static :
    hint("Declaration of " & "getTypePrettyPrinted" &
        " already exists, not redeclaring")
when not declared(getFullyQualifiedName):
  proc getFullyQualifiedName*(CT: CXType_553648724; Policy: CXPrintingPolicy_553648746;
                              WithGlobalNsPrefix: cuint): CXString_553648593 {.
      cdecl, importc: "clang_getFullyQualifiedName".}
else:
  static :
    hint("Declaration of " & "getFullyQualifiedName" &
        " already exists, not redeclaring")
when not declared(getCursorDisplayName):
  proc getCursorDisplayName*(a0: CXCursor_553648702): CXString_553648593 {.
      cdecl, importc: "clang_getCursorDisplayName".}
else:
  static :
    hint("Declaration of " & "getCursorDisplayName" &
        " already exists, not redeclaring")
when not declared(getCursorReferenced):
  proc getCursorReferenced*(a0: CXCursor_553648702): CXCursor_553648702 {.cdecl,
      importc: "clang_getCursorReferenced".}
else:
  static :
    hint("Declaration of " & "getCursorReferenced" &
        " already exists, not redeclaring")
when not declared(getCursorDefinition):
  proc getCursorDefinition*(a0: CXCursor_553648702): CXCursor_553648702 {.cdecl,
      importc: "clang_getCursorDefinition".}
else:
  static :
    hint("Declaration of " & "getCursorDefinition" &
        " already exists, not redeclaring")
when not declared(isCursorDefinition):
  proc isCursorDefinition*(a0: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_isCursorDefinition".}
else:
  static :
    hint("Declaration of " & "isCursorDefinition" &
        " already exists, not redeclaring")
when not declared(getCanonicalCursor):
  proc getCanonicalCursor*(a0: CXCursor_553648702): CXCursor_553648702 {.cdecl,
      importc: "clang_getCanonicalCursor".}
else:
  static :
    hint("Declaration of " & "getCanonicalCursor" &
        " already exists, not redeclaring")
when not declared(Cursor_getObjCSelectorIndex):
  proc Cursor_getObjCSelectorIndex*(a0: CXCursor_553648702): cint {.cdecl,
      importc: "clang_Cursor_getObjCSelectorIndex".}
else:
  static :
    hint("Declaration of " & "Cursor_getObjCSelectorIndex" &
        " already exists, not redeclaring")
when not declared(Cursor_isDynamicCall):
  proc Cursor_isDynamicCall*(C: CXCursor_553648702): cint {.cdecl,
      importc: "clang_Cursor_isDynamicCall".}
else:
  static :
    hint("Declaration of " & "Cursor_isDynamicCall" &
        " already exists, not redeclaring")
when not declared(Cursor_getReceiverType):
  proc Cursor_getReceiverType*(C: CXCursor_553648702): CXType_553648724 {.cdecl,
      importc: "clang_Cursor_getReceiverType".}
else:
  static :
    hint("Declaration of " & "Cursor_getReceiverType" &
        " already exists, not redeclaring")
when not declared(Cursor_getObjCPropertyAttributes):
  proc Cursor_getObjCPropertyAttributes*(C: CXCursor_553648702; reserved: cuint): cuint {.
      cdecl, importc: "clang_Cursor_getObjCPropertyAttributes".}
else:
  static :
    hint("Declaration of " & "Cursor_getObjCPropertyAttributes" &
        " already exists, not redeclaring")
when not declared(Cursor_getObjCPropertyGetterName):
  proc Cursor_getObjCPropertyGetterName*(C: CXCursor_553648702): CXString_553648593 {.
      cdecl, importc: "clang_Cursor_getObjCPropertyGetterName".}
else:
  static :
    hint("Declaration of " & "Cursor_getObjCPropertyGetterName" &
        " already exists, not redeclaring")
when not declared(Cursor_getObjCPropertySetterName):
  proc Cursor_getObjCPropertySetterName*(C: CXCursor_553648702): CXString_553648593 {.
      cdecl, importc: "clang_Cursor_getObjCPropertySetterName".}
else:
  static :
    hint("Declaration of " & "Cursor_getObjCPropertySetterName" &
        " already exists, not redeclaring")
when not declared(Cursor_getObjCDeclQualifiers):
  proc Cursor_getObjCDeclQualifiers*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_getObjCDeclQualifiers".}
else:
  static :
    hint("Declaration of " & "Cursor_getObjCDeclQualifiers" &
        " already exists, not redeclaring")
when not declared(Cursor_isObjCOptional):
  proc Cursor_isObjCOptional*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_isObjCOptional".}
else:
  static :
    hint("Declaration of " & "Cursor_isObjCOptional" &
        " already exists, not redeclaring")
when not declared(Cursor_isVariadic):
  proc Cursor_isVariadic*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_isVariadic".}
else:
  static :
    hint("Declaration of " & "Cursor_isVariadic" &
        " already exists, not redeclaring")
when not declared(Cursor_isExternalSymbol):
  proc Cursor_isExternalSymbol*(C: CXCursor_553648702; language: ptr CXString_553648593;
                                definedIn: ptr CXString_553648593;
                                isGenerated: ptr cuint): cuint {.cdecl,
      importc: "clang_Cursor_isExternalSymbol".}
else:
  static :
    hint("Declaration of " & "Cursor_isExternalSymbol" &
        " already exists, not redeclaring")
when not declared(Cursor_getCommentRange):
  proc Cursor_getCommentRange*(C: CXCursor_553648702): CXSourceRange_553648627 {.
      cdecl, importc: "clang_Cursor_getCommentRange".}
else:
  static :
    hint("Declaration of " & "Cursor_getCommentRange" &
        " already exists, not redeclaring")
when not declared(Cursor_getRawCommentText):
  proc Cursor_getRawCommentText*(C: CXCursor_553648702): CXString_553648593 {.
      cdecl, importc: "clang_Cursor_getRawCommentText".}
else:
  static :
    hint("Declaration of " & "Cursor_getRawCommentText" &
        " already exists, not redeclaring")
when not declared(Cursor_getBriefCommentText):
  proc Cursor_getBriefCommentText*(C: CXCursor_553648702): CXString_553648593 {.
      cdecl, importc: "clang_Cursor_getBriefCommentText".}
else:
  static :
    hint("Declaration of " & "Cursor_getBriefCommentText" &
        " already exists, not redeclaring")
when not declared(Cursor_getMangling):
  proc Cursor_getMangling*(a0: CXCursor_553648702): CXString_553648593 {.cdecl,
      importc: "clang_Cursor_getMangling".}
else:
  static :
    hint("Declaration of " & "Cursor_getMangling" &
        " already exists, not redeclaring")
when not declared(Cursor_getCXXManglings):
  proc Cursor_getCXXManglings*(a0: CXCursor_553648702): ptr CXStringSet_553648597 {.
      cdecl, importc: "clang_Cursor_getCXXManglings".}
else:
  static :
    hint("Declaration of " & "Cursor_getCXXManglings" &
        " already exists, not redeclaring")
when not declared(Cursor_getObjCManglings):
  proc Cursor_getObjCManglings*(a0: CXCursor_553648702): ptr CXStringSet_553648597 {.
      cdecl, importc: "clang_Cursor_getObjCManglings".}
else:
  static :
    hint("Declaration of " & "Cursor_getObjCManglings" &
        " already exists, not redeclaring")
when not declared(Cursor_getGCCAssemblyTemplate):
  proc Cursor_getGCCAssemblyTemplate*(a0: CXCursor_553648702): CXString_553648593 {.
      cdecl, importc: "clang_Cursor_getGCCAssemblyTemplate".}
else:
  static :
    hint("Declaration of " & "Cursor_getGCCAssemblyTemplate" &
        " already exists, not redeclaring")
when not declared(Cursor_isGCCAssemblyHasGoto):
  proc Cursor_isGCCAssemblyHasGoto*(a0: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_isGCCAssemblyHasGoto".}
else:
  static :
    hint("Declaration of " & "Cursor_isGCCAssemblyHasGoto" &
        " already exists, not redeclaring")
when not declared(Cursor_getGCCAssemblyNumOutputs):
  proc Cursor_getGCCAssemblyNumOutputs*(a0: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_getGCCAssemblyNumOutputs".}
else:
  static :
    hint("Declaration of " & "Cursor_getGCCAssemblyNumOutputs" &
        " already exists, not redeclaring")
when not declared(Cursor_getGCCAssemblyNumInputs):
  proc Cursor_getGCCAssemblyNumInputs*(a0: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_getGCCAssemblyNumInputs".}
else:
  static :
    hint("Declaration of " & "Cursor_getGCCAssemblyNumInputs" &
        " already exists, not redeclaring")
when not declared(Cursor_getGCCAssemblyInput):
  proc Cursor_getGCCAssemblyInput*(Cursor: CXCursor_553648702; Index: cuint;
                                   Constraint: ptr CXString_553648593;
                                   Expr: ptr CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_getGCCAssemblyInput".}
else:
  static :
    hint("Declaration of " & "Cursor_getGCCAssemblyInput" &
        " already exists, not redeclaring")
when not declared(Cursor_getGCCAssemblyOutput):
  proc Cursor_getGCCAssemblyOutput*(Cursor: CXCursor_553648702; Index: cuint;
                                    Constraint: ptr CXString_553648593;
                                    Expr: ptr CXCursor_553648702): cuint {.
      cdecl, importc: "clang_Cursor_getGCCAssemblyOutput".}
else:
  static :
    hint("Declaration of " & "Cursor_getGCCAssemblyOutput" &
        " already exists, not redeclaring")
when not declared(Cursor_getGCCAssemblyNumClobbers):
  proc Cursor_getGCCAssemblyNumClobbers*(Cursor: CXCursor_553648702): cuint {.
      cdecl, importc: "clang_Cursor_getGCCAssemblyNumClobbers".}
else:
  static :
    hint("Declaration of " & "Cursor_getGCCAssemblyNumClobbers" &
        " already exists, not redeclaring")
when not declared(Cursor_getGCCAssemblyClobber):
  proc Cursor_getGCCAssemblyClobber*(Cursor: CXCursor_553648702; Index: cuint): CXString_553648593 {.
      cdecl, importc: "clang_Cursor_getGCCAssemblyClobber".}
else:
  static :
    hint("Declaration of " & "Cursor_getGCCAssemblyClobber" &
        " already exists, not redeclaring")
when not declared(Cursor_isGCCAssemblyVolatile):
  proc Cursor_isGCCAssemblyVolatile*(Cursor: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_Cursor_isGCCAssemblyVolatile".}
else:
  static :
    hint("Declaration of " & "Cursor_isGCCAssemblyVolatile" &
        " already exists, not redeclaring")
when not declared(Cursor_getModule):
  proc Cursor_getModule*(C: CXCursor_553648702): CXModule_553648758 {.cdecl,
      importc: "clang_Cursor_getModule".}
else:
  static :
    hint("Declaration of " & "Cursor_getModule" &
        " already exists, not redeclaring")
when not declared(getModuleForFile):
  proc getModuleForFile*(a0: CXTranslationUnit_553648647; a1: CXFile_553648613): CXModule_553648758 {.
      cdecl, importc: "clang_getModuleForFile".}
else:
  static :
    hint("Declaration of " & "getModuleForFile" &
        " already exists, not redeclaring")
when not declared(Module_getASTFile):
  proc Module_getASTFile*(Module: CXModule_553648758): CXFile_553648613 {.cdecl,
      importc: "clang_Module_getASTFile".}
else:
  static :
    hint("Declaration of " & "Module_getASTFile" &
        " already exists, not redeclaring")
when not declared(Module_getParent):
  proc Module_getParent*(Module: CXModule_553648758): CXModule_553648758 {.
      cdecl, importc: "clang_Module_getParent".}
else:
  static :
    hint("Declaration of " & "Module_getParent" &
        " already exists, not redeclaring")
when not declared(Module_getName):
  proc Module_getName*(Module: CXModule_553648758): CXString_553648593 {.cdecl,
      importc: "clang_Module_getName".}
else:
  static :
    hint("Declaration of " & "Module_getName" &
        " already exists, not redeclaring")
when not declared(Module_getFullName):
  proc Module_getFullName*(Module: CXModule_553648758): CXString_553648593 {.
      cdecl, importc: "clang_Module_getFullName".}
else:
  static :
    hint("Declaration of " & "Module_getFullName" &
        " already exists, not redeclaring")
when not declared(Module_isSystem):
  proc Module_isSystem*(Module: CXModule_553648758): cint {.cdecl,
      importc: "clang_Module_isSystem".}
else:
  static :
    hint("Declaration of " & "Module_isSystem" &
        " already exists, not redeclaring")
when not declared(Module_getNumTopLevelHeaders):
  proc Module_getNumTopLevelHeaders*(a0: CXTranslationUnit_553648647;
                                     Module: CXModule_553648758): cuint {.cdecl,
      importc: "clang_Module_getNumTopLevelHeaders".}
else:
  static :
    hint("Declaration of " & "Module_getNumTopLevelHeaders" &
        " already exists, not redeclaring")
when not declared(Module_getTopLevelHeader):
  proc Module_getTopLevelHeader*(a0: CXTranslationUnit_553648647;
                                 Module: CXModule_553648758; Index: cuint): CXFile_553648613 {.
      cdecl, importc: "clang_Module_getTopLevelHeader".}
else:
  static :
    hint("Declaration of " & "Module_getTopLevelHeader" &
        " already exists, not redeclaring")
when not declared(CXXConstructor_isConvertingConstructor):
  proc CXXConstructor_isConvertingConstructor*(C: CXCursor_553648702): cuint {.
      cdecl, importc: "clang_CXXConstructor_isConvertingConstructor".}
else:
  static :
    hint("Declaration of " & "CXXConstructor_isConvertingConstructor" &
        " already exists, not redeclaring")
when not declared(CXXConstructor_isCopyConstructor):
  proc CXXConstructor_isCopyConstructor*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_CXXConstructor_isCopyConstructor".}
else:
  static :
    hint("Declaration of " & "CXXConstructor_isCopyConstructor" &
        " already exists, not redeclaring")
when not declared(CXXConstructor_isDefaultConstructor):
  proc CXXConstructor_isDefaultConstructor*(C: CXCursor_553648702): cuint {.
      cdecl, importc: "clang_CXXConstructor_isDefaultConstructor".}
else:
  static :
    hint("Declaration of " & "CXXConstructor_isDefaultConstructor" &
        " already exists, not redeclaring")
when not declared(CXXConstructor_isMoveConstructor):
  proc CXXConstructor_isMoveConstructor*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_CXXConstructor_isMoveConstructor".}
else:
  static :
    hint("Declaration of " & "CXXConstructor_isMoveConstructor" &
        " already exists, not redeclaring")
when not declared(CXXField_isMutable):
  proc CXXField_isMutable*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_CXXField_isMutable".}
else:
  static :
    hint("Declaration of " & "CXXField_isMutable" &
        " already exists, not redeclaring")
when not declared(CXXMethod_isDefaulted):
  proc CXXMethod_isDefaulted*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_CXXMethod_isDefaulted".}
else:
  static :
    hint("Declaration of " & "CXXMethod_isDefaulted" &
        " already exists, not redeclaring")
when not declared(CXXMethod_isDeleted):
  proc CXXMethod_isDeleted*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_CXXMethod_isDeleted".}
else:
  static :
    hint("Declaration of " & "CXXMethod_isDeleted" &
        " already exists, not redeclaring")
when not declared(CXXMethod_isPureVirtual):
  proc CXXMethod_isPureVirtual*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_CXXMethod_isPureVirtual".}
else:
  static :
    hint("Declaration of " & "CXXMethod_isPureVirtual" &
        " already exists, not redeclaring")
when not declared(CXXMethod_isStatic):
  proc CXXMethod_isStatic*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_CXXMethod_isStatic".}
else:
  static :
    hint("Declaration of " & "CXXMethod_isStatic" &
        " already exists, not redeclaring")
when not declared(CXXMethod_isVirtual):
  proc CXXMethod_isVirtual*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_CXXMethod_isVirtual".}
else:
  static :
    hint("Declaration of " & "CXXMethod_isVirtual" &
        " already exists, not redeclaring")
when not declared(CXXMethod_isCopyAssignmentOperator):
  proc CXXMethod_isCopyAssignmentOperator*(C: CXCursor_553648702): cuint {.
      cdecl, importc: "clang_CXXMethod_isCopyAssignmentOperator".}
else:
  static :
    hint("Declaration of " & "CXXMethod_isCopyAssignmentOperator" &
        " already exists, not redeclaring")
when not declared(CXXMethod_isMoveAssignmentOperator):
  proc CXXMethod_isMoveAssignmentOperator*(C: CXCursor_553648702): cuint {.
      cdecl, importc: "clang_CXXMethod_isMoveAssignmentOperator".}
else:
  static :
    hint("Declaration of " & "CXXMethod_isMoveAssignmentOperator" &
        " already exists, not redeclaring")
when not declared(CXXMethod_isExplicit):
  proc CXXMethod_isExplicit*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_CXXMethod_isExplicit".}
else:
  static :
    hint("Declaration of " & "CXXMethod_isExplicit" &
        " already exists, not redeclaring")
when not declared(CXXRecord_isAbstract):
  proc CXXRecord_isAbstract*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_CXXRecord_isAbstract".}
else:
  static :
    hint("Declaration of " & "CXXRecord_isAbstract" &
        " already exists, not redeclaring")
when not declared(EnumDecl_isScoped):
  proc EnumDecl_isScoped*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_EnumDecl_isScoped".}
else:
  static :
    hint("Declaration of " & "EnumDecl_isScoped" &
        " already exists, not redeclaring")
when not declared(CXXMethod_isConst):
  proc CXXMethod_isConst*(C: CXCursor_553648702): cuint {.cdecl,
      importc: "clang_CXXMethod_isConst".}
else:
  static :
    hint("Declaration of " & "CXXMethod_isConst" &
        " already exists, not redeclaring")
when not declared(getTemplateCursorKind):
  proc getTemplateCursorKind*(C: CXCursor_553648702): enum_CXCursorKind_553648698 {.
      cdecl, importc: "clang_getTemplateCursorKind".}
else:
  static :
    hint("Declaration of " & "getTemplateCursorKind" &
        " already exists, not redeclaring")
when not declared(getSpecializedCursorTemplate):
  proc getSpecializedCursorTemplate*(C: CXCursor_553648702): CXCursor_553648702 {.
      cdecl, importc: "clang_getSpecializedCursorTemplate".}
else:
  static :
    hint("Declaration of " & "getSpecializedCursorTemplate" &
        " already exists, not redeclaring")
when not declared(getCursorReferenceNameRange):
  proc getCursorReferenceNameRange*(C: CXCursor_553648702; NameFlags: cuint;
                                    PieceIndex: cuint): CXSourceRange_553648627 {.
      cdecl, importc: "clang_getCursorReferenceNameRange".}
else:
  static :
    hint("Declaration of " & "getCursorReferenceNameRange" &
        " already exists, not redeclaring")
when not declared(getToken):
  proc getToken*(TU: CXTranslationUnit_553648647; Location: CXSourceLocation_553648623): ptr CXToken_553648768 {.
      cdecl, importc: "clang_getToken".}
else:
  static :
    hint("Declaration of " & "getToken" & " already exists, not redeclaring")
when not declared(getTokenKind):
  proc getTokenKind*(a0: CXToken_553648768): CXTokenKind_553648764 {.cdecl,
      importc: "clang_getTokenKind".}
else:
  static :
    hint("Declaration of " & "getTokenKind" & " already exists, not redeclaring")
when not declared(getTokenSpelling):
  proc getTokenSpelling*(a0: CXTranslationUnit_553648647; a1: CXToken_553648768): CXString_553648593 {.
      cdecl, importc: "clang_getTokenSpelling".}
else:
  static :
    hint("Declaration of " & "getTokenSpelling" &
        " already exists, not redeclaring")
when not declared(getTokenLocation):
  proc getTokenLocation*(a0: CXTranslationUnit_553648647; a1: CXToken_553648768): CXSourceLocation_553648623 {.
      cdecl, importc: "clang_getTokenLocation".}
else:
  static :
    hint("Declaration of " & "getTokenLocation" &
        " already exists, not redeclaring")
when not declared(getTokenExtent):
  proc getTokenExtent*(a0: CXTranslationUnit_553648647; a1: CXToken_553648768): CXSourceRange_553648627 {.
      cdecl, importc: "clang_getTokenExtent".}
else:
  static :
    hint("Declaration of " & "getTokenExtent" &
        " already exists, not redeclaring")
when not declared(tokenize):
  proc tokenize*(TU: CXTranslationUnit_553648647; Range: CXSourceRange_553648627;
                 Tokens: ptr ptr CXToken_553648768; NumTokens: ptr cuint): void {.
      cdecl, importc: "clang_tokenize".}
else:
  static :
    hint("Declaration of " & "tokenize" & " already exists, not redeclaring")
when not declared(annotateTokens):
  proc annotateTokens*(TU: CXTranslationUnit_553648647; Tokens: ptr CXToken_553648768;
                       NumTokens: cuint; Cursors: ptr CXCursor_553648702): void {.
      cdecl, importc: "clang_annotateTokens".}
else:
  static :
    hint("Declaration of " & "annotateTokens" &
        " already exists, not redeclaring")
when not declared(disposeTokens):
  proc disposeTokens*(TU: CXTranslationUnit_553648647; Tokens: ptr CXToken_553648768;
                      NumTokens: cuint): void {.cdecl,
      importc: "clang_disposeTokens".}
else:
  static :
    hint("Declaration of " & "disposeTokens" &
        " already exists, not redeclaring")
when not declared(getCursorKindSpelling):
  proc getCursorKindSpelling*(Kind: enum_CXCursorKind_553648698): CXString_553648593 {.
      cdecl, importc: "clang_getCursorKindSpelling".}
else:
  static :
    hint("Declaration of " & "getCursorKindSpelling" &
        " already exists, not redeclaring")
when not declared(getDefinitionSpellingAndExtent):
  proc getDefinitionSpellingAndExtent*(a0: CXCursor_553648702;
                                       startBuf: ptr cstring;
                                       endBuf: ptr cstring;
                                       startLine: ptr cuint;
                                       startColumn: ptr cuint;
                                       endLine: ptr cuint; endColumn: ptr cuint): void {.
      cdecl, importc: "clang_getDefinitionSpellingAndExtent".}
else:
  static :
    hint("Declaration of " & "getDefinitionSpellingAndExtent" &
        " already exists, not redeclaring")
when not declared(enableStackTraces):
  proc enableStackTraces*(): void {.cdecl, importc: "clang_enableStackTraces".}
else:
  static :
    hint("Declaration of " & "enableStackTraces" &
        " already exists, not redeclaring")
when not declared(executeOnThread):
  proc executeOnThread*(fn: proc (a0: pointer): void {.cdecl.};
                        user_data: pointer; stack_size: cuint): void {.cdecl,
      importc: "clang_executeOnThread".}
else:
  static :
    hint("Declaration of " & "executeOnThread" &
        " already exists, not redeclaring")
when not declared(getCompletionChunkKind):
  proc getCompletionChunkKind*(completion_string: CXCompletionString_553648770;
                               chunk_number: cuint): enum_CXCompletionChunkKind_553648776 {.
      cdecl, importc: "clang_getCompletionChunkKind".}
else:
  static :
    hint("Declaration of " & "getCompletionChunkKind" &
        " already exists, not redeclaring")
when not declared(getCompletionChunkText):
  proc getCompletionChunkText*(completion_string: CXCompletionString_553648770;
                               chunk_number: cuint): CXString_553648593 {.cdecl,
      importc: "clang_getCompletionChunkText".}
else:
  static :
    hint("Declaration of " & "getCompletionChunkText" &
        " already exists, not redeclaring")
when not declared(getCompletionChunkCompletionString):
  proc getCompletionChunkCompletionString*(
      completion_string: CXCompletionString_553648770; chunk_number: cuint): CXCompletionString_553648770 {.
      cdecl, importc: "clang_getCompletionChunkCompletionString".}
else:
  static :
    hint("Declaration of " & "getCompletionChunkCompletionString" &
        " already exists, not redeclaring")
when not declared(getNumCompletionChunks):
  proc getNumCompletionChunks*(completion_string: CXCompletionString_553648770): cuint {.
      cdecl, importc: "clang_getNumCompletionChunks".}
else:
  static :
    hint("Declaration of " & "getNumCompletionChunks" &
        " already exists, not redeclaring")
when not declared(getCompletionPriority):
  proc getCompletionPriority*(completion_string: CXCompletionString_553648770): cuint {.
      cdecl, importc: "clang_getCompletionPriority".}
else:
  static :
    hint("Declaration of " & "getCompletionPriority" &
        " already exists, not redeclaring")
when not declared(getCompletionAvailability):
  proc getCompletionAvailability*(completion_string: CXCompletionString_553648770): enum_CXAvailabilityKind_553648653 {.
      cdecl, importc: "clang_getCompletionAvailability".}
else:
  static :
    hint("Declaration of " & "getCompletionAvailability" &
        " already exists, not redeclaring")
when not declared(getCompletionNumAnnotations):
  proc getCompletionNumAnnotations*(completion_string: CXCompletionString_553648770): cuint {.
      cdecl, importc: "clang_getCompletionNumAnnotations".}
else:
  static :
    hint("Declaration of " & "getCompletionNumAnnotations" &
        " already exists, not redeclaring")
when not declared(getCompletionAnnotation):
  proc getCompletionAnnotation*(completion_string: CXCompletionString_553648770;
                                annotation_number: cuint): CXString_553648593 {.
      cdecl, importc: "clang_getCompletionAnnotation".}
else:
  static :
    hint("Declaration of " & "getCompletionAnnotation" &
        " already exists, not redeclaring")
when not declared(getCompletionParent):
  proc getCompletionParent*(completion_string: CXCompletionString_553648770;
                            kind: ptr enum_CXCursorKind_553648698): CXString_553648593 {.
      cdecl, importc: "clang_getCompletionParent".}
else:
  static :
    hint("Declaration of " & "getCompletionParent" &
        " already exists, not redeclaring")
when not declared(getCompletionBriefComment):
  proc getCompletionBriefComment*(completion_string: CXCompletionString_553648770): CXString_553648593 {.
      cdecl, importc: "clang_getCompletionBriefComment".}
else:
  static :
    hint("Declaration of " & "getCompletionBriefComment" &
        " already exists, not redeclaring")
when not declared(getCursorCompletionString):
  proc getCursorCompletionString*(cursor: CXCursor_553648702): CXCompletionString_553648770 {.
      cdecl, importc: "clang_getCursorCompletionString".}
else:
  static :
    hint("Declaration of " & "getCursorCompletionString" &
        " already exists, not redeclaring")
when not declared(getCompletionNumFixIts):
  proc getCompletionNumFixIts*(results: ptr CXCodeCompleteResults_553648780;
                               completion_index: cuint): cuint {.cdecl,
      importc: "clang_getCompletionNumFixIts".}
else:
  static :
    hint("Declaration of " & "getCompletionNumFixIts" &
        " already exists, not redeclaring")
when not declared(getCompletionFixIt):
  proc getCompletionFixIt*(results: ptr CXCodeCompleteResults_553648780;
                           completion_index: cuint; fixit_index: cuint;
                           replacement_range: ptr CXSourceRange_553648627): CXString_553648593 {.
      cdecl, importc: "clang_getCompletionFixIt".}
else:
  static :
    hint("Declaration of " & "getCompletionFixIt" &
        " already exists, not redeclaring")
when not declared(defaultCodeCompleteOptions):
  proc defaultCodeCompleteOptions*(): cuint {.cdecl,
      importc: "clang_defaultCodeCompleteOptions".}
else:
  static :
    hint("Declaration of " & "defaultCodeCompleteOptions" &
        " already exists, not redeclaring")
when not declared(codeCompleteAt):
  proc codeCompleteAt*(TU: CXTranslationUnit_553648647;
                       complete_filename: cstring; complete_line: cuint;
                       complete_column: cuint;
                       unsaved_files: ptr struct_CXUnsavedFile_553648651;
                       num_unsaved_files: cuint; options: cuint): ptr CXCodeCompleteResults_553648780 {.
      cdecl, importc: "clang_codeCompleteAt".}
else:
  static :
    hint("Declaration of " & "codeCompleteAt" &
        " already exists, not redeclaring")
when not declared(sortCodeCompletionResults):
  proc sortCodeCompletionResults*(Results: ptr CXCompletionResult_553648774;
                                  NumResults: cuint): void {.cdecl,
      importc: "clang_sortCodeCompletionResults".}
else:
  static :
    hint("Declaration of " & "sortCodeCompletionResults" &
        " already exists, not redeclaring")
when not declared(disposeCodeCompleteResults):
  proc disposeCodeCompleteResults*(Results: ptr CXCodeCompleteResults_553648780): void {.
      cdecl, importc: "clang_disposeCodeCompleteResults".}
else:
  static :
    hint("Declaration of " & "disposeCodeCompleteResults" &
        " already exists, not redeclaring")
when not declared(codeCompleteGetNumDiagnostics):
  proc codeCompleteGetNumDiagnostics*(Results: ptr CXCodeCompleteResults_553648780): cuint {.
      cdecl, importc: "clang_codeCompleteGetNumDiagnostics".}
else:
  static :
    hint("Declaration of " & "codeCompleteGetNumDiagnostics" &
        " already exists, not redeclaring")
when not declared(codeCompleteGetDiagnostic):
  proc codeCompleteGetDiagnostic*(Results: ptr CXCodeCompleteResults_553648780;
                                  Index: cuint): CXDiagnostic_553648635 {.cdecl,
      importc: "clang_codeCompleteGetDiagnostic".}
else:
  static :
    hint("Declaration of " & "codeCompleteGetDiagnostic" &
        " already exists, not redeclaring")
when not declared(codeCompleteGetContexts):
  proc codeCompleteGetContexts*(Results: ptr CXCodeCompleteResults_553648780): culonglong {.
      cdecl, importc: "clang_codeCompleteGetContexts".}
else:
  static :
    hint("Declaration of " & "codeCompleteGetContexts" &
        " already exists, not redeclaring")
when not declared(codeCompleteGetContainerKind):
  proc codeCompleteGetContainerKind*(Results: ptr CXCodeCompleteResults_553648780;
                                     IsIncomplete: ptr cuint): enum_CXCursorKind_553648698 {.
      cdecl, importc: "clang_codeCompleteGetContainerKind".}
else:
  static :
    hint("Declaration of " & "codeCompleteGetContainerKind" &
        " already exists, not redeclaring")
when not declared(codeCompleteGetContainerUSR):
  proc codeCompleteGetContainerUSR*(Results: ptr CXCodeCompleteResults_553648780): CXString_553648593 {.
      cdecl, importc: "clang_codeCompleteGetContainerUSR".}
else:
  static :
    hint("Declaration of " & "codeCompleteGetContainerUSR" &
        " already exists, not redeclaring")
when not declared(codeCompleteGetObjCSelector):
  proc codeCompleteGetObjCSelector*(Results: ptr CXCodeCompleteResults_553648780): CXString_553648593 {.
      cdecl, importc: "clang_codeCompleteGetObjCSelector".}
else:
  static :
    hint("Declaration of " & "codeCompleteGetObjCSelector" &
        " already exists, not redeclaring")
when not declared(getClangVersion):
  proc getClangVersion*(): CXString_553648593 {.cdecl,
      importc: "clang_getClangVersion".}
else:
  static :
    hint("Declaration of " & "getClangVersion" &
        " already exists, not redeclaring")
when not declared(toggleCrashRecovery):
  proc toggleCrashRecovery*(isEnabled: cuint): void {.cdecl,
      importc: "clang_toggleCrashRecovery".}
else:
  static :
    hint("Declaration of " & "toggleCrashRecovery" &
        " already exists, not redeclaring")
when not declared(getInclusions):
  proc getInclusions*(tu: CXTranslationUnit_553648647;
                      visitor: CXInclusionVisitor_553648786;
                      client_data: CXClientData_553648649): void {.cdecl,
      importc: "clang_getInclusions".}
else:
  static :
    hint("Declaration of " & "getInclusions" &
        " already exists, not redeclaring")
when not declared(Cursor_Evaluate):
  proc Cursor_Evaluate*(C: CXCursor_553648702): CXEvalResult_553648792 {.cdecl,
      importc: "clang_Cursor_Evaluate".}
else:
  static :
    hint("Declaration of " & "Cursor_Evaluate" &
        " already exists, not redeclaring")
when not declared(EvalResult_getKind):
  proc EvalResult_getKind*(E: CXEvalResult_553648792): CXEvalResultKind_553648790 {.
      cdecl, importc: "clang_EvalResult_getKind".}
else:
  static :
    hint("Declaration of " & "EvalResult_getKind" &
        " already exists, not redeclaring")
when not declared(EvalResult_getAsInt):
  proc EvalResult_getAsInt*(E: CXEvalResult_553648792): cint {.cdecl,
      importc: "clang_EvalResult_getAsInt".}
else:
  static :
    hint("Declaration of " & "EvalResult_getAsInt" &
        " already exists, not redeclaring")
when not declared(EvalResult_getAsLongLong):
  proc EvalResult_getAsLongLong*(E: CXEvalResult_553648792): clonglong {.cdecl,
      importc: "clang_EvalResult_getAsLongLong".}
else:
  static :
    hint("Declaration of " & "EvalResult_getAsLongLong" &
        " already exists, not redeclaring")
when not declared(EvalResult_isUnsignedInt):
  proc EvalResult_isUnsignedInt*(E: CXEvalResult_553648792): cuint {.cdecl,
      importc: "clang_EvalResult_isUnsignedInt".}
else:
  static :
    hint("Declaration of " & "EvalResult_isUnsignedInt" &
        " already exists, not redeclaring")
when not declared(EvalResult_getAsUnsigned):
  proc EvalResult_getAsUnsigned*(E: CXEvalResult_553648792): culonglong {.cdecl,
      importc: "clang_EvalResult_getAsUnsigned".}
else:
  static :
    hint("Declaration of " & "EvalResult_getAsUnsigned" &
        " already exists, not redeclaring")
when not declared(EvalResult_getAsDouble):
  proc EvalResult_getAsDouble*(E: CXEvalResult_553648792): cdouble {.cdecl,
      importc: "clang_EvalResult_getAsDouble".}
else:
  static :
    hint("Declaration of " & "EvalResult_getAsDouble" &
        " already exists, not redeclaring")
when not declared(EvalResult_getAsStr):
  proc EvalResult_getAsStr*(E: CXEvalResult_553648792): cstring {.cdecl,
      importc: "clang_EvalResult_getAsStr".}
else:
  static :
    hint("Declaration of " & "EvalResult_getAsStr" &
        " already exists, not redeclaring")
when not declared(EvalResult_dispose):
  proc EvalResult_dispose*(E: CXEvalResult_553648792): void {.cdecl,
      importc: "clang_EvalResult_dispose".}
else:
  static :
    hint("Declaration of " & "EvalResult_dispose" &
        " already exists, not redeclaring")
when not declared(findReferencesInFile):
  proc findReferencesInFile*(cursor: CXCursor_553648702; file: CXFile_553648613;
                             visitor: CXCursorAndRangeVisitor_553648798): CXResult_553648802 {.
      cdecl, importc: "clang_findReferencesInFile".}
else:
  static :
    hint("Declaration of " & "findReferencesInFile" &
        " already exists, not redeclaring")
when not declared(findIncludesInFile):
  proc findIncludesInFile*(TU: CXTranslationUnit_553648647; file: CXFile_553648613;
                           visitor: CXCursorAndRangeVisitor_553648798): CXResult_553648802 {.
      cdecl, importc: "clang_findIncludesInFile".}
else:
  static :
    hint("Declaration of " & "findIncludesInFile" &
        " already exists, not redeclaring")
when not declared(findReferencesInFileWithBlock):
  proc findReferencesInFileWithBlock*(a0: CXCursor_553648702; a1: CXFile_553648613;
                                      a2: CXCursorAndRangeVisitorBlock_553648804): CXResult_553648802 {.
      cdecl, importc: "clang_findReferencesInFileWithBlock".}
else:
  static :
    hint("Declaration of " & "findReferencesInFileWithBlock" &
        " already exists, not redeclaring")
when not declared(findIncludesInFileWithBlock):
  proc findIncludesInFileWithBlock*(a0: CXTranslationUnit_553648647; a1: CXFile_553648613;
                                    a2: CXCursorAndRangeVisitorBlock_553648804): CXResult_553648802 {.
      cdecl, importc: "clang_findIncludesInFileWithBlock".}
else:
  static :
    hint("Declaration of " & "findIncludesInFileWithBlock" &
        " already exists, not redeclaring")
when not declared(index_isEntityObjCContainerKind):
  proc index_isEntityObjCContainerKind*(a0: CXIdxEntityKind_553648828): cint {.
      cdecl, importc: "clang_index_isEntityObjCContainerKind".}
else:
  static :
    hint("Declaration of " & "index_isEntityObjCContainerKind" &
        " already exists, not redeclaring")
when not declared(index_getObjCContainerDeclInfo):
  proc index_getObjCContainerDeclInfo*(a0: ptr CXIdxDeclInfo_553648864): ptr CXIdxObjCContainerDeclInfo_553648872 {.
      cdecl, importc: "clang_index_getObjCContainerDeclInfo".}
else:
  static :
    hint("Declaration of " & "index_getObjCContainerDeclInfo" &
        " already exists, not redeclaring")
when not declared(index_getObjCInterfaceDeclInfo):
  proc index_getObjCInterfaceDeclInfo*(a0: ptr CXIdxDeclInfo_553648864): ptr CXIdxObjCInterfaceDeclInfo_553648888 {.
      cdecl, importc: "clang_index_getObjCInterfaceDeclInfo".}
else:
  static :
    hint("Declaration of " & "index_getObjCInterfaceDeclInfo" &
        " already exists, not redeclaring")
when not declared(index_getObjCCategoryDeclInfo):
  proc index_getObjCCategoryDeclInfo*(a0: ptr CXIdxDeclInfo_553648864): ptr CXIdxObjCCategoryDeclInfo_553648892 {.
      cdecl, importc: "clang_index_getObjCCategoryDeclInfo".}
else:
  static :
    hint("Declaration of " & "index_getObjCCategoryDeclInfo" &
        " already exists, not redeclaring")
when not declared(index_getObjCProtocolRefListInfo):
  proc index_getObjCProtocolRefListInfo*(a0: ptr CXIdxDeclInfo_553648864): ptr CXIdxObjCProtocolRefListInfo_553648884 {.
      cdecl, importc: "clang_index_getObjCProtocolRefListInfo".}
else:
  static :
    hint("Declaration of " & "index_getObjCProtocolRefListInfo" &
        " already exists, not redeclaring")
when not declared(index_getObjCPropertyDeclInfo):
  proc index_getObjCPropertyDeclInfo*(a0: ptr CXIdxDeclInfo_553648864): ptr CXIdxObjCPropertyDeclInfo_553648896 {.
      cdecl, importc: "clang_index_getObjCPropertyDeclInfo".}
else:
  static :
    hint("Declaration of " & "index_getObjCPropertyDeclInfo" &
        " already exists, not redeclaring")
when not declared(index_getIBOutletCollectionAttrInfo):
  proc index_getIBOutletCollectionAttrInfo*(a0: ptr CXIdxAttrInfo_553648844): ptr CXIdxIBOutletCollectionAttrInfo_553648856 {.
      cdecl, importc: "clang_index_getIBOutletCollectionAttrInfo".}
else:
  static :
    hint("Declaration of " & "index_getIBOutletCollectionAttrInfo" &
        " already exists, not redeclaring")
when not declared(index_getCXXClassDeclInfo):
  proc index_getCXXClassDeclInfo*(a0: ptr CXIdxDeclInfo_553648864): ptr CXIdxCXXClassDeclInfo_553648900 {.
      cdecl, importc: "clang_index_getCXXClassDeclInfo".}
else:
  static :
    hint("Declaration of " & "index_getCXXClassDeclInfo" &
        " already exists, not redeclaring")
when not declared(index_getClientContainer):
  proc index_getClientContainer*(a0: ptr CXIdxContainerInfo_553648852): CXIdxClientContainer_553648810 {.
      cdecl, importc: "clang_index_getClientContainer".}
else:
  static :
    hint("Declaration of " & "index_getClientContainer" &
        " already exists, not redeclaring")
when not declared(index_setClientContainer):
  proc index_setClientContainer*(a0: ptr CXIdxContainerInfo_553648852;
                                 a1: CXIdxClientContainer_553648810): void {.
      cdecl, importc: "clang_index_setClientContainer".}
else:
  static :
    hint("Declaration of " & "index_setClientContainer" &
        " already exists, not redeclaring")
when not declared(index_getClientEntity):
  proc index_getClientEntity*(a0: ptr CXIdxEntityInfo_553648848): CXIdxClientEntity_553648808 {.
      cdecl, importc: "clang_index_getClientEntity".}
else:
  static :
    hint("Declaration of " & "index_getClientEntity" &
        " already exists, not redeclaring")
when not declared(index_setClientEntity):
  proc index_setClientEntity*(a0: ptr CXIdxEntityInfo_553648848;
                              a1: CXIdxClientEntity_553648808): void {.cdecl,
      importc: "clang_index_setClientEntity".}
else:
  static :
    hint("Declaration of " & "index_setClientEntity" &
        " already exists, not redeclaring")
when not declared(IndexAction_create):
  proc IndexAction_create*(CIdx: CXIndex_553648643): CXIndexAction_553648918 {.
      cdecl, importc: "clang_IndexAction_create".}
else:
  static :
    hint("Declaration of " & "IndexAction_create" &
        " already exists, not redeclaring")
when not declared(IndexAction_dispose):
  proc IndexAction_dispose*(a0: CXIndexAction_553648918): void {.cdecl,
      importc: "clang_IndexAction_dispose".}
else:
  static :
    hint("Declaration of " & "IndexAction_dispose" &
        " already exists, not redeclaring")
when not declared(indexSourceFile):
  proc indexSourceFile*(a0: CXIndexAction_553648918; client_data: CXClientData_553648649;
                        index_callbacks: ptr IndexerCallbacks_553648916;
                        index_callbacks_size: cuint; index_options: cuint;
                        source_filename: cstring;
                        command_line_args: ptr cstring;
                        num_command_line_args: cint;
                        unsaved_files: ptr struct_CXUnsavedFile_553648651;
                        num_unsaved_files: cuint; out_TU: ptr CXTranslationUnit_553648647;
                        TU_options: cuint): cint {.cdecl,
      importc: "clang_indexSourceFile".}
else:
  static :
    hint("Declaration of " & "indexSourceFile" &
        " already exists, not redeclaring")
when not declared(indexSourceFileFullArgv):
  proc indexSourceFileFullArgv*(a0: CXIndexAction_553648918;
                                client_data: CXClientData_553648649;
                                index_callbacks: ptr IndexerCallbacks_553648916;
                                index_callbacks_size: cuint;
                                index_options: cuint; source_filename: cstring;
                                command_line_args: ptr cstring;
                                num_command_line_args: cint;
                                unsaved_files: ptr struct_CXUnsavedFile_553648651;
                                num_unsaved_files: cuint;
                                out_TU: ptr CXTranslationUnit_553648647;
                                TU_options: cuint): cint {.cdecl,
      importc: "clang_indexSourceFileFullArgv".}
else:
  static :
    hint("Declaration of " & "indexSourceFileFullArgv" &
        " already exists, not redeclaring")
when not declared(indexTranslationUnit):
  proc indexTranslationUnit*(a0: CXIndexAction_553648918;
                             client_data: CXClientData_553648649;
                             index_callbacks: ptr IndexerCallbacks_553648916;
                             index_callbacks_size: cuint; index_options: cuint;
                             a5: CXTranslationUnit_553648647): cint {.cdecl,
      importc: "clang_indexTranslationUnit".}
else:
  static :
    hint("Declaration of " & "indexTranslationUnit" &
        " already exists, not redeclaring")
when not declared(indexLoc_getFileLocation):
  proc indexLoc_getFileLocation*(loc: CXIdxLoc_553648816;
                                 indexFile: ptr CXIdxClientFile_553648806;
                                 file: ptr CXFile_553648613; line: ptr cuint;
                                 column: ptr cuint; offset: ptr cuint): void {.
      cdecl, importc: "clang_indexLoc_getFileLocation".}
else:
  static :
    hint("Declaration of " & "indexLoc_getFileLocation" &
        " already exists, not redeclaring")
when not declared(indexLoc_getCXSourceLocation):
  proc indexLoc_getCXSourceLocation*(loc: CXIdxLoc_553648816): CXSourceLocation_553648623 {.
      cdecl, importc: "clang_indexLoc_getCXSourceLocation".}
else:
  static :
    hint("Declaration of " & "indexLoc_getCXSourceLocation" &
        " already exists, not redeclaring")
when not declared(Type_visitFields):
  proc Type_visitFields*(T: CXType_553648724; visitor: CXFieldVisitor_553648924;
                         client_data: CXClientData_553648649): cuint {.cdecl,
      importc: "clang_Type_visitFields".}
else:
  static :
    hint("Declaration of " & "Type_visitFields" &
        " already exists, not redeclaring")
when not declared(visitCXXBaseClasses):
  proc visitCXXBaseClasses*(T: CXType_553648724; visitor: CXFieldVisitor_553648924;
                            client_data: CXClientData_553648649): cuint {.cdecl,
      importc: "clang_visitCXXBaseClasses".}
else:
  static :
    hint("Declaration of " & "visitCXXBaseClasses" &
        " already exists, not redeclaring")
when not declared(visitCXXMethods):
  proc visitCXXMethods*(T: CXType_553648724; visitor: CXFieldVisitor_553648924;
                        client_data: CXClientData_553648649): cuint {.cdecl,
      importc: "clang_visitCXXMethods".}
else:
  static :
    hint("Declaration of " & "visitCXXMethods" &
        " already exists, not redeclaring")
when not declared(getBinaryOperatorKindSpelling):
  proc getBinaryOperatorKindSpelling*(kind: enum_CXBinaryOperatorKind_enum_553648926): CXString_553648593 {.
      cdecl, importc: "clang_getBinaryOperatorKindSpelling".}
else:
  static :
    hint("Declaration of " & "getBinaryOperatorKindSpelling" &
        " already exists, not redeclaring")
when not declared(getCursorBinaryOperatorKind):
  proc getCursorBinaryOperatorKind*(cursor: CXCursor_553648702): enum_CXBinaryOperatorKind_enum_553648926 {.
      cdecl, importc: "clang_getCursorBinaryOperatorKind".}
else:
  static :
    hint("Declaration of " & "getCursorBinaryOperatorKind" &
        " already exists, not redeclaring")
when not declared(getUnaryOperatorKindSpelling):
  proc getUnaryOperatorKindSpelling*(kind: enum_CXUnaryOperatorKind_553648928): CXString_553648593 {.
      cdecl, importc: "clang_getUnaryOperatorKindSpelling".}
else:
  static :
    hint("Declaration of " & "getUnaryOperatorKindSpelling" &
        " already exists, not redeclaring")
when not declared(getCursorUnaryOperatorKind):
  proc getCursorUnaryOperatorKind*(cursor: CXCursor_553648702): enum_CXUnaryOperatorKind_553648928 {.
      cdecl, importc: "clang_getCursorUnaryOperatorKind".}
else:
  static :
    hint("Declaration of " & "getCursorUnaryOperatorKind" &
        " already exists, not redeclaring")
when not declared(getRemappings):
  proc getRemappings*(a0: cstring): CXRemapping_553648930 {.cdecl,
      importc: "clang_getRemappings".}
else:
  static :
    hint("Declaration of " & "getRemappings" &
        " already exists, not redeclaring")
when not declared(getRemappingsFromFileList):
  proc getRemappingsFromFileList*(a0: ptr cstring; a1: cuint): CXRemapping_553648930 {.
      cdecl, importc: "clang_getRemappingsFromFileList".}
else:
  static :
    hint("Declaration of " & "getRemappingsFromFileList" &
        " already exists, not redeclaring")
when not declared(remap_getNumFiles):
  proc remap_getNumFiles*(a0: CXRemapping_553648930): cuint {.cdecl,
      importc: "clang_remap_getNumFiles".}
else:
  static :
    hint("Declaration of " & "remap_getNumFiles" &
        " already exists, not redeclaring")
when not declared(remap_getFilenames):
  proc remap_getFilenames*(a0: CXRemapping_553648930; a1: cuint;
                           a2: ptr CXString_553648593; a3: ptr CXString_553648593): void {.
      cdecl, importc: "clang_remap_getFilenames".}
else:
  static :
    hint("Declaration of " & "remap_getFilenames" &
        " already exists, not redeclaring")
when not declared(remap_dispose):
  proc remap_dispose*(a0: CXRemapping_553648930): void {.cdecl,
      importc: "clang_remap_dispose".}
else:
  static :
    hint("Declaration of " & "remap_dispose" &
        " already exists, not redeclaring")
when not declared(Cursor_getParsedComment):
  proc Cursor_getParsedComment*(C: CXCursor_553648702): CXComment_553648934 {.
      cdecl, importc: "clang_Cursor_getParsedComment".}
else:
  static :
    hint("Declaration of " & "Cursor_getParsedComment" &
        " already exists, not redeclaring")
when not declared(Comment_getKind):
  proc Comment_getKind*(Comment: CXComment_553648934): enum_CXCommentKind_553648936 {.
      cdecl, importc: "clang_Comment_getKind".}
else:
  static :
    hint("Declaration of " & "Comment_getKind" &
        " already exists, not redeclaring")
when not declared(Comment_getNumChildren):
  proc Comment_getNumChildren*(Comment: CXComment_553648934): cuint {.cdecl,
      importc: "clang_Comment_getNumChildren".}
else:
  static :
    hint("Declaration of " & "Comment_getNumChildren" &
        " already exists, not redeclaring")
when not declared(Comment_getChild):
  proc Comment_getChild*(Comment: CXComment_553648934; ChildIdx: cuint): CXComment_553648934 {.
      cdecl, importc: "clang_Comment_getChild".}
else:
  static :
    hint("Declaration of " & "Comment_getChild" &
        " already exists, not redeclaring")
when not declared(Comment_isWhitespace):
  proc Comment_isWhitespace*(Comment: CXComment_553648934): cuint {.cdecl,
      importc: "clang_Comment_isWhitespace".}
else:
  static :
    hint("Declaration of " & "Comment_isWhitespace" &
        " already exists, not redeclaring")
when not declared(InlineContentComment_hasTrailingNewline):
  proc InlineContentComment_hasTrailingNewline*(Comment: CXComment_553648934): cuint {.
      cdecl, importc: "clang_InlineContentComment_hasTrailingNewline".}
else:
  static :
    hint("Declaration of " & "InlineContentComment_hasTrailingNewline" &
        " already exists, not redeclaring")
when not declared(TextComment_getText):
  proc TextComment_getText*(Comment: CXComment_553648934): CXString_553648593 {.
      cdecl, importc: "clang_TextComment_getText".}
else:
  static :
    hint("Declaration of " & "TextComment_getText" &
        " already exists, not redeclaring")
when not declared(InlineCommandComment_getCommandName):
  proc InlineCommandComment_getCommandName*(Comment: CXComment_553648934): CXString_553648593 {.
      cdecl, importc: "clang_InlineCommandComment_getCommandName".}
else:
  static :
    hint("Declaration of " & "InlineCommandComment_getCommandName" &
        " already exists, not redeclaring")
when not declared(InlineCommandComment_getRenderKind):
  proc InlineCommandComment_getRenderKind*(Comment: CXComment_553648934): enum_CXCommentInlineCommandRenderKind_553648938 {.
      cdecl, importc: "clang_InlineCommandComment_getRenderKind".}
else:
  static :
    hint("Declaration of " & "InlineCommandComment_getRenderKind" &
        " already exists, not redeclaring")
when not declared(InlineCommandComment_getNumArgs):
  proc InlineCommandComment_getNumArgs*(Comment: CXComment_553648934): cuint {.
      cdecl, importc: "clang_InlineCommandComment_getNumArgs".}
else:
  static :
    hint("Declaration of " & "InlineCommandComment_getNumArgs" &
        " already exists, not redeclaring")
when not declared(InlineCommandComment_getArgText):
  proc InlineCommandComment_getArgText*(Comment: CXComment_553648934;
                                        ArgIdx: cuint): CXString_553648593 {.
      cdecl, importc: "clang_InlineCommandComment_getArgText".}
else:
  static :
    hint("Declaration of " & "InlineCommandComment_getArgText" &
        " already exists, not redeclaring")
when not declared(HTMLTagComment_getTagName):
  proc HTMLTagComment_getTagName*(Comment: CXComment_553648934): CXString_553648593 {.
      cdecl, importc: "clang_HTMLTagComment_getTagName".}
else:
  static :
    hint("Declaration of " & "HTMLTagComment_getTagName" &
        " already exists, not redeclaring")
when not declared(HTMLStartTagComment_isSelfClosing):
  proc HTMLStartTagComment_isSelfClosing*(Comment: CXComment_553648934): cuint {.
      cdecl, importc: "clang_HTMLStartTagComment_isSelfClosing".}
else:
  static :
    hint("Declaration of " & "HTMLStartTagComment_isSelfClosing" &
        " already exists, not redeclaring")
when not declared(HTMLStartTag_getNumAttrs):
  proc HTMLStartTag_getNumAttrs*(Comment: CXComment_553648934): cuint {.cdecl,
      importc: "clang_HTMLStartTag_getNumAttrs".}
else:
  static :
    hint("Declaration of " & "HTMLStartTag_getNumAttrs" &
        " already exists, not redeclaring")
when not declared(HTMLStartTag_getAttrName):
  proc HTMLStartTag_getAttrName*(Comment: CXComment_553648934; AttrIdx: cuint): CXString_553648593 {.
      cdecl, importc: "clang_HTMLStartTag_getAttrName".}
else:
  static :
    hint("Declaration of " & "HTMLStartTag_getAttrName" &
        " already exists, not redeclaring")
when not declared(HTMLStartTag_getAttrValue):
  proc HTMLStartTag_getAttrValue*(Comment: CXComment_553648934; AttrIdx: cuint): CXString_553648593 {.
      cdecl, importc: "clang_HTMLStartTag_getAttrValue".}
else:
  static :
    hint("Declaration of " & "HTMLStartTag_getAttrValue" &
        " already exists, not redeclaring")
when not declared(BlockCommandComment_getCommandName):
  proc BlockCommandComment_getCommandName*(Comment: CXComment_553648934): CXString_553648593 {.
      cdecl, importc: "clang_BlockCommandComment_getCommandName".}
else:
  static :
    hint("Declaration of " & "BlockCommandComment_getCommandName" &
        " already exists, not redeclaring")
when not declared(BlockCommandComment_getNumArgs):
  proc BlockCommandComment_getNumArgs*(Comment: CXComment_553648934): cuint {.
      cdecl, importc: "clang_BlockCommandComment_getNumArgs".}
else:
  static :
    hint("Declaration of " & "BlockCommandComment_getNumArgs" &
        " already exists, not redeclaring")
when not declared(BlockCommandComment_getArgText):
  proc BlockCommandComment_getArgText*(Comment: CXComment_553648934;
                                       ArgIdx: cuint): CXString_553648593 {.
      cdecl, importc: "clang_BlockCommandComment_getArgText".}
else:
  static :
    hint("Declaration of " & "BlockCommandComment_getArgText" &
        " already exists, not redeclaring")
when not declared(BlockCommandComment_getParagraph):
  proc BlockCommandComment_getParagraph*(Comment: CXComment_553648934): CXComment_553648934 {.
      cdecl, importc: "clang_BlockCommandComment_getParagraph".}
else:
  static :
    hint("Declaration of " & "BlockCommandComment_getParagraph" &
        " already exists, not redeclaring")
when not declared(ParamCommandComment_getParamName):
  proc ParamCommandComment_getParamName*(Comment: CXComment_553648934): CXString_553648593 {.
      cdecl, importc: "clang_ParamCommandComment_getParamName".}
else:
  static :
    hint("Declaration of " & "ParamCommandComment_getParamName" &
        " already exists, not redeclaring")
when not declared(ParamCommandComment_isParamIndexValid):
  proc ParamCommandComment_isParamIndexValid*(Comment: CXComment_553648934): cuint {.
      cdecl, importc: "clang_ParamCommandComment_isParamIndexValid".}
else:
  static :
    hint("Declaration of " & "ParamCommandComment_isParamIndexValid" &
        " already exists, not redeclaring")
when not declared(ParamCommandComment_getParamIndex):
  proc ParamCommandComment_getParamIndex*(Comment: CXComment_553648934): cuint {.
      cdecl, importc: "clang_ParamCommandComment_getParamIndex".}
else:
  static :
    hint("Declaration of " & "ParamCommandComment_getParamIndex" &
        " already exists, not redeclaring")
when not declared(ParamCommandComment_isDirectionExplicit):
  proc ParamCommandComment_isDirectionExplicit*(Comment: CXComment_553648934): cuint {.
      cdecl, importc: "clang_ParamCommandComment_isDirectionExplicit".}
else:
  static :
    hint("Declaration of " & "ParamCommandComment_isDirectionExplicit" &
        " already exists, not redeclaring")
when not declared(ParamCommandComment_getDirection):
  proc ParamCommandComment_getDirection*(Comment: CXComment_553648934): enum_CXCommentParamPassDirection_553648940 {.
      cdecl, importc: "clang_ParamCommandComment_getDirection".}
else:
  static :
    hint("Declaration of " & "ParamCommandComment_getDirection" &
        " already exists, not redeclaring")
when not declared(TParamCommandComment_getParamName):
  proc TParamCommandComment_getParamName*(Comment: CXComment_553648934): CXString_553648593 {.
      cdecl, importc: "clang_TParamCommandComment_getParamName".}
else:
  static :
    hint("Declaration of " & "TParamCommandComment_getParamName" &
        " already exists, not redeclaring")
when not declared(TParamCommandComment_isParamPositionValid):
  proc TParamCommandComment_isParamPositionValid*(Comment: CXComment_553648934): cuint {.
      cdecl, importc: "clang_TParamCommandComment_isParamPositionValid".}
else:
  static :
    hint("Declaration of " & "TParamCommandComment_isParamPositionValid" &
        " already exists, not redeclaring")
when not declared(TParamCommandComment_getDepth):
  proc TParamCommandComment_getDepth*(Comment: CXComment_553648934): cuint {.
      cdecl, importc: "clang_TParamCommandComment_getDepth".}
else:
  static :
    hint("Declaration of " & "TParamCommandComment_getDepth" &
        " already exists, not redeclaring")
when not declared(TParamCommandComment_getIndex):
  proc TParamCommandComment_getIndex*(Comment: CXComment_553648934; Depth: cuint): cuint {.
      cdecl, importc: "clang_TParamCommandComment_getIndex".}
else:
  static :
    hint("Declaration of " & "TParamCommandComment_getIndex" &
        " already exists, not redeclaring")
when not declared(VerbatimBlockLineComment_getText):
  proc VerbatimBlockLineComment_getText*(Comment: CXComment_553648934): CXString_553648593 {.
      cdecl, importc: "clang_VerbatimBlockLineComment_getText".}
else:
  static :
    hint("Declaration of " & "VerbatimBlockLineComment_getText" &
        " already exists, not redeclaring")
when not declared(VerbatimLineComment_getText):
  proc VerbatimLineComment_getText*(Comment: CXComment_553648934): CXString_553648593 {.
      cdecl, importc: "clang_VerbatimLineComment_getText".}
else:
  static :
    hint("Declaration of " & "VerbatimLineComment_getText" &
        " already exists, not redeclaring")
when not declared(HTMLTagComment_getAsString):
  proc HTMLTagComment_getAsString*(Comment: CXComment_553648934): CXString_553648593 {.
      cdecl, importc: "clang_HTMLTagComment_getAsString".}
else:
  static :
    hint("Declaration of " & "HTMLTagComment_getAsString" &
        " already exists, not redeclaring")
when not declared(FullComment_getAsHTML):
  proc FullComment_getAsHTML*(Comment: CXComment_553648934): CXString_553648593 {.
      cdecl, importc: "clang_FullComment_getAsHTML".}
else:
  static :
    hint("Declaration of " & "FullComment_getAsHTML" &
        " already exists, not redeclaring")
when not declared(FullComment_getAsXML):
  proc FullComment_getAsXML*(Comment: CXComment_553648934): CXString_553648593 {.
      cdecl, importc: "clang_FullComment_getAsXML".}
else:
  static :
    hint("Declaration of " & "FullComment_getAsXML" &
        " already exists, not redeclaring")
when not declared(createAPISet):
  proc createAPISet*(tu: CXTranslationUnit_553648647; out_api: ptr CXAPISet_553648942): enum_CXErrorCode_553648589 {.
      cdecl, importc: "clang_createAPISet".}
else:
  static :
    hint("Declaration of " & "createAPISet" & " already exists, not redeclaring")
when not declared(disposeAPISet):
  proc disposeAPISet*(api: CXAPISet_553648942): void {.cdecl,
      importc: "clang_disposeAPISet".}
else:
  static :
    hint("Declaration of " & "disposeAPISet" &
        " already exists, not redeclaring")
when not declared(getSymbolGraphForUSR):
  proc getSymbolGraphForUSR*(usr: cstring; api: CXAPISet_553648942): CXString_553648593 {.
      cdecl, importc: "clang_getSymbolGraphForUSR".}
else:
  static :
    hint("Declaration of " & "getSymbolGraphForUSR" &
        " already exists, not redeclaring")
when not declared(getSymbolGraphForCursor):
  proc getSymbolGraphForCursor*(cursor: CXCursor_553648702): CXString_553648593 {.
      cdecl, importc: "clang_getSymbolGraphForCursor".}
else:
  static :
    hint("Declaration of " & "getSymbolGraphForCursor" &
        " already exists, not redeclaring")
when not declared(install_aborting_llvm_fatal_error_handler):
  proc install_aborting_llvm_fatal_error_handler*(): void {.cdecl,
      importc: "clang_install_aborting_llvm_fatal_error_handler".}
else:
  static :
    hint("Declaration of " & "install_aborting_llvm_fatal_error_handler" &
        " already exists, not redeclaring")
when not declared(uninstall_llvm_fatal_error_handler):
  proc uninstall_llvm_fatal_error_handler*(): void {.cdecl,
      importc: "clang_uninstall_llvm_fatal_error_handler".}
else:
  static :
    hint("Declaration of " & "uninstall_llvm_fatal_error_handler" &
        " already exists, not redeclaring")
when not declared(CXRewriter_create):
  proc CXRewriter_create*(TU: CXTranslationUnit_553648647): CXRewriter_553648944 {.
      cdecl, importc: "clang_CXRewriter_create".}
else:
  static :
    hint("Declaration of " & "CXRewriter_create" &
        " already exists, not redeclaring")
when not declared(CXRewriter_insertTextBefore):
  proc CXRewriter_insertTextBefore*(Rew: CXRewriter_553648944;
                                    Loc: CXSourceLocation_553648623;
                                    Insert: cstring): void {.cdecl,
      importc: "clang_CXRewriter_insertTextBefore".}
else:
  static :
    hint("Declaration of " & "CXRewriter_insertTextBefore" &
        " already exists, not redeclaring")
when not declared(CXRewriter_replaceText):
  proc CXRewriter_replaceText*(Rew: CXRewriter_553648944;
                               ToBeReplaced: CXSourceRange_553648627;
                               Replacement: cstring): void {.cdecl,
      importc: "clang_CXRewriter_replaceText".}
else:
  static :
    hint("Declaration of " & "CXRewriter_replaceText" &
        " already exists, not redeclaring")
when not declared(CXRewriter_removeText):
  proc CXRewriter_removeText*(Rew: CXRewriter_553648944;
                              ToBeRemoved: CXSourceRange_553648627): void {.
      cdecl, importc: "clang_CXRewriter_removeText".}
else:
  static :
    hint("Declaration of " & "CXRewriter_removeText" &
        " already exists, not redeclaring")
when not declared(CXRewriter_overwriteChangedFiles):
  proc CXRewriter_overwriteChangedFiles*(Rew: CXRewriter_553648944): cint {.
      cdecl, importc: "clang_CXRewriter_overwriteChangedFiles".}
else:
  static :
    hint("Declaration of " & "CXRewriter_overwriteChangedFiles" &
        " already exists, not redeclaring")
when not declared(CXRewriter_writeMainFileToStdOut):
  proc CXRewriter_writeMainFileToStdOut*(Rew: CXRewriter_553648944): void {.
      cdecl, importc: "clang_CXRewriter_writeMainFileToStdOut".}
else:
  static :
    hint("Declaration of " & "CXRewriter_writeMainFileToStdOut" &
        " already exists, not redeclaring")
when not declared(CXRewriter_dispose):
  proc CXRewriter_dispose*(Rew: CXRewriter_553648944): void {.cdecl,
      importc: "clang_CXRewriter_dispose".}
else:
  static :
    hint("Declaration of " & "CXRewriter_dispose" &
        " already exists, not redeclaring")