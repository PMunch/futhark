when defined(windows):
  import os
  # Default LLVM install path on Windows
  switch("passL", "-L" & quoteShell(getEnv("ProgramFiles") / "LLVM" / "lib"))

switch("passL", "-lclang")
