import "../src/futhark", strutils

# Remove the `stbi_` prefix since Nim doesn't struggle as much with collisions as C
proc renameCb(n: string, k: SymbolKind, p: string, overloading: var bool): string = n.replace "stbi_", ""

# Tell futhark where to find the C libraries you will compile with, and what
# header files you wish to import.
importc:
  path "./stb"
  define STB_IMAGE_IMPLEMENTATION
  renameCallback renameCb
  rename FILE, CFile
  "stb_image.h"

# Tell Nim how to compile against the library. If you have a dynamic library
# this would simply be a `--passL:"-l<library name>`
static:
  writeFile("test.c", """
  #define STB_IMAGE_IMPLEMENTATION
  #include "./stb/stb_image.h"
  """)
{.compile: "test.c".}

# Use the library just like you would in C!
var width, height, channels: cint

var image = load("futhark.png", width.addr, height.addr, channels.addr, STBI_default.cint)
if image.isNil:
  echo "Error in loading the image"
  quit 1

echo "Loaded image with a width of ", width, ", a height of ", height, " and ", channels, " channels"
doAssert width == 830
doAssert height == 261
doAssert channels == 4
image_free(image)
