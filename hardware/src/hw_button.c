#include "hw_button.h"
#include "app_event.h"
#include "stm32f1xx_hal.h"

static volatile uint8_t btn_flag = 0;

void hw_button_init(hw_button_t btn)
{
    if (btn != HW_BUTTON_USER) return;

    __HAL_RCC_GPIOC_CLK_ENABLE();
    __HAL_RCC_AFIO_CLK_ENABLE();

    GPIO_InitTypeDef GPIO_InitStruct = {0};
    GPIO_InitStruct.Pin  = GPIO_PIN_9;
    GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;   // nhấn kéo xuống GND
    GPIO_InitStruct.Pull = GPIO_PULLUP;
    HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

    HAL_NVIC_SetPriority(EXTI9_5_IRQn, 2, 0);
    HAL_NVIC_EnableIRQ(EXTI9_5_IRQn);
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
    if (GPIO_Pin == GPIO_PIN_9)
    {
        btn_flag = 1;
    }
}

uint8_t hw_button_get_and_clear(void)
{
    if (btn_flag)
    {
        btn_flag = 0;
        return 1;
    }
    return 0;
}
// void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
// {
//     if (GPIO_Pin == GPIO_PIN_9)
//     {
//         app_event_push(APP_EVENT_BUTTON_PRESS);
//         //HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_8);
//     }
// }


