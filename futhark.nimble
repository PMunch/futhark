# Package

version       = "0.1.0"
author        = "PMunch"
description   = "A package which uses libclang to parse C headers into Nim files for easy interop"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["opir"]


# Dependencies

requires "nim >= 1.4.8"
requires "clang"
requires "termstyle"
requires "macroutils"
