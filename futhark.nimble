# Package

version       = "0.9.1"
author        = "PMunch"
description   = "A package which uses libclang to parse C headers into Nim files for easy interop"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["opir"]


# Dependencies

requires "nim >= 1.4.8"
requires "https://github.com/PMunch/libclang-nim#head"
requires "termstyle"
requires "macroutils"
