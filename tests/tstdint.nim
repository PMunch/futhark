import "../src/futhark"

importc:
  path "."
  "tstdint.h"

doAssert TEST_UINT8_ZERO == 0'u8.uint8
doAssert TEST_UINT8  == 0xff'u8.uint8
doAssert TEST_UINT16 == 0xffff'u16.cuint
doAssert TEST_UINT32 == 0xffffffff'u32.culong
doAssert TEST_UINT64 == 18446744073709551615'u64.culonglong

doAssert TEST_INT8  == -128'i8.int8
doAssert TEST_INT16 == -32768'i16.cint
doAssert TEST_INT32 == -2147483648'i32.clong
doAssert TEST_INT64 == -9223372036854775808'i64.clonglong
