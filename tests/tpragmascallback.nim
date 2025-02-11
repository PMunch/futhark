import macros
import "../src/futhark"

proc pragmasCallback(name: string, kind: SymbolKind, pragmas: var seq[NimNode]) =
  case name:
  of "TCHAR":
    assert kind == Typedef
    assert pragmas.len == 0
  of "struct_test":
    assert kind == Struct
    assert pragmas.repr == "@[pure, inheritable, bycopy]"
  of "union_test2":
    assert kind == Union
    assert pragmas.repr == "@[union, bycopy]"
  of "enum_myEnum":
    assert kind == Enum
    assert pragmas.repr == "@[size: sizeof(cuint)]"
  of "my_func":
    assert kind == Proc
    assert pragmas.repr == "@[cdecl, importc: \"my_func\"]"
  else:
    assert false
  if name == "my_func":
    pragmas.add newIdentNode("discardable")

{.emit: """
int my_func(char* string) {
  return 10;
}
""".}

importc:
  path "."
  pragmasCallback pragmasCallback
  "tpragmascallback.h"

# This should work
let x = my_func("test".cstring)
assert x == 10
# Also works because it is marked as "discardable" by the pragmasCallback
my_func("test".cstring)
