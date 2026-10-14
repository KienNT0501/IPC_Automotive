#include "hw_led.h"
#include "stm32f1xx_hal.h"

/* ================= PRIVATE ================= */

static GPIO_TypeDef* hw_led_port_to_gpio(HW_LED_PORT_t port)
{
    switch (port)
    {
    case HW_GPIO_A: return GPIOA;
    case HW_GPIO_B: return GPIOB;
    case HW_GPIO_C: return GPIOC;
    default:        return GPIOA;
    }
}
static GPIO_PinState state_led_to_gpio_pin_state(int state)
{
    switch(state){
        case 1: return GPIO_PIN_SET;
        case 0: return GPIO_PIN_RESET;
    }
}
static void hw_led_enable_clock(HW_LED_PORT_t port)
{
    switch (port)
    {
    case HW_GPIO_A:
        __HAL_RCC_GPIOA_CLK_ENABLE();
        break;
    case HW_GPIO_B:
        __HAL_RCC_GPIOB_CLK_ENABLE();
        break;
    case HW_GPIO_C:
        __HAL_RCC_GPIOC_CLK_ENABLE();
        break;
    default:
        break;
    }
}

/* ================= PUBLIC API ================= */

void LED_Init(HW_LED_PORT_t LED_PORT, HW_LED_PIN_t LED_PIN)
{
    hw_led_enable_clock(LED_PORT);

    GPIO_InitTypeDef gpio = {0};
    gpio.Pin = LED_PIN;
    gpio.Mode = GPIO_MODE_OUTPUT_PP;
    gpio.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init(hw_led_port_to_gpio(LED_PORT), &gpio);
    HAL_GPIO_WritePin(hw_led_port_to_gpio(LED_PORT), LED_PIN, GPIO_PIN_SET);
}

void LED_On(HW_LED_PORT_t LED_PORT, HW_LED_PIN_t LED_PIN){
    HAL_GPIO_WritePin(hw_led_port_to_gpio(LED_PORT), LED_PIN, GPIO_PIN_RESET);
}

void LED_Off(HW_LED_PORT_t LED_PORT, HW_LED_PIN_t LED_PIN){
    HAL_GPIO_WritePin(hw_led_port_to_gpio(LED_PORT), LED_PIN, GPIO_PIN_SET);
}

void LED_Toggle(HW_LED_PORT_t LED_PORT, HW_LED_PIN_t LED_PIN)
{
    HAL_GPIO_TogglePin(hw_led_port_to_gpio(LED_PORT), LED_PIN);
}
