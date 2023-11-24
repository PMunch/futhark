import "../src/futhark"

importc:
  path "."
  compilerArg when not defined(windows): "-fshort-enums" else: ""
  "tenumconst.h"


doAssert My_enum.mY_VAR_A.ord == 0
doAssert My_enum.mY_VAR_B.ord == 1
doAssert My_enum.mY_VAR_C.ord == 2
doAssert mY_VAR_D.ord == 1
doAssert mY_VAR_E.ord == 0

doAssert mY_VAR_D == mY_VAR_B
doAssert mY_VAR_E == mY_VAR_A

doAssert aNON_A == 0
doAssert aNON_B == 1
doAssert aNON_C == -1

when not defined(windows):
  doAssert sizeof(aNON_D) == 1
else:
  doAssert sizeof(ANON_D) == sizeof(cint)

when not defined(windows):
  doAssert sizeof(EnumSHORT) == 2
else:
  doAssert sizeof(SHORT) == sizeof(cint)
doAssert sHORT.ord == 0x7fff

when not defined(windows):
  doAssert sizeof(EnumWORD) == 4
else:
  doAssert sizeof(WORD) == sizeof(cint)
doAssert wORD.ord == 0x7fffffff
