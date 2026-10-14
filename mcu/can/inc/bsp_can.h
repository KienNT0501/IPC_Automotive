#ifndef BSP_CAN_H
#define BSP_CAN_H

#include <stdint.h>
#include <stdbool.h>

#define CAN_MAX_DATA_LEN 8
#define CAN_SOF          0xAA

typedef struct {
    uint8_t id;
    uint8_t len;
    uint8_t data[CAN_MAX_DATA_LEN];
} can_frame_t;

typedef void (*bsp_can_rx_cb_t)(const can_frame_t *frame);

/* API */
void bsp_can_init(bsp_can_rx_cb_t cb);
void bsp_can_send(const can_frame_t *frame);

/* RX hook (call từ UART ISR hoặc poll) */
void bsp_can_rx_byte(uint8_t byte);

#endif
