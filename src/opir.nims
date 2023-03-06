when defined(windows):
  # Default LLVM install path on Windows
  switch("passL", "-L\"C:\\Program Files\\LLVM\\lib\"")
switch("passL", "-lclang")
