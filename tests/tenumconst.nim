import "../src/futhark"

importc:
  path "."
  compilerArg "-fshort-enums"
  compilerArg "--target=armv6m-none-eabi"
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

doAssert sizeof(ANON_D) == 1

doAssert sizeof(SHORT) == 2
doAssert SHORT.ord == 0x7fff

doAssert sizeof(WORD) == 4
doAssert WORD.ord == 0x7fffffff
