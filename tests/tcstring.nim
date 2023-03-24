import "../src/futhark"

{.compile: "tcstring.c".}

importc:
  path "."
  "tcstring.h"

doAssert my_func("Hello".cstring) == 5
