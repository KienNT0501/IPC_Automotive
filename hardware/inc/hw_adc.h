#ifndef HW_ADC_H
#define HW_ADC_H

#include <stdint.h>

void hw_adc_init(void);
uint16_t hw_adc_read_raw(void);   // 0–4095

#endif