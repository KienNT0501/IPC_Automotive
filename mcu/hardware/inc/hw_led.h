#ifndef HW_LED_H
#define HW_LED_H

#include <stdint.h>
#include <stdbool.h>
#include "stm32f1xx_hal.h"

typedef enum { 
    HW_GPIO_A = 0,
    HW_GPIO_B,
    HW_GPIO_C
} HW_LED_PORT_t;

typedef uint16_t HW_LED_PIN_t;

void LED_Init(HW_LED_PORT_t LED_PORT, HW_LED_PIN_t LED_PIN);
void LED_On(HW_LED_PORT_t LED_PORT, HW_LED_PIN_t LED_PIN);
void LED_Off(HW_LED_PORT_t LED_PORT, HW_LED_PIN_t LED_PIN);
void LED_Toggle(HW_LED_PORT_t LED_PORT, HW_LED_PIN_t LED_PIN);

#endif
