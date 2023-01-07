switch("define", "opirRebuild")
switch("define", "futharkRebuild")

import strutils

proc getClangPath(): string =
  var sysPaths: seq[string]
  for line in staticExec("clang -x c -v -E /dev/null").split("\n"):
    if line.startsWith(" /"):
      sysPaths.add(line.substr(1))
      break
  if sysPaths.len > 0:
    sysPaths[0]
  else:
    ""

var clangPath = getClangPath()

if clangPath == "":
  echo "clang include path not found"

switch("define", "sysPaths:" & clangPath)

