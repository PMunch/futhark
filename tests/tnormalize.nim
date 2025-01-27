import "../src/futhark"

importc:
  path "."
  "tnormalize.h"

doAssert(my_var == 1)
doAssert(myVar_const == 2) # Renamed as 1st definition collides
doAssert(myvar_const_339F6A06 == 3) # Renamed as both 1st and 2nd definition collides
doAssert(MYVAR == 4)
doAssert(MY_VAR_const == 5) # Renamed as 4th definition collides
doAssert(MyVar_const_57AD9D4C == 6) # Renamed as 4th and 5th definition collides
doAssert(My_Var_const_DE52C234 == 7) # Renamed as 4th and 5th definiton collides
