import os, strutils

import ../src/futhark

const outputPath = currentSourcePath.parentDir / "tnoidentnormalizecollision_out.nim"

importc:
  path "."
  outputPath outputPath
  "tnoidentnormalizecollision.h"


let fObject = open(outputPath, FileMode.fmRead)
let outputText = fObject.readAll()
fObject.close()

# Test default behavior per tnormalize.nim
doAssert(my_var == 1)
doAssert(myVar_const == 2) # Renamed as 1st definition collides
doAssert(myvar_const_339F6A06 == 3) # Renamed as both 1st and 2nd definition collides
doAssert(MYVAR == 4)
doAssert(MY_VAR_const == 5) # Renamed as 4th definition collides
doAssert(MyVar_const_57AD9D4C == 6) # Renamed as 4th and 5th definition collides
doAssert(My_Var_const_DE52C234 == 7) # Renamed as 4th and 5th definiton collides

# Manually test identifier case of output
doAssert " my_var*" in outputText
doAssert " myVar_const*" in outputText
doAssert " myvar_const_339F6A06*" in outputText
doAssert " MYVAR*" in outputText
doAssert " MY_VAR_const*" in outputText
doAssert " MyVar_const_57AD9D4C*" in outputText
doAssert " My_Var_const_DE52C234*" in outputText

# `myvar` was renamed in the second name collision, so we can check its 
# nonexistence in the output file.
doAssert (not (" myvar*" in outputText))
