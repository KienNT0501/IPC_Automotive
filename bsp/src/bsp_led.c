#include "bsp_led.h"
#include "hw_led.h"


void bsp_led_init(void)
{
    LED_Init(HW_GPIO_A, GPIO_PIN_8);
}

void bsp_led_on(void)
{
    LED_On(HW_GPIO_A, GPIO_PIN_8);
}

void bsp_led_off(void)
{
    LED_Off(HW_GPIO_A, GPIO_PIN_8);
}

void bsp_led_toggle(void)
{
    LED_Toggle(HW_GPIO_A, GPIO_PIN_8);
}
