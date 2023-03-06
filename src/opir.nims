when defined(windows):
  switch("passL", "-L\"C:\\Program Files\\LLVM\\lib\"")
switch("passL", "-lclang")
