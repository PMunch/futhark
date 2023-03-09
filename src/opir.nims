import os

when defined(windows):
  # Default LLVM install library path on Windows
  switch("passL", "-L" & quoteShell(getEnv("ProgramFiles") / "LLVM" / "lib"))
elif defined(macosx):
  # Default libclang path on macOS
  const libpath = "/Library/Developer/CommandLineTools/usr/lib"
  switch("passL", "-L" & quoteShell(libpath))
  switch("passL", "-Wl,-rpath " & quoteShell(libpath.quoteShell))

switch("passL", "-lclang")
