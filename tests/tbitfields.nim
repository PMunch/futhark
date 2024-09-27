import "../src/futhark"

importc:
  path "."
  "tbitfields.h"

{.emit: "#include \"tbitfields.h\"".}
proc getCsizeofBitmap(): cint =
  {.emit: [result, " = sizeof(bitmap);"].}

proc getCsizeofHeaderInfoBitmap(): cint =
  {.emit: [result, " = sizeof(struct bitmap2);"].}

echo getCsizeofBitmap()
echo sizeof(bitmap)
doAssert sizeof(bitmap) == getCsizeofBitmap()
echo getCsizeofHeaderInfoBitmap()
echo sizeof(structBitmap2)
doAssert sizeof(structBitmap2) == getCsizeofHeaderInfoBitmap()
