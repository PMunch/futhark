import "../src/futhark"

importc:
  path "."
  "tstructinstruct.h"

assert sizeof(structNormal) == sizeof(pointer)
{.emit: "#include \"tstructinstruct.h\"".}
proc getParentSpec(): tuple[size, f1offset, childOffset, f2offset: int] =
  {.emit: [result[0], " = sizeof(struct Parent);"].}
  {.emit: [result[1], " = offsetof(struct Parent, field1);"].}
  {.emit: [result[2], " = offsetof(struct Parent, child);"].}
  {.emit: [result[3], " = offsetof(struct Parent, field2);"].}
let pspec = getParentSpec()
assert pspec.size == sizeof(structParent)
assert pspec.f1offset == offsetof(structParent, field1)
assert pspec.childOffset == offsetof(structParent, child)
assert pspec.f2offset == offsetof(structParent, field2)
