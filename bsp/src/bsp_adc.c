#include "bsp_adc.h"
#include "hw_adc.h"

void bsp_adc_init(void)
{
    hw_adc_init();
}

uint16_t bsp_adc_read_raw(void)
{
    return hw_adc_read_raw();
}