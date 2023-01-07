switch("define", "opirRebuild")
switch("define", "futharkRebuild")

proc getClangIncludePath(): string =
  const inclDir = staticExec("clang -print-resource-dir") & "/include"
  when dirExists(inclDir):
    inclDir
  else:
    {.warning: "futhark: clang include path not found".}
    ""

const clangIncludePath = getClangIncludePath()

switch("define", "sysPaths:" & clangIncludePath)
