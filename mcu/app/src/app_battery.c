#include "app_battery.h"
#include "bsp_adc.h"

#define ADC_MAX         4095
#define ADC_AVG_NUM     4

static uint16_t adc_buf[ADC_AVG_NUM];
static uint8_t  adc_idx;
static uint8_t  battery_percent;

void app_battery_init(void)
{
    bsp_adc_init();

    for (int i = 0; i < ADC_AVG_NUM; i++)
        adc_buf[i] = 0;

    battery_percent = 0;
}

static uint16_t adc_read_avg(void)
{
    adc_buf[adc_idx++] = bsp_adc_read_raw();
    if (adc_idx >= ADC_AVG_NUM)
        adc_idx = 0;

    uint32_t sum = 0;
    for (int i = 0; i < ADC_AVG_NUM; i++)
        sum += adc_buf[i];

    return (uint16_t)(sum / ADC_AVG_NUM);
}

uint8_t app_battery_get_percent(void)
{
    uint16_t adc = adc_read_avg();
    uint8_t new_percent;

    if (adc > ADC_MAX)
        adc = ADC_MAX;

    new_percent = (uint8_t)((adc * 100) / ADC_MAX);

    /* giả lập pin xả / nạp chậm */
    if (new_percent > battery_percent)
        battery_percent++;
    else if (new_percent < battery_percent)
        battery_percent--;

    return battery_percent;
}

void app_battery_send_vcu(void) {
    static uint32_t last_adc_tick = 0;

    if (HAL_GetTick() - last_adc_tick >= 10)
    {
        last_adc_tick = HAL_GetTick();

        uint8_t adc_val = app_battery_get_percent();

        app_can_send_sensor(10, adc_val);
    }
}