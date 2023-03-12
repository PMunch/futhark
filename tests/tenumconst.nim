import "../src/futhark"

importc:
  path "."
  compilerArg when not defined(windows): "-fshort-enums" else: ""
  "tenumconst.h"


doAssert my_enum.MY_VAR_A.ord == 0
doAssert my_enum.MY_VAR_B.ord == 1
doAssert my_enum.MY_VAR_C.ord == 2
doAssert MY_VAR_D.ord == 1
doAssert MY_VAR_E.ord == 0

doAssert MY_VAR_D == MY_VAR_B
doAssert MY_VAR_E == MY_VAR_A

doAssert ANON_A == 0
doAssert ANON_B == 1
doAssert ANON_C == -1

when not defined(windows):
  doAssert sizeof(ANON_D) == 1
else:
  doAssert sizeof(ANON_D) == sizeof(cint)

when not defined(windows):
  doAssert sizeof(SHORT) == 2
else:
  doAssert sizeof(SHORT) == sizeof(cint)
doAssert SHORT.ord == 0x7fff

when not defined(windows):
  doAssert sizeof(WORD) == 4
else:
  doAssert sizeof(WORD) == sizeof(cint)
doAssert WORD.ord == 0x7fffffff
