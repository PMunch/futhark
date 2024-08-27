
from macros import hint

when not declared(enumcxerrorcode):
  type
    enumcxerrorcode* {.size: sizeof(cuint).} = enum
      Cxerrorsuccess = 0, Cxerrorfailure = 1, Cxerrorcrashed = 2,
      Cxerrorinvalidarguments = 3, Cxerrorastreaderror = 4
else:
  static :
    hint("Declaration of " & "enumcxerrorcode" &
        " already exists, not redeclaring")
when not declared(enumcxcompilationdatabaseerror):
  type
    enumcxcompilationdatabaseerror* {.size: sizeof(cuint).} = enum
      Cxcompilationdatabasenoerror = 0,
      Cxcompilationdatabasecannotloaddatabase = 1
else:
  static :
    hint("Declaration of " & "enumcxcompilationdatabaseerror" &
        " already exists, not redeclaring")
when not declared(enumcxdiagnosticseverity):
  type
    enumcxdiagnosticseverity* {.size: sizeof(cuint).} = enum
      Cxdiagnosticignored = 0, Cxdiagnosticnote = 1, Cxdiagnosticwarning = 2,
      Cxdiagnosticerror = 3, Cxdiagnosticfatal = 4
else:
  static :
    hint("Declaration of " & "enumcxdiagnosticseverity" &
        " already exists, not redeclaring")
when not declared(enumcxloaddiagerror):
  type
    enumcxloaddiagerror* {.size: sizeof(cuint).} = enum
      Cxloaddiagnone = 0, Cxloaddiagunknown = 1, Cxloaddiagcannotload = 2,
      Cxloaddiaginvalidfile = 3
else:
  static :
    hint("Declaration of " & "enumcxloaddiagerror" &
        " already exists, not redeclaring")
when not declared(enumcxdiagnosticdisplayoptions):
  type
    enumcxdiagnosticdisplayoptions* {.size: sizeof(cuint).} = enum
      Cxdiagnosticdisplaysourcelocation = 1, Cxdiagnosticdisplaycolumn = 2,
      Cxdiagnosticdisplaysourceranges = 4, Cxdiagnosticdisplayoption = 8,
      Cxdiagnosticdisplaycategoryid = 16, Cxdiagnosticdisplaycategoryname = 32
else:
  static :
    hint("Declaration of " & "enumcxdiagnosticdisplayoptions" &
        " already exists, not redeclaring")
when not declared(enumcxavailabilitykind):
  type
    enumcxavailabilitykind* {.size: sizeof(cuint).} = enum
      Cxavailabilityavailable = 0, Cxavailabilitydeprecated = 1,
      Cxavailabilitynotavailable = 2, Cxavailabilitynotaccessible = 3
else:
  static :
    hint("Declaration of " & "enumcxavailabilitykind" &
        " already exists, not redeclaring")
when not declared(enumcxcursorexceptionspecificationkind):
  type
    enumcxcursorexceptionspecificationkind* {.size: sizeof(cuint).} = enum
      Cxcursorexceptionspecificationkindnone = 0,
      Cxcursorexceptionspecificationkinddynamicnone = 1,
      Cxcursorexceptionspecificationkinddynamic = 2,
      Cxcursorexceptionspecificationkindmsany = 3,
      Cxcursorexceptionspecificationkindbasicnoexcept = 4,
      Cxcursorexceptionspecificationkindcomputednoexcept = 5,
      Cxcursorexceptionspecificationkindunevaluated = 6,
      Cxcursorexceptionspecificationkinduninstantiated = 7,
      Cxcursorexceptionspecificationkindunparsed = 8,
      Cxcursorexceptionspecificationkindnothrow = 9
else:
  static :
    hint("Declaration of " & "enumcxcursorexceptionspecificationkind" &
        " already exists, not redeclaring")
when not declared(enumcxchoice):
  type
    enumcxchoice* {.size: sizeof(cuint).} = enum
      Cxchoicedefault = 0, Cxchoiceenabled = 1, Cxchoicedisabled = 2
else:
  static :
    hint("Declaration of " & "enumcxchoice" & " already exists, not redeclaring")
when not declared(enumcxglobaloptflags):
  type
    enumcxglobaloptflags* {.size: sizeof(cuint).} = enum
      Cxglobaloptnone = 0, Cxglobaloptthreadbackgroundpriorityforindexing = 1,
      Cxglobaloptthreadbackgroundpriorityforediting = 2,
      Cxglobaloptthreadbackgroundpriorityforall = 3
else:
  static :
    hint("Declaration of " & "enumcxglobaloptflags" &
        " already exists, not redeclaring")
when not declared(enumcxtranslationunitflags):
  type
    enumcxtranslationunitflags* {.size: sizeof(cuint).} = enum
      Cxtranslationunitnone = 0,
      Cxtranslationunitdetailedpreprocessingrecord = 1,
      Cxtranslationunitincomplete = 2, Cxtranslationunitprecompiledpreamble = 4,
      Cxtranslationunitcachecompletionresults = 8,
      Cxtranslationunitforserialization = 16,
      Cxtranslationunitcxxchainedpch = 32,
      Cxtranslationunitskipfunctionbodies = 64,
      Cxtranslationunitincludebriefcommentsincodecompletion = 128,
      Cxtranslationunitcreatepreambleonfirstparse = 256,
      Cxtranslationunitkeepgoing = 512, Cxtranslationunitsinglefileparse = 1024,
      Cxtranslationunitlimitskipfunctionbodiestopreamble = 2048,
      Cxtranslationunitincludeattributedtypes = 4096,
      Cxtranslationunitvisitimplicitattributes = 8192,
      Cxtranslationunitignorenonerrorsfromincludedfiles = 16384,
      Cxtranslationunitretainexcludedconditionalblocks = 32768
else:
  static :
    hint("Declaration of " & "enumcxtranslationunitflags" &
        " already exists, not redeclaring")
when not declared(enumcxsavetranslationunitflags):
  type
    enumcxsavetranslationunitflags* {.size: sizeof(cuint).} = enum
      Cxsavetranslationunitnone = 0
else:
  static :
    hint("Declaration of " & "enumcxsavetranslationunitflags" &
        " already exists, not redeclaring")
when not declared(enumcxsaveerror):
  type
    enumcxsaveerror* {.size: sizeof(cuint).} = enum
      Cxsaveerrornone = 0, Cxsaveerrorunknown = 1,
      Cxsaveerrortranslationerrors = 2, Cxsaveerrorinvalidtu = 3
else:
  static :
    hint("Declaration of " & "enumcxsaveerror" &
        " already exists, not redeclaring")
when not declared(enumcxreparseflags):
  type
    enumcxreparseflags* {.size: sizeof(cuint).} = enum
      Cxreparsenone = 0
else:
  static :
    hint("Declaration of " & "enumcxreparseflags" &
        " already exists, not redeclaring")
when not declared(enumcxturesourceusagekind):
  type
    enumcxturesourceusagekind* {.size: sizeof(cuint).} = enum
      Cxturesourceusageast = 1, Cxturesourceusageidentifiers = 2,
      Cxturesourceusageselectors = 3,
      Cxturesourceusageglobalcompletionresults = 4,
      Cxturesourceusagesourcemanagercontentcache = 5,
      Cxturesourceusageastsidetables = 6,
      Cxturesourceusagesourcemanagermembuffermalloc = 7,
      Cxturesourceusagesourcemanagermembuffermmap = 8,
      Cxturesourceusageexternalastsourcemembuffermalloc = 9,
      Cxturesourceusageexternalastsourcemembuffermmap = 10,
      Cxturesourceusagepreprocessor = 11,
      Cxturesourceusagepreprocessingrecord = 12,
      Cxturesourceusagesourcemanagerdatastructures = 13,
      Cxturesourceusagepreprocessorheadersearch = 14
else:
  static :
    hint("Declaration of " & "enumcxturesourceusagekind" &
        " already exists, not redeclaring")
when not declared(Cxturesourceusagememoryinbytesbegin):
  const
    Cxturesourceusagememoryinbytesbegin* = enumcxturesourceusagekind.Cxturesourceusageast
else:
  static :
    hint("Declaration of " & "Cxturesourceusagememoryinbytesbegin" &
        " already exists, not redeclaring")
when not declared(Cxturesourceusagememoryinbytesend):
  const
    Cxturesourceusagememoryinbytesend* = enumcxturesourceusagekind.Cxturesourceusagepreprocessorheadersearch
else:
  static :
    hint("Declaration of " & "Cxturesourceusagememoryinbytesend" &
        " already exists, not redeclaring")
when not declared(Cxturesourceusagefirst):
  const
    Cxturesourceusagefirst* = enumcxturesourceusagekind.Cxturesourceusageast
else:
  static :
    hint("Declaration of " & "Cxturesourceusagefirst" &
        " already exists, not redeclaring")
when not declared(Cxturesourceusagelast):
  const
    Cxturesourceusagelast* = enumcxturesourceusagekind.Cxturesourceusagepreprocessorheadersearch
else:
  static :
    hint("Declaration of " & "Cxturesourceusagelast" &
        " already exists, not redeclaring")
when not declared(enumcxcursorkind):
  type
    enumcxcursorkind* {.size: sizeof(cuint).} = enum
      Cxcursorunexposeddecl = 1, Cxcursorstructdecl = 2, Cxcursoruniondecl = 3,
      Cxcursorclassdecl = 4, Cxcursorenumdecl = 5, Cxcursorfielddecl = 6,
      Cxcursorenumconstantdecl = 7, Cxcursorfunctiondecl = 8,
      Cxcursorvardecl = 9, Cxcursorparmdecl = 10,
      Cxcursorobjcinterfacedecl = 11, Cxcursorobjccategorydecl = 12,
      Cxcursorobjcprotocoldecl = 13, Cxcursorobjcpropertydecl = 14,
      Cxcursorobjcivardecl = 15, Cxcursorobjcinstancemethoddecl = 16,
      Cxcursorobjcclassmethoddecl = 17, Cxcursorobjcimplementationdecl = 18,
      Cxcursorobjccategoryimpldecl = 19, Cxcursortypedefdecl = 20,
      Cxcursorcxxmethod = 21, Cxcursornamespace = 22, Cxcursorlinkagespec = 23,
      Cxcursorconstructor = 24, Cxcursordestructor = 25,
      Cxcursorconversionfunction = 26, Cxcursortemplatetypeparameter = 27,
      Cxcursornontypetemplateparameter = 28,
      Cxcursortemplatetemplateparameter = 29, Cxcursorfunctiontemplate = 30,
      Cxcursorclasstemplate = 31,
      Cxcursorclasstemplatepartialspecialization = 32,
      Cxcursornamespacealias = 33, Cxcursorusingdirective = 34,
      Cxcursorusingdeclaration = 35, Cxcursortypealiasdecl = 36,
      Cxcursorobjcsynthesizedecl = 37, Cxcursorobjcdynamicdecl = 38,
      Cxcursorcxxaccessspecifier = 39, Cxcursorfirstref = 40,
      Cxcursorobjcprotocolref = 41, Cxcursorobjcclassref = 42,
      Cxcursortyperef = 43, Cxcursorcxxbasespecifier = 44,
      Cxcursortemplateref = 45, Cxcursornamespaceref = 46,
      Cxcursormemberref = 47, Cxcursorlabelref = 48,
      Cxcursoroverloadeddeclref = 49, Cxcursorvariableref = 50,
      Cxcursorfirstinvalid = 70, Cxcursornodeclfound = 71,
      Cxcursornotimplemented = 72, Cxcursorinvalidcode = 73,
      Cxcursorfirstexpr = 100, Cxcursordeclrefexpr = 101,
      Cxcursormemberrefexpr = 102, Cxcursorcallexpr = 103,
      Cxcursorobjcmessageexpr = 104, Cxcursorblockexpr = 105,
      Cxcursorintegerliteral = 106, Cxcursorfloatingliteral = 107,
      Cxcursorimaginaryliteral = 108, Cxcursorstringliteral = 109,
      Cxcursorcharacterliteral = 110, Cxcursorparenexpr = 111,
      Cxcursorunaryoperator = 112, Cxcursorarraysubscriptexpr = 113,
      Cxcursorbinaryoperator = 114, Cxcursorcompoundassignoperator = 115,
      Cxcursorconditionaloperator = 116, Cxcursorcstylecastexpr = 117,
      Cxcursorcompoundliteralexpr = 118, Cxcursorinitlistexpr = 119,
      Cxcursoraddrlabelexpr = 120, Cxcursorstmtexpr = 121,
      Cxcursorgenericselectionexpr = 122, Cxcursorgnunullexpr = 123,
      Cxcursorcxxstaticcastexpr = 124, Cxcursorcxxdynamiccastexpr = 125,
      Cxcursorcxxreinterpretcastexpr = 126, Cxcursorcxxconstcastexpr = 127,
      Cxcursorcxxfunctionalcastexpr = 128, Cxcursorcxxtypeidexpr = 129,
      Cxcursorcxxboolliteralexpr = 130, Cxcursorcxxnullptrliteralexpr = 131,
      Cxcursorcxxthisexpr = 132, Cxcursorcxxthrowexpr = 133,
      Cxcursorcxxnewexpr = 134, Cxcursorcxxdeleteexpr = 135,
      Cxcursorunaryexpr = 136, Cxcursorobjcstringliteral = 137,
      Cxcursorobjcencodeexpr = 138, Cxcursorobjcselectorexpr = 139,
      Cxcursorobjcprotocolexpr = 140, Cxcursorobjcbridgedcastexpr = 141,
      Cxcursorpackexpansionexpr = 142, Cxcursorsizeofpackexpr = 143,
      Cxcursorlambdaexpr = 144, Cxcursorobjcboolliteralexpr = 145,
      Cxcursorobjcselfexpr = 146, Cxcursoromparraysectionexpr = 147,
      Cxcursorobjcavailabilitycheckexpr = 148, Cxcursorfixedpointliteral = 149,
      Cxcursoromparrayshapingexpr = 150, Cxcursorompiteratorexpr = 151,
      Cxcursorcxxaddrspacecastexpr = 152,
      Cxcursorconceptspecializationexpr = 153, Cxcursorrequiresexpr = 154,
      Cxcursorcxxparenlistinitexpr = 155, Cxcursorfirststmt = 200,
      Cxcursorlabelstmt = 201, Cxcursorcompoundstmt = 202,
      Cxcursorcasestmt = 203, Cxcursordefaultstmt = 204, Cxcursorifstmt = 205,
      Cxcursorswitchstmt = 206, Cxcursorwhilestmt = 207, Cxcursordostmt = 208,
      Cxcursorforstmt = 209, Cxcursorgotostmt = 210,
      Cxcursorindirectgotostmt = 211, Cxcursorcontinuestmt = 212,
      Cxcursorbreakstmt = 213, Cxcursorreturnstmt = 214,
      Cxcursorgccasmstmt = 215, Cxcursorobjcattrystmt = 216,
      Cxcursorobjcatcatchstmt = 217, Cxcursorobjcatfinallystmt = 218,
      Cxcursorobjcatthrowstmt = 219, Cxcursorobjcatsynchronizedstmt = 220,
      Cxcursorobjcautoreleasepoolstmt = 221,
      Cxcursorobjcforcollectionstmt = 222, Cxcursorcxxcatchstmt = 223,
      Cxcursorcxxtrystmt = 224, Cxcursorcxxforrangestmt = 225,
      Cxcursorsehtrystmt = 226, Cxcursorsehexceptstmt = 227,
      Cxcursorsehfinallystmt = 228, Cxcursormsasmstmt = 229,
      Cxcursornullstmt = 230, Cxcursordeclstmt = 231,
      Cxcursorompparalleldirective = 232, Cxcursorompsimddirective = 233,
      Cxcursorompfordirective = 234, Cxcursorompsectionsdirective = 235,
      Cxcursorompsectiondirective = 236, Cxcursorompsingledirective = 237,
      Cxcursorompparallelfordirective = 238,
      Cxcursorompparallelsectionsdirective = 239,
      Cxcursoromptaskdirective = 240, Cxcursorompmasterdirective = 241,
      Cxcursorompcriticaldirective = 242, Cxcursoromptaskyielddirective = 243,
      Cxcursorompbarrierdirective = 244, Cxcursoromptaskwaitdirective = 245,
      Cxcursorompflushdirective = 246, Cxcursorsehleavestmt = 247,
      Cxcursorompordereddirective = 248, Cxcursorompatomicdirective = 249,
      Cxcursorompforsimddirective = 250,
      Cxcursorompparallelforsimddirective = 251,
      Cxcursoromptargetdirective = 252, Cxcursorompteamsdirective = 253,
      Cxcursoromptaskgroupdirective = 254,
      Cxcursorompcancellationpointdirective = 255,
      Cxcursorompcanceldirective = 256, Cxcursoromptargetdatadirective = 257,
      Cxcursoromptaskloopdirective = 258,
      Cxcursoromptaskloopsimddirective = 259,
      Cxcursorompdistributedirective = 260,
      Cxcursoromptargetenterdatadirective = 261,
      Cxcursoromptargetexitdatadirective = 262,
      Cxcursoromptargetparalleldirective = 263,
      Cxcursoromptargetparallelfordirective = 264,
      Cxcursoromptargetupdatedirective = 265,
      Cxcursorompdistributeparallelfordirective = 266,
      Cxcursorompdistributeparallelforsimddirective = 267,
      Cxcursorompdistributesimddirective = 268,
      Cxcursoromptargetparallelforsimddirective = 269,
      Cxcursoromptargetsimddirective = 270,
      Cxcursorompteamsdistributedirective = 271,
      Cxcursorompteamsdistributesimddirective = 272,
      Cxcursorompteamsdistributeparallelforsimddirective = 273,
      Cxcursorompteamsdistributeparallelfordirective = 274,
      Cxcursoromptargetteamsdirective = 275,
      Cxcursoromptargetteamsdistributedirective = 276,
      Cxcursoromptargetteamsdistributeparallelfordirective = 277,
      Cxcursoromptargetteamsdistributeparallelforsimddirective = 278,
      Cxcursoromptargetteamsdistributesimddirective = 279,
      Cxcursorbuiltinbitcastexpr = 280,
      Cxcursorompmastertaskloopdirective = 281,
      Cxcursorompparallelmastertaskloopdirective = 282,
      Cxcursorompmastertaskloopsimddirective = 283,
      Cxcursorompparallelmastertaskloopsimddirective = 284,
      Cxcursorompparallelmasterdirective = 285,
      Cxcursorompdepobjdirective = 286, Cxcursorompscandirective = 287,
      Cxcursoromptiledirective = 288, Cxcursorompcanonicalloop = 289,
      Cxcursorompinteropdirective = 290, Cxcursorompdispatchdirective = 291,
      Cxcursorompmaskeddirective = 292, Cxcursorompunrolldirective = 293,
      Cxcursorompmetadirective = 294, Cxcursorompgenericloopdirective = 295,
      Cxcursorompteamsgenericloopdirective = 296,
      Cxcursoromptargetteamsgenericloopdirective = 297,
      Cxcursorompparallelgenericloopdirective = 298,
      Cxcursoromptargetparallelgenericloopdirective = 299,
      Cxcursorompparallelmaskeddirective = 300,
      Cxcursorompmaskedtaskloopdirective = 301,
      Cxcursorompmaskedtaskloopsimddirective = 302,
      Cxcursorompparallelmaskedtaskloopdirective = 303,
      Cxcursorompparallelmaskedtaskloopsimddirective = 304,
      Cxcursoromperrordirective = 305, Cxcursortranslationunit = 350,
      Cxcursorfirstattr = 400, Cxcursoribactionattr = 401,
      Cxcursoriboutletattr = 402, Cxcursoriboutletcollectionattr = 403,
      Cxcursorcxxfinalattr = 404, Cxcursorcxxoverrideattr = 405,
      Cxcursorannotateattr = 406, Cxcursorasmlabelattr = 407,
      Cxcursorpackedattr = 408, Cxcursorpureattr = 409, Cxcursorconstattr = 410,
      Cxcursornoduplicateattr = 411, Cxcursorcudaconstantattr = 412,
      Cxcursorcudadeviceattr = 413, Cxcursorcudaglobalattr = 414,
      Cxcursorcudahostattr = 415, Cxcursorcudasharedattr = 416,
      Cxcursorvisibilityattr = 417, Cxcursordllexport = 418,
      Cxcursordllimport = 419, Cxcursornsreturnsretained = 420,
      Cxcursornsreturnsnotretained = 421, Cxcursornsreturnsautoreleased = 422,
      Cxcursornsconsumesself = 423, Cxcursornsconsumed = 424,
      Cxcursorobjcexception = 425, Cxcursorobjcnsobject = 426,
      Cxcursorobjcindependentclass = 427, Cxcursorobjcpreciselifetime = 428,
      Cxcursorobjcreturnsinnerpointer = 429, Cxcursorobjcrequiressuper = 430,
      Cxcursorobjcrootclass = 431, Cxcursorobjcsubclassingrestricted = 432,
      Cxcursorobjcexplicitprotocolimpl = 433,
      Cxcursorobjcdesignatedinitializer = 434, Cxcursorobjcruntimevisible = 435,
      Cxcursorobjcboxable = 436, Cxcursorflagenum = 437,
      Cxcursorconvergentattr = 438, Cxcursorwarnunusedattr = 439,
      Cxcursorwarnunusedresultattr = 440, Cxcursoralignedattr = 441,
      Cxcursorpreprocessingdirective = 500, Cxcursormacrodefinition = 501,
      Cxcursormacroexpansion = 502, Cxcursorinclusiondirective = 503,
      Cxcursormoduleimportdecl = 600, Cxcursortypealiastemplatedecl = 601,
      Cxcursorstaticassert = 602, Cxcursorfrienddecl = 603,
      Cxcursorconceptdecl = 604, Cxcursoroverloadcandidate = 700
else:
  static :
    hint("Declaration of " & "enumcxcursorkind" &
        " already exists, not redeclaring")
when not declared(Cxcursorfirstdecl):
  const
    Cxcursorfirstdecl* = enumcxcursorkind.Cxcursorunexposeddecl
else:
  static :
    hint("Declaration of " & "Cxcursorfirstdecl" &
        " already exists, not redeclaring")
when not declared(Cxcursorlastdecl):
  const
    Cxcursorlastdecl* = enumcxcursorkind.Cxcursorcxxaccessspecifier
else:
  static :
    hint("Declaration of " & "Cxcursorlastdecl" &
        " already exists, not redeclaring")
when not declared(Cxcursorobjcsuperclassref):
  const
    Cxcursorobjcsuperclassref* = enumcxcursorkind.Cxcursorfirstref
else:
  static :
    hint("Declaration of " & "Cxcursorobjcsuperclassref" &
        " already exists, not redeclaring")
when not declared(Cxcursorlastref):
  const
    Cxcursorlastref* = enumcxcursorkind.Cxcursorvariableref
else:
  static :
    hint("Declaration of " & "Cxcursorlastref" &
        " already exists, not redeclaring")
when not declared(Cxcursorinvalidfile):
  const
    Cxcursorinvalidfile* = enumcxcursorkind.Cxcursorfirstinvalid
else:
  static :
    hint("Declaration of " & "Cxcursorinvalidfile" &
        " already exists, not redeclaring")
when not declared(Cxcursorlastinvalid):
  const
    Cxcursorlastinvalid* = enumcxcursorkind.Cxcursorinvalidcode
else:
  static :
    hint("Declaration of " & "Cxcursorlastinvalid" &
        " already exists, not redeclaring")
when not declared(Cxcursorunexposedexpr):
  const
    Cxcursorunexposedexpr* = enumcxcursorkind.Cxcursorfirstexpr
else:
  static :
    hint("Declaration of " & "Cxcursorunexposedexpr" &
        " already exists, not redeclaring")
when not declared(Cxcursorlastexpr):
  const
    Cxcursorlastexpr* = enumcxcursorkind.Cxcursorcxxparenlistinitexpr
else:
  static :
    hint("Declaration of " & "Cxcursorlastexpr" &
        " already exists, not redeclaring")
when not declared(Cxcursorunexposedstmt):
  const
    Cxcursorunexposedstmt* = enumcxcursorkind.Cxcursorfirststmt
else:
  static :
    hint("Declaration of " & "Cxcursorunexposedstmt" &
        " already exists, not redeclaring")
when not declared(Cxcursorasmstmt):
  const
    Cxcursorasmstmt* = enumcxcursorkind.Cxcursorgccasmstmt
else:
  static :
    hint("Declaration of " & "Cxcursorasmstmt" &
        " already exists, not redeclaring")
when not declared(Cxcursorlaststmt):
  const
    Cxcursorlaststmt* = enumcxcursorkind.Cxcursoromperrordirective
else:
  static :
    hint("Declaration of " & "Cxcursorlaststmt" &
        " already exists, not redeclaring")
when not declared(Cxcursorunexposedattr):
  const
    Cxcursorunexposedattr* = enumcxcursorkind.Cxcursorfirstattr
else:
  static :
    hint("Declaration of " & "Cxcursorunexposedattr" &
        " already exists, not redeclaring")
when not declared(Cxcursorlastattr):
  const
    Cxcursorlastattr* = enumcxcursorkind.Cxcursoralignedattr
else:
  static :
    hint("Declaration of " & "Cxcursorlastattr" &
        " already exists, not redeclaring")
when not declared(Cxcursormacroinstantiation):
  const
    Cxcursormacroinstantiation* = enumcxcursorkind.Cxcursormacroexpansion
else:
  static :
    hint("Declaration of " & "Cxcursormacroinstantiation" &
        " already exists, not redeclaring")
when not declared(Cxcursorfirstpreprocessing):
  const
    Cxcursorfirstpreprocessing* = enumcxcursorkind.Cxcursorpreprocessingdirective
else:
  static :
    hint("Declaration of " & "Cxcursorfirstpreprocessing" &
        " already exists, not redeclaring")
when not declared(Cxcursorlastpreprocessing):
  const
    Cxcursorlastpreprocessing* = enumcxcursorkind.Cxcursorinclusiondirective
else:
  static :
    hint("Declaration of " & "Cxcursorlastpreprocessing" &
        " already exists, not redeclaring")
when not declared(Cxcursorfirstextradecl):
  const
    Cxcursorfirstextradecl* = enumcxcursorkind.Cxcursormoduleimportdecl
else:
  static :
    hint("Declaration of " & "Cxcursorfirstextradecl" &
        " already exists, not redeclaring")
when not declared(Cxcursorlastextradecl):
  const
    Cxcursorlastextradecl* = enumcxcursorkind.Cxcursorconceptdecl
else:
  static :
    hint("Declaration of " & "Cxcursorlastextradecl" &
        " already exists, not redeclaring")
when not declared(enumcxlinkagekind):
  type
    enumcxlinkagekind* {.size: sizeof(cuint).} = enum
      Cxlinkageinvalid = 0, Cxlinkagenolinkage = 1, Cxlinkageinternal = 2,
      Cxlinkageuniqueexternal = 3, Cxlinkageexternal = 4
else:
  static :
    hint("Declaration of " & "enumcxlinkagekind" &
        " already exists, not redeclaring")
when not declared(enumcxvisibilitykind):
  type
    enumcxvisibilitykind* {.size: sizeof(cuint).} = enum
      Cxvisibilityinvalid = 0, Cxvisibilityhidden = 1,
      Cxvisibilityprotected = 2, Cxvisibilitydefault = 3
else:
  static :
    hint("Declaration of " & "enumcxvisibilitykind" &
        " already exists, not redeclaring")
when not declared(enumcxlanguagekind):
  type
    enumcxlanguagekind* {.size: sizeof(cuint).} = enum
      Cxlanguageinvalid = 0, Cxlanguagec = 1, Cxlanguageobjc = 2,
      Cxlanguagecplusplus = 3
else:
  static :
    hint("Declaration of " & "enumcxlanguagekind" &
        " already exists, not redeclaring")
when not declared(enumcxtlskind):
  type
    enumcxtlskind* {.size: sizeof(cuint).} = enum
      Cxtlsnone = 0, Cxtlsdynamic = 1, Cxtlsstatic = 2
else:
  static :
    hint("Declaration of " & "enumcxtlskind" &
        " already exists, not redeclaring")
when not declared(enumcxtypekind):
  type
    enumcxtypekind* {.size: sizeof(cuint).} = enum
      Cxtypeinvalid = 0, Cxtypeunexposed = 1, Cxtypevoid = 2, Cxtypebool = 3,
      Cxtypecharu = 4, Cxtypeuchar = 5, Cxtypechar16 = 6, Cxtypechar32 = 7,
      Cxtypeushort = 8, Cxtypeuint = 9, Cxtypeulong = 10, Cxtypeulonglong = 11,
      Cxtypeuint128 = 12, Cxtypechars = 13, Cxtypeschar = 14, Cxtypewchar = 15,
      Cxtypeshort = 16, Cxtypeint = 17, Cxtypelong = 18, Cxtypelonglong = 19,
      Cxtypeint128 = 20, Cxtypefloat = 21, Cxtypedouble = 22,
      Cxtypelongdouble = 23, Cxtypenullptr = 24, Cxtypeoverload = 25,
      Cxtypedependent = 26, Cxtypeobjcid = 27, Cxtypeobjcclass = 28,
      Cxtypeobjcsel = 29, Cxtypefloat128 = 30, Cxtypehalf = 31,
      Cxtypefloat16 = 32, Cxtypeshortaccum = 33, Cxtypeaccum = 34,
      Cxtypelongaccum = 35, Cxtypeushortaccum = 36, Cxtypeuaccum = 37,
      Cxtypeulongaccum = 38, Cxtypebfloat16 = 39, Cxtypeibm128 = 40,
      Cxtypecomplex = 100, Cxtypepointer = 101, Cxtypeblockpointer = 102,
      Cxtypelvaluereference = 103, Cxtypervaluereference = 104,
      Cxtyperecord = 105, Cxtypeenum = 106, Cxtypetypedef = 107,
      Cxtypeobjcinterface = 108, Cxtypeobjcobjectpointer = 109,
      Cxtypefunctionnoproto = 110, Cxtypefunctionproto = 111,
      Cxtypeconstantarray = 112, Cxtypevector = 113,
      Cxtypeincompletearray = 114, Cxtypevariablearray = 115,
      Cxtypedependentsizedarray = 116, Cxtypememberpointer = 117,
      Cxtypeauto = 118, Cxtypeelaborated = 119, Cxtypepipe = 120,
      Cxtypeoclimage1dro = 121, Cxtypeoclimage1darrayro = 122,
      Cxtypeoclimage1dbufferro = 123, Cxtypeoclimage2dro = 124,
      Cxtypeoclimage2darrayro = 125, Cxtypeoclimage2ddepthro = 126,
      Cxtypeoclimage2darraydepthro = 127, Cxtypeoclimage2dmsaaro = 128,
      Cxtypeoclimage2darraymsaaro = 129, Cxtypeoclimage2dmsaadepthro = 130,
      Cxtypeoclimage2darraymsaadepthro = 131, Cxtypeoclimage3dro = 132,
      Cxtypeoclimage1dwo = 133, Cxtypeoclimage1darraywo = 134,
      Cxtypeoclimage1dbufferwo = 135, Cxtypeoclimage2dwo = 136,
      Cxtypeoclimage2darraywo = 137, Cxtypeoclimage2ddepthwo = 138,
      Cxtypeoclimage2darraydepthwo = 139, Cxtypeoclimage2dmsaawo = 140,
      Cxtypeoclimage2darraymsaawo = 141, Cxtypeoclimage2dmsaadepthwo = 142,
      Cxtypeoclimage2darraymsaadepthwo = 143, Cxtypeoclimage3dwo = 144,
      Cxtypeoclimage1drw = 145, Cxtypeoclimage1darrayrw = 146,
      Cxtypeoclimage1dbufferrw = 147, Cxtypeoclimage2drw = 148,
      Cxtypeoclimage2darrayrw = 149, Cxtypeoclimage2ddepthrw = 150,
      Cxtypeoclimage2darraydepthrw = 151, Cxtypeoclimage2dmsaarw = 152,
      Cxtypeoclimage2darraymsaarw = 153, Cxtypeoclimage2dmsaadepthrw = 154,
      Cxtypeoclimage2darraymsaadepthrw = 155, Cxtypeoclimage3drw = 156,
      Cxtypeoclsampler = 157, Cxtypeoclevent = 158, Cxtypeoclqueue = 159,
      Cxtypeoclreserveid = 160, Cxtypeobjcobject = 161,
      Cxtypeobjctypeparam = 162, Cxtypeattributed = 163,
      Cxtypeoclintelsubgroupavcmcepayload = 164,
      Cxtypeoclintelsubgroupavcimepayload = 165,
      Cxtypeoclintelsubgroupavcrefpayload = 166,
      Cxtypeoclintelsubgroupavcsicpayload = 167,
      Cxtypeoclintelsubgroupavcmceresult = 168,
      Cxtypeoclintelsubgroupavcimeresult = 169,
      Cxtypeoclintelsubgroupavcrefresult = 170,
      Cxtypeoclintelsubgroupavcsicresult = 171,
      Cxtypeoclintelsubgroupavcimeresultsinglereferencestreamout = 172,
      Cxtypeoclintelsubgroupavcimeresultdualreferencestreamout = 173,
      Cxtypeoclintelsubgroupavcimesinglereferencestreamin = 174,
      Cxtypeoclintelsubgroupavcimedualreferencestreamin = 175,
      Cxtypeextvector = 176, Cxtypeatomic = 177, Cxtypebtftagattributed = 178
else:
  static :
    hint("Declaration of " & "enumcxtypekind" &
        " already exists, not redeclaring")
when not declared(Cxtypefirstbuiltin):
  const
    Cxtypefirstbuiltin* = enumcxtypekind.Cxtypevoid
else:
  static :
    hint("Declaration of " & "Cxtypefirstbuiltin" &
        " already exists, not redeclaring")
when not declared(Cxtypelastbuiltin):
  const
    Cxtypelastbuiltin* = enumcxtypekind.Cxtypeibm128
else:
  static :
    hint("Declaration of " & "Cxtypelastbuiltin" &
        " already exists, not redeclaring")
when not declared(Cxtypeoclintelsubgroupavcimeresultsinglerefstreamout):
  const
    Cxtypeoclintelsubgroupavcimeresultsinglerefstreamout* = enumcxtypekind.Cxtypeoclintelsubgroupavcimeresultsinglereferencestreamout
else:
  static :
    hint("Declaration of " &
        "Cxtypeoclintelsubgroupavcimeresultsinglerefstreamout" &
        " already exists, not redeclaring")
when not declared(Cxtypeoclintelsubgroupavcimeresultdualrefstreamout):
  const
    Cxtypeoclintelsubgroupavcimeresultdualrefstreamout* = enumcxtypekind.Cxtypeoclintelsubgroupavcimeresultdualreferencestreamout
else:
  static :
    hint("Declaration of " &
        "Cxtypeoclintelsubgroupavcimeresultdualrefstreamout" &
        " already exists, not redeclaring")
when not declared(Cxtypeoclintelsubgroupavcimesinglerefstreamin):
  const
    Cxtypeoclintelsubgroupavcimesinglerefstreamin* = enumcxtypekind.Cxtypeoclintelsubgroupavcimesinglereferencestreamin
