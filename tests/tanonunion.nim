import "../src/futhark"

importc:
  path "."
  "tanonunion.h"

var
  v = 100'u8
  t: lpuartTransferT
t.dataSize = 10
t.anon0.rxData = v.addr
doAssert t.dataSize == 10
doAssert t.anon0.data[] == 100'u8
doAssert t.anon0.rxData[] == 100'u8
doAssert t.anon0.txData[] == 100'u8
v = 42'u8
doAssert t.anon0.data[] == 42'u8
doAssert t.anon0.rxData[] == 42'u8
doAssert t.anon0.txData[] == 42'u8

var t2: lpuartTransferT2

t2.dataSize.rxData = v.addr
doAssert t2.dataSize.data[] == 42'u8
doAssert t2.dataSize.rxData[] == 42'u8
doAssert t2.dataSize.txData[] == 42'u8
v = 100'u8
doAssert t2.dataSize.data[] == 100'u8
doAssert t2.dataSize.rxData[] == 100'u8
doAssert t2.dataSize.txData[] == 100'u8
