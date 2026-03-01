#ifndef BSP_ADC_H
#define BSP_ADC_H

#include <stdint.h>

void bsp_adc_init(void);

/* Read raw ADC value (0–4095) */
uint16_t bsp_adc_read_raw(void);

#endif