else:
  static :
    hint("Declaration of " & "Cxtypeoclintelsubgroupavcimesinglerefstreamin" &
        " already exists, not redeclaring")
when not declared(Cxtypeoclintelsubgroupavcimedualrefstreamin):
  const
    Cxtypeoclintelsubgroupavcimedualrefstreamin* = enumcxtypekind.Cxtypeoclintelsubgroupavcimedualreferencestreamin
else:
  static :
    hint("Declaration of " & "Cxtypeoclintelsubgroupavcimedualrefstreamin" &
        " already exists, not redeclaring")
when not declared(enumcxcallingconv):
  type
    enumcxcallingconv* {.size: sizeof(cuint).} = enum
      Cxcallingconvdefault = 0, Cxcallingconvc = 1, Cxcallingconvx86stdcall = 2,
      Cxcallingconvx86fastcall = 3, Cxcallingconvx86thiscall = 4,
      Cxcallingconvx86pascal = 5, Cxcallingconvaapcs = 6,
      Cxcallingconvaapcsvfp = 7, Cxcallingconvx86regcall = 8,
      Cxcallingconvinteloclbicc = 9, Cxcallingconvwin64 = 10,
      Cxcallingconvx8664sysv = 11, Cxcallingconvx86vectorcall = 12,
      Cxcallingconvswift = 13, Cxcallingconvpreservemost = 14,
      Cxcallingconvpreserveall = 15, Cxcallingconvaarch64vectorcall = 16,
      Cxcallingconvswiftasync = 17, Cxcallingconvaarch64svepcs = 18,
      Cxcallingconvinvalid = 100, Cxcallingconvunexposed = 200
else:
  static :
    hint("Declaration of " & "enumcxcallingconv" &
        " already exists, not redeclaring")
when not declared(Cxcallingconvx8664win64):
  const
    Cxcallingconvx8664win64* = enumcxcallingconv.Cxcallingconvwin64
else:
  static :
    hint("Declaration of " & "Cxcallingconvx8664win64" &
        " already exists, not redeclaring")
when not declared(enumcxtemplateargumentkind):
  type
    enumcxtemplateargumentkind* {.size: sizeof(cuint).} = enum
      Cxtemplateargumentkindnull = 0, Cxtemplateargumentkindtype = 1,
      Cxtemplateargumentkinddeclaration = 2, Cxtemplateargumentkindnullptr = 3,
      Cxtemplateargumentkindintegral = 4, Cxtemplateargumentkindtemplate = 5,
      Cxtemplateargumentkindtemplateexpansion = 6,
      Cxtemplateargumentkindexpression = 7, Cxtemplateargumentkindpack = 8,
      Cxtemplateargumentkindinvalid = 9
else:
  static :
    hint("Declaration of " & "enumcxtemplateargumentkind" &
        " already exists, not redeclaring")
when not declared(enumcxtypenullabilitykind):
  type
    enumcxtypenullabilitykind* {.size: sizeof(cuint).} = enum
      Cxtypenullabilitynonnull = 0, Cxtypenullabilitynullable = 1,
      Cxtypenullabilityunspecified = 2, Cxtypenullabilityinvalid = 3,
      Cxtypenullabilitynullableresult = 4
else:
  static :
    hint("Declaration of " & "enumcxtypenullabilitykind" &
        " already exists, not redeclaring")
when not declared(enumcxtypelayouterror):
  type
    enumcxtypelayouterror* {.size: sizeof(cint).} = enum
      Cxtypelayouterrorundeduced = -6, Cxtypelayouterrorinvalidfieldname = -5,
      Cxtypelayouterrornotconstantsize = -4, Cxtypelayouterrordependent = -3,
      Cxtypelayouterrorincomplete = -2, Cxtypelayouterrorinvalid = -1
else:
  static :
    hint("Declaration of " & "enumcxtypelayouterror" &
        " already exists, not redeclaring")
when not declared(enumcxrefqualifierkind):
  type
    enumcxrefqualifierkind* {.size: sizeof(cuint).} = enum
      Cxrefqualifiernone = 0, Cxrefqualifierlvalue = 1, Cxrefqualifierrvalue = 2
else:
  static :
    hint("Declaration of " & "enumcxrefqualifierkind" &
        " already exists, not redeclaring")
when not declared(enumcxcxxaccessspecifier):
  type
    enumcxcxxaccessspecifier* {.size: sizeof(cuint).} = enum
      Cxcxxinvalidaccessspecifier = 0, Cxcxxpublic = 1, Cxcxxprotected = 2,
      Cxcxxprivate = 3
else:
  static :
    hint("Declaration of " & "enumcxcxxaccessspecifier" &
        " already exists, not redeclaring")
when not declared(enumcxstorageclass):
  type
    enumcxstorageclass* {.size: sizeof(cuint).} = enum
      Cxscinvalid = 0, Cxscnone = 1, Cxscextern = 2, Cxscstatic = 3,
      Cxscprivateextern = 4, Cxscopenclworkgrouplocal = 5, Cxscauto = 6,
      Cxscregister = 7
else:
  static :
    hint("Declaration of " & "enumcxstorageclass" &
        " already exists, not redeclaring")
when not declared(enumcxchildvisitresult):
  type
    enumcxchildvisitresult* {.size: sizeof(cuint).} = enum
      Cxchildvisitbreak = 0, Cxchildvisitcontinue = 1, Cxchildvisitrecurse = 2
else:
  static :
    hint("Declaration of " & "enumcxchildvisitresult" &
        " already exists, not redeclaring")
when not declared(enumcxprintingpolicyproperty):
  type
    enumcxprintingpolicyproperty* {.size: sizeof(cuint).} = enum
      Cxprintingpolicyindentation = 0, Cxprintingpolicysuppressspecifiers = 1,
      Cxprintingpolicysuppresstagkeyword = 2,
      Cxprintingpolicyincludetagdefinition = 3,
      Cxprintingpolicysuppressscope = 4,
      Cxprintingpolicysuppressunwrittenscope = 5,
      Cxprintingpolicysuppressinitializers = 6,
      Cxprintingpolicyconstantarraysizeaswritten = 7,
      Cxprintingpolicyanonymoustaglocations = 8,
      Cxprintingpolicysuppressstronglifetime = 9,
      Cxprintingpolicysuppresslifetimequalifiers = 10,
      Cxprintingpolicysuppresstemplateargsincxxconstructors = 11,
      Cxprintingpolicybool = 12, Cxprintingpolicyrestrict = 13,
      Cxprintingpolicyalignof = 14, Cxprintingpolicyunderscorealignof = 15,
      Cxprintingpolicyusevoidforzeroparams = 16,
      Cxprintingpolicyterseoutput = 17,
      Cxprintingpolicypolishfordeclaration = 18, Cxprintingpolicyhalf = 19,
      Cxprintingpolicymswchar = 20, Cxprintingpolicyincludenewlines = 21,
      Cxprintingpolicymsvcformatting = 22,
      Cxprintingpolicyconstantsaswritten = 23,
      Cxprintingpolicysuppressimplicitbase = 24,
      Cxprintingpolicyfullyqualifiedname = 25
else:
  static :
    hint("Declaration of " & "enumcxprintingpolicyproperty" &
        " already exists, not redeclaring")
when not declared(Cxprintingpolicylastproperty):
  const
    Cxprintingpolicylastproperty* = enumcxprintingpolicyproperty.Cxprintingpolicyfullyqualifiedname
else:
  static :
    hint("Declaration of " & "Cxprintingpolicylastproperty" &
        " already exists, not redeclaring")
when not declared(enumcxobjcpropertyattrkind):
  type
    enumcxobjcpropertyattrkind* {.size: sizeof(cuint).} = enum
      Cxobjcpropertyattrnoattr = 0, Cxobjcpropertyattrreadonly = 1,
      Cxobjcpropertyattrgetter = 2, Cxobjcpropertyattrassign = 4,
      Cxobjcpropertyattrreadwrite = 8, Cxobjcpropertyattrretain = 16,
      Cxobjcpropertyattrcopy = 32, Cxobjcpropertyattrnonatomic = 64,
      Cxobjcpropertyattrsetter = 128, Cxobjcpropertyattratomic = 256,
      Cxobjcpropertyattrweak = 512, Cxobjcpropertyattrstrong = 1024,
      Cxobjcpropertyattrunsafeunretained = 2048, Cxobjcpropertyattrclass = 4096
else:
  static :
    hint("Declaration of " & "enumcxobjcpropertyattrkind" &
        " already exists, not redeclaring")
when not declared(enumcxobjcdeclqualifierkind):
  type
    enumcxobjcdeclqualifierkind* {.size: sizeof(cuint).} = enum
      Cxobjcdeclqualifiernone = 0, Cxobjcdeclqualifierin = 1,
      Cxobjcdeclqualifierinout = 2, Cxobjcdeclqualifierout = 4,
      Cxobjcdeclqualifierbycopy = 8, Cxobjcdeclqualifierbyref = 16,
      Cxobjcdeclqualifieroneway = 32
else:
  static :
    hint("Declaration of " & "enumcxobjcdeclqualifierkind" &
        " already exists, not redeclaring")
when not declared(enumcxnamerefflags):
  type
    enumcxnamerefflags* {.size: sizeof(cuint).} = enum
      Cxnamerangewantqualifier = 1, Cxnamerangewanttemplateargs = 2,
      Cxnamerangewantsinglepiece = 4
else:
  static :
    hint("Declaration of " & "enumcxnamerefflags" &
        " already exists, not redeclaring")
when not declared(enumcxtokenkind):
  type
    enumcxtokenkind* {.size: sizeof(cuint).} = enum
      Cxtokenpunctuation = 0, Cxtokenkeyword = 1, Cxtokenidentifier = 2,
      Cxtokenliteral = 3, Cxtokencomment = 4
else:
  static :
    hint("Declaration of " & "enumcxtokenkind" &
        " already exists, not redeclaring")
when not declared(enumcxcompletionchunkkind):
  type
    enumcxcompletionchunkkind* {.size: sizeof(cuint).} = enum
      Cxcompletionchunkoptional = 0, Cxcompletionchunktypedtext = 1,
      Cxcompletionchunktext = 2, Cxcompletionchunkplaceholder = 3,
      Cxcompletionchunkinformative = 4, Cxcompletionchunkcurrentparameter = 5,
      Cxcompletionchunkleftparen = 6, Cxcompletionchunkrightparen = 7,
      Cxcompletionchunkleftbracket = 8, Cxcompletionchunkrightbracket = 9,
      Cxcompletionchunkleftbrace = 10, Cxcompletionchunkrightbrace = 11,
      Cxcompletionchunkleftangle = 12, Cxcompletionchunkrightangle = 13,
      Cxcompletionchunkcomma = 14, Cxcompletionchunkresulttype = 15,
      Cxcompletionchunkcolon = 16, Cxcompletionchunksemicolon = 17,
      Cxcompletionchunkequal = 18, Cxcompletionchunkhorizontalspace = 19,
      Cxcompletionchunkverticalspace = 20
else:
  static :
    hint("Declaration of " & "enumcxcompletionchunkkind" &
        " already exists, not redeclaring")
when not declared(enumcxcodecompleteflags):
  type
    enumcxcodecompleteflags* {.size: sizeof(cuint).} = enum
      Cxcodecompleteincludemacros = 1, Cxcodecompleteincludecodepatterns = 2,
      Cxcodecompleteincludebriefcomments = 4, Cxcodecompleteskippreamble = 8,
      Cxcodecompleteincludecompletionswithfixits = 16
else:
  static :
    hint("Declaration of " & "enumcxcodecompleteflags" &
        " already exists, not redeclaring")
when not declared(enumcxcompletioncontext):
  type
    enumcxcompletioncontext* {.size: sizeof(cuint).} = enum
      Cxcompletioncontextunexposed = 0, Cxcompletioncontextanytype = 1,
      Cxcompletioncontextanyvalue = 2, Cxcompletioncontextobjcobjectvalue = 4,
      Cxcompletioncontextobjcselectorvalue = 8,
      Cxcompletioncontextcxxclasstypevalue = 16,
      Cxcompletioncontextdotmemberaccess = 32,
      Cxcompletioncontextarrowmemberaccess = 64,
      Cxcompletioncontextobjcpropertyaccess = 128,
      Cxcompletioncontextenumtag = 256, Cxcompletioncontextuniontag = 512,
      Cxcompletioncontextstructtag = 1024, Cxcompletioncontextclasstag = 2048,
      Cxcompletioncontextnamespace = 4096,
      Cxcompletioncontextnestednamespecifier = 8192,
      Cxcompletioncontextobjcinterface = 16384,
      Cxcompletioncontextobjcprotocol = 32768,
      Cxcompletioncontextobjccategory = 65536,
      Cxcompletioncontextobjcinstancemessage = 131072,
      Cxcompletioncontextobjcclassmessage = 262144,
      Cxcompletioncontextobjcselectorname = 524288,
      Cxcompletioncontextmacroname = 1048576,
      Cxcompletioncontextnaturallanguage = 2097152,
      Cxcompletioncontextincludedfile = 4194304,
      Cxcompletioncontextunknown = 8388607
else:
  static :
    hint("Declaration of " & "enumcxcompletioncontext" &
        " already exists, not redeclaring")
when not declared(enumcxevalresultkind):
  type
    enumcxevalresultkind* {.size: sizeof(cuint).} = enum
      Cxevalunexposed = 0, Cxevalint = 1, Cxevalfloat = 2,
      Cxevalobjcstrliteral = 3, Cxevalstrliteral = 4, Cxevalcfstr = 5,
      Cxevalother = 6
else:
  static :
    hint("Declaration of " & "enumcxevalresultkind" &
        " already exists, not redeclaring")
when not declared(enumcxvisitorresult):
  type
    enumcxvisitorresult* {.size: sizeof(cuint).} = enum
      Cxvisitbreak = 0, Cxvisitcontinue = 1
else:
  static :
    hint("Declaration of " & "enumcxvisitorresult" &
        " already exists, not redeclaring")
when not declared(enumcxresult):
  type
    enumcxresult* {.size: sizeof(cuint).} = enum
      Cxresultsuccess = 0, Cxresultinvalid = 1, Cxresultvisitbreak = 2
else:
  static :
    hint("Declaration of " & "enumcxresult" & " already exists, not redeclaring")
when not declared(enumcxidxentitykind):
  type
    enumcxidxentitykind* {.size: sizeof(cuint).} = enum
      Cxidxentityunexposed = 0, Cxidxentitytypedef = 1, Cxidxentityfunction = 2,
      Cxidxentityvariable = 3, Cxidxentityfield = 4,
      Cxidxentityenumconstant = 5, Cxidxentityobjcclass = 6,
      Cxidxentityobjcprotocol = 7, Cxidxentityobjccategory = 8,
      Cxidxentityobjcinstancemethod = 9, Cxidxentityobjcclassmethod = 10,
      Cxidxentityobjcproperty = 11, Cxidxentityobjcivar = 12,
      Cxidxentityenum = 13, Cxidxentitystruct = 14, Cxidxentityunion = 15,
      Cxidxentitycxxclass = 16, Cxidxentitycxxnamespace = 17,
      Cxidxentitycxxnamespacealias = 18, Cxidxentitycxxstaticvariable = 19,
      Cxidxentitycxxstaticmethod = 20, Cxidxentitycxxinstancemethod = 21,
      Cxidxentitycxxconstructor = 22, Cxidxentitycxxdestructor = 23,
      Cxidxentitycxxconversionfunction = 24, Cxidxentitycxxtypealias = 25,
      Cxidxentitycxxinterface = 26, Cxidxentitycxxconcept = 27
else:
  static :
    hint("Declaration of " & "enumcxidxentitykind" &
        " already exists, not redeclaring")
when not declared(enumcxidxentitylanguage):
  type
    enumcxidxentitylanguage* {.size: sizeof(cuint).} = enum
      Cxidxentitylangnone = 0, Cxidxentitylangc = 1, Cxidxentitylangobjc = 2,
      Cxidxentitylangcxx = 3, Cxidxentitylangswift = 4
else:
  static :
    hint("Declaration of " & "enumcxidxentitylanguage" &
        " already exists, not redeclaring")
when not declared(enumcxidxentitycxxtemplatekind):
  type
    enumcxidxentitycxxtemplatekind* {.size: sizeof(cuint).} = enum
      Cxidxentitynontemplate = 0, Cxidxentitytemplate = 1,
      Cxidxentitytemplatepartialspecialization = 2,
      Cxidxentitytemplatespecialization = 3
else:
  static :
    hint("Declaration of " & "enumcxidxentitycxxtemplatekind" &
        " already exists, not redeclaring")
when not declared(enumcxidxattrkind):
  type
    enumcxidxattrkind* {.size: sizeof(cuint).} = enum
      Cxidxattrunexposed = 0, Cxidxattribaction = 1, Cxidxattriboutlet = 2,
      Cxidxattriboutletcollection = 3
else:
  static :
    hint("Declaration of " & "enumcxidxattrkind" &
        " already exists, not redeclaring")
when not declared(enumcxidxdeclinfoflags):
  type
    enumcxidxdeclinfoflags* {.size: sizeof(cuint).} = enum
      Cxidxdeclflagskipped = 1
else:
  static :
    hint("Declaration of " & "enumcxidxdeclinfoflags" &
        " already exists, not redeclaring")
when not declared(enumcxidxobjccontainerkind):
  type
    enumcxidxobjccontainerkind* {.size: sizeof(cuint).} = enum
      Cxidxobjccontainerforwardref = 0, Cxidxobjccontainerinterface = 1,
      Cxidxobjccontainerimplementation = 2
else:
  static :
    hint("Declaration of " & "enumcxidxobjccontainerkind" &
        " already exists, not redeclaring")
when not declared(enumcxidxentityrefkind):
  type
    enumcxidxentityrefkind* {.size: sizeof(cuint).} = enum
      Cxidxentityrefdirect = 1, Cxidxentityrefimplicit = 2
else:
  static :
    hint("Declaration of " & "enumcxidxentityrefkind" &
        " already exists, not redeclaring")
when not declared(enumcxsymbolrole):
  type
    enumcxsymbolrole* {.size: sizeof(cuint).} = enum
      Cxsymbolrolenone = 0, Cxsymbolroledeclaration = 1,
      Cxsymbolroledefinition = 2, Cxsymbolrolereference = 4,
      Cxsymbolroleread = 8, Cxsymbolrolewrite = 16, Cxsymbolrolecall = 32,
      Cxsymbolroledynamic = 64, Cxsymbolroleaddressof = 128,
      Cxsymbolroleimplicit = 256
else:
  static :
    hint("Declaration of " & "enumcxsymbolrole" &
        " already exists, not redeclaring")
when not declared(enumcxindexoptflags):
  type
    enumcxindexoptflags* {.size: sizeof(cuint).} = enum
      Cxindexoptnone = 0, Cxindexoptsuppressredundantrefs = 1,
      Cxindexoptindexfunctionlocalsymbols = 2,
      Cxindexoptindeximplicittemplateinstantiations = 4,
      Cxindexoptsuppresswarnings = 8, Cxindexoptskipparsedbodiesinsession = 16
else:
  static :
    hint("Declaration of " & "enumcxindexoptflags" &
        " already exists, not redeclaring")
when not declared(enumcxbinaryoperatorkind):
  type
    enumcxbinaryoperatorkind* {.size: sizeof(cuint).} = enum
      Cxbinaryoperatorinvalid = 0, Cxbinaryoperatorptrmemd = 1,
      Cxbinaryoperatorptrmemi = 2, Cxbinaryoperatormul = 3,
      Cxbinaryoperatordiv = 4, Cxbinaryoperatorrem = 5, Cxbinaryoperatoradd = 6,
      Cxbinaryoperatorsub = 7, Cxbinaryoperatorshl = 8, Cxbinaryoperatorshr = 9,
      Cxbinaryoperatorcmp = 10, Cxbinaryoperatorlt = 11,
      Cxbinaryoperatorgt = 12, Cxbinaryoperatorle = 13, Cxbinaryoperatorge = 14,
      Cxbinaryoperatoreq = 15, Cxbinaryoperatorne = 16,
      Cxbinaryoperatorand = 17, Cxbinaryoperatorxor = 18,
      Cxbinaryoperatoror = 19, Cxbinaryoperatorland = 20,
      Cxbinaryoperatorlor = 21, Cxbinaryoperatorassign = 22,
      Cxbinaryoperatormulassign = 23, Cxbinaryoperatordivassign = 24,
      Cxbinaryoperatorremassign = 25, Cxbinaryoperatoraddassign = 26,
      Cxbinaryoperatorsubassign = 27, Cxbinaryoperatorshlassign = 28,
      Cxbinaryoperatorshrassign = 29, Cxbinaryoperatorandassign = 30,
      Cxbinaryoperatorxorassign = 31, Cxbinaryoperatororassign = 32,
      Cxbinaryoperatorcomma = 33
else:
  static :
    hint("Declaration of " & "enumcxbinaryoperatorkind" &
        " already exists, not redeclaring")
when not declared(enumcxunaryoperatorkind):
  type
    enumcxunaryoperatorkind* {.size: sizeof(cuint).} = enum
      Cxunaryoperatorinvalid = 0, Cxunaryoperatorpostinc = 1,
      Cxunaryoperatorpostdec = 2, Cxunaryoperatorpreinc = 3,
      Cxunaryoperatorpredec = 4, Cxunaryoperatoraddrof = 5,
      Cxunaryoperatorderef = 6, Cxunaryoperatorplus = 7,
      Cxunaryoperatorminus = 8, Cxunaryoperatornot = 9,
      Cxunaryoperatorlnot = 10, Cxunaryoperatorreal = 11,
      Cxunaryoperatorimag = 12, Cxunaryoperatorextension = 13,
      Cxunaryoperatorcoawait = 14
else:
  static :
    hint("Declaration of " & "enumcxunaryoperatorkind" &
        " already exists, not redeclaring")
when not declared(enumcxcommentkind):
  type
    enumcxcommentkind* {.size: sizeof(cuint).} = enum
      Cxcommentnull = 0, Cxcommenttext = 1, Cxcommentinlinecommand = 2,
      Cxcommenthtmlstarttag = 3, Cxcommenthtmlendtag = 4,
      Cxcommentparagraph = 5, Cxcommentblockcommand = 6,
      Cxcommentparamcommand = 7, Cxcommenttparamcommand = 8,
      Cxcommentverbatimblockcommand = 9, Cxcommentverbatimblockline = 10,
      Cxcommentverbatimline = 11, Cxcommentfullcomment = 12
else:
  static :
    hint("Declaration of " & "enumcxcommentkind" &
        " already exists, not redeclaring")
when not declared(enumcxcommentinlinecommandrenderkind):
  type
    enumcxcommentinlinecommandrenderkind* {.size: sizeof(cuint).} = enum
      Cxcommentinlinecommandrenderkindnormal = 0,
      Cxcommentinlinecommandrenderkindbold = 1,
      Cxcommentinlinecommandrenderkindmonospaced = 2,
      Cxcommentinlinecommandrenderkindemphasized = 3,
      Cxcommentinlinecommandrenderkindanchor = 4
else:
  static :
    hint("Declaration of " & "enumcxcommentinlinecommandrenderkind" &
        " already exists, not redeclaring")
when not declared(enumcxcommentparampassdirection):
  type
    enumcxcommentparampassdirection* {.size: sizeof(cuint).} = enum
      Cxcommentparampassdirectionin = 0, Cxcommentparampassdirectionout = 1,
      Cxcommentparampassdirectioninout = 2
else:
  static :
    hint("Declaration of " & "enumcxcommentparampassdirection" &
        " already exists, not redeclaring")
when not declared(structcxtranslationunitimpl):
  type
    structcxtranslationunitimpl* = distinct object
else:
  static :
    hint("Declaration of " & "structcxtranslationunitimpl" &
        " already exists, not redeclaring")
when not declared(structcxcursorsetimpl):
  type
    structcxcursorsetimpl* = distinct object
else:
  static :
    hint("Declaration of " & "structcxcursorsetimpl" &
        " already exists, not redeclaring")
when not declared(Llvmclangcstrictprototypesend):
  type
    Llvmclangcstrictprototypesend* = distinct object
else:
  static :
    hint("Declaration of " & "Llvmclangcstrictprototypesend" &
        " already exists, not redeclaring")
when not declared(Llvmclangcstrictprototypesbegin):
  type
    Llvmclangcstrictprototypesbegin* = distinct object
else:
  static :
    hint("Declaration of " & "Llvmclangcstrictprototypesbegin" &
        " already exists, not redeclaring")
when not declared(structcxmodulemapdescriptorimpl):
  type
    structcxmodulemapdescriptorimpl* = distinct object
else:
  static :
    hint("Declaration of " & "structcxmodulemapdescriptorimpl" &
        " already exists, not redeclaring")
when not declared(structcxtargetinfoimpl):
  type
    structcxtargetinfoimpl* = distinct object
else:
  static :
    hint("Declaration of " & "structcxtargetinfoimpl" &
        " already exists, not redeclaring")
when not declared(structcxchildvisitresult):
  type
    structcxchildvisitresult* = distinct object
else:
  static :
    hint("Declaration of " & "structcxchildvisitresult" &
        " already exists, not redeclaring")
when not declared(structcxcursorandrangevisitorblock):
  type
    structcxcursorandrangevisitorblock* = distinct object
else:
  static :
    hint("Declaration of " & "structcxcursorandrangevisitorblock" &
        " already exists, not redeclaring")
when not declared(structcxvirtualfileoverlayimpl):
  type
    structcxvirtualfileoverlayimpl* = distinct object
else:
  static :
    hint("Declaration of " & "structcxvirtualfileoverlayimpl" &
        " already exists, not redeclaring")
when not declared(structcxapisetimpl):
  type
    structcxapisetimpl* = distinct object
else:
  static :
    hint("Declaration of " & "structcxapisetimpl" &
        " already exists, not redeclaring")
