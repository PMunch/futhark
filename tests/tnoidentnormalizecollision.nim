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
doAssert(myVarconst == 2) # Renamed as 1st definition collides
doAssert(myvarconstC690172C == 3) # Renamed as both 1st and 2nd definition collides
doAssert(MYVAR == 4)
doAssert(MY_VARconst == 5) # Renamed as 4th definition collides
doAssert(MyVarconst2E4AA817 == 6) # Renamed as 4th and 5th definition collides
doAssert(My_Varconst038D4D97 == 7) # Renamed as 4th and 5th definiton collides

# Manually test identifier case of output
doAssert " my_var*" in outputText
doAssert " myVarconst*" in outputText
doAssert " myvarconstC690172C*" in outputText
doAssert " MYVAR*" in outputText
doAssert " MyVarconst2E4AA817*" in outputText
doAssert " My_Varconst038D4D97*" in outputText

# `myvar` was renamed in the second name collision, so we can check its 
# nonexistence in the output file.
doAssert (not (" myvar*" in outputText))