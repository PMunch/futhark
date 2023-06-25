#include <stdint.h>

// Adapted from usage in the wild:
// https://github.com/boschsensortec/BME68x-Sensor-API/blob/master/bme68x_defs.h

#define TEST_UINT8                         UINT8_C(0xff)
#define TEST_UINT16                        UINT16_C(0xffff)
#define TEST_UINT32                        UINT32_C(0xffffffff)
#define TEST_UINT64                        UINT64_C(18446744073709551615)

#define TEST_INT8                          INT8_C(-128)
#define TEST_INT16                         INT16_C(-32768)
#define TEST_INT32                         INT32_C(-2147483648)
#define TEST_INT64                         INT64_C(-9223372036854775808)
