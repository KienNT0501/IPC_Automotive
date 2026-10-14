#ifndef HW_BUTTON_H
#define HW_BUTTON_H

#include <stdint.h>

typedef enum {
    HW_BUTTON_USER = 0
} hw_button_t;

void hw_button_init(hw_button_t btn);
uint8_t hw_button_get_and_clear(void);

#endif
