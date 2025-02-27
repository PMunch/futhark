import std/[os, strutils]

when defined(windows):
  # Default LLVM install library path on Windows
  const libpath = getEnv("ProgramFiles") / "LLVM" / "bin"
  if libpath.dirExists():
    switch("passL", "-L" & quoteShell(libpath))
elif defined(macosx):
  # Try command-line tools lib path first
  const libpath = "/Library/Developer/CommandLineTools/usr/lib"
  if (libpath / "libclang.dylib").fileExists():
    switch("passL", "-L" & quoteShell(libpath))
    switch("passL", "-Wl,-rpath " & quoteShell(libpath.quoteShell))
  else:
    const cmdres = gorgeEx("xcode-select -p")
    if cmdres.exitCode != 0:
      raise newException(LibraryError, $cmdres)
    const xcodeselectpath = cmdres.output.strip()
    const libpaths = @[
      xcodeselectpath / "usr/lib",
      xcodeselectpath / "Toolchains/XcodeDefault.xctoolchain/usr/lib",
    ]
    for libpath2 in libpaths:
      if (libpath2 / "libclang.dylib").fileExists():
        switch("passL", "-L" & quoteShell(libpath2))
        switch(
          "passL",
          "-Wl,-rpath " &
            quoteShell(libpath2.quoteShell),
        )
        break
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
