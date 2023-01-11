typedef enum {
    MY_VAR_A, // == 0
    MY_VAR_B, // == 1
    MY_VAR_C, // == 2
    MY_VAR_D = MY_VAR_B, // == 1
    MY_VAR_E = 0 // == 0
} my_enum;

enum {
    ANON_A,
    ANON_B,
    ANON_C = -1
};

enum {
    ANON_D = 0,

    // this is ignored now
    ANON_E = 'E'
};

#include <limits.h>

typedef enum {
    SHORT = SHRT_MAX
} enum_short;

typedef enum {
    WORD = INT_MAX
} enum_word;

// does not not work
// typedef enum {
//     LONG = LONG_MAX
// } enum_long;
