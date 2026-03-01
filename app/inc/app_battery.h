#ifndef APP_BATTERY_H
#define APP_BATTERY_H

#include <stdint.h>
#include <stdio.h>
#include "app_can.h"
void app_battery_init(void);

/* Battery level in percent (0–100) */
uint8_t app_battery_get_percent(void);
void app_battery_send_vcu(void);
#endif