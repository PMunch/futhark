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
