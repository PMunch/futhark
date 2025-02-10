import "../src/futhark"

importc:
  path "."
  "tillegalidentifiers.h"

{.emit: """
int func(int *end) {
  return 42;
}
void typedesc(int *end, int proc) {
  *end = proc;
}
""".}

var x: structIllegal
x.typeField = default(type_typedef)
x.procField = default(proc_typedef)
x.set = default(set_typedef)
var y: cint
assert func_proc(y.addr) == 42
y.addr.typedesc(42)
echo y
