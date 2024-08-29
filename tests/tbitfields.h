#include <stdint.h>

typedef struct {
  int one : 1;
  int two : 1;
  int three : 2;
  int four : 4;
} bitmap;

struct bitmap2
{
    uint8_t frame_id : 1;
    uint8_t end_of_frame : 1;
    uint8_t presentation_time : 1;
    uint8_t source_clock : 1;
    uint8_t reserved : 1;
    uint8_t still_image : 1;
    uint8_t error : 1;
    uint8_t end_of_header : 1;
};
