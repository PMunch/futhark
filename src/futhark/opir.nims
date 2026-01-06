import std/[os, strutils]

when defined(windows):
  # Default LLVM install library path on Windows
  const libpath = getEnv("ProgramFiles") / "LLVM" / "lib"
  if libpath.dirExists():
    when defined(vcc):
      switch("passL", "/link /LIBPATH:" & quoteShell(libpath))
    else:
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
elif defined(freebsd):
  # Path prefix is never the same so we grab from llvm-config
  const cmdres = gorgeEx("llvm-config --libdir")
  if cmdres.exitCode != 0:
    raise newException(LibraryError, $cmdres)
  const libpath = cmdres.output.strip()
  if fileExists(libpath / "libclang.so"):
    switch("passL", "-L" & libpath)
elif defined(openbsd):
  # lib never has the same file name and similar paths to FreeBSD
  const cmdres = gorgeEx("pkg_info -L llvm | grep libclang.so")
  if cmdres.exitCode != 0:
    raise newException(LibraryError, $cmdres)
  const libpath = cmdres.output.strip()
  # libpath already contains name of lib file
  if fileExists(libpath):
    # parentDir() happens here instead of separate variable
    switch("passL", "-L" & libpath.parentDir())

when defined(vcc):
  switch("passL", "libclang.lib")
else:
  switch("passL", "-lclang")
