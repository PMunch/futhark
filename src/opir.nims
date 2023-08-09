import std/[os, strutils]

when defined(windows):
  # Default LLVM install library path on Windows
  const libpath = getEnv("ProgramFiles") / "LLVM" / "lib"
  if libpath.dirExists():
    switch("passL", "-L" & quoteShell(libpath))
elif defined(macosx):
  # Default libclang path on macOS
  const libpath = staticExec("xcode-select -p").strip() / "usr" / "lib"
  if libpath.dirExists():
    switch("passL", "-L" & quoteShell(libpath))
    switch("passL", "-Wl,-rpath " & quoteShell(libpath.quoteShell))
elif defined(linux):
  const libpath = staticExec("clang -print-file-name=libclang.so").strip().parentDir()
  if fileExists(libpath / "libclang.so"):
    switch("passL", "-L" & libpath)

switch("passL", "-lclang")
