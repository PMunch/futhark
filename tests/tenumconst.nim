import "../src/futhark"

importc:
  path "."
  "tenumconst.h"

doAssert MY_VAR_A.ord == 0
doAssert MY_VAR_B.ord == 1
doAssert MY_VAR_C.ord == 2
doAssert MY_VAR_D.ord == 1
doAssert MY_VAR_E.ord == 0

doAssert MY_VAR_D == MY_VAR_B
doAssert MY_VAR_E == MY_VAR_A
