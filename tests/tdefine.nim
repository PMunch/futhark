import "../src/futhark"

importc:
  path "."
  "tdefine.h"

assert TEST1 == 1 shl 5
assert TEST2(4) == 1 shl 4
