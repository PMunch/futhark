import "../src/futhark"

proc renameCb(name: string, kind: string, partof = ""): string =
  if name == "out": "notout"
  else: name

# Tell futhark where to find the C libraries you will compile with, and what
# header files you wish to import.
importc:
  absPath "/usr/lib/clang/12.0.1/include"
  path "./stb"
  define STB_IMAGE_IMPLEMENTATION
  #renameCallback renameCb
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

var image = stbi_load("../futhark.png", width.addr, height.addr, channels.addr, STBI_default.cint)
if image == nil:
  echo "Error in loading the image"
  quit 1

echo "Loaded image with a width of ", width, ", a height of ", height, " and ", channels, " channels"
stbi_image_free(image)
