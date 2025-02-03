import "../src/futhark"
import strutils

{.emit: "#include \"toverloading.h\"".}

proc renameCallback(name: string, kind: string, partof: string, overloading: var bool): string =
  result = name
  if result in ["setFoo", "setBar"]:
    result = "set"
    overloading = true
  elif result in ["Foo", "Bar"]:
    result = result & "Zee"
    overloading = true

importc:
  renameCallback renameCallback
  path "."
  "toverloading.h"

var
  foo: FooZee
  bar: BarZee

foo.addr.set(100.cint)
bar.addr.set(1.42.cfloat)

echo foo
echo bar

