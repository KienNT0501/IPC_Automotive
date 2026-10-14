#include "hw_adc.h"
#include "adc.h"
#include "bsp_uart.h"
void hw_adc_init(void)
{

}

uint16_t hw_adc_read_raw(void)
{
    
    HAL_ADC_Start(&hadc1);
    uint16_t v = 0;
    if (HAL_ADC_PollForConversion(&hadc1, 10) == HAL_OK)
        {
            v = HAL_ADC_GetValue(&hadc1);
        }
    HAL_ADC_Stop(&hadc1);
    return v;
}