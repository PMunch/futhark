import "../src/futhark"

importc:
  path "."
  "tarranonstruct.h"

var t: structTest
t.a[0].m = 42
doAssert t.a[0].m == 42
doAssert t.a[9].m == 0
