import os, strutils

import ../src/futhark


importc:
  path "."
  "tstaticconstvalues.h"

doAssert(One == 1)
doAssert(Two == 2.0)
doAssert(Three.char == '3')
doAssert(Four == "four")
