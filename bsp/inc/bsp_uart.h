#ifndef BSP_UART_H
#define BSP_UART_H

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#define LOG(fmt, ...) \
    do { \
        char buf[128]; \
        int n = snprintf(buf, sizeof(buf), fmt, ##__VA_ARGS__); \
        bsp_uart_send(BSP_UART_VCU, (uint8_t*)buf, n); \
    } while(0)

typedef enum {
    BSP_UART_VCU = 0
} bsp_uart_t;

void bsp_uart_init(bsp_uart_t uart);
bool bsp_uart_send(bsp_uart_t uart, uint8_t *data, uint16_t len);
bool bsp_uart_send_byte(bsp_uart_t uart, uint8_t byte);
bool bsp_uart_read_byte(bsp_uart_t uart, uint8_t *byte);

#endif /* BSP_UART_H */
