import os, strutils

import ../src/futhark

const outputPath = currentSourcePath.parentDir / "tnoidentnormalize_out.nim"

importc:
  path "."
  outputPath outputPath
  "tnoidentnormalize.h"


let fObject = open(outputPath, FileMode.fmRead)
let outputText = fObject.readAll()
fObject.close()

# Because of Nim's case/underscore insensitivity, the output of `importc` has
# to be evaluated directly.

# The existence of the exported identifiers `doNot_normalize`,
# `will_partly_normalize`, and the inexistence of exported `donotnormalize`
# should be sufficient in determining whether the test has passed.

doAssert " doNot_normalize*" in outputText
doAssert " will_partly_normalize*" in outputText
doAssert (not (" donotnormalize*" in outputText))
