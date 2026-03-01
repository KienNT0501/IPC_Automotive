#ifndef APP_CAN_H
#define APP_CAN_H

#include <stdint.h>
#include "bsp_uart.h"
#include "bsp_can.h"
#include "app_event.h"

/* CAN IDs */
#define CAN_ID_CMD_RUN     0x01
#define CAN_ID_CMD_STOP    0x02
#define CAN_ID_CMD_STATUS  0x03

#define CAN_ID_SENSOR      0x10
#define CAN_ID_DTC         0x11

void app_can_init(void);

/* ECU → VCU */
void app_can_send_sensor(uint16_t speed, uint8_t battery);
void app_can_send_dtc(uint16_t dtc);
/* VCU → ECU */
void app_can_read_vcu(void);
/* Debug CAN */
void app_can_log_frame(const can_frame_t *f);

#endif
