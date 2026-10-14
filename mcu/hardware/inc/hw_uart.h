#ifndef HW_UART_H
#define HW_UART_H

#include <stdint.h>
#include <stdbool.h>

typedef enum {
    HW_UART_VCU = 0
} HW_UART_t;

void HW_UART_Init(HW_UART_t uart);
bool HW_UART_Send(HW_UART_t uart, uint8_t *data, uint16_t len);
bool HW_UART_ReadByte(HW_UART_t uart, uint8_t *byte);

#endif
