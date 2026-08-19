// Test handling of C macros that expand to compound literals, such as
// raylib's named colors: #define LIGHTGRAY CLITERAL(Color){ 200, 200, 200, 255 }

typedef struct Color {
    unsigned char r;
    unsigned char g;
    unsigned char b;
    unsigned char a;
} Color;

typedef struct Vector2 {
    float x;
    float y;
} Vector2;

// Struct without a typedef, referenced as `struct Rectangle`
struct Rectangle {
    float x;
    float y;
    float width;
    float height;
};

// raylib-style CLITERAL wrapper
#define CLITERAL(type) (type)

// Plain C99 compound literals
#define LIGHTGRAY  CLITERAL(Color){ 200, 200, 200, 255 }
#define RAYWHITE   CLITERAL(Color){ 245, 245, 245, 255 }
#define BLANK      CLITERAL(Color){ 0, 0, 0, 0 }
#define VECTOR2_ZERO (Vector2){ 0.0f, 0.0f }
#define VECTOR2_ONE (Vector2){ 1.0f, 1.0f }
#define RECT_ONE (struct Rectangle){ 0.0f, 0.0f, 100.0f, 50.0f }

// These should be ignored, not crash the parser:
#define FUNCTION_LIKE(x) (x)
#define JUST_AN_IDENTIFIER SOME_OTHER_MACRO
#define PLAIN_NUMBER 42
