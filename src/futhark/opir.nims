import std/[os, strutils]

when defined(windows):
  # Default LLVM install library path on Windows
  const libpath = getEnv("ProgramFiles") / "LLVM" / "bin"
  if libpath.dirExists():
    switch("passL", "-L" & quoteShell(libpath))
elif defined(macosx):
  # Default libclang path on macOS
  const cmdres = gorgeEx("xcode-select -p")
  if cmdres.exitCode != 0:
    raise newException(LibraryError, $cmdres)
  const libpath = cmdres.output.strip() / "usr" / "lib"
  if libpath.dirExists():
    switch("passL", "-L" & quoteShell(libpath))
    switch("passL", "-Wl,-rpath " & quoteShell(libpath.quoteShell))
elif defined(linux):
  const cmdres = gorgeEx("clang -print-file-name=../../libclang.so")
  if cmdres.exitCode != 0:
    raise newException(LibraryError, $cmdres)
  const libpath = cmdres.output.strip().parentDir()
  if fileExists(libpath / "libclang.so"):
    switch("passL", "-L" & libpath)
  else:
    const cmdres = gorgeEx("clang -print-file-name=libclang.so")
    if cmdres.exitCode != 0:
      raise newException(LibraryError, $cmdres)
    const libpath2 = cmdres.output.strip().parentDir()
    if fileExists(libpath2 / "libclang.so"):
      switch("passL", "-L" & libpath2)

switch("passL", "-lclang")
