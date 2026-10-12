import ../src/futhark


importc:
  path "."
  "tcompoundliteral.h"

# Compound literal macros should be generated as templates
doAssert LIGHTGRAY.r == 200'u8
doAssert LIGHTGRAY.g == 200'u8
doAssert LIGHTGRAY.b == 200'u8
doAssert LIGHTGRAY.a == 255'u8

doAssert RAYWHITE.r == 245'u8
doAssert RAYWHITE.g == 245'u8
doAssert RAYWHITE.b == 245'u8
doAssert RAYWHITE.a == 255'u8

doAssert BLANK.a == 0'u8

doAssert VECTOR2_ZERO.x == 0.0
doAssert VECTOR2_ZERO.y == 0.0
doAssert VECTOR2_ONE.x == 1.0
doAssert VECTOR2_ONE.y == 1.0

# `struct Rectangle` without a typedef is normalized to `struct_Rectangle`
doAssert RECT_ONE.x == 0.0
doAssert RECT_ONE.width == 100.0
doAssert RECT_ONE.height == 50.0

# Each use should expand to a fresh object, just like the C macro
var c1 = LIGHTGRAY
var c2 = LIGHTGRAY
c1.r = 0'u8
doAssert c1.r == 0'u8
doAssert c2.r == 200'u8

echo "OK: compound literal macros generated correctly"
