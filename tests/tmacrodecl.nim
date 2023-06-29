import "../src/futhark"

importc:
  path "."
  "tmacrodecl.h"

doAssert TEST_PLAIN_INT == 123
doAssert TEST_PLAIN_LONG == -2147483648
doAssert TEST_PLAIN_LONGLONG == -9223372036854775808'i64.clonglong

doAssert TEST_PLAIN_FLOAT_1 == 123.123.cfloat
doAssert TEST_PLAIN_FLOAT_2 == 0.123.cfloat
doAssert TEST_PLAIN_FLOAT_3 == 123.cfloat
doAssert TEST_PLAIN_FLOAT_4 == -0.0.cfloat
doAssert TEST_PLAIN_FLOAT_5 == -0.0.cfloat
doAssert TEST_PLAIN_FLOAT_6 == 0.0.cfloat

doAssert TEST_PLAIN_DOUBLE_1 == 123.cdouble

doAssert TEST_PLAIN_LONG_DOUBLE_1 == 100.clongdouble