type
  structcxstring_520094057 {.pure, inheritable, bycopy.} = object
    data*: pointer           ## Generated based on /usr/include/clang-c/CXString.h:37:9
    privateflags*: cuint

  Cxstring_520094059 = structcxstring_520094058 ## Generated based on /usr/include/clang-c/CXString.h:40:3
  structcxstringset_520094061 {.pure, inheritable, bycopy.} = object
    Strings*: ptr Cxstring_520094060 ## Generated based on /usr/include/clang-c/CXString.h:42:9
    Count*: cuint

  Cxstringset_520094063 = structcxstringset_520094062 ## Generated based on /usr/include/clang-c/CXString.h:45:3
  Cxvirtualfileoverlay_520094065 = ptr structcxvirtualfileoverlayimpl ## Generated based on /usr/include/clang-c/BuildSystem.h:39:42
  Cxmodulemapdescriptor_520094067 = ptr structcxmodulemapdescriptorimpl ## Generated based on /usr/include/clang-c/BuildSystem.h:100:43
  Cxcompilationdatabase_520094069 = pointer ## Generated based on /usr/include/clang-c/CXCompilationDatabase.h:37:16
  Cxcompilecommands_520094071 = pointer ## Generated based on /usr/include/clang-c/CXCompilationDatabase.h:48:16
  Cxcompilecommand_520094073 = pointer ## Generated based on /usr/include/clang-c/CXCompilationDatabase.h:53:16
  Cxcompilationdatabaseerror_520094077 = enumcxcompilationdatabaseerror_520094076 ## Generated based on /usr/include/clang-c/CXCompilationDatabase.h:69:3
  Cxfile_520094079 = pointer ## Generated based on /usr/include/clang-c/CXFile.h:34:15
  timet_520094081 = compilertimet_520094414 ## Generated based on /usr/include/bits/types/time_t.h:10:18
  structcxfileuniqueid_520094083 {.pure, inheritable, bycopy.} = object
    data*: array[3'i64, culonglong] ## Generated based on /usr/include/clang-c/CXFile.h:50:9
  
  Cxfileuniqueid_520094085 = structcxfileuniqueid_520094084 ## Generated based on /usr/include/clang-c/CXFile.h:52:3
  structcxsourcelocation_520094087 {.pure, inheritable, bycopy.} = object
    ptrdata*: array[2'i64, pointer] ## Generated based on /usr/include/clang-c/CXSourceLocation.h:44:9
    intdata*: cuint

  Cxsourcelocation_520094089 = structcxsourcelocation_520094088 ## Generated based on /usr/include/clang-c/CXSourceLocation.h:47:3
  structcxsourcerange_520094091 {.pure, inheritable, bycopy.} = object
    ptrdata*: array[2'i64, pointer] ## Generated based on /usr/include/clang-c/CXSourceLocation.h:55:9
    beginintdata*: cuint
    endintdata*: cuint

  Cxsourcerange_520094093 = structcxsourcerange_520094092 ## Generated based on /usr/include/clang-c/CXSourceLocation.h:59:3
  structcxsourcerangelist_520094095 {.pure, inheritable, bycopy.} = object
    count*: cuint            ## Generated based on /usr/include/clang-c/CXSourceLocation.h:266:9
    ranges*: ptr Cxsourcerange_520094094

  Cxsourcerangelist_520094097 = structcxsourcerangelist_520094096 ## Generated based on /usr/include/clang-c/CXSourceLocation.h:273:3
  Cxdiagnostic_520094101 = pointer ## Generated based on /usr/include/clang-c/CXDiagnostic.h:69:15
  Cxdiagnosticset_520094103 = pointer ## Generated based on /usr/include/clang-c/CXDiagnostic.h:74:15
  Cxindex_520094109 = pointer ## Generated based on /usr/include/clang-c/Index.h:80:15
  Cxtargetinfo_520094111 = ptr structcxtargetinfoimpl ## Generated based on /usr/include/clang-c/Index.h:86:34
  Cxtranslationunit_520094113 = ptr structcxtranslationunitimpl ## Generated based on /usr/include/clang-c/Index.h:91:39
  Cxclientdata_520094115 = pointer ## Generated based on /usr/include/clang-c/Index.h:97:15
  structcxunsavedfile_520094117 {.pure, inheritable, bycopy.} = object
    Filename*: cstring       ## Generated based on /usr/include/clang-c/Index.h:106:8
    Contents*: cstring
    Length*: culong

  structcxversion_520094121 {.pure, inheritable, bycopy.} = object
    Major*: cint             ## Generated based on /usr/include/clang-c/Index.h:154:16
    Minor*: cint
    Subminor*: cint

  Cxversion_520094123 = structcxversion_520094122 ## Generated based on /usr/include/clang-c/Index.h:172:3
  Cxchoice_520094129 = enumcxchoice_520094128 ## Generated based on /usr/include/clang-c/Index.h:296:3
  Cxglobaloptflags_520094140 = enumcxglobaloptflags_520094139 ## Generated based on /usr/include/clang-c/Index.h:330:3
  structcxindexoptions_520094142 {.pure, inheritable, bycopy.} = object
    Size*: cuint             ## Generated based on /usr/include/clang-c/Index.h:353:16
    Threadbackgroundpriorityforindexing*: uint8
    Threadbackgroundpriorityforediting*: uint8
    Excludedeclarationsfrompch* {.bitsize: 1'i64.}: cuint
    Displaydiagnostics* {.bitsize: 1'i64.}: cuint
    Storepreamblesinmemory* {.bitsize: 1'i64.}: cuint
    anon0* {.bitsize: 13'i64.}: cuint
    Preamblestoragepath*: cstring
    Invocationemissionpath*: cstring

  Cxindexoptions_520094144 = structcxindexoptions_520094143 ## Generated based on /usr/include/clang-c/Index.h:401:3
  structcxturesourceusageentry_520094156 {.pure, inheritable, bycopy.} = object
    kind*: enumcxturesourceusagekind_520094155 ## Generated based on /usr/include/clang-c/Index.h:1119:16
    amount*: culong

  Cxturesourceusageentry_520094158 = structcxturesourceusageentry_520094157 ## Generated based on /usr/include/clang-c/Index.h:1125:3
  structcxturesourceusage_520094160 {.pure, inheritable, bycopy.} = object
    data*: pointer           ## Generated based on /usr/include/clang-c/Index.h:1130:16
    numentries*: cuint
    entries*: ptr Cxturesourceusageentry_520094159

  Cxturesourceusage_520094162 = structcxturesourceusage_520094161 ## Generated based on /usr/include/clang-c/Index.h:1141:3
  structcxcursor_520094166 {.pure, inheritable, bycopy.} = object
    kind*: enumcxcursorkind_520094165 ## Generated based on /usr/include/clang-c/Index.h:2255:9
    xdata*: cint
    data*: array[3'i64, pointer]

  Cxcursor_520094168 = structcxcursor_520094167 ## Generated based on /usr/include/clang-c/Index.h:2259:3
  structcxplatformavailability_520094174 {.pure, inheritable, bycopy.} = object
    Platform*: Cxstring_520094060 ## Generated based on /usr/include/clang-c/Index.h:2436:16
    Introduced*: Cxversion_520094124
    Deprecated*: Cxversion_520094124
    Obsoleted*: Cxversion_520094124
    Unavailable*: cint
    Message*: Cxstring_520094060

  Cxplatformavailability_520094176 = structcxplatformavailability_520094175 ## Generated based on /usr/include/clang-c/Index.h:2467:3
  Cxcursorset_520094182 = ptr structcxcursorsetimpl ## Generated based on /usr/include/clang-c/Index.h:2571:33
  structcxtype_520094188 {.pure, inheritable, bycopy.} = object
    kind*: enumcxtypekind_520094185 ## Generated based on /usr/include/clang-c/Index.h:2988:9
    data*: array[2'i64, pointer]

  Cxtype_520094190 = structcxtype_520094189 ## Generated based on /usr/include/clang-c/Index.h:2991:3
  Cxcursorvisitor_520094206 = proc (a0: Cxcursor_520094169; a1: Cxcursor_520094169;
                                    a2: Cxclientdata_520094116): enumcxchildvisitresult_520094205 {.
      cdecl.}                ## Generated based on /usr/include/clang-c/Index.h:3834:35
  Cxcursorvisitorblock_520094208 = ptr structcxchildvisitresult ## Generated based on /usr/include/clang-c/Index.h:3877:37
  Cxprintingpolicy_520094210 = pointer ## Generated based on /usr/include/clang-c/Index.h:3975:15
  Cxobjcpropertyattrkind_520094216 = enumcxobjcpropertyattrkind_520094215 ## Generated based on /usr/include/clang-c/Index.h:4188:3
  Cxobjcdeclqualifierkind_520094220 = enumcxobjcdeclqualifierkind_520094219 ## Generated based on /usr/include/clang-c/Index.h:4224:3
  Cxmodule_520094222 = pointer ## Generated based on /usr/include/clang-c/Index.h:4322:15
  Cxtokenkind_520094228 = enumcxtokenkind_520094227 ## Generated based on /usr/include/clang-c/Index.h:4709:3
  structcxtoken_520094230 {.pure, inheritable, bycopy.} = object
    intdata*: array[4'i64, cuint] ## Generated based on /usr/include/clang-c/Index.h:4714:9
    ptrdata*: pointer

  Cxtoken_520094232 = structcxtoken_520094231 ## Generated based on /usr/include/clang-c/Index.h:4717:3
  Cxcompletionstring_520094234 = pointer ## Generated based on /usr/include/clang-c/Index.h:4867:15
  structcxcompletionresult_520094236 {.pure, inheritable, bycopy.} = object
    Cursorkind*: enumcxcursorkind_520094165 ## Generated based on /usr/include/clang-c/Index.h:4872:9
    Completionstring*: Cxcompletionstring_520094235

  Cxcompletionresult_520094238 = structcxcompletionresult_520094237 ## Generated based on /usr/include/clang-c/Index.h:4890:3
  structcxcodecompleteresults_520094242 {.pure, inheritable, bycopy.} = object
    Results*: ptr Cxcompletionresult_520094239 ## Generated based on /usr/include/clang-c/Index.h:5206:9
    Numresults*: cuint

  Cxcodecompleteresults_520094244 = structcxcodecompleteresults_520094243 ## Generated based on /usr/include/clang-c/Index.h:5217:3
  Cxinclusionvisitor_520094250 = proc (a0: Cxfile_520094080;
                                       a1: ptr Cxsourcelocation_520094090;
                                       a2: cuint; a3: Cxclientdata_520094116): void {.
      cdecl.}                ## Generated based on /usr/include/clang-c/Index.h:5672:16
  Cxevalresultkind_520094254 = enumcxevalresultkind_520094253 ## Generated based on /usr/include/clang-c/Index.h:5697:3
  Cxevalresult_520094256 = pointer ## Generated based on /usr/include/clang-c/Index.h:5702:15
  Cxremapping_520094258 = pointer ## Generated based on /usr/include/clang-c/Index.h:5773:15
  structcxcursorandrangevisitor_520094262 {.pure, inheritable, bycopy.} = object
    context*: pointer        ## Generated based on /usr/include/clang-c/Index.h:5832:16
    visit*: proc (a0: pointer; a1: Cxcursor_520094169; a2: Cxsourcerange_520094094): enumcxvisitorresult_520094261 {.
        cdecl.}

  Cxcursorandrangevisitor_520094264 = structcxcursorandrangevisitor_520094263 ## Generated based on /usr/include/clang-c/Index.h:5835:3
  Cxresult_520094268 = enumcxresult_520094267 ## Generated based on /usr/include/clang-c/Index.h:5852:3
  Cxcursorandrangevisitorblock_520094270 = ptr structcxcursorandrangevisitorblock ## Generated based on /usr/include/clang-c/Index.h:5890:47
  Cxidxclientfile_520094272 = pointer ## Generated based on /usr/include/clang-c/Index.h:5904:15
  Cxidxcliententity_520094274 = pointer ## Generated based on /usr/include/clang-c/Index.h:5909:15
  Cxidxclientcontainer_520094276 = pointer ## Generated based on /usr/include/clang-c/Index.h:5915:15
  Cxidxclientastfile_520094278 = pointer ## Generated based on /usr/include/clang-c/Index.h:5921:15
  structcxidxloc_520094280 {.pure, inheritable, bycopy.} = object
    ptrdata*: array[2'i64, pointer] ## Generated based on /usr/include/clang-c/Index.h:5926:9
    intdata*: cuint

  Cxidxloc_520094282 = structcxidxloc_520094281 ## Generated based on /usr/include/clang-c/Index.h:5929:3
  structcxidxincludedfileinfo_520094284 {.pure, inheritable, bycopy.} = object
    hashloc*: Cxidxloc_520094283 ## Generated based on /usr/include/clang-c/Index.h:5934:9
    filename*: cstring
    file*: Cxfile_520094080
    isimport*: cint
    isangled*: cint
    ismoduleimport*: cint

  Cxidxincludedfileinfo_520094286 = structcxidxincludedfileinfo_520094285 ## Generated based on /usr/include/clang-c/Index.h:5954:3
  structcxidximportedastfileinfo_520094288 {.pure, inheritable, bycopy.} = object
    file*: Cxfile_520094080  ## Generated based on /usr/include/clang-c/Index.h:5959:9
    module*: Cxmodule_520094223
    loc*: Cxidxloc_520094283
    isimplicit*: cint

  Cxidximportedastfileinfo_520094290 = structcxidximportedastfileinfo_520094289 ## Generated based on /usr/include/clang-c/Index.h:5978:3
  Cxidxentitykind_520094294 = enumcxidxentitykind_520094293 ## Generated based on /usr/include/clang-c/Index.h:6014:3
  Cxidxentitylanguage_520094298 = enumcxidxentitylanguage_520094297 ## Generated based on /usr/include/clang-c/Index.h:6022:3
  Cxidxentitycxxtemplatekind_520094302 = enumcxidxentitycxxtemplatekind_520094301 ## Generated based on /usr/include/clang-c/Index.h:6039:3
  Cxidxattrkind_520094306 = enumcxidxattrkind_520094305 ## Generated based on /usr/include/clang-c/Index.h:6046:3
  structcxidxattrinfo_520094308 {.pure, inheritable, bycopy.} = object
    kind*: Cxidxattrkind_520094307 ## Generated based on /usr/include/clang-c/Index.h:6048:9
    cursor*: Cxcursor_520094169
    loc*: Cxidxloc_520094283

  Cxidxattrinfo_520094310 = structcxidxattrinfo_520094309 ## Generated based on /usr/include/clang-c/Index.h:6052:3
  structcxidxentityinfo_520094312 {.pure, inheritable, bycopy.} = object
    kind*: Cxidxentitykind_520094295 ## Generated based on /usr/include/clang-c/Index.h:6054:9
    templatekind*: Cxidxentitycxxtemplatekind_520094303
    lang*: Cxidxentitylanguage_520094299
    name*: cstring
    Usr*: cstring
    cursor*: Cxcursor_520094169
    attributes*: ptr ptr Cxidxattrinfo_520094311
    numattributes*: cuint

  Cxidxentityinfo_520094314 = structcxidxentityinfo_520094313 ## Generated based on /usr/include/clang-c/Index.h:6063:3
  structcxidxcontainerinfo_520094316 {.pure, inheritable, bycopy.} = object
    cursor*: Cxcursor_520094169 ## Generated based on /usr/include/clang-c/Index.h:6065:9
  
  Cxidxcontainerinfo_520094318 = structcxidxcontainerinfo_520094317 ## Generated based on /usr/include/clang-c/Index.h:6067:3
  structcxidxiboutletcollectionattrinfo_520094320 {.pure, inheritable, bycopy.} = object
    attrinfo*: ptr Cxidxattrinfo_520094311 ## Generated based on /usr/include/clang-c/Index.h:6069:9
    objcclass*: ptr Cxidxentityinfo_520094315
    classcursor*: Cxcursor_520094169
    classloc*: Cxidxloc_520094283

  Cxidxiboutletcollectionattrinfo_520094322 = structcxidxiboutletcollectionattrinfo_520094321 ## Generated based on /usr/include/clang-c/Index.h:6074:3
  Cxidxdeclinfoflags_520094326 = enumcxidxdeclinfoflags_520094325 ## Generated based on /usr/include/clang-c/Index.h:6076:46
  structcxidxdeclinfo_520094328 {.pure, inheritable, bycopy.} = object
    entityinfo*: ptr Cxidxentityinfo_520094315 ## Generated based on /usr/include/clang-c/Index.h:6078:9
    cursor*: Cxcursor_520094169
    loc*: Cxidxloc_520094283
    semanticcontainer*: ptr Cxidxcontainerinfo_520094319
    lexicalcontainer*: ptr Cxidxcontainerinfo_520094319
    isredeclaration*: cint
    isdefinition*: cint
    iscontainer*: cint
    declascontainer*: ptr Cxidxcontainerinfo_520094319
    isimplicit*: cint
    attributes*: ptr ptr Cxidxattrinfo_520094311
    numattributes*: cuint
    flags*: cuint

  Cxidxdeclinfo_520094330 = structcxidxdeclinfo_520094329 ## Generated based on /usr/include/clang-c/Index.h:6102:3
  Cxidxobjccontainerkind_520094334 = enumcxidxobjccontainerkind_520094333 ## Generated based on /usr/include/clang-c/Index.h:6108:3
  structcxidxobjccontainerdeclinfo_520094336 {.pure, inheritable, bycopy.} = object
    declinfo*: ptr Cxidxdeclinfo_520094331 ## Generated based on /usr/include/clang-c/Index.h:6110:9
    kind*: Cxidxobjccontainerkind_520094335

  Cxidxobjccontainerdeclinfo_520094338 = structcxidxobjccontainerdeclinfo_520094337 ## Generated based on /usr/include/clang-c/Index.h:6113:3
  structcxidxbaseclassinfo_520094340 {.pure, inheritable, bycopy.} = object
    base*: ptr Cxidxentityinfo_520094315 ## Generated based on /usr/include/clang-c/Index.h:6115:9
    cursor*: Cxcursor_520094169
    loc*: Cxidxloc_520094283

  Cxidxbaseclassinfo_520094342 = structcxidxbaseclassinfo_520094341 ## Generated based on /usr/include/clang-c/Index.h:6119:3
  structcxidxobjcprotocolrefinfo_520094344 {.pure, inheritable, bycopy.} = object
    protocol*: ptr Cxidxentityinfo_520094315 ## Generated based on /usr/include/clang-c/Index.h:6121:9
    cursor*: Cxcursor_520094169
    loc*: Cxidxloc_520094283

  Cxidxobjcprotocolrefinfo_520094346 = structcxidxobjcprotocolrefinfo_520094345 ## Generated based on /usr/include/clang-c/Index.h:6125:3
  structcxidxobjcprotocolreflistinfo_520094348 {.pure, inheritable, bycopy.} = object
    protocols*: ptr ptr Cxidxobjcprotocolrefinfo_520094347 ## Generated based on /usr/include/clang-c/Index.h:6127:9
    numprotocols*: cuint

  Cxidxobjcprotocolreflistinfo_520094350 = structcxidxobjcprotocolreflistinfo_520094349 ## Generated based on /usr/include/clang-c/Index.h:6130:3
  structcxidxobjcinterfacedeclinfo_520094352 {.pure, inheritable, bycopy.} = object
    containerinfo*: ptr Cxidxobjccontainerdeclinfo_520094339 ## Generated based on /usr/include/clang-c/Index.h:6132:9
    superinfo*: ptr Cxidxbaseclassinfo_520094343
    protocols*: ptr Cxidxobjcprotocolreflistinfo_520094351

  Cxidxobjcinterfacedeclinfo_520094354 = structcxidxobjcinterfacedeclinfo_520094353 ## Generated based on /usr/include/clang-c/Index.h:6136:3
  structcxidxobjccategorydeclinfo_520094356 {.pure, inheritable, bycopy.} = object
    containerinfo*: ptr Cxidxobjccontainerdeclinfo_520094339 ## Generated based on /usr/include/clang-c/Index.h:6138:9
    objcclass*: ptr Cxidxentityinfo_520094315
    classcursor*: Cxcursor_520094169
    classloc*: Cxidxloc_520094283
    protocols*: ptr Cxidxobjcprotocolreflistinfo_520094351

  Cxidxobjccategorydeclinfo_520094358 = structcxidxobjccategorydeclinfo_520094357 ## Generated based on /usr/include/clang-c/Index.h:6144:3
  structcxidxobjcpropertydeclinfo_520094360 {.pure, inheritable, bycopy.} = object
    declinfo*: ptr Cxidxdeclinfo_520094331 ## Generated based on /usr/include/clang-c/Index.h:6146:9
    getter*: ptr Cxidxentityinfo_520094315
    setter*: ptr Cxidxentityinfo_520094315

  Cxidxobjcpropertydeclinfo_520094362 = structcxidxobjcpropertydeclinfo_520094361 ## Generated based on /usr/include/clang-c/Index.h:6150:3
  structcxidxcxxclassdeclinfo_520094364 {.pure, inheritable, bycopy.} = object
    declinfo*: ptr Cxidxdeclinfo_520094331 ## Generated based on /usr/include/clang-c/Index.h:6152:9
    bases*: ptr ptr Cxidxbaseclassinfo_520094343
    numbases*: cuint

  Cxidxcxxclassdeclinfo_520094366 = structcxidxcxxclassdeclinfo_520094365 ## Generated based on /usr/include/clang-c/Index.h:6156:3
  Cxidxentityrefkind_520094370 = enumcxidxentityrefkind_520094369 ## Generated based on /usr/include/clang-c/Index.h:6174:3
  Cxsymbolrole_520094374 = enumcxsymbolrole_520094373 ## Generated based on /usr/include/clang-c/Index.h:6193:3
  structcxidxentityrefinfo_520094376 {.pure, inheritable, bycopy.} = object
    kind*: Cxidxentityrefkind_520094371 ## Generated based on /usr/include/clang-c/Index.h:6198:9
    cursor*: Cxcursor_520094169
    loc*: Cxidxloc_520094283
    referencedentity*: ptr Cxidxentityinfo_520094315
    parententity*: ptr Cxidxentityinfo_520094315
    container*: ptr Cxidxcontainerinfo_520094319
    role*: Cxsymbolrole_520094375

  Cxidxentityrefinfo_520094378 = structcxidxentityrefinfo_520094377 ## Generated based on /usr/include/clang-c/Index.h:6229:3
  structindexercallbacks_520094380 {.pure, inheritable, bycopy.} = object
    abortquery*: proc (a0: Cxclientdata_520094116; a1: pointer): cint {.cdecl.} ## Generated based on /usr/include/clang-c/Index.h:6235:9
    diagnostic*: proc (a0: Cxclientdata_520094116; a1: Cxdiagnosticset_520094104;
                       a2: pointer): void {.cdecl.}
    enteredmainfile*: proc (a0: Cxclientdata_520094116; a1: Cxfile_520094080;
                            a2: pointer): Cxidxclientfile_520094273 {.cdecl.}
    ppincludedfile*: proc (a0: Cxclientdata_520094116;
                           a1: ptr Cxidxincludedfileinfo_520094287): Cxidxclientfile_520094273 {.
        cdecl.}
    importedastfile*: proc (a0: Cxclientdata_520094116;
                            a1: ptr Cxidximportedastfileinfo_520094291): Cxidxclientastfile_520094279 {.
        cdecl.}
    startedtranslationunit*: proc (a0: Cxclientdata_520094116; a1: pointer): Cxidxclientcontainer_520094277 {.
        cdecl.}
    indexdeclaration*: proc (a0: Cxclientdata_520094116; a1: ptr Cxidxdeclinfo_520094331): void {.
        cdecl.}
    indexentityreference*: proc (a0: Cxclientdata_520094116;
                                 a1: ptr Cxidxentityrefinfo_520094379): void {.
        cdecl.}

  Indexercallbacks_520094382 = structindexercallbacks_520094381 ## Generated based on /usr/include/clang-c/Index.h:6281:3
  Cxindexaction_520094384 = pointer ## Generated based on /usr/include/clang-c/Index.h:6336:15
  Cxindexoptflags_520094388 = enumcxindexoptflags_520094387 ## Generated based on /usr/include/clang-c/Index.h:6391:3
  Cxfieldvisitor_520094390 = proc (a0: Cxcursor_520094169; a1: Cxclientdata_520094116): enumcxvisitorresult_520094261 {.
      cdecl.}                ## Generated based on /usr/include/clang-c/Index.h:6488:32
  structcxcomment_520094396 {.pure, inheritable, bycopy.} = object
    Astnode*: pointer        ## Generated based on /usr/include/clang-c/Documentation.h:37:9
    Translationunit*: Cxtranslationunit_520094114

  Cxcomment_520094398 = structcxcomment_520094397 ## Generated based on /usr/include/clang-c/Documentation.h:40:3
  Cxapiset_520094406 = ptr structcxapisetimpl ## Generated based on /usr/include/clang-c/Documentation.h:554:30
  Cxrewriter_520094408 = pointer ## Generated based on /usr/include/clang-c/Rewrite.h:20:15
  compilertimet_520094413 = clong ## Generated based on /usr/include/bits/types.h:160:26
  structcxturesourceusage_520094161 = (when declared(structcxturesourceusage):
    structcxturesourceusage
   else:
    structcxturesourceusage_520094160)
  enumcxloaddiagerror_520094106 = (when declared(enumcxloaddiagerror):
    enumcxloaddiagerror
   else:
    enumcxloaddiagerror_520094105)
  Cxfile_520094080 = (when declared(Cxfile):
    Cxfile
   else:
    Cxfile_520094079)
  Cxidxclientcontainer_520094277 = (when declared(Cxidxclientcontainer):
    Cxidxclientcontainer
   else:
    Cxidxclientcontainer_520094276)
  enumcxidxentitycxxtemplatekind_520094301 = (when declared(
      enumcxidxentitycxxtemplatekind):
    enumcxidxentitycxxtemplatekind
   else:
    enumcxidxentitycxxtemplatekind_520094300)
  Cxapiset_520094407 = (when declared(Cxapiset):
    Cxapiset
   else:
    Cxapiset_520094406)
  Cxidxattrkind_520094307 = (when declared(Cxidxattrkind):
    Cxidxattrkind
   else:
    Cxidxattrkind_520094306)
  structcxidxobjcprotocolreflistinfo_520094349 = (when declared(
      structcxidxobjcprotocolreflistinfo):
    structcxidxobjcprotocolreflistinfo
   else:
    structcxidxobjcprotocolreflistinfo_520094348)
  Cxidxobjccontainerdeclinfo_520094339 = (when declared(
      Cxidxobjccontainerdeclinfo):
    Cxidxobjccontainerdeclinfo
   else:
    Cxidxobjccontainerdeclinfo_520094338)
  Cxidxobjccontainerkind_520094335 = (when declared(Cxidxobjccontainerkind):
    Cxidxobjccontainerkind
   else:
    Cxidxobjccontainerkind_520094334)
  enumcxidxdeclinfoflags_520094325 = (when declared(enumcxidxdeclinfoflags):
    enumcxidxdeclinfoflags
   else:
    enumcxidxdeclinfoflags_520094324)
  structcxidxcontainerinfo_520094317 = (when declared(structcxidxcontainerinfo):
    structcxidxcontainerinfo
   else:
    structcxidxcontainerinfo_520094316)
  enumcxbinaryoperatorkind_520094393 = (when declared(enumcxbinaryoperatorkind):
    enumcxbinaryoperatorkind
   else:
    enumcxbinaryoperatorkind_520094392)
  Cxglobaloptflags_520094141 = (when declared(Cxglobaloptflags):
    Cxglobaloptflags
   else:
    Cxglobaloptflags_520094140)
  enumcxnamerefflags_520094225 = (when declared(enumcxnamerefflags):
    enumcxnamerefflags
   else:
    enumcxnamerefflags_520094224)
  Cxsourcerange_520094094 = (when declared(Cxsourcerange):
    Cxsourcerange
   else:
    Cxsourcerange_520094093)
  Cxevalresult_520094257 = (when declared(Cxevalresult):
    Cxevalresult
   else:
    Cxevalresult_520094256)
  structcxidxentityinfo_520094313 = (when declared(structcxidxentityinfo):
    structcxidxentityinfo
   else:
    structcxidxentityinfo_520094312)
  Cxevalresultkind_520094255 = (when declared(Cxevalresultkind):
    Cxevalresultkind
   else:
    Cxevalresultkind_520094254)
  enumcxchildvisitresult_520094205 = (when declared(enumcxchildvisitresult):
    enumcxchildvisitresult
   else:
    enumcxchildvisitresult_520094204)
  Cxidxcliententity_520094275 = (when declared(Cxidxcliententity):
    Cxidxcliententity
   else:
    Cxidxcliententity_520094274)
  Cxturesourceusage_520094163 = (when declared(Cxturesourceusage):
    Cxturesourceusage
   else:
    Cxturesourceusage_520094162)
  enumcxchoice_520094128 = (when declared(enumcxchoice):
    enumcxchoice
   else:
    enumcxchoice_520094127)
  Cxresult_520094269 = (when declared(Cxresult):
    Cxresult
   else:
    Cxresult_520094268)
  enumcxcallingconv_520094187 = (when declared(enumcxcallingconv):
    enumcxcallingconv
   else:
    enumcxcallingconv_520094186)
  Cxdiagnosticset_520094104 = (when declared(Cxdiagnosticset):
    Cxdiagnosticset
   else:
    Cxdiagnosticset_520094103)
  enumcxevalresultkind_520094253 = (when declared(enumcxevalresultkind):
    enumcxevalresultkind
   else:
    enumcxevalresultkind_520094252)
  Cxvirtualfileoverlay_520094066 = (when declared(Cxvirtualfileoverlay):
    Cxvirtualfileoverlay
   else:
    Cxvirtualfileoverlay_520094065)
  enumcxvisibilitykind_520094173 = (when declared(enumcxvisibilitykind):
    enumcxvisibilitykind
   else:
    enumcxvisibilitykind_520094172)
  Cxidxentitycxxtemplatekind_520094303 = (when declared(
      Cxidxentitycxxtemplatekind):
    Cxidxentitycxxtemplatekind
   else:
    Cxidxentitycxxtemplatekind_520094302)
  Cxtargetinfo_520094112 = (when declared(Cxtargetinfo):
    Cxtargetinfo
   else:
    Cxtargetinfo_520094111)
  structcxturesourceusageentry_520094157 = (when declared(
      structcxturesourceusageentry):
    structcxturesourceusageentry
   else:
    structcxturesourceusageentry_520094156)
  enumcxidxentityrefkind_520094369 = (when declared(enumcxidxentityrefkind):
    enumcxidxentityrefkind
   else:
    enumcxidxentityrefkind_520094368)
  enumcxidxentitylanguage_520094297 = (when declared(enumcxidxentitylanguage):
    enumcxidxentitylanguage
   else:
    enumcxidxentitylanguage_520094296)
  enumcxtlskind_520094181 = (when declared(enumcxtlskind):
    enumcxtlskind
   else:
    enumcxtlskind_520094180)
  Cxindexaction_520094385 = (when declared(Cxindexaction):
    Cxindexaction
   else:
    Cxindexaction_520094384)
  Cxcompletionstring_520094235 = (when declared(Cxcompletionstring):
    Cxcompletionstring
   else:
    Cxcompletionstring_520094234)
  Cxidxentityrefinfo_520094379 = (when declared(Cxidxentityrefinfo):
    Cxidxentityrefinfo
   else:
    Cxidxentityrefinfo_520094378)
  Indexercallbacks_520094383 = (when declared(Indexercallbacks):
    Indexercallbacks
   else:
    Indexercallbacks_520094382)
  Cxidxcontainerinfo_520094319 = (when declared(Cxidxcontainerinfo):
    Cxidxcontainerinfo
   else:
    Cxidxcontainerinfo_520094318)
  Cxclientdata_520094116 = (when declared(Cxclientdata):
    Cxclientdata
   else:
    Cxclientdata_520094115)
  enumcxobjcdeclqualifierkind_520094219 = (when declared(
      enumcxobjcdeclqualifierkind):
    enumcxobjcdeclqualifierkind
   else:
    enumcxobjcdeclqualifierkind_520094218)
  Cxcompilecommands_520094072 = (when declared(Cxcompilecommands):
    Cxcompilecommands
   else:
    Cxcompilecommands_520094071)
  Cxidxobjcprotocolrefinfo_520094347 = (when declared(Cxidxobjcprotocolrefinfo):
    Cxidxobjcprotocolrefinfo
   else:
    Cxidxobjcprotocolrefinfo_520094346)
  enumcxobjcpropertyattrkind_520094215 = (when declared(
      enumcxobjcpropertyattrkind):
    enumcxobjcpropertyattrkind
   else:
    enumcxobjcpropertyattrkind_520094214)
  enumcxdiagnosticdisplayoptions_520094108 = (when declared(
      enumcxdiagnosticdisplayoptions):
    enumcxdiagnosticdisplayoptions
   else:
    enumcxdiagnosticdisplayoptions_520094107)
  Cxcompletionresult_520094239 = (when declared(Cxcompletionresult):
    Cxcompletionresult
   else:
    Cxcompletionresult_520094238)
  Cxcompilationdatabase_520094070 = (when declared(Cxcompilationdatabase):
    Cxcompilationdatabase
   else:
    Cxcompilationdatabase_520094069)
  enumcxsavetranslationunitflags_520094149 = (when declared(
      enumcxsavetranslationunitflags):
    enumcxsavetranslationunitflags
   else:
    enumcxsavetranslationunitflags_520094148)
  enumcxlanguagekind_520094179 = (when declared(enumcxlanguagekind):
    enumcxlanguagekind
   else:
    enumcxlanguagekind_520094178)
  Cxturesourceusageentry_520094159 = (when declared(Cxturesourceusageentry):
    Cxturesourceusageentry
   else:
    Cxturesourceusageentry_520094158)
  Cxtoken_520094233 = (when declared(Cxtoken):
    Cxtoken
   else:
    Cxtoken_520094232)
  Cxtranslationunit_520094114 = (when declared(Cxtranslationunit):
    Cxtranslationunit
   else:
    Cxtranslationunit_520094113)
  Cxobjcpropertyattrkind_520094217 = (when declared(Cxobjcpropertyattrkind):
    Cxobjcpropertyattrkind
   else:
    Cxobjcpropertyattrkind_520094216)
  structcxidxbaseclassinfo_520094341 = (when declared(structcxidxbaseclassinfo):
    structcxidxbaseclassinfo
   else:
    structcxidxbaseclassinfo_520094340)
  Cxcursorset_520094183 = (when declared(Cxcursorset):
    Cxcursorset
   else:
    Cxcursorset_520094182)
  Cxmodulemapdescriptor_520094068 = (when declared(Cxmodulemapdescriptor):
    Cxmodulemapdescriptor
   else:
    Cxmodulemapdescriptor_520094067)
  structcxfileuniqueid_520094084 = (when declared(structcxfileuniqueid):
    structcxfileuniqueid
   else:
    structcxfileuniqueid_520094083)
  structcxidxloc_520094281 = (when declared(structcxidxloc):
    structcxidxloc
   else:
    structcxidxloc_520094280)
  structcxcomment_520094397 = (when declared(structcxcomment):
    structcxcomment
   else:
    structcxcomment_520094396)
  structcxcursor_520094167 = (when declared(structcxcursor):
    structcxcursor
   else:
    structcxcursor_520094166)
  enumcxprintingpolicyproperty_520094213 = (when declared(
      enumcxprintingpolicyproperty):
    enumcxprintingpolicyproperty
   else:
    enumcxprintingpolicyproperty_520094212)
  enumcxtokenkind_520094227 = (when declared(enumcxtokenkind):
    enumcxtokenkind
   else:
    enumcxtokenkind_520094226)
  Cxidxloc_520094283 = (when declared(Cxidxloc):
    Cxidxloc
   else:
    Cxidxloc_520094282)
  enumcxcommentparampassdirection_520094405 = (when declared(
      enumcxcommentparampassdirection):
    enumcxcommentparampassdirection
   else:
    enumcxcommentparampassdirection_520094404)
  Cxidxdeclinfo_520094331 = (when declared(Cxidxdeclinfo):
    Cxidxdeclinfo
   else:
    Cxidxdeclinfo_520094330)
  Cxplatformavailability_520094177 = (when declared(Cxplatformavailability):
    Cxplatformavailability
   else:
    Cxplatformavailability_520094176)
  Cxidxobjcinterfacedeclinfo_520094355 = (when declared(
      Cxidxobjcinterfacedeclinfo):
    Cxidxobjcinterfacedeclinfo
   else:
    Cxidxobjcinterfacedeclinfo_520094354)
  enumcxsymbolrole_520094373 = (when declared(enumcxsymbolrole):
    enumcxsymbolrole
   else:
    enumcxsymbolrole_520094372)
  structcxidximportedastfileinfo_520094289 = (when declared(
      structcxidximportedastfileinfo):
    structcxidximportedastfileinfo
   else:
    structcxidximportedastfileinfo_520094288)
  structcxcompletionresult_520094237 = (when declared(structcxcompletionresult):
    structcxcompletionresult
   else:
    structcxcompletionresult_520094236)
  structcxstringset_520094062 = (when declared(structcxstringset):
    structcxstringset
   else:
    structcxstringset_520094061)
  structcxtype_520094189 = (when declared(structcxtype):
    structcxtype
   else:
    structcxtype_520094188)
  enumcxdiagnosticseverity_520094100 = (when declared(enumcxdiagnosticseverity):
    enumcxdiagnosticseverity
   else:
    enumcxdiagnosticseverity_520094099)
  Cxidxobjccategorydeclinfo_520094359 = (when declared(Cxidxobjccategorydeclinfo):
    Cxidxobjccategorydeclinfo
   else:
    Cxidxobjccategorydeclinfo_520094358)
  Cxremapping_520094259 = (when declared(Cxremapping):
    Cxremapping
   else:
    Cxremapping_520094258)
  Cxrewriter_520094409 = (when declared(Cxrewriter):
    Cxrewriter
   else:
    Cxrewriter_520094408)
  Cxstring_520094060 = (when declared(Cxstring):
    Cxstring
   else:
    Cxstring_520094059)
  enumcxrefqualifierkind_520094199 = (when declared(enumcxrefqualifierkind):
    enumcxrefqualifierkind
   else:
    enumcxrefqualifierkind_520094198)
  Cxidxincludedfileinfo_520094287 = (when declared(Cxidxincludedfileinfo):
    Cxidxincludedfileinfo
   else:
    Cxidxincludedfileinfo_520094286)
  Cxcursorandrangevisitor_520094265 = (when declared(Cxcursorandrangevisitor):
    Cxcursorandrangevisitor
   else:
    Cxcursorandrangevisitor_520094264)
  Cxidxattrinfo_520094311 = (when declared(Cxidxattrinfo):
    Cxidxattrinfo
   else:
    Cxidxattrinfo_520094310)
  structcxsourcelocation_520094088 = (when declared(structcxsourcelocation):
    structcxsourcelocation
   else:
    structcxsourcelocation_520094087)
  enumcxtranslationunitflags_520094147 = (when declared(
      enumcxtranslationunitflags):
    enumcxtranslationunitflags
   else:
    enumcxtranslationunitflags_520094146)
  structcxidxobjcpropertydeclinfo_520094361 = (when declared(
      structcxidxobjcpropertydeclinfo):
    structcxidxobjcpropertydeclinfo
   else:
    structcxidxobjcpropertydeclinfo_520094360)
  Cxsourcelocation_520094090 = (when declared(Cxsourcelocation):
    Cxsourcelocation
   else:
    Cxsourcelocation_520094089)
  enumcxtypekind_520094185 = (when declared(enumcxtypekind):
    enumcxtypekind
   else:
    enumcxtypekind_520094184)
  Cxprintingpolicy_520094211 = (when declared(Cxprintingpolicy):
    Cxprintingpolicy
   else:
    Cxprintingpolicy_520094210)
  structcxsourcerangelist_520094096 = (when declared(structcxsourcerangelist):
    structcxsourcerangelist
   else:
    structcxsourcerangelist_520094095)
  Cxidxentitylanguage_520094299 = (when declared(Cxidxentitylanguage):
    Cxidxentitylanguage
   else:
    Cxidxentitylanguage_520094298)
  structcxidxattrinfo_520094309 = (when declared(structcxidxattrinfo):
    structcxidxattrinfo
   else:
    structcxidxattrinfo_520094308)
  structcxunsavedfile_520094118 = (when declared(structcxunsavedfile):
    structcxunsavedfile
   else:
    structcxunsavedfile_520094117)
  Cxidxbaseclassinfo_520094343 = (when declared(Cxidxbaseclassinfo):
    Cxidxbaseclassinfo
   else:
    Cxidxbaseclassinfo_520094342)
  Cxsymbolrole_520094375 = (when declared(Cxsymbolrole):
    Cxsymbolrole
   else:
    Cxsymbolrole_520094374)
  enumcxvisitorresult_520094261 = (when declared(enumcxvisitorresult):
    enumcxvisitorresult
   else:
    enumcxvisitorresult_520094260)
  Cxcomment_520094399 = (when declared(Cxcomment):
    Cxcomment
   else:
    Cxcomment_520094398)
  Cxidxentityinfo_520094315 = (when declared(Cxidxentityinfo):
    Cxidxentityinfo
   else:
    Cxidxentityinfo_520094314)
  enumcxcommentkind_520094401 = (when declared(enumcxcommentkind):
    enumcxcommentkind
   else:
    enumcxcommentkind_520094400)
  Cxindexoptions_520094145 = (when declared(Cxindexoptions):
    Cxindexoptions
   else:
    Cxindexoptions_520094144)
  Cxchoice_520094130 = (when declared(Cxchoice):
    Cxchoice
   else:
    Cxchoice_520094129)
  structcxstring_520094058 = (when declared(structcxstring):
    structcxstring
   else:
    structcxstring_520094057)
  Cxindexoptflags_520094389 = (when declared(Cxindexoptflags):
    Cxindexoptflags
   else:
    Cxindexoptflags_520094388)
  Cxdiagnostic_520094102 = (when declared(Cxdiagnostic):
    Cxdiagnostic
   else:
    Cxdiagnostic_520094101)
  enumcxtypelayouterror_520094197 = (when declared(enumcxtypelayouterror):
    enumcxtypelayouterror
   else:
    enumcxtypelayouterror_520094196)
  Cxidxcxxclassdeclinfo_520094367 = (when declared(Cxidxcxxclassdeclinfo):
    Cxidxcxxclassdeclinfo
   else:
    Cxidxcxxclassdeclinfo_520094366)
  Cxcursorandrangevisitorblock_520094271 = (when declared(
      Cxcursorandrangevisitorblock):
    Cxcursorandrangevisitorblock
   else:
    Cxcursorandrangevisitorblock_520094270)
  structcxidxentityrefinfo_520094377 = (when declared(structcxidxentityrefinfo):
    structcxidxentityrefinfo
   else:
    structcxidxentityrefinfo_520094376)
  Cxcursorvisitor_520094207 = (when declared(Cxcursorvisitor):
    Cxcursorvisitor
   else:
    Cxcursorvisitor_520094206)
  Cxtokenkind_520094229 = (when declared(Cxtokenkind):
    Cxtokenkind
   else:
    Cxtokenkind_520094228)
  Cxidxclientfile_520094273 = (when declared(Cxidxclientfile):
    Cxidxclientfile
   else:
    Cxidxclientfile_520094272)
  enumcxresult_520094267 = (when declared(enumcxresult):
    enumcxresult
   else:
    enumcxresult_520094266)
  timet_520094082 = (when declared(timet):
    timet
   else:
    timet_520094081)
  structcxsourcerange_520094092 = (when declared(structcxsourcerange):
    structcxsourcerange
   else:
    structcxsourcerange_520094091)
  Cxidxentitykind_520094295 = (when declared(Cxidxentitykind):
    Cxidxentitykind
   else:
    Cxidxentitykind_520094294)
  enumcxlinkagekind_520094171 = (when declared(enumcxlinkagekind):
    enumcxlinkagekind
   else:
    enumcxlinkagekind_520094170)
  enumcxstorageclass_520094203 = (when declared(enumcxstorageclass):
    enumcxstorageclass
   else:
    enumcxstorageclass_520094202)
  Cxfieldvisitor_520094391 = (when declared(Cxfieldvisitor):
    Cxfieldvisitor
   else:
    Cxfieldvisitor_520094390)
  structindexercallbacks_520094381 = (when declared(structindexercallbacks):
    structindexercallbacks
   else:
    structindexercallbacks_520094380)
  compilertimet_520094414 = (when declared(compilertimet):
    compilertimet
   else:
    compilertimet_520094413)
  enumcxerrorcode_520094056 = (when declared(enumcxerrorcode):
    enumcxerrorcode
   else:
    enumcxerrorcode_520094055)
  Cxcompilationdatabaseerror_520094078 = (when declared(
      Cxcompilationdatabaseerror):
    Cxcompilationdatabaseerror
   else:
    Cxcompilationdatabaseerror_520094077)
  Cxfileuniqueid_520094086 = (when declared(Cxfileuniqueid):
    Cxfileuniqueid
   else:
    Cxfileuniqueid_520094085)
  Cxidxentityrefkind_520094371 = (when declared(Cxidxentityrefkind):
    Cxidxentityrefkind
   else:
    Cxidxentityrefkind_520094370)
  Cxversion_520094124 = (when declared(Cxversion):
    Cxversion
   else:
    Cxversion_520094123)
  structcxcodecompleteresults_520094243 = (when declared(
      structcxcodecompleteresults):
    structcxcodecompleteresults
   else:
    structcxcodecompleteresults_520094242)
  Cxcodecompleteresults_520094245 = (when declared(Cxcodecompleteresults):
    Cxcodecompleteresults
   else:
    Cxcodecompleteresults_520094244)
  structcxidxobjccategorydeclinfo_520094357 = (when declared(
      structcxidxobjccategorydeclinfo):
    structcxidxobjccategorydeclinfo
   else:
    structcxidxobjccategorydeclinfo_520094356)
  enumcxcompletionchunkkind_520094241 = (when declared(enumcxcompletionchunkkind):
    enumcxcompletionchunkkind
   else:
    enumcxcompletionchunkkind_520094240)
  Cxidxiboutletcollectionattrinfo_520094323 = (when declared(
      Cxidxiboutletcollectionattrinfo):
    Cxidxiboutletcollectionattrinfo
   else:
    Cxidxiboutletcollectionattrinfo_520094322)
  Cxidximportedastfileinfo_520094291 = (when declared(Cxidximportedastfileinfo):
    Cxidximportedastfileinfo
   else:
    Cxidximportedastfileinfo_520094290)
  Cxstringset_520094064 = (when declared(Cxstringset):
    Cxstringset
   else:
    Cxstringset_520094063)
  structcxidxobjcinterfacedeclinfo_520094353 = (when declared(
      structcxidxobjcinterfacedeclinfo):
    structcxidxobjcinterfacedeclinfo
   else:
    structcxidxobjcinterfacedeclinfo_520094352)
  enumcxreparseflags_520094153 = (when declared(enumcxreparseflags):
    enumcxreparseflags
   else:
    enumcxreparseflags_520094152)
  structcxcursorandrangevisitor_520094263 = (when declared(
      structcxcursorandrangevisitor):
    structcxcursorandrangevisitor
   else:
    structcxcursorandrangevisitor_520094262)
  Cxidxclientastfile_520094279 = (when declared(Cxidxclientastfile):
    Cxidxclientastfile
   else:
    Cxidxclientastfile_520094278)
  Cxmodule_520094223 = (when declared(Cxmodule):
    Cxmodule
   else:
    Cxmodule_520094222)
  structcxidxcxxclassdeclinfo_520094365 = (when declared(
      structcxidxcxxclassdeclinfo):
    structcxidxcxxclassdeclinfo
   else:
    structcxidxcxxclassdeclinfo_520094364)
  structcxidxiboutletcollectionattrinfo_520094321 = (when declared(
      structcxidxiboutletcollectionattrinfo):
    structcxidxiboutletcollectionattrinfo
   else:
    structcxidxiboutletcollectionattrinfo_520094320)
  enumcxidxobjccontainerkind_520094333 = (when declared(
      enumcxidxobjccontainerkind):
    enumcxidxobjccontainerkind
   else:
    enumcxidxobjccontainerkind_520094332)
  Cxidxobjcpropertydeclinfo_520094363 = (when declared(Cxidxobjcpropertydeclinfo):
    Cxidxobjcpropertydeclinfo
   else:
    Cxidxobjcpropertydeclinfo_520094362)
  enumcxavailabilitykind_520094120 = (when declared(enumcxavailabilitykind):
    enumcxavailabilitykind
   else:
    enumcxavailabilitykind_520094119)
  Cxcompilecommand_520094074 = (when declared(Cxcompilecommand):
    Cxcompilecommand
   else:
    Cxcompilecommand_520094073)
  Cxindex_520094110 = (when declared(Cxindex):
    Cxindex
   else:
    Cxindex_520094109)
  Cxidxobjcprotocolreflistinfo_520094351 = (when declared(
      Cxidxobjcprotocolreflistinfo):
    Cxidxobjcprotocolreflistinfo
   else:
    Cxidxobjcprotocolreflistinfo_520094350)
  enumcxcursorexceptionspecificationkind_520094126 = (when declared(
      enumcxcursorexceptionspecificationkind):
    enumcxcursorexceptionspecificationkind
   else:
    enumcxcursorexceptionspecificationkind_520094125)
  structcxplatformavailability_520094175 = (when declared(
      structcxplatformavailability):
    structcxplatformavailability
   else:
    structcxplatformavailability_520094174)
  enumcxtemplateargumentkind_520094193 = (when declared(
      enumcxtemplateargumentkind):
    enumcxtemplateargumentkind
   else:
    enumcxtemplateargumentkind_520094192)
  enumcxcompilationdatabaseerror_520094076 = (when declared(
      enumcxcompilationdatabaseerror):
    enumcxcompilationdatabaseerror
   else:
    enumcxcompilationdatabaseerror_520094075)
  enumcxtypenullabilitykind_520094195 = (when declared(enumcxtypenullabilitykind):
    enumcxtypenullabilitykind
   else:
    enumcxtypenullabilitykind_520094194)
  enumcxcursorkind_520094165 = (when declared(enumcxcursorkind):
    enumcxcursorkind
   else:
    enumcxcursorkind_520094164)
  structcxtoken_520094231 = (when declared(structcxtoken):
    structcxtoken
   else:
    structcxtoken_520094230)
  enumcxturesourceusagekind_520094155 = (when declared(enumcxturesourceusagekind):
    enumcxturesourceusagekind
   else:
    enumcxturesourceusagekind_520094154)
  structcxidxincludedfileinfo_520094285 = (when declared(
      structcxidxincludedfileinfo):
    structcxidxincludedfileinfo
   else:
    structcxidxincludedfileinfo_520094284)
  enumcxcodecompleteflags_520094247 = (when declared(enumcxcodecompleteflags):
    enumcxcodecompleteflags
   else:
    enumcxcodecompleteflags_520094246)
  enumcxcxxaccessspecifier_520094201 = (when declared(enumcxcxxaccessspecifier):
    enumcxcxxaccessspecifier
   else:
    enumcxcxxaccessspecifier_520094200)
  structcxidxobjcprotocolrefinfo_520094345 = (when declared(
      structcxidxobjcprotocolrefinfo):
    structcxidxobjcprotocolrefinfo
   else:
    structcxidxobjcprotocolrefinfo_520094344)
  enumcxcompletioncontext_520094249 = (when declared(enumcxcompletioncontext):
    enumcxcompletioncontext
   else:
    enumcxcompletioncontext_520094248)
  Cxobjcdeclqualifierkind_520094221 = (when declared(Cxobjcdeclqualifierkind):
    Cxobjcdeclqualifierkind
   else:
    Cxobjcdeclqualifierkind_520094220)
  enumcxglobaloptflags_520094139 = (when declared(enumcxglobaloptflags):
    enumcxglobaloptflags
   else:
    enumcxglobaloptflags_520094138)
  Cxcursor_520094169 = (when declared(Cxcursor):
    Cxcursor
   else:
    Cxcursor_520094168)
  enumcxunaryoperatorkind_520094395 = (when declared(enumcxunaryoperatorkind):
    enumcxunaryoperatorkind
   else:
    enumcxunaryoperatorkind_520094394)
  enumcxidxentitykind_520094293 = (when declared(enumcxidxentitykind):
    enumcxidxentitykind
   else:
    enumcxidxentitykind_520094292)
  Cxsourcerangelist_520094098 = (when declared(Cxsourcerangelist):
    Cxsourcerangelist
   else:
    Cxsourcerangelist_520094097)
  structcxindexoptions_520094143 = (when declared(structcxindexoptions):
    structcxindexoptions
   else:
    structcxindexoptions_520094142)
  enumcxsaveerror_520094151 = (when declared(enumcxsaveerror):
    enumcxsaveerror
   else:
    enumcxsaveerror_520094150)
  Cxcursorvisitorblock_520094209 = (when declared(Cxcursorvisitorblock):
    Cxcursorvisitorblock
   else:
    Cxcursorvisitorblock_520094208)
  structcxidxobjccontainerdeclinfo_520094337 = (when declared(
      structcxidxobjccontainerdeclinfo):
    structcxidxobjccontainerdeclinfo
   else:
    structcxidxobjccontainerdeclinfo_520094336)
  enumcxindexoptflags_520094387 = (when declared(enumcxindexoptflags):
    enumcxindexoptflags
   else:
    enumcxindexoptflags_520094386)
  Cxtype_520094191 = (when declared(Cxtype):
    Cxtype
   else:
    Cxtype_520094190)
  enumcxidxattrkind_520094305 = (when declared(enumcxidxattrkind):
    enumcxidxattrkind
   else:
    enumcxidxattrkind_520094304)
  Cxidxdeclinfoflags_520094327 = (when declared(Cxidxdeclinfoflags):
    Cxidxdeclinfoflags
   else:
    Cxidxdeclinfoflags_520094326)
  Cxinclusionvisitor_520094251 = (when declared(Cxinclusionvisitor):
    Cxinclusionvisitor
   else:
    Cxinclusionvisitor_520094250)
  structcxidxdeclinfo_520094329 = (when declared(structcxidxdeclinfo):
    structcxidxdeclinfo
   else:
    structcxidxdeclinfo_520094328)
  structcxversion_520094122 = (when declared(structcxversion):
    structcxversion
   else:
    structcxversion_520094121)
  enumcxcommentinlinecommandrenderkind_520094403 = (when declared(
      enumcxcommentinlinecommandrenderkind):
    enumcxcommentinlinecommandrenderkind
   else:
    enumcxcommentinlinecommandrenderkind_520094402)
when not declared(structcxturesourceusage):
  type
    structcxturesourceusage* = structcxturesourceusage_520094160
else:
  static :
    hint("Declaration of " & "structcxturesourceusage" &
        " already exists, not redeclaring")
when not declared(Cxfile):
  type
    Cxfile* = Cxfile_520094079
else:
  static :
    hint("Declaration of " & "Cxfile" & " already exists, not redeclaring")
when not declared(Cxidxclientcontainer):
  type
    Cxidxclientcontainer* = Cxidxclientcontainer_520094276
else:
  static :
    hint("Declaration of " & "Cxidxclientcontainer" &
        " already exists, not redeclaring")
when not declared(Cxapiset):
  type
    Cxapiset* = Cxapiset_520094406
else:
  static :
    hint("Declaration of " & "Cxapiset" & " already exists, not redeclaring")
when not declared(Cxidxattrkind):
  type
    Cxidxattrkind* = Cxidxattrkind_520094306
else:
  static :
    hint("Declaration of " & "Cxidxattrkind" &
        " already exists, not redeclaring")
when not declared(structcxidxobjcprotocolreflistinfo):
  type
    structcxidxobjcprotocolreflistinfo* = structcxidxobjcprotocolreflistinfo_520094348
else:
  static :
    hint("Declaration of " & "structcxidxobjcprotocolreflistinfo" &
        " already exists, not redeclaring")
when not declared(Cxidxobjccontainerdeclinfo):
  type
    Cxidxobjccontainerdeclinfo* = Cxidxobjccontainerdeclinfo_520094338
else:
  static :
    hint("Declaration of " & "Cxidxobjccontainerdeclinfo" &
        " already exists, not redeclaring")
when not declared(Cxidxobjccontainerkind):
  type
    Cxidxobjccontainerkind* = Cxidxobjccontainerkind_520094334
else:
  static :
    hint("Declaration of " & "Cxidxobjccontainerkind" &
        " already exists, not redeclaring")
when not declared(structcxidxcontainerinfo):
  type
    structcxidxcontainerinfo* = structcxidxcontainerinfo_520094316
else:
  static :
    hint("Declaration of " & "structcxidxcontainerinfo" &
        " already exists, not redeclaring")
when not declared(Cxglobaloptflags):
  type
    Cxglobaloptflags* = Cxglobaloptflags_520094140
else:
  static :
    hint("Declaration of " & "Cxglobaloptflags" &
        " already exists, not redeclaring")
when not declared(Cxsourcerange):
  type
    Cxsourcerange* = Cxsourcerange_520094093
else:
  static :
    hint("Declaration of " & "Cxsourcerange" &
        " already exists, not redeclaring")
when not declared(Cxevalresult):
  type
    Cxevalresult* = Cxevalresult_520094256
else:
  static :
    hint("Declaration of " & "Cxevalresult" & " already exists, not redeclaring")
when not declared(structcxidxentityinfo):
  type
    structcxidxentityinfo* = structcxidxentityinfo_520094312
else:
  static :
    hint("Declaration of " & "structcxidxentityinfo" &
        " already exists, not redeclaring")
when not declared(Cxevalresultkind):
  type
    Cxevalresultkind* = Cxevalresultkind_520094254
else:
  static :
    hint("Declaration of " & "Cxevalresultkind" &
        " already exists, not redeclaring")
when not declared(Cxidxcliententity):
  type
    Cxidxcliententity* = Cxidxcliententity_520094274
else:
  static :
    hint("Declaration of " & "Cxidxcliententity" &
        " already exists, not redeclaring")
when not declared(Cxturesourceusage):
  type
    Cxturesourceusage* = Cxturesourceusage_520094162
else:
  static :
    hint("Declaration of " & "Cxturesourceusage" &
        " already exists, not redeclaring")
when not declared(Cxresult):
  type
    Cxresult* = Cxresult_520094268
else:
  static :
    hint("Declaration of " & "Cxresult" & " already exists, not redeclaring")
when not declared(Cxdiagnosticset):
  type
    Cxdiagnosticset* = Cxdiagnosticset_520094103
else:
  static :
    hint("Declaration of " & "Cxdiagnosticset" &
        " already exists, not redeclaring")
when not declared(Cxvirtualfileoverlay):
  type
    Cxvirtualfileoverlay* = Cxvirtualfileoverlay_520094065
else:
  static :
    hint("Declaration of " & "Cxvirtualfileoverlay" &
        " already exists, not redeclaring")
when not declared(Cxidxentitycxxtemplatekind):
  type
    Cxidxentitycxxtemplatekind* = Cxidxentitycxxtemplatekind_520094302
else:
  static :
    hint("Declaration of " & "Cxidxentitycxxtemplatekind" &
        " already exists, not redeclaring")
when not declared(Cxtargetinfo):
  type
    Cxtargetinfo* = Cxtargetinfo_520094111
else:
  static :
    hint("Declaration of " & "Cxtargetinfo" & " already exists, not redeclaring")
when not declared(structcxturesourceusageentry):
  type
    structcxturesourceusageentry* = structcxturesourceusageentry_520094156
else:
  static :
    hint("Declaration of " & "structcxturesourceusageentry" &
        " already exists, not redeclaring")
when not declared(Cxindexaction):
  type
    Cxindexaction* = Cxindexaction_520094384
else:
  static :
    hint("Declaration of " & "Cxindexaction" &
        " already exists, not redeclaring")
when not declared(Cxcompletionstring):
  type
    Cxcompletionstring* = Cxcompletionstring_520094234
else:
  static :
    hint("Declaration of " & "Cxcompletionstring" &
        " already exists, not redeclaring")
when not declared(Cxidxentityrefinfo):
  type
    Cxidxentityrefinfo* = Cxidxentityrefinfo_520094378
else:
  static :
    hint("Declaration of " & "Cxidxentityrefinfo" &
        " already exists, not redeclaring")
when not declared(Indexercallbacks):
  type
    Indexercallbacks* = Indexercallbacks_520094382
else:
  static :
    hint("Declaration of " & "Indexercallbacks" &
        " already exists, not redeclaring")
when not declared(Cxidxcontainerinfo):
  type
    Cxidxcontainerinfo* = Cxidxcontainerinfo_520094318
else:
  static :
    hint("Declaration of " & "Cxidxcontainerinfo" &
        " already exists, not redeclaring")
when not declared(Cxclientdata):
  type
    Cxclientdata* = Cxclientdata_520094115
else:
  static :
    hint("Declaration of " & "Cxclientdata" & " already exists, not redeclaring")
when not declared(Cxcompilecommands):
  type
    Cxcompilecommands* = Cxcompilecommands_520094071
else:
  static :
    hint("Declaration of " & "Cxcompilecommands" &
        " already exists, not redeclaring")
when not declared(Cxidxobjcprotocolrefinfo):
  type
    Cxidxobjcprotocolrefinfo* = Cxidxobjcprotocolrefinfo_520094346
else:
  static :
    hint("Declaration of " & "Cxidxobjcprotocolrefinfo" &
        " already exists, not redeclaring")
when not declared(Cxcompletionresult):
  type
    Cxcompletionresult* = Cxcompletionresult_520094238
else:
  static :
    hint("Declaration of " & "Cxcompletionresult" &
        " already exists, not redeclaring")
when not declared(Cxcompilationdatabase):
  type
    Cxcompilationdatabase* = Cxcompilationdatabase_520094069
else:
  static :
    hint("Declaration of " & "Cxcompilationdatabase" &
        " already exists, not redeclaring")
when not declared(Cxturesourceusageentry):
  type
    Cxturesourceusageentry* = Cxturesourceusageentry_520094158
else:
  static :
    hint("Declaration of " & "Cxturesourceusageentry" &
        " already exists, not redeclaring")
when not declared(Cxtoken):
  type
    Cxtoken* = Cxtoken_520094232
else:
  static :
    hint("Declaration of " & "Cxtoken" & " already exists, not redeclaring")
when not declared(Cxtranslationunit):
  type
    Cxtranslationunit* = Cxtranslationunit_520094113
else:
  static :
    hint("Declaration of " & "Cxtranslationunit" &
        " already exists, not redeclaring")
when not declared(Cxobjcpropertyattrkind):
  type
    Cxobjcpropertyattrkind* = Cxobjcpropertyattrkind_520094216
else:
  static :
    hint("Declaration of " & "Cxobjcpropertyattrkind" &
        " already exists, not redeclaring")
when not declared(structcxidxbaseclassinfo):
  type
    structcxidxbaseclassinfo* = structcxidxbaseclassinfo_520094340
else:
  static :
    hint("Declaration of " & "structcxidxbaseclassinfo" &
        " already exists, not redeclaring")
when not declared(Cxcursorset):
  type
    Cxcursorset* = Cxcursorset_520094182
else:
  static :
    hint("Declaration of " & "Cxcursorset" & " already exists, not redeclaring")
when not declared(Cxmodulemapdescriptor):
  type
    Cxmodulemapdescriptor* = Cxmodulemapdescriptor_520094067
else:
  static :
    hint("Declaration of " & "Cxmodulemapdescriptor" &
        " already exists, not redeclaring")
when not declared(structcxfileuniqueid):
  type
    structcxfileuniqueid* = structcxfileuniqueid_520094083
else:
  static :
    hint("Declaration of " & "structcxfileuniqueid" &
        " already exists, not redeclaring")
when not declared(structcxidxloc):
  type
    structcxidxloc* = structcxidxloc_520094280
else:
  static :
    hint("Declaration of " & "structcxidxloc" &
        " already exists, not redeclaring")
when not declared(structcxcomment):
  type
    structcxcomment* = structcxcomment_520094396
else:
  static :
    hint("Declaration of " & "structcxcomment" &
        " already exists, not redeclaring")
when not declared(structcxcursor):
  type
    structcxcursor* = structcxcursor_520094166
else:
  static :
    hint("Declaration of " & "structcxcursor" &
        " already exists, not redeclaring")
when not declared(Cxidxloc):
  type
    Cxidxloc* = Cxidxloc_520094282
else:
  static :
    hint("Declaration of " & "Cxidxloc" & " already exists, not redeclaring")
when not declared(Cxidxdeclinfo):
  type
    Cxidxdeclinfo* = Cxidxdeclinfo_520094330
else:
  static :
    hint("Declaration of " & "Cxidxdeclinfo" &
        " already exists, not redeclaring")
when not declared(Cxplatformavailability):
  type
    Cxplatformavailability* = Cxplatformavailability_520094176
else:
  static :
    hint("Declaration of " & "Cxplatformavailability" &
        " already exists, not redeclaring")
when not declared(Cxidxobjcinterfacedeclinfo):
  type
    Cxidxobjcinterfacedeclinfo* = Cxidxobjcinterfacedeclinfo_520094354
else:
  static :
    hint("Declaration of " & "Cxidxobjcinterfacedeclinfo" &
        " already exists, not redeclaring")
when not declared(structcxidximportedastfileinfo):
  type
    structcxidximportedastfileinfo* = structcxidximportedastfileinfo_520094288
else:
  static :
    hint("Declaration of " & "structcxidximportedastfileinfo" &
        " already exists, not redeclaring")
when not declared(structcxcompletionresult):
  type
    structcxcompletionresult* = structcxcompletionresult_520094236
else:
  static :
    hint("Declaration of " & "structcxcompletionresult" &
        " already exists, not redeclaring")
when not declared(structcxstringset):
  type
    structcxstringset* = structcxstringset_520094061
else:
  static :
    hint("Declaration of " & "structcxstringset" &
        " already exists, not redeclaring")
when not declared(structcxtype):
  type
    structcxtype* = structcxtype_520094188
else:
  static :
    hint("Declaration of " & "structcxtype" & " already exists, not redeclaring")
when not declared(Cxidxobjccategorydeclinfo):
  type
    Cxidxobjccategorydeclinfo* = Cxidxobjccategorydeclinfo_520094358
else:
  static :
    hint("Declaration of " & "Cxidxobjccategorydeclinfo" &
        " already exists, not redeclaring")
when not declared(Cxremapping):
  type
    Cxremapping* = Cxremapping_520094258
else:
  static :
    hint("Declaration of " & "Cxremapping" & " already exists, not redeclaring")
when not declared(Cxrewriter):
  type
    Cxrewriter* = Cxrewriter_520094408
else:
  static :
    hint("Declaration of " & "Cxrewriter" & " already exists, not redeclaring")
when not declared(Cxstring):
  type
    Cxstring* = Cxstring_520094059
else:
  static :
    hint("Declaration of " & "Cxstring" & " already exists, not redeclaring")
when not declared(Cxidxincludedfileinfo):
  type
    Cxidxincludedfileinfo* = Cxidxincludedfileinfo_520094286
else:
  static :
    hint("Declaration of " & "Cxidxincludedfileinfo" &
        " already exists, not redeclaring")
when not declared(Cxcursorandrangevisitor):
  type
    Cxcursorandrangevisitor* = Cxcursorandrangevisitor_520094264
else:
  static :
    hint("Declaration of " & "Cxcursorandrangevisitor" &
        " already exists, not redeclaring")
when not declared(Cxidxattrinfo):
  type
    Cxidxattrinfo* = Cxidxattrinfo_520094310
else:
  static :
    hint("Declaration of " & "Cxidxattrinfo" &
        " already exists, not redeclaring")
when not declared(structcxsourcelocation):
  type
    structcxsourcelocation* = structcxsourcelocation_520094087
else:
  static :
    hint("Declaration of " & "structcxsourcelocation" &
        " already exists, not redeclaring")
when not declared(structcxidxobjcpropertydeclinfo):
  type
    structcxidxobjcpropertydeclinfo* = structcxidxobjcpropertydeclinfo_520094360
else:
  static :
    hint("Declaration of " & "structcxidxobjcpropertydeclinfo" &
        " already exists, not redeclaring")
when not declared(Cxsourcelocation):
  type
    Cxsourcelocation* = Cxsourcelocation_520094089
else:
  static :
    hint("Declaration of " & "Cxsourcelocation" &
        " already exists, not redeclaring")
when not declared(Cxprintingpolicy):
  type
    Cxprintingpolicy* = Cxprintingpolicy_520094210
else:
  static :
    hint("Declaration of " & "Cxprintingpolicy" &
        " already exists, not redeclaring")
when not declared(structcxsourcerangelist):
  type
    structcxsourcerangelist* = structcxsourcerangelist_520094095
else:
  static :
    hint("Declaration of " & "structcxsourcerangelist" &
        " already exists, not redeclaring")
when not declared(Cxidxentitylanguage):
  type
    Cxidxentitylanguage* = Cxidxentitylanguage_520094298
else:
  static :
    hint("Declaration of " & "Cxidxentitylanguage" &
        " already exists, not redeclaring")
when not declared(structcxidxattrinfo):
  type
    structcxidxattrinfo* = structcxidxattrinfo_520094308
else:
  static :
    hint("Declaration of " & "structcxidxattrinfo" &
        " already exists, not redeclaring")
when not declared(structcxunsavedfile):
  type
    structcxunsavedfile* = structcxunsavedfile_520094117
else:
  static :
    hint("Declaration of " & "structcxunsavedfile" &
        " already exists, not redeclaring")
when not declared(Cxidxbaseclassinfo):
  type
    Cxidxbaseclassinfo* = Cxidxbaseclassinfo_520094342
else:
  static :
    hint("Declaration of " & "Cxidxbaseclassinfo" &
        " already exists, not redeclaring")
when not declared(Cxsymbolrole):
  type
    Cxsymbolrole* = Cxsymbolrole_520094374
else:
  static :
    hint("Declaration of " & "Cxsymbolrole" & " already exists, not redeclaring")
when not declared(Cxcomment):
  type
    Cxcomment* = Cxcomment_520094398
else:
  static :
    hint("Declaration of " & "Cxcomment" & " already exists, not redeclaring")
when not declared(Cxidxentityinfo):
  type
    Cxidxentityinfo* = Cxidxentityinfo_520094314
else:
  static :
    hint("Declaration of " & "Cxidxentityinfo" &
        " already exists, not redeclaring")
when not declared(Cxindexoptions):
  type
    Cxindexoptions* = Cxindexoptions_520094144
else:
  static :
    hint("Declaration of " & "Cxindexoptions" &
        " already exists, not redeclaring")
when not declared(Cxchoice):
  type
    Cxchoice* = Cxchoice_520094129
else:
  static :
    hint("Declaration of " & "Cxchoice" & " already exists, not redeclaring")
when not declared(structcxstring):
  type
    structcxstring* = structcxstring_520094057
else:
  static :
    hint("Declaration of " & "structcxstring" &
        " already exists, not redeclaring")
when not declared(Cxindexoptflags):
  type
    Cxindexoptflags* = Cxindexoptflags_520094388
else:
  static :
    hint("Declaration of " & "Cxindexoptflags" &
        " already exists, not redeclaring")
when not declared(Cxdiagnostic):
  type
    Cxdiagnostic* = Cxdiagnostic_520094101
else:
  static :
    hint("Declaration of " & "Cxdiagnostic" & " already exists, not redeclaring")
when not declared(Cxidxcxxclassdeclinfo):
  type
    Cxidxcxxclassdeclinfo* = Cxidxcxxclassdeclinfo_520094366
else:
  static :
    hint("Declaration of " & "Cxidxcxxclassdeclinfo" &
        " already exists, not redeclaring")
when not declared(Cxcursorandrangevisitorblock):
  type
    Cxcursorandrangevisitorblock* = Cxcursorandrangevisitorblock_520094270
else:
  static :
    hint("Declaration of " & "Cxcursorandrangevisitorblock" &
        " already exists, not redeclaring")
when not declared(structcxidxentityrefinfo):
  type
    structcxidxentityrefinfo* = structcxidxentityrefinfo_520094376
else:
  static :
    hint("Declaration of " & "structcxidxentityrefinfo" &
        " already exists, not redeclaring")
when not declared(Cxcursorvisitor):
  type
    Cxcursorvisitor* = Cxcursorvisitor_520094206
else:
  static :
    hint("Declaration of " & "Cxcursorvisitor" &
        " already exists, not redeclaring")
when not declared(Cxtokenkind):
  type
    Cxtokenkind* = Cxtokenkind_520094228
else:
  static :
    hint("Declaration of " & "Cxtokenkind" & " already exists, not redeclaring")
when not declared(Cxidxclientfile):
  type
    Cxidxclientfile* = Cxidxclientfile_520094272
else:
  static :
    hint("Declaration of " & "Cxidxclientfile" &
        " already exists, not redeclaring")
when not declared(timet):
  type
    timet* = timet_520094081
else:
  static :
    hint("Declaration of " & "timet" & " already exists, not redeclaring")
when not declared(structcxsourcerange):
  type
    structcxsourcerange* = structcxsourcerange_520094091
else:
  static :
    hint("Declaration of " & "structcxsourcerange" &
        " already exists, not redeclaring")
when not declared(Cxidxentitykind):
  type
    Cxidxentitykind* = Cxidxentitykind_520094294
else:
  static :
    hint("Declaration of " & "Cxidxentitykind" &
        " already exists, not redeclaring")
when not declared(Cxfieldvisitor):
  type
    Cxfieldvisitor* = Cxfieldvisitor_520094390
else:
  static :
    hint("Declaration of " & "Cxfieldvisitor" &
        " already exists, not redeclaring")
when not declared(structindexercallbacks):
  type
    structindexercallbacks* = structindexercallbacks_520094380
else:
  static :
    hint("Declaration of " & "structindexercallbacks" &
        " already exists, not redeclaring")
when not declared(compilertimet):
  type
    compilertimet* = compilertimet_520094413
else:
  static :
    hint("Declaration of " & "compilertimet" &
        " already exists, not redeclaring")
when not declared(Cxcompilationdatabaseerror):
  type
    Cxcompilationdatabaseerror* = Cxcompilationdatabaseerror_520094077
else:
  static :
    hint("Declaration of " & "Cxcompilationdatabaseerror" &
        " already exists, not redeclaring")
when not declared(Cxfileuniqueid):
  type
    Cxfileuniqueid* = Cxfileuniqueid_520094085
else:
  static :
    hint("Declaration of " & "Cxfileuniqueid" &
        " already exists, not redeclaring")
when not declared(Cxidxentityrefkind):
  type
    Cxidxentityrefkind* = Cxidxentityrefkind_520094370
else:
  static :
    hint("Declaration of " & "Cxidxentityrefkind" &
        " already exists, not redeclaring")
when not declared(Cxversion):
  type
    Cxversion* = Cxversion_520094123
else:
  static :
    hint("Declaration of " & "Cxversion" & " already exists, not redeclaring")
when not declared(structcxcodecompleteresults):
  type
    structcxcodecompleteresults* = structcxcodecompleteresults_520094242
else:
  static :
    hint("Declaration of " & "structcxcodecompleteresults" &
        " already exists, not redeclaring")
when not declared(Cxcodecompleteresults):
  type
    Cxcodecompleteresults* = Cxcodecompleteresults_520094244
else:
  static :
    hint("Declaration of " & "Cxcodecompleteresults" &
        " already exists, not redeclaring")
when not declared(structcxidxobjccategorydeclinfo):
  type
    structcxidxobjccategorydeclinfo* = structcxidxobjccategorydeclinfo_520094356
else:
  static :
    hint("Declaration of " & "structcxidxobjccategorydeclinfo" &
        " already exists, not redeclaring")
when not declared(Cxidxiboutletcollectionattrinfo):
  type
    Cxidxiboutletcollectionattrinfo* = Cxidxiboutletcollectionattrinfo_520094322
else:
  static :
    hint("Declaration of " & "Cxidxiboutletcollectionattrinfo" &
        " already exists, not redeclaring")
when not declared(Cxidximportedastfileinfo):
  type
    Cxidximportedastfileinfo* = Cxidximportedastfileinfo_520094290
else:
  static :
    hint("Declaration of " & "Cxidximportedastfileinfo" &
        " already exists, not redeclaring")
when not declared(Cxstringset):
  type
    Cxstringset* = Cxstringset_520094063
else:
  static :
    hint("Declaration of " & "Cxstringset" & " already exists, not redeclaring")
when not declared(structcxidxobjcinterfacedeclinfo):
  type
    structcxidxobjcinterfacedeclinfo* = structcxidxobjcinterfacedeclinfo_520094352
else:
  static :
    hint("Declaration of " & "structcxidxobjcinterfacedeclinfo" &
        " already exists, not redeclaring")
when not declared(structcxcursorandrangevisitor):
  type
    structcxcursorandrangevisitor* = structcxcursorandrangevisitor_520094262
else:
  static :
    hint("Declaration of " & "structcxcursorandrangevisitor" &
        " already exists, not redeclaring")
when not declared(Cxidxclientastfile):
  type
    Cxidxclientastfile* = Cxidxclientastfile_520094278
else:
  static :
    hint("Declaration of " & "Cxidxclientastfile" &
        " already exists, not redeclaring")
when not declared(Cxmodule):
  type
    Cxmodule* = Cxmodule_520094222
else:
  static :
    hint("Declaration of " & "Cxmodule" & " already exists, not redeclaring")
when not declared(structcxidxcxxclassdeclinfo):
  type
    structcxidxcxxclassdeclinfo* = structcxidxcxxclassdeclinfo_520094364
else:
  static :
    hint("Declaration of " & "structcxidxcxxclassdeclinfo" &
        " already exists, not redeclaring")
when not declared(structcxidxiboutletcollectionattrinfo):
  type
    structcxidxiboutletcollectionattrinfo* = structcxidxiboutletcollectionattrinfo_520094320
else:
  static :
    hint("Declaration of " & "structcxidxiboutletcollectionattrinfo" &
        " already exists, not redeclaring")
when not declared(Cxidxobjcpropertydeclinfo):
  type
    Cxidxobjcpropertydeclinfo* = Cxidxobjcpropertydeclinfo_520094362
else:
  static :
    hint("Declaration of " & "Cxidxobjcpropertydeclinfo" &
        " already exists, not redeclaring")
when not declared(Cxcompilecommand):
  type
    Cxcompilecommand* = Cxcompilecommand_520094073
else:
  static :
    hint("Declaration of " & "Cxcompilecommand" &
        " already exists, not redeclaring")
when not declared(Cxindex):
  type
    Cxindex* = Cxindex_520094109
else:
  static :
    hint("Declaration of " & "Cxindex" & " already exists, not redeclaring")
when not declared(Cxidxobjcprotocolreflistinfo):
  type
    Cxidxobjcprotocolreflistinfo* = Cxidxobjcprotocolreflistinfo_520094350
else:
  static :
    hint("Declaration of " & "Cxidxobjcprotocolreflistinfo" &
        " already exists, not redeclaring")
when not declared(structcxplatformavailability):
  type
    structcxplatformavailability* = structcxplatformavailability_520094174
else:
  static :
    hint("Declaration of " & "structcxplatformavailability" &
        " already exists, not redeclaring")
when not declared(structcxtoken):
  type
    structcxtoken* = structcxtoken_520094230
else:
  static :
    hint("Declaration of " & "structcxtoken" &
        " already exists, not redeclaring")
when not declared(structcxidxincludedfileinfo):
  type
    structcxidxincludedfileinfo* = structcxidxincludedfileinfo_520094284
else:
  static :
    hint("Declaration of " & "structcxidxincludedfileinfo" &
        " already exists, not redeclaring")
when not declared(structcxidxobjcprotocolrefinfo):
  type
    structcxidxobjcprotocolrefinfo* = structcxidxobjcprotocolrefinfo_520094344
else:
  static :
    hint("Declaration of " & "structcxidxobjcprotocolrefinfo" &
        " already exists, not redeclaring")
when not declared(Cxobjcdeclqualifierkind):
  type
    Cxobjcdeclqualifierkind* = Cxobjcdeclqualifierkind_520094220
else:
  static :
    hint("Declaration of " & "Cxobjcdeclqualifierkind" &
        " already exists, not redeclaring")
when not declared(Cxcursor):
  type
    Cxcursor* = Cxcursor_520094168
else:
  static :
    hint("Declaration of " & "Cxcursor" & " already exists, not redeclaring")
when not declared(Cxsourcerangelist):
  type
    Cxsourcerangelist* = Cxsourcerangelist_520094097
else:
  static :
    hint("Declaration of " & "Cxsourcerangelist" &
        " already exists, not redeclaring")
when not declared(structcxindexoptions):
  type
    structcxindexoptions* = structcxindexoptions_520094142
else:
  static :
    hint("Declaration of " & "structcxindexoptions" &
        " already exists, not redeclaring")
when not declared(Cxcursorvisitorblock):
  type
    Cxcursorvisitorblock* = Cxcursorvisitorblock_520094208
else:
  static :
    hint("Declaration of " & "Cxcursorvisitorblock" &
        " already exists, not redeclaring")
when not declared(structcxidxobjccontainerdeclinfo):
  type
    structcxidxobjccontainerdeclinfo* = structcxidxobjccontainerdeclinfo_520094336
else:
  static :
    hint("Declaration of " & "structcxidxobjccontainerdeclinfo" &
        " already exists, not redeclaring")
when not declared(Cxtype):
  type
    Cxtype* = Cxtype_520094190
else:
  static :
    hint("Declaration of " & "Cxtype" & " already exists, not redeclaring")
when not declared(Cxidxdeclinfoflags):
  type
    Cxidxdeclinfoflags* = Cxidxdeclinfoflags_520094326
else:
  static :
    hint("Declaration of " & "Cxidxdeclinfoflags" &
        " already exists, not redeclaring")
when not declared(Cxinclusionvisitor):
  type
    Cxinclusionvisitor* = Cxinclusionvisitor_520094250
else:
  static :
    hint("Declaration of " & "Cxinclusionvisitor" &
        " already exists, not redeclaring")
when not declared(structcxidxdeclinfo):
  type
    structcxidxdeclinfo* = structcxidxdeclinfo_520094328
else:
  static :
    hint("Declaration of " & "structcxidxdeclinfo" &
        " already exists, not redeclaring")
when not declared(structcxversion):
  type
    structcxversion* = structcxversion_520094121
else:
  static :
    hint("Declaration of " & "structcxversion" &
        " already exists, not redeclaring")
when not declared(Cindexversionmajor):
  when 0 is static:
    const
      Cindexversionmajor* = 0 ## Generated based on /usr/include/clang-c/Index.h:36:9
  else:
    let Cindexversionmajor* = 0 ## Generated based on /usr/include/clang-c/Index.h:36:9
else:
  static :
    hint("Declaration of " & "Cindexversionmajor" &
        " already exists, not redeclaring")
when not declared(Cindexversionminor):
  when 64 is static:
    const
      Cindexversionminor* = 64 ## Generated based on /usr/include/clang-c/Index.h:37:9
  else:
    let Cindexversionminor* = 64 ## Generated based on /usr/include/clang-c/Index.h:37:9
else:
  static :
    hint("Declaration of " & "Cindexversionminor" &
        " already exists, not redeclaring")
when not declared(getcstring):
  proc getcstring*(string: Cxstring_520094060): cstring {.cdecl,
      importc: "clang_getCString".}
else:
  static :
    hint("Declaration of " & "getcstring" & " already exists, not redeclaring")
when not declared(disposestring):
  proc disposestring*(string: Cxstring_520094060): void {.cdecl,
      importc: "clang_disposeString".}
else:
  static :
    hint("Declaration of " & "disposestring" &
        " already exists, not redeclaring")
when not declared(disposestringset):
  proc disposestringset*(set: ptr Cxstringset_520094064): void {.cdecl,
      importc: "clang_disposeStringSet".}
else:
  static :
    hint("Declaration of " & "disposestringset" &
        " already exists, not redeclaring")
when not declared(getbuildsessiontimestamp):
  proc getbuildsessiontimestamp*(): culonglong {.cdecl,
      importc: "clang_getBuildSessionTimestamp".}
else:
  static :
    hint("Declaration of " & "getbuildsessiontimestamp" &
        " already exists, not redeclaring")
when not declared(Virtualfileoverlaycreate):
  proc Virtualfileoverlaycreate*(options: cuint): Cxvirtualfileoverlay_520094066 {.
      cdecl, importc: "clang_VirtualFileOverlay_create".}
else:
  static :
    hint("Declaration of " & "Virtualfileoverlaycreate" &
        " already exists, not redeclaring")
when not declared(Virtualfileoverlayaddfilemapping):
  proc Virtualfileoverlayaddfilemapping*(a0: Cxvirtualfileoverlay_520094066;
      virtualpath: cstring; realpath: cstring): enumcxerrorcode_520094056 {.
      cdecl, importc: "clang_VirtualFileOverlay_addFileMapping".}
else:
  static :
    hint("Declaration of " & "Virtualfileoverlayaddfilemapping" &
        " already exists, not redeclaring")
when not declared(Virtualfileoverlaysetcasesensitivity):
  proc Virtualfileoverlaysetcasesensitivity*(a0: Cxvirtualfileoverlay_520094066;
      casesensitive: cint): enumcxerrorcode_520094056 {.cdecl,
      importc: "clang_VirtualFileOverlay_setCaseSensitivity".}
else:
  static :
    hint("Declaration of " & "Virtualfileoverlaysetcasesensitivity" &
        " already exists, not redeclaring")
when not declared(Virtualfileoverlaywritetobuffer):
  proc Virtualfileoverlaywritetobuffer*(a0: Cxvirtualfileoverlay_520094066;
                                        options: cuint;
                                        outbufferptr: ptr cstring;
                                        outbuffersize: ptr cuint): enumcxerrorcode_520094056 {.
      cdecl, importc: "clang_VirtualFileOverlay_writeToBuffer".}
else:
  static :
    hint("Declaration of " & "Virtualfileoverlaywritetobuffer" &
        " already exists, not redeclaring")
when not declared(free):
  proc free*(buffer: pointer): void {.cdecl, importc: "clang_free".}
else:
  static :
    hint("Declaration of " & "free" & " already exists, not redeclaring")
when not declared(Virtualfileoverlaydispose):
  proc Virtualfileoverlaydispose*(a0: Cxvirtualfileoverlay_520094066): void {.
      cdecl, importc: "clang_VirtualFileOverlay_dispose".}
else:
  static :
    hint("Declaration of " & "Virtualfileoverlaydispose" &
        " already exists, not redeclaring")
when not declared(Modulemapdescriptorcreate):
  proc Modulemapdescriptorcreate*(options: cuint): Cxmodulemapdescriptor_520094068 {.
      cdecl, importc: "clang_ModuleMapDescriptor_create".}
else:
  static :
    hint("Declaration of " & "Modulemapdescriptorcreate" &
        " already exists, not redeclaring")
when not declared(Modulemapdescriptorsetframeworkmodulename):
  proc Modulemapdescriptorsetframeworkmodulename*(a0: Cxmodulemapdescriptor_520094068;
      name: cstring): enumcxerrorcode_520094056 {.cdecl,
      importc: "clang_ModuleMapDescriptor_setFrameworkModuleName".}
else:
  static :
    hint("Declaration of " & "Modulemapdescriptorsetframeworkmodulename" &
        " already exists, not redeclaring")
when not declared(Modulemapdescriptorsetumbrellaheader):
  proc Modulemapdescriptorsetumbrellaheader*(a0: Cxmodulemapdescriptor_520094068;
      name: cstring): enumcxerrorcode_520094056 {.cdecl,
      importc: "clang_ModuleMapDescriptor_setUmbrellaHeader".}
else:
  static :
    hint("Declaration of " & "Modulemapdescriptorsetumbrellaheader" &
        " already exists, not redeclaring")
when not declared(Modulemapdescriptorwritetobuffer):
  proc Modulemapdescriptorwritetobuffer*(a0: Cxmodulemapdescriptor_520094068;
      options: cuint; outbufferptr: ptr cstring; outbuffersize: ptr cuint): enumcxerrorcode_520094056 {.
      cdecl, importc: "clang_ModuleMapDescriptor_writeToBuffer".}
else:
  static :
    hint("Declaration of " & "Modulemapdescriptorwritetobuffer" &
        " already exists, not redeclaring")
when not declared(Modulemapdescriptordispose):
  proc Modulemapdescriptordispose*(a0: Cxmodulemapdescriptor_520094068): void {.
      cdecl, importc: "clang_ModuleMapDescriptor_dispose".}
else:
  static :
    hint("Declaration of " & "Modulemapdescriptordispose" &
        " already exists, not redeclaring")
when not declared(Compilationdatabasefromdirectory):
  proc Compilationdatabasefromdirectory*(Builddir: cstring;
      Errorcode: ptr Cxcompilationdatabaseerror_520094078): Cxcompilationdatabase_520094070 {.
      cdecl, importc: "clang_CompilationDatabase_fromDirectory".}
else:
  static :
    hint("Declaration of " & "Compilationdatabasefromdirectory" &
        " already exists, not redeclaring")
when not declared(Compilationdatabasedispose):
  proc Compilationdatabasedispose*(a0: Cxcompilationdatabase_520094070): void {.
      cdecl, importc: "clang_CompilationDatabase_dispose".}
else:
  static :
    hint("Declaration of " & "Compilationdatabasedispose" &
        " already exists, not redeclaring")
when not declared(Compilationdatabasegetcompilecommands):
  proc Compilationdatabasegetcompilecommands*(a0: Cxcompilationdatabase_520094070;
      Completefilename: cstring): Cxcompilecommands_520094072 {.cdecl,
      importc: "clang_CompilationDatabase_getCompileCommands".}
else:
  static :
    hint("Declaration of " & "Compilationdatabasegetcompilecommands" &
        " already exists, not redeclaring")
when not declared(Compilationdatabasegetallcompilecommands):
  proc Compilationdatabasegetallcompilecommands*(a0: Cxcompilationdatabase_520094070): Cxcompilecommands_520094072 {.
      cdecl, importc: "clang_CompilationDatabase_getAllCompileCommands".}
else:
  static :
    hint("Declaration of " & "Compilationdatabasegetallcompilecommands" &
        " already exists, not redeclaring")
when not declared(Compilecommandsdispose):
  proc Compilecommandsdispose*(a0: Cxcompilecommands_520094072): void {.cdecl,
      importc: "clang_CompileCommands_dispose".}
else:
  static :
    hint("Declaration of " & "Compilecommandsdispose" &
        " already exists, not redeclaring")
when not declared(Compilecommandsgetsize):
  proc Compilecommandsgetsize*(a0: Cxcompilecommands_520094072): cuint {.cdecl,
      importc: "clang_CompileCommands_getSize".}
else:
  static :
    hint("Declaration of " & "Compilecommandsgetsize" &
        " already exists, not redeclaring")
when not declared(Compilecommandsgetcommand):
  proc Compilecommandsgetcommand*(a0: Cxcompilecommands_520094072; I: cuint): Cxcompilecommand_520094074 {.
      cdecl, importc: "clang_CompileCommands_getCommand".}
else:
  static :
    hint("Declaration of " & "Compilecommandsgetcommand" &
        " already exists, not redeclaring")
when not declared(Compilecommandgetdirectory):
  proc Compilecommandgetdirectory*(a0: Cxcompilecommand_520094074): Cxstring_520094060 {.
      cdecl, importc: "clang_CompileCommand_getDirectory".}
else:
  static :
    hint("Declaration of " & "Compilecommandgetdirectory" &
        " already exists, not redeclaring")
when not declared(Compilecommandgetfilename):
  proc Compilecommandgetfilename*(a0: Cxcompilecommand_520094074): Cxstring_520094060 {.
      cdecl, importc: "clang_CompileCommand_getFilename".}
else:
  static :
    hint("Declaration of " & "Compilecommandgetfilename" &
        " already exists, not redeclaring")
when not declared(Compilecommandgetnumargs):
  proc Compilecommandgetnumargs*(a0: Cxcompilecommand_520094074): cuint {.cdecl,
      importc: "clang_CompileCommand_getNumArgs".}
else:
  static :
    hint("Declaration of " & "Compilecommandgetnumargs" &
        " already exists, not redeclaring")
when not declared(Compilecommandgetarg):
  proc Compilecommandgetarg*(a0: Cxcompilecommand_520094074; I: cuint): Cxstring_520094060 {.
      cdecl, importc: "clang_CompileCommand_getArg".}
else:
  static :
    hint("Declaration of " & "Compilecommandgetarg" &
        " already exists, not redeclaring")
when not declared(Compilecommandgetnummappedsources):
  proc Compilecommandgetnummappedsources*(a0: Cxcompilecommand_520094074): cuint {.
      cdecl, importc: "clang_CompileCommand_getNumMappedSources".}
else:
  static :
    hint("Declaration of " & "Compilecommandgetnummappedsources" &
        " already exists, not redeclaring")
when not declared(Compilecommandgetmappedsourcepath):
  proc Compilecommandgetmappedsourcepath*(a0: Cxcompilecommand_520094074;
      I: cuint): Cxstring_520094060 {.cdecl, importc: "clang_CompileCommand_getMappedSourcePath".}
else:
  static :
    hint("Declaration of " & "Compilecommandgetmappedsourcepath" &
        " already exists, not redeclaring")
when not declared(Compilecommandgetmappedsourcecontent):
  proc Compilecommandgetmappedsourcecontent*(a0: Cxcompilecommand_520094074;
      I: cuint): Cxstring_520094060 {.cdecl, importc: "clang_CompileCommand_getMappedSourceContent".}
else:
  static :
    hint("Declaration of " & "Compilecommandgetmappedsourcecontent" &
        " already exists, not redeclaring")
when not declared(getfilename):
  proc getfilename*(Sfile: Cxfile_520094080): Cxstring_520094060 {.cdecl,
      importc: "clang_getFileName".}
else:
  static :
    hint("Declaration of " & "getfilename" & " already exists, not redeclaring")
when not declared(getfiletime):
  proc getfiletime*(Sfile: Cxfile_520094080): timet_520094082 {.cdecl,
      importc: "clang_getFileTime".}
else:
  static :
    hint("Declaration of " & "getfiletime" & " already exists, not redeclaring")
when not declared(getfileuniqueid):
  proc getfileuniqueid*(file: Cxfile_520094080; outid: ptr Cxfileuniqueid_520094086): cint {.
      cdecl, importc: "clang_getFileUniqueID".}
else:
  static :
    hint("Declaration of " & "getfileuniqueid" &
        " already exists, not redeclaring")
when not declared(Fileisequal):
  proc Fileisequal*(file1: Cxfile_520094080; file2: Cxfile_520094080): cint {.
      cdecl, importc: "clang_File_isEqual".}
else:
  static :
    hint("Declaration of " & "Fileisequal" & " already exists, not redeclaring")
when not declared(Filetrygetrealpathname):
  proc Filetrygetrealpathname*(file: Cxfile_520094080): Cxstring_520094060 {.
      cdecl, importc: "clang_File_tryGetRealPathName".}
else:
  static :
    hint("Declaration of " & "Filetrygetrealpathname" &
        " already exists, not redeclaring")
when not declared(getnulllocation):
  proc getnulllocation*(): Cxsourcelocation_520094090 {.cdecl,
      importc: "clang_getNullLocation".}
else:
  static :
    hint("Declaration of " & "getnulllocation" &
        " already exists, not redeclaring")
when not declared(equallocations):
  proc equallocations*(loc1: Cxsourcelocation_520094090; loc2: Cxsourcelocation_520094090): cuint {.
      cdecl, importc: "clang_equalLocations".}
else:
  static :
    hint("Declaration of " & "equallocations" &
        " already exists, not redeclaring")
when not declared(Locationisinsystemheader):
  proc Locationisinsystemheader*(location: Cxsourcelocation_520094090): cint {.
      cdecl, importc: "clang_Location_isInSystemHeader".}
else:
  static :
    hint("Declaration of " & "Locationisinsystemheader" &
        " already exists, not redeclaring")
when not declared(Locationisfrommainfile):
  proc Locationisfrommainfile*(location: Cxsourcelocation_520094090): cint {.
      cdecl, importc: "clang_Location_isFromMainFile".}
else:
  static :
    hint("Declaration of " & "Locationisfrommainfile" &
        " already exists, not redeclaring")
when not declared(getnullrange):
  proc getnullrange*(): Cxsourcerange_520094094 {.cdecl,
      importc: "clang_getNullRange".}
else:
  static :
    hint("Declaration of " & "getnullrange" & " already exists, not redeclaring")
when not declared(getrange):
  proc getrange*(begin: Cxsourcelocation_520094090; endarg: Cxsourcelocation_520094090): Cxsourcerange_520094094 {.
      cdecl, importc: "clang_getRange".}
else:
  static :
    hint("Declaration of " & "getrange" & " already exists, not redeclaring")
when not declared(equalranges):
  proc equalranges*(range1: Cxsourcerange_520094094; range2: Cxsourcerange_520094094): cuint {.
      cdecl, importc: "clang_equalRanges".}
else:
  static :
    hint("Declaration of " & "equalranges" & " already exists, not redeclaring")
when not declared(Rangeisnull):
  proc Rangeisnull*(range: Cxsourcerange_520094094): cint {.cdecl,
      importc: "clang_Range_isNull".}
else:
  static :
    hint("Declaration of " & "Rangeisnull" & " already exists, not redeclaring")
when not declared(getexpansionlocation):
  proc getexpansionlocation*(location: Cxsourcelocation_520094090;
                             file: ptr Cxfile_520094080; line: ptr cuint;
                             column: ptr cuint; offset: ptr cuint): void {.
      cdecl, importc: "clang_getExpansionLocation".}
else:
  static :
    hint("Declaration of " & "getexpansionlocation" &
        " already exists, not redeclaring")
when not declared(getpresumedlocation):
  proc getpresumedlocation*(location: Cxsourcelocation_520094090;
                            filename: ptr Cxstring_520094060; line: ptr cuint;
                            column: ptr cuint): void {.cdecl,
      importc: "clang_getPresumedLocation".}
else:
  static :
    hint("Declaration of " & "getpresumedlocation" &
        " already exists, not redeclaring")
when not declared(getinstantiationlocation):
  proc getinstantiationlocation*(location: Cxsourcelocation_520094090;
                                 file: ptr Cxfile_520094080; line: ptr cuint;
                                 column: ptr cuint; offset: ptr cuint): void {.
      cdecl, importc: "clang_getInstantiationLocation".}
else:
  static :
    hint("Declaration of " & "getinstantiationlocation" &
        " already exists, not redeclaring")
when not declared(getspellinglocation):
  proc getspellinglocation*(location: Cxsourcelocation_520094090;
                            file: ptr Cxfile_520094080; line: ptr cuint;
                            column: ptr cuint; offset: ptr cuint): void {.cdecl,
      importc: "clang_getSpellingLocation".}
else:
  static :
    hint("Declaration of " & "getspellinglocation" &
        " already exists, not redeclaring")
when not declared(getfilelocation):
  proc getfilelocation*(location: Cxsourcelocation_520094090; file: ptr Cxfile_520094080;
                        line: ptr cuint; column: ptr cuint; offset: ptr cuint): void {.
      cdecl, importc: "clang_getFileLocation".}
else:
  static :
    hint("Declaration of " & "getfilelocation" &
        " already exists, not redeclaring")
when not declared(getrangestart):
  proc getrangestart*(range: Cxsourcerange_520094094): Cxsourcelocation_520094090 {.
      cdecl, importc: "clang_getRangeStart".}
else:
  static :
    hint("Declaration of " & "getrangestart" &
        " already exists, not redeclaring")
when not declared(getrangeend):
  proc getrangeend*(range: Cxsourcerange_520094094): Cxsourcelocation_520094090 {.
      cdecl, importc: "clang_getRangeEnd".}
else:
  static :
    hint("Declaration of " & "getrangeend" & " already exists, not redeclaring")
when not declared(disposesourcerangelist):
  proc disposesourcerangelist*(ranges: ptr Cxsourcerangelist_520094098): void {.
      cdecl, importc: "clang_disposeSourceRangeList".}
else:
  static :
    hint("Declaration of " & "disposesourcerangelist" &
        " already exists, not redeclaring")
when not declared(getnumdiagnosticsinset):
  proc getnumdiagnosticsinset*(Diags: Cxdiagnosticset_520094104): cuint {.cdecl,
      importc: "clang_getNumDiagnosticsInSet".}
else:
  static :
    hint("Declaration of " & "getnumdiagnosticsinset" &
        " already exists, not redeclaring")
when not declared(getdiagnosticinset):
  proc getdiagnosticinset*(Diags: Cxdiagnosticset_520094104; Index: cuint): Cxdiagnostic_520094102 {.
      cdecl, importc: "clang_getDiagnosticInSet".}
else:
  static :
    hint("Declaration of " & "getdiagnosticinset" &
        " already exists, not redeclaring")
when not declared(loaddiagnostics):
  proc loaddiagnostics*(file: cstring; error: ptr enumcxloaddiagerror_520094106;
                        errorstring: ptr Cxstring_520094060): Cxdiagnosticset_520094104 {.
      cdecl, importc: "clang_loadDiagnostics".}
else:
  static :
    hint("Declaration of " & "loaddiagnostics" &
        " already exists, not redeclaring")
when not declared(disposediagnosticset):
  proc disposediagnosticset*(Diags: Cxdiagnosticset_520094104): void {.cdecl,
      importc: "clang_disposeDiagnosticSet".}
else:
  static :
    hint("Declaration of " & "disposediagnosticset" &
        " already exists, not redeclaring")
when not declared(getchilddiagnostics):
  proc getchilddiagnostics*(D: Cxdiagnostic_520094102): Cxdiagnosticset_520094104 {.
      cdecl, importc: "clang_getChildDiagnostics".}
else:
  static :
    hint("Declaration of " & "getchilddiagnostics" &
        " already exists, not redeclaring")
when not declared(disposediagnostic):
  proc disposediagnostic*(Diagnostic: Cxdiagnostic_520094102): void {.cdecl,
      importc: "clang_disposeDiagnostic".}
else:
  static :
    hint("Declaration of " & "disposediagnostic" &
        " already exists, not redeclaring")
when not declared(formatdiagnostic):
  proc formatdiagnostic*(Diagnostic: Cxdiagnostic_520094102; Options: cuint): Cxstring_520094060 {.
      cdecl, importc: "clang_formatDiagnostic".}
else:
  static :
    hint("Declaration of " & "formatdiagnostic" &
        " already exists, not redeclaring")
when not declared(defaultdiagnosticdisplayoptions):
  proc defaultdiagnosticdisplayoptions*(): cuint {.cdecl,
      importc: "clang_defaultDiagnosticDisplayOptions".}
else:
  static :
    hint("Declaration of " & "defaultdiagnosticdisplayoptions" &
        " already exists, not redeclaring")
when not declared(getdiagnosticseverity):
  proc getdiagnosticseverity*(a0: Cxdiagnostic_520094102): enumcxdiagnosticseverity_520094100 {.
      cdecl, importc: "clang_getDiagnosticSeverity".}
else:
  static :
    hint("Declaration of " & "getdiagnosticseverity" &
        " already exists, not redeclaring")
when not declared(getdiagnosticlocation):
  proc getdiagnosticlocation*(a0: Cxdiagnostic_520094102): Cxsourcelocation_520094090 {.
      cdecl, importc: "clang_getDiagnosticLocation".}
else:
  static :
    hint("Declaration of " & "getdiagnosticlocation" &
        " already exists, not redeclaring")
when not declared(getdiagnosticspelling):
  proc getdiagnosticspelling*(a0: Cxdiagnostic_520094102): Cxstring_520094060 {.
      cdecl, importc: "clang_getDiagnosticSpelling".}
else:
  static :
    hint("Declaration of " & "getdiagnosticspelling" &
        " already exists, not redeclaring")
when not declared(getdiagnosticoption):
  proc getdiagnosticoption*(Diag: Cxdiagnostic_520094102; Disable: ptr Cxstring_520094060): Cxstring_520094060 {.
      cdecl, importc: "clang_getDiagnosticOption".}
else:
  static :
    hint("Declaration of " & "getdiagnosticoption" &
        " already exists, not redeclaring")
when not declared(getdiagnosticcategory):
  proc getdiagnosticcategory*(a0: Cxdiagnostic_520094102): cuint {.cdecl,
      importc: "clang_getDiagnosticCategory".}
else:
  static :
    hint("Declaration of " & "getdiagnosticcategory" &
        " already exists, not redeclaring")
when not declared(getdiagnosticcategoryname):
  proc getdiagnosticcategoryname*(Category: cuint): Cxstring_520094060 {.cdecl,
      importc: "clang_getDiagnosticCategoryName".}
else:
  static :
    hint("Declaration of " & "getdiagnosticcategoryname" &
        " already exists, not redeclaring")
when not declared(getdiagnosticcategorytext):
  proc getdiagnosticcategorytext*(a0: Cxdiagnostic_520094102): Cxstring_520094060 {.
      cdecl, importc: "clang_getDiagnosticCategoryText".}
else:
  static :
    hint("Declaration of " & "getdiagnosticcategorytext" &
        " already exists, not redeclaring")
when not declared(getdiagnosticnumranges):
  proc getdiagnosticnumranges*(a0: Cxdiagnostic_520094102): cuint {.cdecl,
      importc: "clang_getDiagnosticNumRanges".}
else:
  static :
    hint("Declaration of " & "getdiagnosticnumranges" &
        " already exists, not redeclaring")
when not declared(getdiagnosticrange):
  proc getdiagnosticrange*(Diagnostic: Cxdiagnostic_520094102; Range: cuint): Cxsourcerange_520094094 {.
      cdecl, importc: "clang_getDiagnosticRange".}
else:
  static :
    hint("Declaration of " & "getdiagnosticrange" &
        " already exists, not redeclaring")
when not declared(getdiagnosticnumfixits):
  proc getdiagnosticnumfixits*(Diagnostic: Cxdiagnostic_520094102): cuint {.
      cdecl, importc: "clang_getDiagnosticNumFixIts".}
else:
  static :
    hint("Declaration of " & "getdiagnosticnumfixits" &
        " already exists, not redeclaring")
when not declared(getdiagnosticfixit):
  proc getdiagnosticfixit*(Diagnostic: Cxdiagnostic_520094102; Fixit: cuint;
                           Replacementrange: ptr Cxsourcerange_520094094): Cxstring_520094060 {.
      cdecl, importc: "clang_getDiagnosticFixIt".}
else:
  static :
    hint("Declaration of " & "getdiagnosticfixit" &
        " already exists, not redeclaring")
when not declared(createindex):
  proc createindex*(excludedeclarationsfrompch: cint; displaydiagnostics: cint): Cxindex_520094110 {.
      cdecl, importc: "clang_createIndex".}
else:
  static :
    hint("Declaration of " & "createindex" & " already exists, not redeclaring")
when not declared(disposeindex):
  proc disposeindex*(index: Cxindex_520094110): void {.cdecl,
      importc: "clang_disposeIndex".}
else:
  static :
    hint("Declaration of " & "disposeindex" & " already exists, not redeclaring")
when not declared(createindexwithoptions):
  proc createindexwithoptions*(options: ptr Cxindexoptions_520094145): Cxindex_520094110 {.
      cdecl, importc: "clang_createIndexWithOptions".}
else:
  static :
    hint("Declaration of " & "createindexwithoptions" &
        " already exists, not redeclaring")
when not declared(Cxindexsetglobaloptions):
  proc Cxindexsetglobaloptions*(a0: Cxindex_520094110; options: cuint): void {.
      cdecl, importc: "clang_CXIndex_setGlobalOptions".}
else:
  static :
    hint("Declaration of " & "Cxindexsetglobaloptions" &
        " already exists, not redeclaring")
when not declared(Cxindexgetglobaloptions):
  proc Cxindexgetglobaloptions*(a0: Cxindex_520094110): cuint {.cdecl,
      importc: "clang_CXIndex_getGlobalOptions".}
else:
  static :
    hint("Declaration of " & "Cxindexgetglobaloptions" &
        " already exists, not redeclaring")
when not declared(Cxindexsetinvocationemissionpathoption):
  proc Cxindexsetinvocationemissionpathoption*(a0: Cxindex_520094110;
      Path: cstring): void {.cdecl, importc: "clang_CXIndex_setInvocationEmissionPathOption".}
else:
  static :
    hint("Declaration of " & "Cxindexsetinvocationemissionpathoption" &
        " already exists, not redeclaring")
when not declared(isfilemultipleincludeguarded):
  proc isfilemultipleincludeguarded*(tu: Cxtranslationunit_520094114;
                                     file: Cxfile_520094080): cuint {.cdecl,
      importc: "clang_isFileMultipleIncludeGuarded".}
else:
  static :
    hint("Declaration of " & "isfilemultipleincludeguarded" &
        " already exists, not redeclaring")
when not declared(getfile):
  proc getfile*(tu: Cxtranslationunit_520094114; filename: cstring): Cxfile_520094080 {.
      cdecl, importc: "clang_getFile".}
else:
  static :
    hint("Declaration of " & "getfile" & " already exists, not redeclaring")
when not declared(getfilecontents):
  proc getfilecontents*(tu: Cxtranslationunit_520094114; file: Cxfile_520094080;
                        size: ptr csize_t): cstring {.cdecl,
      importc: "clang_getFileContents".}
else:
  static :
    hint("Declaration of " & "getfilecontents" &
        " already exists, not redeclaring")
when not declared(getlocation):
  proc getlocation*(tu: Cxtranslationunit_520094114; file: Cxfile_520094080;
                    line: cuint; column: cuint): Cxsourcelocation_520094090 {.
      cdecl, importc: "clang_getLocation".}
else:
  static :
    hint("Declaration of " & "getlocation" & " already exists, not redeclaring")
when not declared(getlocationforoffset):
  proc getlocationforoffset*(tu: Cxtranslationunit_520094114; file: Cxfile_520094080;
                             offset: cuint): Cxsourcelocation_520094090 {.cdecl,
      importc: "clang_getLocationForOffset".}
else:
  static :
    hint("Declaration of " & "getlocationforoffset" &
        " already exists, not redeclaring")
when not declared(getskippedranges):
  proc getskippedranges*(tu: Cxtranslationunit_520094114; file: Cxfile_520094080): ptr Cxsourcerangelist_520094098 {.
      cdecl, importc: "clang_getSkippedRanges".}
else:
  static :
    hint("Declaration of " & "getskippedranges" &
        " already exists, not redeclaring")
when not declared(getallskippedranges):
  proc getallskippedranges*(tu: Cxtranslationunit_520094114): ptr Cxsourcerangelist_520094098 {.
      cdecl, importc: "clang_getAllSkippedRanges".}
else:
  static :
    hint("Declaration of " & "getallskippedranges" &
        " already exists, not redeclaring")
when not declared(getnumdiagnostics):
  proc getnumdiagnostics*(Unit: Cxtranslationunit_520094114): cuint {.cdecl,
      importc: "clang_getNumDiagnostics".}
else:
  static :
    hint("Declaration of " & "getnumdiagnostics" &
        " already exists, not redeclaring")
when not declared(getdiagnostic):
  proc getdiagnostic*(Unit: Cxtranslationunit_520094114; Index: cuint): Cxdiagnostic_520094102 {.
      cdecl, importc: "clang_getDiagnostic".}
else:
  static :
    hint("Declaration of " & "getdiagnostic" &
        " already exists, not redeclaring")
when not declared(getdiagnosticsetfromtu):
  proc getdiagnosticsetfromtu*(Unit: Cxtranslationunit_520094114): Cxdiagnosticset_520094104 {.
      cdecl, importc: "clang_getDiagnosticSetFromTU".}
else:
  static :
    hint("Declaration of " & "getdiagnosticsetfromtu" &
        " already exists, not redeclaring")
when not declared(gettranslationunitspelling):
  proc gettranslationunitspelling*(Ctunit: Cxtranslationunit_520094114): Cxstring_520094060 {.
      cdecl, importc: "clang_getTranslationUnitSpelling".}
else:
  static :
    hint("Declaration of " & "gettranslationunitspelling" &
        " already exists, not redeclaring")
when not declared(createtranslationunitfromsourcefile):
  proc createtranslationunitfromsourcefile*(Cidx: Cxindex_520094110;
      sourcefilename: cstring; numclangcommandlineargs: cint;
      commandlineargs: ptr cstring; numunsavedfiles: cuint;
      unsavedfiles: ptr structcxunsavedfile_520094118): Cxtranslationunit_520094114 {.
      cdecl, importc: "clang_createTranslationUnitFromSourceFile".}
else:
  static :
    hint("Declaration of " & "createtranslationunitfromsourcefile" &
        " already exists, not redeclaring")
when not declared(createtranslationunit):
  proc createtranslationunit*(Cidx: Cxindex_520094110; astfilename: cstring): Cxtranslationunit_520094114 {.
      cdecl, importc: "clang_createTranslationUnit".}
else:
  static :
    hint("Declaration of " & "createtranslationunit" &
        " already exists, not redeclaring")
when not declared(createtranslationunit2):
  proc createtranslationunit2*(Cidx: Cxindex_520094110; astfilename: cstring;
                               outtu: ptr Cxtranslationunit_520094114): enumcxerrorcode_520094056 {.
      cdecl, importc: "clang_createTranslationUnit2".}
else:
  static :
    hint("Declaration of " & "createtranslationunit2" &
        " already exists, not redeclaring")
when not declared(defaulteditingtranslationunitoptions):
  proc defaulteditingtranslationunitoptions*(): cuint {.cdecl,
      importc: "clang_defaultEditingTranslationUnitOptions".}
else:
  static :
    hint("Declaration of " & "defaulteditingtranslationunitoptions" &
        " already exists, not redeclaring")
when not declared(parsetranslationunit):
  proc parsetranslationunit*(Cidx: Cxindex_520094110; sourcefilename: cstring;
                             commandlineargs: ptr cstring;
                             numcommandlineargs: cint;
                             unsavedfiles: ptr structcxunsavedfile_520094118;
                             numunsavedfiles: cuint; options: cuint): Cxtranslationunit_520094114 {.
      cdecl, importc: "clang_parseTranslationUnit".}
else:
  static :
    hint("Declaration of " & "parsetranslationunit" &
        " already exists, not redeclaring")
when not declared(parsetranslationunit2):
  proc parsetranslationunit2*(Cidx: Cxindex_520094110; sourcefilename: cstring;
                              commandlineargs: ptr cstring;
                              numcommandlineargs: cint;
                              unsavedfiles: ptr structcxunsavedfile_520094118;
                              numunsavedfiles: cuint; options: cuint;
                              outtu: ptr Cxtranslationunit_520094114): enumcxerrorcode_520094056 {.
      cdecl, importc: "clang_parseTranslationUnit2".}
else:
  static :
    hint("Declaration of " & "parsetranslationunit2" &
        " already exists, not redeclaring")
when not declared(parsetranslationunit2fullargv):
  proc parsetranslationunit2fullargv*(Cidx: Cxindex_520094110;
                                      sourcefilename: cstring;
                                      commandlineargs: ptr cstring;
                                      numcommandlineargs: cint;
                                      unsavedfiles: ptr structcxunsavedfile_520094118;
                                      numunsavedfiles: cuint; options: cuint;
                                      outtu: ptr Cxtranslationunit_520094114): enumcxerrorcode_520094056 {.
      cdecl, importc: "clang_parseTranslationUnit2FullArgv".}
else:
  static :
    hint("Declaration of " & "parsetranslationunit2fullargv" &
        " already exists, not redeclaring")
when not declared(defaultsaveoptions):
  proc defaultsaveoptions*(Tu: Cxtranslationunit_520094114): cuint {.cdecl,
      importc: "clang_defaultSaveOptions".}
else:
  static :
    hint("Declaration of " & "defaultsaveoptions" &
        " already exists, not redeclaring")
when not declared(savetranslationunit):
  proc savetranslationunit*(Tu: Cxtranslationunit_520094114; Filename: cstring;
                            options: cuint): cint {.cdecl,
      importc: "clang_saveTranslationUnit".}
else:
  static :
    hint("Declaration of " & "savetranslationunit" &
        " already exists, not redeclaring")
when not declared(suspendtranslationunit):
  proc suspendtranslationunit*(a0: Cxtranslationunit_520094114): cuint {.cdecl,
      importc: "clang_suspendTranslationUnit".}
else:
  static :
    hint("Declaration of " & "suspendtranslationunit" &
        " already exists, not redeclaring")
when not declared(disposetranslationunit):
  proc disposetranslationunit*(a0: Cxtranslationunit_520094114): void {.cdecl,
      importc: "clang_disposeTranslationUnit".}
else:
  static :
    hint("Declaration of " & "disposetranslationunit" &
        " already exists, not redeclaring")
when not declared(defaultreparseoptions):
  proc defaultreparseoptions*(Tu: Cxtranslationunit_520094114): cuint {.cdecl,
      importc: "clang_defaultReparseOptions".}
else:
  static :
    hint("Declaration of " & "defaultreparseoptions" &
        " already exists, not redeclaring")
when not declared(reparsetranslationunit):
  proc reparsetranslationunit*(Tu: Cxtranslationunit_520094114;
                               numunsavedfiles: cuint;
                               unsavedfiles: ptr structcxunsavedfile_520094118;
                               options: cuint): cint {.cdecl,
      importc: "clang_reparseTranslationUnit".}
else:
  static :
    hint("Declaration of " & "reparsetranslationunit" &
        " already exists, not redeclaring")
when not declared(getturesourceusagename):
  proc getturesourceusagename*(kind: enumcxturesourceusagekind_520094155): cstring {.
      cdecl, importc: "clang_getTUResourceUsageName".}
else:
  static :
    hint("Declaration of " & "getturesourceusagename" &
        " already exists, not redeclaring")
when not declared(getcxturesourceusage):
  proc getcxturesourceusage*(Tu: Cxtranslationunit_520094114): Cxturesourceusage_520094163 {.
      cdecl, importc: "clang_getCXTUResourceUsage".}
else:
  static :
    hint("Declaration of " & "getcxturesourceusage" &
        " already exists, not redeclaring")
when not declared(disposecxturesourceusage):
  proc disposecxturesourceusage*(usage: Cxturesourceusage_520094163): void {.
      cdecl, importc: "clang_disposeCXTUResourceUsage".}
else:
  static :
    hint("Declaration of " & "disposecxturesourceusage" &
        " already exists, not redeclaring")
when not declared(gettranslationunittargetinfo):
  proc gettranslationunittargetinfo*(Ctunit: Cxtranslationunit_520094114): Cxtargetinfo_520094112 {.
      cdecl, importc: "clang_getTranslationUnitTargetInfo".}
else:
  static :
    hint("Declaration of " & "gettranslationunittargetinfo" &
        " already exists, not redeclaring")
when not declared(Targetinfodispose):
  proc Targetinfodispose*(Info: Cxtargetinfo_520094112): void {.cdecl,
      importc: "clang_TargetInfo_dispose".}
else:
  static :
    hint("Declaration of " & "Targetinfodispose" &
        " already exists, not redeclaring")
when not declared(Targetinfogettriple):
  proc Targetinfogettriple*(Info: Cxtargetinfo_520094112): Cxstring_520094060 {.
      cdecl, importc: "clang_TargetInfo_getTriple".}
else:
  static :
    hint("Declaration of " & "Targetinfogettriple" &
        " already exists, not redeclaring")
when not declared(Targetinfogetpointerwidth):
  proc Targetinfogetpointerwidth*(Info: Cxtargetinfo_520094112): cint {.cdecl,
      importc: "clang_TargetInfo_getPointerWidth".}
else:
  static :
    hint("Declaration of " & "Targetinfogetpointerwidth" &
        " already exists, not redeclaring")
when not declared(getnullcursor):
  proc getnullcursor*(): Cxcursor_520094169 {.cdecl,
      importc: "clang_getNullCursor".}
else:
  static :
    hint("Declaration of " & "getnullcursor" &
        " already exists, not redeclaring")
when not declared(gettranslationunitcursor):
  proc gettranslationunitcursor*(a0: Cxtranslationunit_520094114): Cxcursor_520094169 {.
      cdecl, importc: "clang_getTranslationUnitCursor".}
else:
  static :
    hint("Declaration of " & "gettranslationunitcursor" &
        " already exists, not redeclaring")
when not declared(equalcursors):
  proc equalcursors*(a0: Cxcursor_520094169; a1: Cxcursor_520094169): cuint {.
      cdecl, importc: "clang_equalCursors".}
else:
  static :
    hint("Declaration of " & "equalcursors" & " already exists, not redeclaring")
when not declared(Cursorisnull):
  proc Cursorisnull*(cursor: Cxcursor_520094169): cint {.cdecl,
      importc: "clang_Cursor_isNull".}
else:
  static :
    hint("Declaration of " & "Cursorisnull" & " already exists, not redeclaring")
when not declared(hashcursor):
  proc hashcursor*(a0: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_hashCursor".}
else:
  static :
    hint("Declaration of " & "hashcursor" & " already exists, not redeclaring")
when not declared(getcursorkind):
  proc getcursorkind*(a0: Cxcursor_520094169): enumcxcursorkind_520094165 {.
      cdecl, importc: "clang_getCursorKind".}
else:
  static :
    hint("Declaration of " & "getcursorkind" &
        " already exists, not redeclaring")
when not declared(isdeclaration):
  proc isdeclaration*(a0: enumcxcursorkind_520094165): cuint {.cdecl,
      importc: "clang_isDeclaration".}
else:
  static :
    hint("Declaration of " & "isdeclaration" &
        " already exists, not redeclaring")
when not declared(isinvaliddeclaration):
  proc isinvaliddeclaration*(a0: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_isInvalidDeclaration".}
else:
  static :
    hint("Declaration of " & "isinvaliddeclaration" &
        " already exists, not redeclaring")
when not declared(isreference):
  proc isreference*(a0: enumcxcursorkind_520094165): cuint {.cdecl,
      importc: "clang_isReference".}
else:
  static :
    hint("Declaration of " & "isreference" & " already exists, not redeclaring")
when not declared(isexpression):
  proc isexpression*(a0: enumcxcursorkind_520094165): cuint {.cdecl,
      importc: "clang_isExpression".}
else:
  static :
    hint("Declaration of " & "isexpression" & " already exists, not redeclaring")
when not declared(isstatement):
  proc isstatement*(a0: enumcxcursorkind_520094165): cuint {.cdecl,
      importc: "clang_isStatement".}
else:
  static :
    hint("Declaration of " & "isstatement" & " already exists, not redeclaring")
when not declared(isattribute):
  proc isattribute*(a0: enumcxcursorkind_520094165): cuint {.cdecl,
      importc: "clang_isAttribute".}
else:
  static :
    hint("Declaration of " & "isattribute" & " already exists, not redeclaring")
when not declared(Cursorhasattrs):
  proc Cursorhasattrs*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_Cursor_hasAttrs".}
else:
  static :
    hint("Declaration of " & "Cursorhasattrs" &
        " already exists, not redeclaring")
when not declared(isinvalid):
  proc isinvalid*(a0: enumcxcursorkind_520094165): cuint {.cdecl,
      importc: "clang_isInvalid".}
else:
  static :
    hint("Declaration of " & "isinvalid" & " already exists, not redeclaring")
when not declared(istranslationunit):
  proc istranslationunit*(a0: enumcxcursorkind_520094165): cuint {.cdecl,
      importc: "clang_isTranslationUnit".}
else:
  static :
    hint("Declaration of " & "istranslationunit" &
        " already exists, not redeclaring")
when not declared(ispreprocessing):
  proc ispreprocessing*(a0: enumcxcursorkind_520094165): cuint {.cdecl,
      importc: "clang_isPreprocessing".}
else:
  static :
    hint("Declaration of " & "ispreprocessing" &
        " already exists, not redeclaring")
when not declared(isunexposed):
  proc isunexposed*(a0: enumcxcursorkind_520094165): cuint {.cdecl,
      importc: "clang_isUnexposed".}
else:
  static :
    hint("Declaration of " & "isunexposed" & " already exists, not redeclaring")
when not declared(getcursorlinkage):
  proc getcursorlinkage*(cursor: Cxcursor_520094169): enumcxlinkagekind_520094171 {.
      cdecl, importc: "clang_getCursorLinkage".}
else:
  static :
    hint("Declaration of " & "getcursorlinkage" &
        " already exists, not redeclaring")
when not declared(getcursorvisibility):
  proc getcursorvisibility*(cursor: Cxcursor_520094169): enumcxvisibilitykind_520094173 {.
      cdecl, importc: "clang_getCursorVisibility".}
else:
  static :
    hint("Declaration of " & "getcursorvisibility" &
        " already exists, not redeclaring")
when not declared(getcursoravailability):
  proc getcursoravailability*(cursor: Cxcursor_520094169): enumcxavailabilitykind_520094120 {.
      cdecl, importc: "clang_getCursorAvailability".}
else:
  static :
    hint("Declaration of " & "getcursoravailability" &
        " already exists, not redeclaring")
when not declared(getcursorplatformavailability):
  proc getcursorplatformavailability*(cursor: Cxcursor_520094169;
                                      alwaysdeprecated: ptr cint;
                                      deprecatedmessage: ptr Cxstring_520094060;
                                      alwaysunavailable: ptr cint;
                                      unavailablemessage: ptr Cxstring_520094060;
                                      availability: ptr Cxplatformavailability_520094177;
                                      availabilitysize: cint): cint {.cdecl,
      importc: "clang_getCursorPlatformAvailability".}
else:
  static :
    hint("Declaration of " & "getcursorplatformavailability" &
        " already exists, not redeclaring")
when not declared(disposecxplatformavailability):
  proc disposecxplatformavailability*(availability: ptr Cxplatformavailability_520094177): void {.
      cdecl, importc: "clang_disposeCXPlatformAvailability".}
else:
  static :
    hint("Declaration of " & "disposecxplatformavailability" &
        " already exists, not redeclaring")
when not declared(Cursorgetvardeclinitializer):
  proc Cursorgetvardeclinitializer*(cursor: Cxcursor_520094169): Cxcursor_520094169 {.
      cdecl, importc: "clang_Cursor_getVarDeclInitializer".}
else:
  static :
    hint("Declaration of " & "Cursorgetvardeclinitializer" &
        " already exists, not redeclaring")
when not declared(Cursorhasvardeclglobalstorage):
  proc Cursorhasvardeclglobalstorage*(cursor: Cxcursor_520094169): cint {.cdecl,
      importc: "clang_Cursor_hasVarDeclGlobalStorage".}
else:
  static :
    hint("Declaration of " & "Cursorhasvardeclglobalstorage" &
        " already exists, not redeclaring")
when not declared(Cursorhasvardeclexternalstorage):
  proc Cursorhasvardeclexternalstorage*(cursor: Cxcursor_520094169): cint {.
      cdecl, importc: "clang_Cursor_hasVarDeclExternalStorage".}
else:
  static :
    hint("Declaration of " & "Cursorhasvardeclexternalstorage" &
        " already exists, not redeclaring")
when not declared(getcursorlanguage):
  proc getcursorlanguage*(cursor: Cxcursor_520094169): enumcxlanguagekind_520094179 {.
      cdecl, importc: "clang_getCursorLanguage".}
else:
  static :
    hint("Declaration of " & "getcursorlanguage" &
        " already exists, not redeclaring")
when not declared(getcursortlskind):
  proc getcursortlskind*(cursor: Cxcursor_520094169): enumcxtlskind_520094181 {.
      cdecl, importc: "clang_getCursorTLSKind".}
else:
  static :
    hint("Declaration of " & "getcursortlskind" &
        " already exists, not redeclaring")
when not declared(Cursorgettranslationunit):
  proc Cursorgettranslationunit*(a0: Cxcursor_520094169): Cxtranslationunit_520094114 {.
      cdecl, importc: "clang_Cursor_getTranslationUnit".}
else:
  static :
    hint("Declaration of " & "Cursorgettranslationunit" &
        " already exists, not redeclaring")
when not declared(createcxcursorset):
  proc createcxcursorset*(): Cxcursorset_520094183 {.cdecl,
      importc: "clang_createCXCursorSet".}
else:
  static :
    hint("Declaration of " & "createcxcursorset" &
        " already exists, not redeclaring")
when not declared(disposecxcursorset):
  proc disposecxcursorset*(cset: Cxcursorset_520094183): void {.cdecl,
      importc: "clang_disposeCXCursorSet".}
else:
  static :
    hint("Declaration of " & "disposecxcursorset" &
        " already exists, not redeclaring")
when not declared(Cxcursorsetcontains):
  proc Cxcursorsetcontains*(cset: Cxcursorset_520094183; cursor: Cxcursor_520094169): cuint {.
      cdecl, importc: "clang_CXCursorSet_contains".}
else:
  static :
    hint("Declaration of " & "Cxcursorsetcontains" &
        " already exists, not redeclaring")
when not declared(Cxcursorsetinsert):
  proc Cxcursorsetinsert*(cset: Cxcursorset_520094183; cursor: Cxcursor_520094169): cuint {.
      cdecl, importc: "clang_CXCursorSet_insert".}
else:
  static :
    hint("Declaration of " & "Cxcursorsetinsert" &
        " already exists, not redeclaring")
when not declared(getcursorsemanticparent):
  proc getcursorsemanticparent*(cursor: Cxcursor_520094169): Cxcursor_520094169 {.
      cdecl, importc: "clang_getCursorSemanticParent".}
else:
  static :
    hint("Declaration of " & "getcursorsemanticparent" &
        " already exists, not redeclaring")
when not declared(getcursorlexicalparent):
  proc getcursorlexicalparent*(cursor: Cxcursor_520094169): Cxcursor_520094169 {.
      cdecl, importc: "clang_getCursorLexicalParent".}
else:
  static :
    hint("Declaration of " & "getcursorlexicalparent" &
        " already exists, not redeclaring")
when not declared(getoverriddencursors):
  proc getoverriddencursors*(cursor: Cxcursor_520094169;
                             overridden: ptr ptr Cxcursor_520094169;
                             numoverridden: ptr cuint): void {.cdecl,
      importc: "clang_getOverriddenCursors".}
else:
  static :
    hint("Declaration of " & "getoverriddencursors" &
        " already exists, not redeclaring")
when not declared(disposeoverriddencursors):
  proc disposeoverriddencursors*(overridden: ptr Cxcursor_520094169): void {.
      cdecl, importc: "clang_disposeOverriddenCursors".}
else:
  static :
    hint("Declaration of " & "disposeoverriddencursors" &
        " already exists, not redeclaring")
when not declared(getincludedfile):
  proc getincludedfile*(cursor: Cxcursor_520094169): Cxfile_520094080 {.cdecl,
      importc: "clang_getIncludedFile".}
else:
  static :
    hint("Declaration of " & "getincludedfile" &
        " already exists, not redeclaring")
when not declared(getcursor):
  proc getcursor*(a0: Cxtranslationunit_520094114; a1: Cxsourcelocation_520094090): Cxcursor_520094169 {.
      cdecl, importc: "clang_getCursor".}
else:
  static :
    hint("Declaration of " & "getcursor" & " already exists, not redeclaring")
when not declared(getcursorlocation):
  proc getcursorlocation*(a0: Cxcursor_520094169): Cxsourcelocation_520094090 {.
      cdecl, importc: "clang_getCursorLocation".}
else:
  static :
    hint("Declaration of " & "getcursorlocation" &
        " already exists, not redeclaring")
when not declared(getcursorextent):
  proc getcursorextent*(a0: Cxcursor_520094169): Cxsourcerange_520094094 {.
      cdecl, importc: "clang_getCursorExtent".}
else:
  static :
    hint("Declaration of " & "getcursorextent" &
        " already exists, not redeclaring")
when not declared(getcursortype):
  proc getcursortype*(C: Cxcursor_520094169): Cxtype_520094191 {.cdecl,
      importc: "clang_getCursorType".}
else:
  static :
    hint("Declaration of " & "getcursortype" &
        " already exists, not redeclaring")
when not declared(gettypespelling):
  proc gettypespelling*(Ct: Cxtype_520094191): Cxstring_520094060 {.cdecl,
      importc: "clang_getTypeSpelling".}
else:
  static :
    hint("Declaration of " & "gettypespelling" &
        " already exists, not redeclaring")
when not declared(gettypedefdeclunderlyingtype):
  proc gettypedefdeclunderlyingtype*(C: Cxcursor_520094169): Cxtype_520094191 {.
      cdecl, importc: "clang_getTypedefDeclUnderlyingType".}
else:
  static :
    hint("Declaration of " & "gettypedefdeclunderlyingtype" &
        " already exists, not redeclaring")
when not declared(getenumdeclintegertype):
  proc getenumdeclintegertype*(C: Cxcursor_520094169): Cxtype_520094191 {.cdecl,
      importc: "clang_getEnumDeclIntegerType".}
else:
  static :
    hint("Declaration of " & "getenumdeclintegertype" &
        " already exists, not redeclaring")
when not declared(getenumconstantdeclvalue):
  proc getenumconstantdeclvalue*(C: Cxcursor_520094169): clonglong {.cdecl,
      importc: "clang_getEnumConstantDeclValue".}
else:
  static :
    hint("Declaration of " & "getenumconstantdeclvalue" &
        " already exists, not redeclaring")
when not declared(getenumconstantdeclunsignedvalue):
  proc getenumconstantdeclunsignedvalue*(C: Cxcursor_520094169): culonglong {.
      cdecl, importc: "clang_getEnumConstantDeclUnsignedValue".}
else:
  static :
    hint("Declaration of " & "getenumconstantdeclunsignedvalue" &
        " already exists, not redeclaring")
when not declared(Cursorisbitfield):
  proc Cursorisbitfield*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_Cursor_isBitField".}
else:
  static :
    hint("Declaration of " & "Cursorisbitfield" &
        " already exists, not redeclaring")
when not declared(getfielddeclbitwidth):
  proc getfielddeclbitwidth*(C: Cxcursor_520094169): cint {.cdecl,
      importc: "clang_getFieldDeclBitWidth".}
else:
  static :
    hint("Declaration of " & "getfielddeclbitwidth" &
        " already exists, not redeclaring")
when not declared(Cursorgetnumarguments):
  proc Cursorgetnumarguments*(C: Cxcursor_520094169): cint {.cdecl,
      importc: "clang_Cursor_getNumArguments".}
else:
  static :
    hint("Declaration of " & "Cursorgetnumarguments" &
        " already exists, not redeclaring")
when not declared(Cursorgetargument):
  proc Cursorgetargument*(C: Cxcursor_520094169; i: cuint): Cxcursor_520094169 {.
      cdecl, importc: "clang_Cursor_getArgument".}
else:
  static :
    hint("Declaration of " & "Cursorgetargument" &
        " already exists, not redeclaring")
when not declared(Cursorgetnumtemplatearguments):
  proc Cursorgetnumtemplatearguments*(C: Cxcursor_520094169): cint {.cdecl,
      importc: "clang_Cursor_getNumTemplateArguments".}
else:
  static :
    hint("Declaration of " & "Cursorgetnumtemplatearguments" &
        " already exists, not redeclaring")
when not declared(Cursorgettemplateargumentkind):
  proc Cursorgettemplateargumentkind*(C: Cxcursor_520094169; I: cuint): enumcxtemplateargumentkind_520094193 {.
      cdecl, importc: "clang_Cursor_getTemplateArgumentKind".}
else:
  static :
    hint("Declaration of " & "Cursorgettemplateargumentkind" &
        " already exists, not redeclaring")
when not declared(Cursorgettemplateargumenttype):
  proc Cursorgettemplateargumenttype*(C: Cxcursor_520094169; I: cuint): Cxtype_520094191 {.
      cdecl, importc: "clang_Cursor_getTemplateArgumentType".}
else:
  static :
    hint("Declaration of " & "Cursorgettemplateargumenttype" &
        " already exists, not redeclaring")
when not declared(Cursorgettemplateargumentvalue):
  proc Cursorgettemplateargumentvalue*(C: Cxcursor_520094169; I: cuint): clonglong {.
      cdecl, importc: "clang_Cursor_getTemplateArgumentValue".}
else:
  static :
    hint("Declaration of " & "Cursorgettemplateargumentvalue" &
        " already exists, not redeclaring")
when not declared(Cursorgettemplateargumentunsignedvalue):
  proc Cursorgettemplateargumentunsignedvalue*(C: Cxcursor_520094169; I: cuint): culonglong {.
      cdecl, importc: "clang_Cursor_getTemplateArgumentUnsignedValue".}
else:
  static :
    hint("Declaration of " & "Cursorgettemplateargumentunsignedvalue" &
        " already exists, not redeclaring")
when not declared(equaltypes):
  proc equaltypes*(A: Cxtype_520094191; B: Cxtype_520094191): cuint {.cdecl,
      importc: "clang_equalTypes".}
else:
  static :
    hint("Declaration of " & "equaltypes" & " already exists, not redeclaring")
when not declared(getcanonicaltype):
  proc getcanonicaltype*(T: Cxtype_520094191): Cxtype_520094191 {.cdecl,
      importc: "clang_getCanonicalType".}
else:
  static :
    hint("Declaration of " & "getcanonicaltype" &
        " already exists, not redeclaring")
when not declared(isconstqualifiedtype):
  proc isconstqualifiedtype*(T: Cxtype_520094191): cuint {.cdecl,
      importc: "clang_isConstQualifiedType".}
else:
  static :
    hint("Declaration of " & "isconstqualifiedtype" &
        " already exists, not redeclaring")
when not declared(Cursorismacrofunctionlike):
  proc Cursorismacrofunctionlike*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_Cursor_isMacroFunctionLike".}
else:
  static :
    hint("Declaration of " & "Cursorismacrofunctionlike" &
        " already exists, not redeclaring")
when not declared(Cursorismacrobuiltin):
  proc Cursorismacrobuiltin*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_Cursor_isMacroBuiltin".}
else:
  static :
    hint("Declaration of " & "Cursorismacrobuiltin" &
        " already exists, not redeclaring")
when not declared(Cursorisfunctioninlined):
  proc Cursorisfunctioninlined*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_Cursor_isFunctionInlined".}
else:
  static :
    hint("Declaration of " & "Cursorisfunctioninlined" &
        " already exists, not redeclaring")
when not declared(isvolatilequalifiedtype):
  proc isvolatilequalifiedtype*(T: Cxtype_520094191): cuint {.cdecl,
      importc: "clang_isVolatileQualifiedType".}
else:
  static :
    hint("Declaration of " & "isvolatilequalifiedtype" &
        " already exists, not redeclaring")
when not declared(isrestrictqualifiedtype):
  proc isrestrictqualifiedtype*(T: Cxtype_520094191): cuint {.cdecl,
      importc: "clang_isRestrictQualifiedType".}
else:
  static :
    hint("Declaration of " & "isrestrictqualifiedtype" &
        " already exists, not redeclaring")
when not declared(getaddressspace):
  proc getaddressspace*(T: Cxtype_520094191): cuint {.cdecl,
      importc: "clang_getAddressSpace".}
else:
  static :
    hint("Declaration of " & "getaddressspace" &
        " already exists, not redeclaring")
when not declared(gettypedefname):
  proc gettypedefname*(Ct: Cxtype_520094191): Cxstring_520094060 {.cdecl,
      importc: "clang_getTypedefName".}
else:
  static :
    hint("Declaration of " & "gettypedefname" &
        " already exists, not redeclaring")
when not declared(getpointeetype):
  proc getpointeetype*(T: Cxtype_520094191): Cxtype_520094191 {.cdecl,
      importc: "clang_getPointeeType".}
else:
  static :
    hint("Declaration of " & "getpointeetype" &
        " already exists, not redeclaring")
when not declared(getunqualifiedtype):
  proc getunqualifiedtype*(Ct: Cxtype_520094191): Cxtype_520094191 {.cdecl,
      importc: "clang_getUnqualifiedType".}
else:
  static :
    hint("Declaration of " & "getunqualifiedtype" &
        " already exists, not redeclaring")
when not declared(getnonreferencetype):
  proc getnonreferencetype*(Ct: Cxtype_520094191): Cxtype_520094191 {.cdecl,
      importc: "clang_getNonReferenceType".}
else:
  static :
    hint("Declaration of " & "getnonreferencetype" &
        " already exists, not redeclaring")
when not declared(gettypedeclaration):
  proc gettypedeclaration*(T: Cxtype_520094191): Cxcursor_520094169 {.cdecl,
      importc: "clang_getTypeDeclaration".}
else:
  static :
    hint("Declaration of " & "gettypedeclaration" &
        " already exists, not redeclaring")
when not declared(getdeclobjctypeencoding):
  proc getdeclobjctypeencoding*(C: Cxcursor_520094169): Cxstring_520094060 {.
      cdecl, importc: "clang_getDeclObjCTypeEncoding".}
else:
  static :
    hint("Declaration of " & "getdeclobjctypeencoding" &
        " already exists, not redeclaring")
when not declared(Typegetobjcencoding):
  proc Typegetobjcencoding*(typearg: Cxtype_520094191): Cxstring_520094060 {.
      cdecl, importc: "clang_Type_getObjCEncoding".}
else:
  static :
    hint("Declaration of " & "Typegetobjcencoding" &
        " already exists, not redeclaring")
when not declared(gettypekindspelling):
  proc gettypekindspelling*(K: enumcxtypekind_520094185): Cxstring_520094060 {.
      cdecl, importc: "clang_getTypeKindSpelling".}
else:
  static :
    hint("Declaration of " & "gettypekindspelling" &
        " already exists, not redeclaring")
when not declared(getfunctiontypecallingconv):
  proc getfunctiontypecallingconv*(T: Cxtype_520094191): enumcxcallingconv_520094187 {.
      cdecl, importc: "clang_getFunctionTypeCallingConv".}
else:
  static :
    hint("Declaration of " & "getfunctiontypecallingconv" &
        " already exists, not redeclaring")
when not declared(getresulttype):
  proc getresulttype*(T: Cxtype_520094191): Cxtype_520094191 {.cdecl,
      importc: "clang_getResultType".}
else:
  static :
    hint("Declaration of " & "getresulttype" &
        " already exists, not redeclaring")
when not declared(getexceptionspecificationtype):
  proc getexceptionspecificationtype*(T: Cxtype_520094191): cint {.cdecl,
      importc: "clang_getExceptionSpecificationType".}
else:
  static :
    hint("Declaration of " & "getexceptionspecificationtype" &
        " already exists, not redeclaring")
when not declared(getnumargtypes):
  proc getnumargtypes*(T: Cxtype_520094191): cint {.cdecl,
      importc: "clang_getNumArgTypes".}
else:
  static :
    hint("Declaration of " & "getnumargtypes" &
        " already exists, not redeclaring")
when not declared(getargtype):
  proc getargtype*(T: Cxtype_520094191; i: cuint): Cxtype_520094191 {.cdecl,
      importc: "clang_getArgType".}
else:
  static :
    hint("Declaration of " & "getargtype" & " already exists, not redeclaring")
when not declared(Typegetobjcobjectbasetype):
  proc Typegetobjcobjectbasetype*(T: Cxtype_520094191): Cxtype_520094191 {.
      cdecl, importc: "clang_Type_getObjCObjectBaseType".}
else:
  static :
    hint("Declaration of " & "Typegetobjcobjectbasetype" &
        " already exists, not redeclaring")
when not declared(Typegetnumobjcprotocolrefs):
  proc Typegetnumobjcprotocolrefs*(T: Cxtype_520094191): cuint {.cdecl,
      importc: "clang_Type_getNumObjCProtocolRefs".}
else:
  static :
    hint("Declaration of " & "Typegetnumobjcprotocolrefs" &
        " already exists, not redeclaring")
when not declared(Typegetobjcprotocoldecl):
  proc Typegetobjcprotocoldecl*(T: Cxtype_520094191; i: cuint): Cxcursor_520094169 {.
      cdecl, importc: "clang_Type_getObjCProtocolDecl".}
else:
  static :
    hint("Declaration of " & "Typegetobjcprotocoldecl" &
        " already exists, not redeclaring")
when not declared(Typegetnumobjctypeargs):
  proc Typegetnumobjctypeargs*(T: Cxtype_520094191): cuint {.cdecl,
      importc: "clang_Type_getNumObjCTypeArgs".}
else:
  static :
    hint("Declaration of " & "Typegetnumobjctypeargs" &
        " already exists, not redeclaring")
when not declared(Typegetobjctypearg):
  proc Typegetobjctypearg*(T: Cxtype_520094191; i: cuint): Cxtype_520094191 {.
      cdecl, importc: "clang_Type_getObjCTypeArg".}
else:
  static :
    hint("Declaration of " & "Typegetobjctypearg" &
        " already exists, not redeclaring")
when not declared(isfunctiontypevariadic):
  proc isfunctiontypevariadic*(T: Cxtype_520094191): cuint {.cdecl,
      importc: "clang_isFunctionTypeVariadic".}
else:
  static :
    hint("Declaration of " & "isfunctiontypevariadic" &
        " already exists, not redeclaring")
when not declared(getcursorresulttype):
  proc getcursorresulttype*(C: Cxcursor_520094169): Cxtype_520094191 {.cdecl,
      importc: "clang_getCursorResultType".}
else:
  static :
    hint("Declaration of " & "getcursorresulttype" &
        " already exists, not redeclaring")
when not declared(getcursorexceptionspecificationtype):
  proc getcursorexceptionspecificationtype*(C: Cxcursor_520094169): cint {.
      cdecl, importc: "clang_getCursorExceptionSpecificationType".}
else:
  static :
    hint("Declaration of " & "getcursorexceptionspecificationtype" &
        " already exists, not redeclaring")
when not declared(ispodtype):
  proc ispodtype*(T: Cxtype_520094191): cuint {.cdecl,
      importc: "clang_isPODType".}
else:
  static :
    hint("Declaration of " & "ispodtype" & " already exists, not redeclaring")
when not declared(getelementtype):
  proc getelementtype*(T: Cxtype_520094191): Cxtype_520094191 {.cdecl,
      importc: "clang_getElementType".}
else:
  static :
    hint("Declaration of " & "getelementtype" &
        " already exists, not redeclaring")
when not declared(getnumelements):
  proc getnumelements*(T: Cxtype_520094191): clonglong {.cdecl,
      importc: "clang_getNumElements".}
else:
  static :
    hint("Declaration of " & "getnumelements" &
        " already exists, not redeclaring")
when not declared(getarrayelementtype):
  proc getarrayelementtype*(T: Cxtype_520094191): Cxtype_520094191 {.cdecl,
      importc: "clang_getArrayElementType".}
else:
  static :
    hint("Declaration of " & "getarrayelementtype" &
        " already exists, not redeclaring")
when not declared(getarraysize):
  proc getarraysize*(T: Cxtype_520094191): clonglong {.cdecl,
      importc: "clang_getArraySize".}
else:
  static :
    hint("Declaration of " & "getarraysize" & " already exists, not redeclaring")
when not declared(Typegetnamedtype):
  proc Typegetnamedtype*(T: Cxtype_520094191): Cxtype_520094191 {.cdecl,
      importc: "clang_Type_getNamedType".}
else:
  static :
    hint("Declaration of " & "Typegetnamedtype" &
        " already exists, not redeclaring")
when not declared(Typeistransparenttagtypedef):
  proc Typeistransparenttagtypedef*(T: Cxtype_520094191): cuint {.cdecl,
      importc: "clang_Type_isTransparentTagTypedef".}
else:
  static :
    hint("Declaration of " & "Typeistransparenttagtypedef" &
        " already exists, not redeclaring")
when not declared(Typegetnullability):
  proc Typegetnullability*(T: Cxtype_520094191): enumcxtypenullabilitykind_520094195 {.
      cdecl, importc: "clang_Type_getNullability".}
else:
  static :
    hint("Declaration of " & "Typegetnullability" &
        " already exists, not redeclaring")
when not declared(Typegetalignof):
  proc Typegetalignof*(T: Cxtype_520094191): clonglong {.cdecl,
      importc: "clang_Type_getAlignOf".}
else:
  static :
    hint("Declaration of " & "Typegetalignof" &
        " already exists, not redeclaring")
when not declared(Typegetclasstype):
  proc Typegetclasstype*(T: Cxtype_520094191): Cxtype_520094191 {.cdecl,
      importc: "clang_Type_getClassType".}
else:
  static :
    hint("Declaration of " & "Typegetclasstype" &
        " already exists, not redeclaring")
when not declared(Typegetsizeof):
  proc Typegetsizeof*(T: Cxtype_520094191): clonglong {.cdecl,
      importc: "clang_Type_getSizeOf".}
else:
  static :
    hint("Declaration of " & "Typegetsizeof" &
        " already exists, not redeclaring")
when not declared(Typegetoffsetof):
  proc Typegetoffsetof*(T: Cxtype_520094191; S: cstring): clonglong {.cdecl,
      importc: "clang_Type_getOffsetOf".}
else:
  static :
    hint("Declaration of " & "Typegetoffsetof" &
        " already exists, not redeclaring")
when not declared(Typegetmodifiedtype):
  proc Typegetmodifiedtype*(T: Cxtype_520094191): Cxtype_520094191 {.cdecl,
      importc: "clang_Type_getModifiedType".}
else:
  static :
    hint("Declaration of " & "Typegetmodifiedtype" &
        " already exists, not redeclaring")
when not declared(Typegetvaluetype):
  proc Typegetvaluetype*(Ct: Cxtype_520094191): Cxtype_520094191 {.cdecl,
      importc: "clang_Type_getValueType".}
else:
  static :
    hint("Declaration of " & "Typegetvaluetype" &
        " already exists, not redeclaring")
when not declared(Cursorgetoffsetoffield):
  proc Cursorgetoffsetoffield*(C: Cxcursor_520094169): clonglong {.cdecl,
      importc: "clang_Cursor_getOffsetOfField".}
else:
  static :
    hint("Declaration of " & "Cursorgetoffsetoffield" &
        " already exists, not redeclaring")
when not declared(Cursorisanonymous):
  proc Cursorisanonymous*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_Cursor_isAnonymous".}
else:
  static :
    hint("Declaration of " & "Cursorisanonymous" &
        " already exists, not redeclaring")
when not declared(Cursorisanonymousrecorddecl):
  proc Cursorisanonymousrecorddecl*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_Cursor_isAnonymousRecordDecl".}
else:
  static :
    hint("Declaration of " & "Cursorisanonymousrecorddecl" &
        " already exists, not redeclaring")
when not declared(Cursorisinlinenamespace):
  proc Cursorisinlinenamespace*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_Cursor_isInlineNamespace".}
else:
  static :
    hint("Declaration of " & "Cursorisinlinenamespace" &
        " already exists, not redeclaring")
when not declared(Typegetnumtemplatearguments):
  proc Typegetnumtemplatearguments*(T: Cxtype_520094191): cint {.cdecl,
      importc: "clang_Type_getNumTemplateArguments".}
else:
  static :
    hint("Declaration of " & "Typegetnumtemplatearguments" &
        " already exists, not redeclaring")
when not declared(Typegettemplateargumentastype):
  proc Typegettemplateargumentastype*(T: Cxtype_520094191; i: cuint): Cxtype_520094191 {.
      cdecl, importc: "clang_Type_getTemplateArgumentAsType".}
else:
  static :
    hint("Declaration of " & "Typegettemplateargumentastype" &
        " already exists, not redeclaring")
when not declared(Typegetcxxrefqualifier):
  proc Typegetcxxrefqualifier*(T: Cxtype_520094191): enumcxrefqualifierkind_520094199 {.
      cdecl, importc: "clang_Type_getCXXRefQualifier".}
else:
  static :
    hint("Declaration of " & "Typegetcxxrefqualifier" &
        " already exists, not redeclaring")
when not declared(isvirtualbase):
  proc isvirtualbase*(a0: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_isVirtualBase".}
else:
  static :
    hint("Declaration of " & "isvirtualbase" &
        " already exists, not redeclaring")
when not declared(getcxxaccessspecifier):
  proc getcxxaccessspecifier*(a0: Cxcursor_520094169): enumcxcxxaccessspecifier_520094201 {.
      cdecl, importc: "clang_getCXXAccessSpecifier".}
else:
  static :
    hint("Declaration of " & "getcxxaccessspecifier" &
        " already exists, not redeclaring")
when not declared(Cursorgetstorageclass):
  proc Cursorgetstorageclass*(a0: Cxcursor_520094169): enumcxstorageclass_520094203 {.
      cdecl, importc: "clang_Cursor_getStorageClass".}
else:
  static :
    hint("Declaration of " & "Cursorgetstorageclass" &
        " already exists, not redeclaring")
when not declared(getnumoverloadeddecls):
  proc getnumoverloadeddecls*(cursor: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_getNumOverloadedDecls".}
else:
  static :
    hint("Declaration of " & "getnumoverloadeddecls" &
        " already exists, not redeclaring")
when not declared(getoverloadeddecl):
  proc getoverloadeddecl*(cursor: Cxcursor_520094169; index: cuint): Cxcursor_520094169 {.
      cdecl, importc: "clang_getOverloadedDecl".}
else:
  static :
    hint("Declaration of " & "getoverloadeddecl" &
        " already exists, not redeclaring")
when not declared(getiboutletcollectiontype):
  proc getiboutletcollectiontype*(a0: Cxcursor_520094169): Cxtype_520094191 {.
      cdecl, importc: "clang_getIBOutletCollectionType".}
else:
  static :
    hint("Declaration of " & "getiboutletcollectiontype" &
        " already exists, not redeclaring")
when not declared(visitchildren):
  proc visitchildren*(parent: Cxcursor_520094169; visitor: Cxcursorvisitor_520094207;
                      clientdata: Cxclientdata_520094116): cuint {.cdecl,
      importc: "clang_visitChildren".}
else:
  static :
    hint("Declaration of " & "visitchildren" &
        " already exists, not redeclaring")
when not declared(visitchildrenwithblock):
  proc visitchildrenwithblock*(parent: Cxcursor_520094169;
                               blockarg: Cxcursorvisitorblock_520094209): cuint {.
      cdecl, importc: "clang_visitChildrenWithBlock".}
else:
  static :
    hint("Declaration of " & "visitchildrenwithblock" &
        " already exists, not redeclaring")
when not declared(getcursorusr):
  proc getcursorusr*(a0: Cxcursor_520094169): Cxstring_520094060 {.cdecl,
      importc: "clang_getCursorUSR".}
else:
  static :
    hint("Declaration of " & "getcursorusr" & " already exists, not redeclaring")
when not declared(constructusrobjcclass):
  proc constructusrobjcclass*(classname: cstring): Cxstring_520094060 {.cdecl,
      importc: "clang_constructUSR_ObjCClass".}
else:
  static :
    hint("Declaration of " & "constructusrobjcclass" &
        " already exists, not redeclaring")
when not declared(constructusrobjccategory):
  proc constructusrobjccategory*(classname: cstring; categoryname: cstring): Cxstring_520094060 {.
      cdecl, importc: "clang_constructUSR_ObjCCategory".}
else:
  static :
    hint("Declaration of " & "constructusrobjccategory" &
        " already exists, not redeclaring")
when not declared(constructusrobjcprotocol):
  proc constructusrobjcprotocol*(protocolname: cstring): Cxstring_520094060 {.
      cdecl, importc: "clang_constructUSR_ObjCProtocol".}
else:
  static :
    hint("Declaration of " & "constructusrobjcprotocol" &
        " already exists, not redeclaring")
when not declared(constructusrobjcivar):
  proc constructusrobjcivar*(name: cstring; classusr: Cxstring_520094060): Cxstring_520094060 {.
      cdecl, importc: "clang_constructUSR_ObjCIvar".}
else:
  static :
    hint("Declaration of " & "constructusrobjcivar" &
        " already exists, not redeclaring")
when not declared(constructusrobjcmethod):
  proc constructusrobjcmethod*(name: cstring; isinstancemethod: cuint;
                               classusr: Cxstring_520094060): Cxstring_520094060 {.
      cdecl, importc: "clang_constructUSR_ObjCMethod".}
else:
  static :
    hint("Declaration of " & "constructusrobjcmethod" &
        " already exists, not redeclaring")
when not declared(constructusrobjcproperty):
  proc constructusrobjcproperty*(property: cstring; classusr: Cxstring_520094060): Cxstring_520094060 {.
      cdecl, importc: "clang_constructUSR_ObjCProperty".}
else:
  static :
    hint("Declaration of " & "constructusrobjcproperty" &
        " already exists, not redeclaring")
when not declared(getcursorspelling):
  proc getcursorspelling*(a0: Cxcursor_520094169): Cxstring_520094060 {.cdecl,
      importc: "clang_getCursorSpelling".}
else:
  static :
    hint("Declaration of " & "getcursorspelling" &
        " already exists, not redeclaring")
when not declared(Cursorgetspellingnamerange):
  proc Cursorgetspellingnamerange*(a0: Cxcursor_520094169; pieceindex: cuint;
                                   options: cuint): Cxsourcerange_520094094 {.
      cdecl, importc: "clang_Cursor_getSpellingNameRange".}
else:
  static :
    hint("Declaration of " & "Cursorgetspellingnamerange" &
        " already exists, not redeclaring")
when not declared(Printingpolicygetproperty):
  proc Printingpolicygetproperty*(Policy: Cxprintingpolicy_520094211;
                                  Property: enumcxprintingpolicyproperty_520094213): cuint {.
      cdecl, importc: "clang_PrintingPolicy_getProperty".}
else:
  static :
    hint("Declaration of " & "Printingpolicygetproperty" &
        " already exists, not redeclaring")
when not declared(Printingpolicysetproperty):
  proc Printingpolicysetproperty*(Policy: Cxprintingpolicy_520094211;
                                  Property: enumcxprintingpolicyproperty_520094213;
                                  Value: cuint): void {.cdecl,
      importc: "clang_PrintingPolicy_setProperty".}
else:
  static :
    hint("Declaration of " & "Printingpolicysetproperty" &
        " already exists, not redeclaring")
when not declared(getcursorprintingpolicy):
  proc getcursorprintingpolicy*(a0: Cxcursor_520094169): Cxprintingpolicy_520094211 {.
      cdecl, importc: "clang_getCursorPrintingPolicy".}
else:
  static :
    hint("Declaration of " & "getcursorprintingpolicy" &
        " already exists, not redeclaring")
when not declared(Printingpolicydispose):
  proc Printingpolicydispose*(Policy: Cxprintingpolicy_520094211): void {.cdecl,
      importc: "clang_PrintingPolicy_dispose".}
else:
  static :
    hint("Declaration of " & "Printingpolicydispose" &
        " already exists, not redeclaring")
when not declared(getcursorprettyprinted):
  proc getcursorprettyprinted*(Cursor: Cxcursor_520094169;
                               Policy: Cxprintingpolicy_520094211): Cxstring_520094060 {.
      cdecl, importc: "clang_getCursorPrettyPrinted".}
else:
  static :
    hint("Declaration of " & "getcursorprettyprinted" &
        " already exists, not redeclaring")
when not declared(getcursordisplayname):
  proc getcursordisplayname*(a0: Cxcursor_520094169): Cxstring_520094060 {.
      cdecl, importc: "clang_getCursorDisplayName".}
else:
  static :
    hint("Declaration of " & "getcursordisplayname" &
        " already exists, not redeclaring")
when not declared(getcursorreferenced):
  proc getcursorreferenced*(a0: Cxcursor_520094169): Cxcursor_520094169 {.cdecl,
      importc: "clang_getCursorReferenced".}
else:
  static :
    hint("Declaration of " & "getcursorreferenced" &
        " already exists, not redeclaring")
when not declared(getcursordefinition):
  proc getcursordefinition*(a0: Cxcursor_520094169): Cxcursor_520094169 {.cdecl,
      importc: "clang_getCursorDefinition".}
else:
  static :
    hint("Declaration of " & "getcursordefinition" &
        " already exists, not redeclaring")
when not declared(iscursordefinition):
  proc iscursordefinition*(a0: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_isCursorDefinition".}
else:
  static :
    hint("Declaration of " & "iscursordefinition" &
        " already exists, not redeclaring")
when not declared(getcanonicalcursor):
  proc getcanonicalcursor*(a0: Cxcursor_520094169): Cxcursor_520094169 {.cdecl,
      importc: "clang_getCanonicalCursor".}
else:
  static :
    hint("Declaration of " & "getcanonicalcursor" &
        " already exists, not redeclaring")
when not declared(Cursorgetobjcselectorindex):
  proc Cursorgetobjcselectorindex*(a0: Cxcursor_520094169): cint {.cdecl,
      importc: "clang_Cursor_getObjCSelectorIndex".}
else:
  static :
    hint("Declaration of " & "Cursorgetobjcselectorindex" &
        " already exists, not redeclaring")
when not declared(Cursorisdynamiccall):
  proc Cursorisdynamiccall*(C: Cxcursor_520094169): cint {.cdecl,
      importc: "clang_Cursor_isDynamicCall".}
else:
  static :
    hint("Declaration of " & "Cursorisdynamiccall" &
        " already exists, not redeclaring")
when not declared(Cursorgetreceivertype):
  proc Cursorgetreceivertype*(C: Cxcursor_520094169): Cxtype_520094191 {.cdecl,
      importc: "clang_Cursor_getReceiverType".}
else:
  static :
    hint("Declaration of " & "Cursorgetreceivertype" &
        " already exists, not redeclaring")
when not declared(Cursorgetobjcpropertyattributes):
  proc Cursorgetobjcpropertyattributes*(C: Cxcursor_520094169; reserved: cuint): cuint {.
      cdecl, importc: "clang_Cursor_getObjCPropertyAttributes".}
else:
  static :
    hint("Declaration of " & "Cursorgetobjcpropertyattributes" &
        " already exists, not redeclaring")
when not declared(Cursorgetobjcpropertygettername):
  proc Cursorgetobjcpropertygettername*(C: Cxcursor_520094169): Cxstring_520094060 {.
      cdecl, importc: "clang_Cursor_getObjCPropertyGetterName".}
else:
  static :
    hint("Declaration of " & "Cursorgetobjcpropertygettername" &
        " already exists, not redeclaring")
when not declared(Cursorgetobjcpropertysettername):
  proc Cursorgetobjcpropertysettername*(C: Cxcursor_520094169): Cxstring_520094060 {.
      cdecl, importc: "clang_Cursor_getObjCPropertySetterName".}
else:
  static :
    hint("Declaration of " & "Cursorgetobjcpropertysettername" &
        " already exists, not redeclaring")
when not declared(Cursorgetobjcdeclqualifiers):
  proc Cursorgetobjcdeclqualifiers*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_Cursor_getObjCDeclQualifiers".}
else:
  static :
    hint("Declaration of " & "Cursorgetobjcdeclqualifiers" &
        " already exists, not redeclaring")
when not declared(Cursorisobjcoptional):
  proc Cursorisobjcoptional*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_Cursor_isObjCOptional".}
else:
  static :
    hint("Declaration of " & "Cursorisobjcoptional" &
        " already exists, not redeclaring")
when not declared(Cursorisvariadic):
  proc Cursorisvariadic*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_Cursor_isVariadic".}
else:
  static :
    hint("Declaration of " & "Cursorisvariadic" &
        " already exists, not redeclaring")
when not declared(Cursorisexternalsymbol):
  proc Cursorisexternalsymbol*(C: Cxcursor_520094169; language: ptr Cxstring_520094060;
                               definedin: ptr Cxstring_520094060;
                               isgenerated: ptr cuint): cuint {.cdecl,
      importc: "clang_Cursor_isExternalSymbol".}
else:
  static :
    hint("Declaration of " & "Cursorisexternalsymbol" &
        " already exists, not redeclaring")
when not declared(Cursorgetcommentrange):
  proc Cursorgetcommentrange*(C: Cxcursor_520094169): Cxsourcerange_520094094 {.
      cdecl, importc: "clang_Cursor_getCommentRange".}
else:
  static :
    hint("Declaration of " & "Cursorgetcommentrange" &
        " already exists, not redeclaring")
when not declared(Cursorgetrawcommenttext):
  proc Cursorgetrawcommenttext*(C: Cxcursor_520094169): Cxstring_520094060 {.
      cdecl, importc: "clang_Cursor_getRawCommentText".}
else:
  static :
    hint("Declaration of " & "Cursorgetrawcommenttext" &
        " already exists, not redeclaring")
when not declared(Cursorgetbriefcommenttext):
  proc Cursorgetbriefcommenttext*(C: Cxcursor_520094169): Cxstring_520094060 {.
      cdecl, importc: "clang_Cursor_getBriefCommentText".}
else:
  static :
    hint("Declaration of " & "Cursorgetbriefcommenttext" &
        " already exists, not redeclaring")
when not declared(Cursorgetmangling):
  proc Cursorgetmangling*(a0: Cxcursor_520094169): Cxstring_520094060 {.cdecl,
      importc: "clang_Cursor_getMangling".}
else:
  static :
    hint("Declaration of " & "Cursorgetmangling" &
        " already exists, not redeclaring")
when not declared(Cursorgetcxxmanglings):
  proc Cursorgetcxxmanglings*(a0: Cxcursor_520094169): ptr Cxstringset_520094064 {.
      cdecl, importc: "clang_Cursor_getCXXManglings".}
else:
  static :
    hint("Declaration of " & "Cursorgetcxxmanglings" &
        " already exists, not redeclaring")
when not declared(Cursorgetobjcmanglings):
  proc Cursorgetobjcmanglings*(a0: Cxcursor_520094169): ptr Cxstringset_520094064 {.
      cdecl, importc: "clang_Cursor_getObjCManglings".}
else:
  static :
    hint("Declaration of " & "Cursorgetobjcmanglings" &
        " already exists, not redeclaring")
when not declared(Cursorgetmodule):
  proc Cursorgetmodule*(C: Cxcursor_520094169): Cxmodule_520094223 {.cdecl,
      importc: "clang_Cursor_getModule".}
else:
  static :
    hint("Declaration of " & "Cursorgetmodule" &
        " already exists, not redeclaring")
when not declared(getmoduleforfile):
  proc getmoduleforfile*(a0: Cxtranslationunit_520094114; a1: Cxfile_520094080): Cxmodule_520094223 {.
      cdecl, importc: "clang_getModuleForFile".}
else:
  static :
    hint("Declaration of " & "getmoduleforfile" &
        " already exists, not redeclaring")
when not declared(Modulegetastfile):
  proc Modulegetastfile*(Module: Cxmodule_520094223): Cxfile_520094080 {.cdecl,
      importc: "clang_Module_getASTFile".}
else:
  static :
    hint("Declaration of " & "Modulegetastfile" &
        " already exists, not redeclaring")
when not declared(Modulegetparent):
  proc Modulegetparent*(Module: Cxmodule_520094223): Cxmodule_520094223 {.cdecl,
      importc: "clang_Module_getParent".}
else:
  static :
    hint("Declaration of " & "Modulegetparent" &
        " already exists, not redeclaring")
when not declared(Modulegetname):
  proc Modulegetname*(Module: Cxmodule_520094223): Cxstring_520094060 {.cdecl,
      importc: "clang_Module_getName".}
else:
  static :
    hint("Declaration of " & "Modulegetname" &
        " already exists, not redeclaring")
when not declared(Modulegetfullname):
  proc Modulegetfullname*(Module: Cxmodule_520094223): Cxstring_520094060 {.
      cdecl, importc: "clang_Module_getFullName".}
else:
  static :
    hint("Declaration of " & "Modulegetfullname" &
        " already exists, not redeclaring")
when not declared(Moduleissystem):
  proc Moduleissystem*(Module: Cxmodule_520094223): cint {.cdecl,
      importc: "clang_Module_isSystem".}
else:
  static :
    hint("Declaration of " & "Moduleissystem" &
        " already exists, not redeclaring")
when not declared(Modulegetnumtoplevelheaders):
  proc Modulegetnumtoplevelheaders*(a0: Cxtranslationunit_520094114;
                                    Module: Cxmodule_520094223): cuint {.cdecl,
      importc: "clang_Module_getNumTopLevelHeaders".}
else:
  static :
    hint("Declaration of " & "Modulegetnumtoplevelheaders" &
        " already exists, not redeclaring")
when not declared(Modulegettoplevelheader):
  proc Modulegettoplevelheader*(a0: Cxtranslationunit_520094114;
                                Module: Cxmodule_520094223; Index: cuint): Cxfile_520094080 {.
      cdecl, importc: "clang_Module_getTopLevelHeader".}
else:
  static :
    hint("Declaration of " & "Modulegettoplevelheader" &
        " already exists, not redeclaring")
when not declared(Cxxconstructorisconvertingconstructor):
  proc Cxxconstructorisconvertingconstructor*(C: Cxcursor_520094169): cuint {.
      cdecl, importc: "clang_CXXConstructor_isConvertingConstructor".}
else:
  static :
    hint("Declaration of " & "Cxxconstructorisconvertingconstructor" &
        " already exists, not redeclaring")
when not declared(Cxxconstructoriscopyconstructor):
  proc Cxxconstructoriscopyconstructor*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_CXXConstructor_isCopyConstructor".}
else:
  static :
    hint("Declaration of " & "Cxxconstructoriscopyconstructor" &
        " already exists, not redeclaring")
when not declared(Cxxconstructorisdefaultconstructor):
  proc Cxxconstructorisdefaultconstructor*(C: Cxcursor_520094169): cuint {.
      cdecl, importc: "clang_CXXConstructor_isDefaultConstructor".}
else:
  static :
    hint("Declaration of " & "Cxxconstructorisdefaultconstructor" &
        " already exists, not redeclaring")
when not declared(Cxxconstructorismoveconstructor):
  proc Cxxconstructorismoveconstructor*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_CXXConstructor_isMoveConstructor".}
else:
  static :
    hint("Declaration of " & "Cxxconstructorismoveconstructor" &
        " already exists, not redeclaring")
when not declared(Cxxfieldismutable):
  proc Cxxfieldismutable*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_CXXField_isMutable".}
else:
  static :
    hint("Declaration of " & "Cxxfieldismutable" &
        " already exists, not redeclaring")
when not declared(Cxxmethodisdefaulted):
  proc Cxxmethodisdefaulted*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_CXXMethod_isDefaulted".}
else:
  static :
    hint("Declaration of " & "Cxxmethodisdefaulted" &
        " already exists, not redeclaring")
when not declared(Cxxmethodisdeleted):
  proc Cxxmethodisdeleted*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_CXXMethod_isDeleted".}
else:
  static :
    hint("Declaration of " & "Cxxmethodisdeleted" &
        " already exists, not redeclaring")
when not declared(Cxxmethodispurevirtual):
  proc Cxxmethodispurevirtual*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_CXXMethod_isPureVirtual".}
else:
  static :
    hint("Declaration of " & "Cxxmethodispurevirtual" &
        " already exists, not redeclaring")
when not declared(Cxxmethodisstatic):
  proc Cxxmethodisstatic*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_CXXMethod_isStatic".}
else:
  static :
    hint("Declaration of " & "Cxxmethodisstatic" &
        " already exists, not redeclaring")
when not declared(Cxxmethodisvirtual):
  proc Cxxmethodisvirtual*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_CXXMethod_isVirtual".}
else:
  static :
    hint("Declaration of " & "Cxxmethodisvirtual" &
        " already exists, not redeclaring")
when not declared(Cxxmethodiscopyassignmentoperator):
  proc Cxxmethodiscopyassignmentoperator*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_CXXMethod_isCopyAssignmentOperator".}
else:
  static :
    hint("Declaration of " & "Cxxmethodiscopyassignmentoperator" &
        " already exists, not redeclaring")
when not declared(Cxxmethodismoveassignmentoperator):
  proc Cxxmethodismoveassignmentoperator*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_CXXMethod_isMoveAssignmentOperator".}
else:
  static :
    hint("Declaration of " & "Cxxmethodismoveassignmentoperator" &
        " already exists, not redeclaring")
when not declared(Cxxmethodisexplicit):
  proc Cxxmethodisexplicit*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_CXXMethod_isExplicit".}
else:
  static :
    hint("Declaration of " & "Cxxmethodisexplicit" &
        " already exists, not redeclaring")
when not declared(Cxxrecordisabstract):
  proc Cxxrecordisabstract*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_CXXRecord_isAbstract".}
else:
  static :
    hint("Declaration of " & "Cxxrecordisabstract" &
        " already exists, not redeclaring")
when not declared(Enumdeclisscoped):
  proc Enumdeclisscoped*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_EnumDecl_isScoped".}
else:
  static :
    hint("Declaration of " & "Enumdeclisscoped" &
        " already exists, not redeclaring")
when not declared(Cxxmethodisconst):
  proc Cxxmethodisconst*(C: Cxcursor_520094169): cuint {.cdecl,
      importc: "clang_CXXMethod_isConst".}
else:
  static :
    hint("Declaration of " & "Cxxmethodisconst" &
        " already exists, not redeclaring")
when not declared(gettemplatecursorkind):
  proc gettemplatecursorkind*(C: Cxcursor_520094169): enumcxcursorkind_520094165 {.
      cdecl, importc: "clang_getTemplateCursorKind".}
else:
  static :
    hint("Declaration of " & "gettemplatecursorkind" &
        " already exists, not redeclaring")
when not declared(getspecializedcursortemplate):
  proc getspecializedcursortemplate*(C: Cxcursor_520094169): Cxcursor_520094169 {.
      cdecl, importc: "clang_getSpecializedCursorTemplate".}
else:
  static :
    hint("Declaration of " & "getspecializedcursortemplate" &
        " already exists, not redeclaring")
when not declared(getcursorreferencenamerange):
  proc getcursorreferencenamerange*(C: Cxcursor_520094169; Nameflags: cuint;
                                    Pieceindex: cuint): Cxsourcerange_520094094 {.
      cdecl, importc: "clang_getCursorReferenceNameRange".}
else:
  static :
    hint("Declaration of " & "getcursorreferencenamerange" &
        " already exists, not redeclaring")
when not declared(gettoken):
  proc gettoken*(Tu: Cxtranslationunit_520094114; Location: Cxsourcelocation_520094090): ptr Cxtoken_520094233 {.
      cdecl, importc: "clang_getToken".}
else:
  static :
    hint("Declaration of " & "gettoken" & " already exists, not redeclaring")
when not declared(gettokenkind):
  proc gettokenkind*(a0: Cxtoken_520094233): Cxtokenkind_520094229 {.cdecl,
      importc: "clang_getTokenKind".}
else:
  static :
    hint("Declaration of " & "gettokenkind" & " already exists, not redeclaring")
when not declared(gettokenspelling):
  proc gettokenspelling*(a0: Cxtranslationunit_520094114; a1: Cxtoken_520094233): Cxstring_520094060 {.
      cdecl, importc: "clang_getTokenSpelling".}
else:
  static :
    hint("Declaration of " & "gettokenspelling" &
        " already exists, not redeclaring")
when not declared(gettokenlocation):
  proc gettokenlocation*(a0: Cxtranslationunit_520094114; a1: Cxtoken_520094233): Cxsourcelocation_520094090 {.
      cdecl, importc: "clang_getTokenLocation".}
else:
  static :
    hint("Declaration of " & "gettokenlocation" &
        " already exists, not redeclaring")
when not declared(gettokenextent):
  proc gettokenextent*(a0: Cxtranslationunit_520094114; a1: Cxtoken_520094233): Cxsourcerange_520094094 {.
      cdecl, importc: "clang_getTokenExtent".}
else:
  static :
    hint("Declaration of " & "gettokenextent" &
        " already exists, not redeclaring")
when not declared(tokenize):
  proc tokenize*(Tu: Cxtranslationunit_520094114; Range: Cxsourcerange_520094094;
                 Tokens: ptr ptr Cxtoken_520094233; Numtokens: ptr cuint): void {.
      cdecl, importc: "clang_tokenize".}
else:
  static :
    hint("Declaration of " & "tokenize" & " already exists, not redeclaring")
when not declared(annotatetokens):
  proc annotatetokens*(Tu: Cxtranslationunit_520094114; Tokens: ptr Cxtoken_520094233;
                       Numtokens: cuint; Cursors: ptr Cxcursor_520094169): void {.
      cdecl, importc: "clang_annotateTokens".}
else:
  static :
    hint("Declaration of " & "annotatetokens" &
        " already exists, not redeclaring")
when not declared(disposetokens):
  proc disposetokens*(Tu: Cxtranslationunit_520094114; Tokens: ptr Cxtoken_520094233;
                      Numtokens: cuint): void {.cdecl,
      importc: "clang_disposeTokens".}
else:
  static :
    hint("Declaration of " & "disposetokens" &
        " already exists, not redeclaring")
when not declared(getcursorkindspelling):
  proc getcursorkindspelling*(Kind: enumcxcursorkind_520094165): Cxstring_520094060 {.
      cdecl, importc: "clang_getCursorKindSpelling".}
else:
  static :
    hint("Declaration of " & "getcursorkindspelling" &
        " already exists, not redeclaring")
when not declared(getdefinitionspellingandextent):
  proc getdefinitionspellingandextent*(a0: Cxcursor_520094169;
                                       startbuf: ptr cstring;
                                       endbuf: ptr cstring;
                                       startline: ptr cuint;
                                       startcolumn: ptr cuint;
                                       endline: ptr cuint; endcolumn: ptr cuint): void {.
      cdecl, importc: "clang_getDefinitionSpellingAndExtent".}
else:
  static :
    hint("Declaration of " & "getdefinitionspellingandextent" &
        " already exists, not redeclaring")
when not declared(enablestacktraces):
  proc enablestacktraces*(): void {.cdecl, importc: "clang_enableStackTraces".}
else:
  static :
    hint("Declaration of " & "enablestacktraces" &
        " already exists, not redeclaring")
when not declared(executeonthread):
  proc executeonthread*(fn: proc (a0: pointer): void {.cdecl.};
                        userdata: pointer; stacksize: cuint): void {.cdecl,
      importc: "clang_executeOnThread".}
else:
  static :
    hint("Declaration of " & "executeonthread" &
        " already exists, not redeclaring")
when not declared(getcompletionchunkkind):
  proc getcompletionchunkkind*(completionstring: Cxcompletionstring_520094235;
                               chunknumber: cuint): enumcxcompletionchunkkind_520094241 {.
      cdecl, importc: "clang_getCompletionChunkKind".}
else:
  static :
    hint("Declaration of " & "getcompletionchunkkind" &
        " already exists, not redeclaring")
when not declared(getcompletionchunktext):
  proc getcompletionchunktext*(completionstring: Cxcompletionstring_520094235;
                               chunknumber: cuint): Cxstring_520094060 {.cdecl,
      importc: "clang_getCompletionChunkText".}
else:
  static :
    hint("Declaration of " & "getcompletionchunktext" &
        " already exists, not redeclaring")
when not declared(getcompletionchunkcompletionstring):
  proc getcompletionchunkcompletionstring*(completionstring: Cxcompletionstring_520094235;
      chunknumber: cuint): Cxcompletionstring_520094235 {.cdecl,
      importc: "clang_getCompletionChunkCompletionString".}
else:
  static :
    hint("Declaration of " & "getcompletionchunkcompletionstring" &
        " already exists, not redeclaring")
when not declared(getnumcompletionchunks):
  proc getnumcompletionchunks*(completionstring: Cxcompletionstring_520094235): cuint {.
      cdecl, importc: "clang_getNumCompletionChunks".}
else:
  static :
    hint("Declaration of " & "getnumcompletionchunks" &
        " already exists, not redeclaring")
when not declared(getcompletionpriority):
  proc getcompletionpriority*(completionstring: Cxcompletionstring_520094235): cuint {.
      cdecl, importc: "clang_getCompletionPriority".}
else:
  static :
    hint("Declaration of " & "getcompletionpriority" &
        " already exists, not redeclaring")
when not declared(getcompletionavailability):
  proc getcompletionavailability*(completionstring: Cxcompletionstring_520094235): enumcxavailabilitykind_520094120 {.
      cdecl, importc: "clang_getCompletionAvailability".}
else:
  static :
    hint("Declaration of " & "getcompletionavailability" &
        " already exists, not redeclaring")
when not declared(getcompletionnumannotations):
  proc getcompletionnumannotations*(completionstring: Cxcompletionstring_520094235): cuint {.
      cdecl, importc: "clang_getCompletionNumAnnotations".}
else:
  static :
    hint("Declaration of " & "getcompletionnumannotations" &
        " already exists, not redeclaring")
when not declared(getcompletionannotation):
  proc getcompletionannotation*(completionstring: Cxcompletionstring_520094235;
                                annotationnumber: cuint): Cxstring_520094060 {.
      cdecl, importc: "clang_getCompletionAnnotation".}
else:
  static :
    hint("Declaration of " & "getcompletionannotation" &
        " already exists, not redeclaring")
when not declared(getcompletionparent):
  proc getcompletionparent*(completionstring: Cxcompletionstring_520094235;
                            kind: ptr enumcxcursorkind_520094165): Cxstring_520094060 {.
      cdecl, importc: "clang_getCompletionParent".}
else:
  static :
    hint("Declaration of " & "getcompletionparent" &
        " already exists, not redeclaring")
when not declared(getcompletionbriefcomment):
  proc getcompletionbriefcomment*(completionstring: Cxcompletionstring_520094235): Cxstring_520094060 {.
      cdecl, importc: "clang_getCompletionBriefComment".}
else:
  static :
    hint("Declaration of " & "getcompletionbriefcomment" &
        " already exists, not redeclaring")
when not declared(getcursorcompletionstring):
  proc getcursorcompletionstring*(cursor: Cxcursor_520094169): Cxcompletionstring_520094235 {.
      cdecl, importc: "clang_getCursorCompletionString".}
else:
  static :
    hint("Declaration of " & "getcursorcompletionstring" &
        " already exists, not redeclaring")
when not declared(getcompletionnumfixits):
  proc getcompletionnumfixits*(results: ptr Cxcodecompleteresults_520094245;
                               completionindex: cuint): cuint {.cdecl,
      importc: "clang_getCompletionNumFixIts".}
else:
  static :
    hint("Declaration of " & "getcompletionnumfixits" &
        " already exists, not redeclaring")
when not declared(getcompletionfixit):
  proc getcompletionfixit*(results: ptr Cxcodecompleteresults_520094245;
                           completionindex: cuint; fixitindex: cuint;
                           replacementrange: ptr Cxsourcerange_520094094): Cxstring_520094060 {.
      cdecl, importc: "clang_getCompletionFixIt".}
else:
  static :
    hint("Declaration of " & "getcompletionfixit" &
        " already exists, not redeclaring")
when not declared(defaultcodecompleteoptions):
  proc defaultcodecompleteoptions*(): cuint {.cdecl,
      importc: "clang_defaultCodeCompleteOptions".}
else:
  static :
    hint("Declaration of " & "defaultcodecompleteoptions" &
        " already exists, not redeclaring")
when not declared(codecompleteat):
  proc codecompleteat*(Tu: Cxtranslationunit_520094114;
                       completefilename: cstring; completeline: cuint;
                       completecolumn: cuint;
                       unsavedfiles: ptr structcxunsavedfile_520094118;
                       numunsavedfiles: cuint; options: cuint): ptr Cxcodecompleteresults_520094245 {.
      cdecl, importc: "clang_codeCompleteAt".}
else:
  static :
    hint("Declaration of " & "codecompleteat" &
        " already exists, not redeclaring")
when not declared(sortcodecompletionresults):
  proc sortcodecompletionresults*(Results: ptr Cxcompletionresult_520094239;
                                  Numresults: cuint): void {.cdecl,
      importc: "clang_sortCodeCompletionResults".}
else:
  static :
    hint("Declaration of " & "sortcodecompletionresults" &
        " already exists, not redeclaring")
when not declared(disposecodecompleteresults):
  proc disposecodecompleteresults*(Results: ptr Cxcodecompleteresults_520094245): void {.
      cdecl, importc: "clang_disposeCodeCompleteResults".}
else:
  static :
    hint("Declaration of " & "disposecodecompleteresults" &
        " already exists, not redeclaring")
when not declared(codecompletegetnumdiagnostics):
  proc codecompletegetnumdiagnostics*(Results: ptr Cxcodecompleteresults_520094245): cuint {.
      cdecl, importc: "clang_codeCompleteGetNumDiagnostics".}
else:
  static :
    hint("Declaration of " & "codecompletegetnumdiagnostics" &
        " already exists, not redeclaring")
when not declared(codecompletegetdiagnostic):
  proc codecompletegetdiagnostic*(Results: ptr Cxcodecompleteresults_520094245;
                                  Index: cuint): Cxdiagnostic_520094102 {.cdecl,
      importc: "clang_codeCompleteGetDiagnostic".}
else:
  static :
    hint("Declaration of " & "codecompletegetdiagnostic" &
        " already exists, not redeclaring")
when not declared(codecompletegetcontexts):
  proc codecompletegetcontexts*(Results: ptr Cxcodecompleteresults_520094245): culonglong {.
      cdecl, importc: "clang_codeCompleteGetContexts".}
else:
  static :
    hint("Declaration of " & "codecompletegetcontexts" &
        " already exists, not redeclaring")
when not declared(codecompletegetcontainerkind):
  proc codecompletegetcontainerkind*(Results: ptr Cxcodecompleteresults_520094245;
                                     Isincomplete: ptr cuint): enumcxcursorkind_520094165 {.
      cdecl, importc: "clang_codeCompleteGetContainerKind".}
else:
  static :
    hint("Declaration of " & "codecompletegetcontainerkind" &
        " already exists, not redeclaring")
when not declared(codecompletegetcontainerusr):
  proc codecompletegetcontainerusr*(Results: ptr Cxcodecompleteresults_520094245): Cxstring_520094060 {.
      cdecl, importc: "clang_codeCompleteGetContainerUSR".}
else:
  static :
    hint("Declaration of " & "codecompletegetcontainerusr" &
        " already exists, not redeclaring")
when not declared(codecompletegetobjcselector):
  proc codecompletegetobjcselector*(Results: ptr Cxcodecompleteresults_520094245): Cxstring_520094060 {.
      cdecl, importc: "clang_codeCompleteGetObjCSelector".}
else:
  static :
    hint("Declaration of " & "codecompletegetobjcselector" &
        " already exists, not redeclaring")
when not declared(getclangversion):
  proc getclangversion*(): Cxstring_520094060 {.cdecl,
      importc: "clang_getClangVersion".}
else:
  static :
    hint("Declaration of " & "getclangversion" &
        " already exists, not redeclaring")
when not declared(togglecrashrecovery):
  proc togglecrashrecovery*(isenabled: cuint): void {.cdecl,
      importc: "clang_toggleCrashRecovery".}
else:
  static :
    hint("Declaration of " & "togglecrashrecovery" &
        " already exists, not redeclaring")
when not declared(getinclusions):
  proc getinclusions*(tu: Cxtranslationunit_520094114;
                      visitor: Cxinclusionvisitor_520094251;
                      clientdata: Cxclientdata_520094116): void {.cdecl,
      importc: "clang_getInclusions".}
else:
  static :
    hint("Declaration of " & "getinclusions" &
        " already exists, not redeclaring")
when not declared(Cursorevaluate):
  proc Cursorevaluate*(C: Cxcursor_520094169): Cxevalresult_520094257 {.cdecl,
      importc: "clang_Cursor_Evaluate".}
else:
  static :
    hint("Declaration of " & "Cursorevaluate" &
        " already exists, not redeclaring")
when not declared(Evalresultgetkind):
  proc Evalresultgetkind*(E: Cxevalresult_520094257): Cxevalresultkind_520094255 {.
      cdecl, importc: "clang_EvalResult_getKind".}
else:
  static :
    hint("Declaration of " & "Evalresultgetkind" &
        " already exists, not redeclaring")
when not declared(Evalresultgetasint):
  proc Evalresultgetasint*(E: Cxevalresult_520094257): cint {.cdecl,
      importc: "clang_EvalResult_getAsInt".}
else:
  static :
    hint("Declaration of " & "Evalresultgetasint" &
        " already exists, not redeclaring")
when not declared(Evalresultgetaslonglong):
  proc Evalresultgetaslonglong*(E: Cxevalresult_520094257): clonglong {.cdecl,
      importc: "clang_EvalResult_getAsLongLong".}
else:
  static :
    hint("Declaration of " & "Evalresultgetaslonglong" &
        " already exists, not redeclaring")
when not declared(Evalresultisunsignedint):
  proc Evalresultisunsignedint*(E: Cxevalresult_520094257): cuint {.cdecl,
      importc: "clang_EvalResult_isUnsignedInt".}
else:
  static :
    hint("Declaration of " & "Evalresultisunsignedint" &
        " already exists, not redeclaring")
when not declared(Evalresultgetasunsigned):
  proc Evalresultgetasunsigned*(E: Cxevalresult_520094257): culonglong {.cdecl,
      importc: "clang_EvalResult_getAsUnsigned".}
else:
  static :
    hint("Declaration of " & "Evalresultgetasunsigned" &
        " already exists, not redeclaring")
when not declared(Evalresultgetasdouble):
  proc Evalresultgetasdouble*(E: Cxevalresult_520094257): cdouble {.cdecl,
      importc: "clang_EvalResult_getAsDouble".}
else:
  static :
    hint("Declaration of " & "Evalresultgetasdouble" &
        " already exists, not redeclaring")
when not declared(Evalresultgetasstr):
  proc Evalresultgetasstr*(E: Cxevalresult_520094257): cstring {.cdecl,
      importc: "clang_EvalResult_getAsStr".}
else:
  static :
    hint("Declaration of " & "Evalresultgetasstr" &
        " already exists, not redeclaring")
when not declared(Evalresultdispose):
  proc Evalresultdispose*(E: Cxevalresult_520094257): void {.cdecl,
      importc: "clang_EvalResult_dispose".}
else:
  static :
    hint("Declaration of " & "Evalresultdispose" &
        " already exists, not redeclaring")
when not declared(getremappings):
  proc getremappings*(path: cstring): Cxremapping_520094259 {.cdecl,
      importc: "clang_getRemappings".}
else:
  static :
    hint("Declaration of " & "getremappings" &
        " already exists, not redeclaring")
when not declared(getremappingsfromfilelist):
  proc getremappingsfromfilelist*(filepaths: ptr cstring; numfiles: cuint): Cxremapping_520094259 {.
      cdecl, importc: "clang_getRemappingsFromFileList".}
else:
  static :
    hint("Declaration of " & "getremappingsfromfilelist" &
        " already exists, not redeclaring")
when not declared(remapgetnumfiles):
  proc remapgetnumfiles*(a0: Cxremapping_520094259): cuint {.cdecl,
      importc: "clang_remap_getNumFiles".}
else:
  static :
    hint("Declaration of " & "remapgetnumfiles" &
        " already exists, not redeclaring")
when not declared(remapgetfilenames):
  proc remapgetfilenames*(a0: Cxremapping_520094259; index: cuint;
                          original: ptr Cxstring_520094060;
                          transformed: ptr Cxstring_520094060): void {.cdecl,
      importc: "clang_remap_getFilenames".}
else:
  static :
    hint("Declaration of " & "remapgetfilenames" &
        " already exists, not redeclaring")
when not declared(remapdispose):
  proc remapdispose*(a0: Cxremapping_520094259): void {.cdecl,
      importc: "clang_remap_dispose".}
else:
  static :
    hint("Declaration of " & "remapdispose" & " already exists, not redeclaring")
when not declared(findreferencesinfile):
  proc findreferencesinfile*(cursor: Cxcursor_520094169; file: Cxfile_520094080;
                             visitor: Cxcursorandrangevisitor_520094265): Cxresult_520094269 {.
      cdecl, importc: "clang_findReferencesInFile".}
else:
  static :
    hint("Declaration of " & "findreferencesinfile" &
        " already exists, not redeclaring")
when not declared(findincludesinfile):
  proc findincludesinfile*(Tu: Cxtranslationunit_520094114; file: Cxfile_520094080;
                           visitor: Cxcursorandrangevisitor_520094265): Cxresult_520094269 {.
      cdecl, importc: "clang_findIncludesInFile".}
else:
  static :
    hint("Declaration of " & "findincludesinfile" &
        " already exists, not redeclaring")
when not declared(findreferencesinfilewithblock):
  proc findreferencesinfilewithblock*(a0: Cxcursor_520094169; a1: Cxfile_520094080;
                                      a2: Cxcursorandrangevisitorblock_520094271): Cxresult_520094269 {.
      cdecl, importc: "clang_findReferencesInFileWithBlock".}
else:
  static :
    hint("Declaration of " & "findreferencesinfilewithblock" &
        " already exists, not redeclaring")
when not declared(findincludesinfilewithblock):
  proc findincludesinfilewithblock*(a0: Cxtranslationunit_520094114; a1: Cxfile_520094080;
                                    a2: Cxcursorandrangevisitorblock_520094271): Cxresult_520094269 {.
      cdecl, importc: "clang_findIncludesInFileWithBlock".}
else:
  static :
    hint("Declaration of " & "findincludesinfilewithblock" &
        " already exists, not redeclaring")
when not declared(indexisentityobjccontainerkind):
  proc indexisentityobjccontainerkind*(a0: Cxidxentitykind_520094295): cint {.
      cdecl, importc: "clang_index_isEntityObjCContainerKind".}
else:
  static :
    hint("Declaration of " & "indexisentityobjccontainerkind" &
        " already exists, not redeclaring")
when not declared(indexgetobjccontainerdeclinfo):
  proc indexgetobjccontainerdeclinfo*(a0: ptr Cxidxdeclinfo_520094331): ptr Cxidxobjccontainerdeclinfo_520094339 {.
      cdecl, importc: "clang_index_getObjCContainerDeclInfo".}
else:
  static :
    hint("Declaration of " & "indexgetobjccontainerdeclinfo" &
        " already exists, not redeclaring")
when not declared(indexgetobjcinterfacedeclinfo):
  proc indexgetobjcinterfacedeclinfo*(a0: ptr Cxidxdeclinfo_520094331): ptr Cxidxobjcinterfacedeclinfo_520094355 {.
      cdecl, importc: "clang_index_getObjCInterfaceDeclInfo".}
else:
  static :
    hint("Declaration of " & "indexgetobjcinterfacedeclinfo" &
        " already exists, not redeclaring")
when not declared(indexgetobjccategorydeclinfo):
  proc indexgetobjccategorydeclinfo*(a0: ptr Cxidxdeclinfo_520094331): ptr Cxidxobjccategorydeclinfo_520094359 {.
      cdecl, importc: "clang_index_getObjCCategoryDeclInfo".}
else:
  static :
    hint("Declaration of " & "indexgetobjccategorydeclinfo" &
        " already exists, not redeclaring")
when not declared(indexgetobjcprotocolreflistinfo):
  proc indexgetobjcprotocolreflistinfo*(a0: ptr Cxidxdeclinfo_520094331): ptr Cxidxobjcprotocolreflistinfo_520094351 {.
      cdecl, importc: "clang_index_getObjCProtocolRefListInfo".}
else:
  static :
    hint("Declaration of " & "indexgetobjcprotocolreflistinfo" &
        " already exists, not redeclaring")
when not declared(indexgetobjcpropertydeclinfo):
  proc indexgetobjcpropertydeclinfo*(a0: ptr Cxidxdeclinfo_520094331): ptr Cxidxobjcpropertydeclinfo_520094363 {.
      cdecl, importc: "clang_index_getObjCPropertyDeclInfo".}
else:
  static :
    hint("Declaration of " & "indexgetobjcpropertydeclinfo" &
        " already exists, not redeclaring")
when not declared(indexgetiboutletcollectionattrinfo):
  proc indexgetiboutletcollectionattrinfo*(a0: ptr Cxidxattrinfo_520094311): ptr Cxidxiboutletcollectionattrinfo_520094323 {.
      cdecl, importc: "clang_index_getIBOutletCollectionAttrInfo".}
else:
  static :
    hint("Declaration of " & "indexgetiboutletcollectionattrinfo" &
        " already exists, not redeclaring")
when not declared(indexgetcxxclassdeclinfo):
  proc indexgetcxxclassdeclinfo*(a0: ptr Cxidxdeclinfo_520094331): ptr Cxidxcxxclassdeclinfo_520094367 {.
      cdecl, importc: "clang_index_getCXXClassDeclInfo".}
else:
  static :
    hint("Declaration of " & "indexgetcxxclassdeclinfo" &
        " already exists, not redeclaring")
when not declared(indexgetclientcontainer):
  proc indexgetclientcontainer*(a0: ptr Cxidxcontainerinfo_520094319): Cxidxclientcontainer_520094277 {.
      cdecl, importc: "clang_index_getClientContainer".}
else:
  static :
    hint("Declaration of " & "indexgetclientcontainer" &
        " already exists, not redeclaring")
when not declared(indexsetclientcontainer):
  proc indexsetclientcontainer*(a0: ptr Cxidxcontainerinfo_520094319;
                                a1: Cxidxclientcontainer_520094277): void {.
      cdecl, importc: "clang_index_setClientContainer".}
else:
  static :
    hint("Declaration of " & "indexsetclientcontainer" &
        " already exists, not redeclaring")
when not declared(indexgetcliententity):
  proc indexgetcliententity*(a0: ptr Cxidxentityinfo_520094315): Cxidxcliententity_520094275 {.
      cdecl, importc: "clang_index_getClientEntity".}
else:
  static :
    hint("Declaration of " & "indexgetcliententity" &
        " already exists, not redeclaring")
when not declared(indexsetcliententity):
  proc indexsetcliententity*(a0: ptr Cxidxentityinfo_520094315;
                             a1: Cxidxcliententity_520094275): void {.cdecl,
      importc: "clang_index_setClientEntity".}
else:
  static :
    hint("Declaration of " & "indexsetcliententity" &
        " already exists, not redeclaring")
when not declared(Indexactioncreate):
  proc Indexactioncreate*(Cidx: Cxindex_520094110): Cxindexaction_520094385 {.
      cdecl, importc: "clang_IndexAction_create".}
else:
  static :
    hint("Declaration of " & "Indexactioncreate" &
        " already exists, not redeclaring")
when not declared(Indexactiondispose):
  proc Indexactiondispose*(a0: Cxindexaction_520094385): void {.cdecl,
      importc: "clang_IndexAction_dispose".}
else:
  static :
    hint("Declaration of " & "Indexactiondispose" &
        " already exists, not redeclaring")
when not declared(indexsourcefile):
  proc indexsourcefile*(a0: Cxindexaction_520094385; clientdata: Cxclientdata_520094116;
                        indexcallbacks: ptr Indexercallbacks_520094383;
                        indexcallbackssize: cuint; indexoptions: cuint;
                        sourcefilename: cstring; commandlineargs: ptr cstring;
                        numcommandlineargs: cint;
                        unsavedfiles: ptr structcxunsavedfile_520094118;
                        numunsavedfiles: cuint; outtu: ptr Cxtranslationunit_520094114;
                        Tuoptions: cuint): cint {.cdecl,
      importc: "clang_indexSourceFile".}
else:
  static :
    hint("Declaration of " & "indexsourcefile" &
        " already exists, not redeclaring")
when not declared(indexsourcefilefullargv):
  proc indexsourcefilefullargv*(a0: Cxindexaction_520094385;
                                clientdata: Cxclientdata_520094116;
                                indexcallbacks: ptr Indexercallbacks_520094383;
                                indexcallbackssize: cuint; indexoptions: cuint;
                                sourcefilename: cstring;
                                commandlineargs: ptr cstring;
                                numcommandlineargs: cint;
                                unsavedfiles: ptr structcxunsavedfile_520094118;
                                numunsavedfiles: cuint;
                                outtu: ptr Cxtranslationunit_520094114;
                                Tuoptions: cuint): cint {.cdecl,
      importc: "clang_indexSourceFileFullArgv".}
else:
  static :
    hint("Declaration of " & "indexsourcefilefullargv" &
        " already exists, not redeclaring")
when not declared(indextranslationunit):
  proc indextranslationunit*(a0: Cxindexaction_520094385;
                             clientdata: Cxclientdata_520094116;
                             indexcallbacks: ptr Indexercallbacks_520094383;
                             indexcallbackssize: cuint; indexoptions: cuint;
                             a5: Cxtranslationunit_520094114): cint {.cdecl,
      importc: "clang_indexTranslationUnit".}
else:
  static :
    hint("Declaration of " & "indextranslationunit" &
        " already exists, not redeclaring")
when not declared(indexlocgetfilelocation):
  proc indexlocgetfilelocation*(loc: Cxidxloc_520094283;
                                indexfile: ptr Cxidxclientfile_520094273;
                                file: ptr Cxfile_520094080; line: ptr cuint;
                                column: ptr cuint; offset: ptr cuint): void {.
      cdecl, importc: "clang_indexLoc_getFileLocation".}
else:
  static :
    hint("Declaration of " & "indexlocgetfilelocation" &
        " already exists, not redeclaring")
when not declared(indexlocgetcxsourcelocation):
  proc indexlocgetcxsourcelocation*(loc: Cxidxloc_520094283): Cxsourcelocation_520094090 {.
      cdecl, importc: "clang_indexLoc_getCXSourceLocation".}
else:
  static :
    hint("Declaration of " & "indexlocgetcxsourcelocation" &
        " already exists, not redeclaring")
when not declared(Typevisitfields):
  proc Typevisitfields*(T: Cxtype_520094191; visitor: Cxfieldvisitor_520094391;
                        clientdata: Cxclientdata_520094116): cuint {.cdecl,
      importc: "clang_Type_visitFields".}
else:
  static :
    hint("Declaration of " & "Typevisitfields" &
        " already exists, not redeclaring")
when not declared(getbinaryoperatorkindspelling):
  proc getbinaryoperatorkindspelling*(kind: enumcxbinaryoperatorkind_520094393): Cxstring_520094060 {.
      cdecl, importc: "clang_getBinaryOperatorKindSpelling".}
else:
  static :
    hint("Declaration of " & "getbinaryoperatorkindspelling" &
        " already exists, not redeclaring")
when not declared(getcursorbinaryoperatorkind):
  proc getcursorbinaryoperatorkind*(cursor: Cxcursor_520094169): enumcxbinaryoperatorkind_520094393 {.
      cdecl, importc: "clang_getCursorBinaryOperatorKind".}
else:
  static :
    hint("Declaration of " & "getcursorbinaryoperatorkind" &
        " already exists, not redeclaring")
when not declared(getunaryoperatorkindspelling):
  proc getunaryoperatorkindspelling*(kind: enumcxunaryoperatorkind_520094395): Cxstring_520094060 {.
      cdecl, importc: "clang_getUnaryOperatorKindSpelling".}
else:
  static :
    hint("Declaration of " & "getunaryoperatorkindspelling" &
        " already exists, not redeclaring")
when not declared(getcursorunaryoperatorkind):
  proc getcursorunaryoperatorkind*(cursor: Cxcursor_520094169): enumcxunaryoperatorkind_520094395 {.
      cdecl, importc: "clang_getCursorUnaryOperatorKind".}
else:
  static :
    hint("Declaration of " & "getcursorunaryoperatorkind" &
        " already exists, not redeclaring")
when not declared(Cursorgetparsedcomment):
  proc Cursorgetparsedcomment*(C: Cxcursor_520094169): Cxcomment_520094399 {.
      cdecl, importc: "clang_Cursor_getParsedComment".}
else:
  static :
    hint("Declaration of " & "Cursorgetparsedcomment" &
        " already exists, not redeclaring")
when not declared(Commentgetkind):
  proc Commentgetkind*(Comment: Cxcomment_520094399): enumcxcommentkind_520094401 {.
      cdecl, importc: "clang_Comment_getKind".}
else:
  static :
    hint("Declaration of " & "Commentgetkind" &
        " already exists, not redeclaring")
when not declared(Commentgetnumchildren):
  proc Commentgetnumchildren*(Comment: Cxcomment_520094399): cuint {.cdecl,
      importc: "clang_Comment_getNumChildren".}
else:
  static :
    hint("Declaration of " & "Commentgetnumchildren" &
        " already exists, not redeclaring")
when not declared(Commentgetchild):
  proc Commentgetchild*(Comment: Cxcomment_520094399; Childidx: cuint): Cxcomment_520094399 {.
      cdecl, importc: "clang_Comment_getChild".}
else:
  static :
    hint("Declaration of " & "Commentgetchild" &
        " already exists, not redeclaring")
when not declared(Commentiswhitespace):
  proc Commentiswhitespace*(Comment: Cxcomment_520094399): cuint {.cdecl,
      importc: "clang_Comment_isWhitespace".}
else:
  static :
    hint("Declaration of " & "Commentiswhitespace" &
        " already exists, not redeclaring")
when not declared(Inlinecontentcommenthastrailingnewline):
  proc Inlinecontentcommenthastrailingnewline*(Comment: Cxcomment_520094399): cuint {.
      cdecl, importc: "clang_InlineContentComment_hasTrailingNewline".}
else:
  static :
    hint("Declaration of " & "Inlinecontentcommenthastrailingnewline" &
        " already exists, not redeclaring")
when not declared(Textcommentgettext):
  proc Textcommentgettext*(Comment: Cxcomment_520094399): Cxstring_520094060 {.
      cdecl, importc: "clang_TextComment_getText".}
else:
  static :
    hint("Declaration of " & "Textcommentgettext" &
        " already exists, not redeclaring")
when not declared(Inlinecommandcommentgetcommandname):
  proc Inlinecommandcommentgetcommandname*(Comment: Cxcomment_520094399): Cxstring_520094060 {.
      cdecl, importc: "clang_InlineCommandComment_getCommandName".}
else:
  static :
    hint("Declaration of " & "Inlinecommandcommentgetcommandname" &
        " already exists, not redeclaring")
when not declared(Inlinecommandcommentgetrenderkind):
  proc Inlinecommandcommentgetrenderkind*(Comment: Cxcomment_520094399): enumcxcommentinlinecommandrenderkind_520094403 {.
      cdecl, importc: "clang_InlineCommandComment_getRenderKind".}
else:
  static :
    hint("Declaration of " & "Inlinecommandcommentgetrenderkind" &
        " already exists, not redeclaring")
when not declared(Inlinecommandcommentgetnumargs):
  proc Inlinecommandcommentgetnumargs*(Comment: Cxcomment_520094399): cuint {.
      cdecl, importc: "clang_InlineCommandComment_getNumArgs".}
else:
  static :
    hint("Declaration of " & "Inlinecommandcommentgetnumargs" &
        " already exists, not redeclaring")
when not declared(Inlinecommandcommentgetargtext):
  proc Inlinecommandcommentgetargtext*(Comment: Cxcomment_520094399;
                                       Argidx: cuint): Cxstring_520094060 {.
      cdecl, importc: "clang_InlineCommandComment_getArgText".}
else:
  static :
    hint("Declaration of " & "Inlinecommandcommentgetargtext" &
        " already exists, not redeclaring")
when not declared(Htmltagcommentgettagname):
  proc Htmltagcommentgettagname*(Comment: Cxcomment_520094399): Cxstring_520094060 {.
      cdecl, importc: "clang_HTMLTagComment_getTagName".}
else:
  static :
    hint("Declaration of " & "Htmltagcommentgettagname" &
        " already exists, not redeclaring")
when not declared(Htmlstarttagcommentisselfclosing):
  proc Htmlstarttagcommentisselfclosing*(Comment: Cxcomment_520094399): cuint {.
      cdecl, importc: "clang_HTMLStartTagComment_isSelfClosing".}
else:
  static :
    hint("Declaration of " & "Htmlstarttagcommentisselfclosing" &
        " already exists, not redeclaring")
when not declared(Htmlstarttaggetnumattrs):
  proc Htmlstarttaggetnumattrs*(Comment: Cxcomment_520094399): cuint {.cdecl,
      importc: "clang_HTMLStartTag_getNumAttrs".}
else:
  static :
    hint("Declaration of " & "Htmlstarttaggetnumattrs" &
        " already exists, not redeclaring")
when not declared(Htmlstarttaggetattrname):
  proc Htmlstarttaggetattrname*(Comment: Cxcomment_520094399; Attridx: cuint): Cxstring_520094060 {.
      cdecl, importc: "clang_HTMLStartTag_getAttrName".}
else:
  static :
    hint("Declaration of " & "Htmlstarttaggetattrname" &
        " already exists, not redeclaring")
when not declared(Htmlstarttaggetattrvalue):
  proc Htmlstarttaggetattrvalue*(Comment: Cxcomment_520094399; Attridx: cuint): Cxstring_520094060 {.
      cdecl, importc: "clang_HTMLStartTag_getAttrValue".}
else:
  static :
    hint("Declaration of " & "Htmlstarttaggetattrvalue" &
        " already exists, not redeclaring")
when not declared(Blockcommandcommentgetcommandname):
  proc Blockcommandcommentgetcommandname*(Comment: Cxcomment_520094399): Cxstring_520094060 {.
      cdecl, importc: "clang_BlockCommandComment_getCommandName".}
else:
  static :
    hint("Declaration of " & "Blockcommandcommentgetcommandname" &
        " already exists, not redeclaring")
when not declared(Blockcommandcommentgetnumargs):
  proc Blockcommandcommentgetnumargs*(Comment: Cxcomment_520094399): cuint {.
      cdecl, importc: "clang_BlockCommandComment_getNumArgs".}
else:
  static :
    hint("Declaration of " & "Blockcommandcommentgetnumargs" &
        " already exists, not redeclaring")
when not declared(Blockcommandcommentgetargtext):
  proc Blockcommandcommentgetargtext*(Comment: Cxcomment_520094399;
                                      Argidx: cuint): Cxstring_520094060 {.
      cdecl, importc: "clang_BlockCommandComment_getArgText".}
else:
  static :
    hint("Declaration of " & "Blockcommandcommentgetargtext" &
        " already exists, not redeclaring")
when not declared(Blockcommandcommentgetparagraph):
  proc Blockcommandcommentgetparagraph*(Comment: Cxcomment_520094399): Cxcomment_520094399 {.
      cdecl, importc: "clang_BlockCommandComment_getParagraph".}
else:
  static :
    hint("Declaration of " & "Blockcommandcommentgetparagraph" &
        " already exists, not redeclaring")
when not declared(Paramcommandcommentgetparamname):
  proc Paramcommandcommentgetparamname*(Comment: Cxcomment_520094399): Cxstring_520094060 {.
      cdecl, importc: "clang_ParamCommandComment_getParamName".}
else:
  static :
    hint("Declaration of " & "Paramcommandcommentgetparamname" &
        " already exists, not redeclaring")
when not declared(Paramcommandcommentisparamindexvalid):
  proc Paramcommandcommentisparamindexvalid*(Comment: Cxcomment_520094399): cuint {.
      cdecl, importc: "clang_ParamCommandComment_isParamIndexValid".}
else:
  static :
    hint("Declaration of " & "Paramcommandcommentisparamindexvalid" &
        " already exists, not redeclaring")
when not declared(Paramcommandcommentgetparamindex):
  proc Paramcommandcommentgetparamindex*(Comment: Cxcomment_520094399): cuint {.
      cdecl, importc: "clang_ParamCommandComment_getParamIndex".}
else:
  static :
    hint("Declaration of " & "Paramcommandcommentgetparamindex" &
        " already exists, not redeclaring")
when not declared(Paramcommandcommentisdirectionexplicit):
  proc Paramcommandcommentisdirectionexplicit*(Comment: Cxcomment_520094399): cuint {.
      cdecl, importc: "clang_ParamCommandComment_isDirectionExplicit".}
else:
  static :
    hint("Declaration of " & "Paramcommandcommentisdirectionexplicit" &
        " already exists, not redeclaring")
when not declared(Paramcommandcommentgetdirection):
  proc Paramcommandcommentgetdirection*(Comment: Cxcomment_520094399): enumcxcommentparampassdirection_520094405 {.
      cdecl, importc: "clang_ParamCommandComment_getDirection".}
else:
  static :
    hint("Declaration of " & "Paramcommandcommentgetdirection" &
        " already exists, not redeclaring")
when not declared(Tparamcommandcommentgetparamname):
  proc Tparamcommandcommentgetparamname*(Comment: Cxcomment_520094399): Cxstring_520094060 {.
      cdecl, importc: "clang_TParamCommandComment_getParamName".}
else:
  static :
    hint("Declaration of " & "Tparamcommandcommentgetparamname" &
        " already exists, not redeclaring")
when not declared(Tparamcommandcommentisparampositionvalid):
  proc Tparamcommandcommentisparampositionvalid*(Comment: Cxcomment_520094399): cuint {.
      cdecl, importc: "clang_TParamCommandComment_isParamPositionValid".}
else:
  static :
    hint("Declaration of " & "Tparamcommandcommentisparampositionvalid" &
        " already exists, not redeclaring")
when not declared(Tparamcommandcommentgetdepth):
  proc Tparamcommandcommentgetdepth*(Comment: Cxcomment_520094399): cuint {.
      cdecl, importc: "clang_TParamCommandComment_getDepth".}
else:
  static :
    hint("Declaration of " & "Tparamcommandcommentgetdepth" &
        " already exists, not redeclaring")
when not declared(Tparamcommandcommentgetindex):
  proc Tparamcommandcommentgetindex*(Comment: Cxcomment_520094399; Depth: cuint): cuint {.
      cdecl, importc: "clang_TParamCommandComment_getIndex".}
else:
  static :
    hint("Declaration of " & "Tparamcommandcommentgetindex" &
        " already exists, not redeclaring")
when not declared(Verbatimblocklinecommentgettext):
  proc Verbatimblocklinecommentgettext*(Comment: Cxcomment_520094399): Cxstring_520094060 {.
      cdecl, importc: "clang_VerbatimBlockLineComment_getText".}
else:
  static :
    hint("Declaration of " & "Verbatimblocklinecommentgettext" &
        " already exists, not redeclaring")
when not declared(Verbatimlinecommentgettext):
  proc Verbatimlinecommentgettext*(Comment: Cxcomment_520094399): Cxstring_520094060 {.
      cdecl, importc: "clang_VerbatimLineComment_getText".}
else:
  static :
    hint("Declaration of " & "Verbatimlinecommentgettext" &
        " already exists, not redeclaring")
when not declared(Htmltagcommentgetasstring):
  proc Htmltagcommentgetasstring*(Comment: Cxcomment_520094399): Cxstring_520094060 {.
      cdecl, importc: "clang_HTMLTagComment_getAsString".}
else:
  static :
    hint("Declaration of " & "Htmltagcommentgetasstring" &
        " already exists, not redeclaring")
when not declared(Fullcommentgetashtml):
  proc Fullcommentgetashtml*(Comment: Cxcomment_520094399): Cxstring_520094060 {.
      cdecl, importc: "clang_FullComment_getAsHTML".}
else:
  static :
    hint("Declaration of " & "Fullcommentgetashtml" &
        " already exists, not redeclaring")
when not declared(Fullcommentgetasxml):
  proc Fullcommentgetasxml*(Comment: Cxcomment_520094399): Cxstring_520094060 {.
      cdecl, importc: "clang_FullComment_getAsXML".}
else:
  static :
    hint("Declaration of " & "Fullcommentgetasxml" &
        " already exists, not redeclaring")
when not declared(createapiset):
  proc createapiset*(tu: Cxtranslationunit_520094114; outapi: ptr Cxapiset_520094407): enumcxerrorcode_520094056 {.
      cdecl, importc: "clang_createAPISet".}
else:
  static :
    hint("Declaration of " & "createapiset" & " already exists, not redeclaring")
when not declared(disposeapiset):
  proc disposeapiset*(api: Cxapiset_520094407): void {.cdecl,
      importc: "clang_disposeAPISet".}
else:
  static :
    hint("Declaration of " & "disposeapiset" &
        " already exists, not redeclaring")
when not declared(getsymbolgraphforusr):
  proc getsymbolgraphforusr*(usr: cstring; api: Cxapiset_520094407): Cxstring_520094060 {.
      cdecl, importc: "clang_getSymbolGraphForUSR".}
else:
  static :
    hint("Declaration of " & "getsymbolgraphforusr" &
        " already exists, not redeclaring")
when not declared(getsymbolgraphforcursor):
  proc getsymbolgraphforcursor*(cursor: Cxcursor_520094169): Cxstring_520094060 {.
      cdecl, importc: "clang_getSymbolGraphForCursor".}
else:
  static :
    hint("Declaration of " & "getsymbolgraphforcursor" &
        " already exists, not redeclaring")
when not declared(installabortingllvmfatalerrorhandler):
  proc installabortingllvmfatalerrorhandler*(): void {.cdecl,
      importc: "clang_install_aborting_llvm_fatal_error_handler".}
else:
  static :
    hint("Declaration of " & "installabortingllvmfatalerrorhandler" &
        " already exists, not redeclaring")
when not declared(uninstallllvmfatalerrorhandler):
  proc uninstallllvmfatalerrorhandler*(): void {.cdecl,
      importc: "clang_uninstall_llvm_fatal_error_handler".}
else:
  static :
    hint("Declaration of " & "uninstallllvmfatalerrorhandler" &
        " already exists, not redeclaring")
when not declared(Cxrewritercreate):
  proc Cxrewritercreate*(Tu: Cxtranslationunit_520094114): Cxrewriter_520094409 {.
      cdecl, importc: "clang_CXRewriter_create".}
else:
  static :
    hint("Declaration of " & "Cxrewritercreate" &
        " already exists, not redeclaring")
when not declared(Cxrewriterinserttextbefore):
  proc Cxrewriterinserttextbefore*(Rew: Cxrewriter_520094409;
                                   Loc: Cxsourcelocation_520094090;
                                   Insert: cstring): void {.cdecl,
      importc: "clang_CXRewriter_insertTextBefore".}
else:
  static :
    hint("Declaration of " & "Cxrewriterinserttextbefore" &
        " already exists, not redeclaring")
when not declared(Cxrewriterreplacetext):
  proc Cxrewriterreplacetext*(Rew: Cxrewriter_520094409;
                              Tobereplaced: Cxsourcerange_520094094;
                              Replacement: cstring): void {.cdecl,
      importc: "clang_CXRewriter_replaceText".}
else:
  static :
    hint("Declaration of " & "Cxrewriterreplacetext" &
        " already exists, not redeclaring")
when not declared(Cxrewriterremovetext):
  proc Cxrewriterremovetext*(Rew: Cxrewriter_520094409;
                             Toberemoved: Cxsourcerange_520094094): void {.
      cdecl, importc: "clang_CXRewriter_removeText".}
else:
  static :
    hint("Declaration of " & "Cxrewriterremovetext" &
        " already exists, not redeclaring")
when not declared(Cxrewriteroverwritechangedfiles):
  proc Cxrewriteroverwritechangedfiles*(Rew: Cxrewriter_520094409): cint {.
      cdecl, importc: "clang_CXRewriter_overwriteChangedFiles".}
else:
  static :
    hint("Declaration of " & "Cxrewriteroverwritechangedfiles" &
        " already exists, not redeclaring")
when not declared(Cxrewriterwritemainfiletostdout):
  proc Cxrewriterwritemainfiletostdout*(Rew: Cxrewriter_520094409): void {.
      cdecl, importc: "clang_CXRewriter_writeMainFileToStdOut".}
else:
  static :
    hint("Declaration of " & "Cxrewriterwritemainfiletostdout" &
        " already exists, not redeclaring")
when not declared(Cxrewriterdispose):
  proc Cxrewriterdispose*(Rew: Cxrewriter_520094409): void {.cdecl,
      importc: "clang_CXRewriter_dispose".}
else:
  static :
    hint("Declaration of " & "Cxrewriterdispose" &
        " already exists, not redeclaring")