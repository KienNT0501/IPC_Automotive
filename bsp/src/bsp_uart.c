#include "hw_uart.h"
#include "bsp_uart.h"



void bsp_uart_init(bsp_uart_t uart){
    
    switch (uart)
    {
        case BSP_UART_VCU:
            
            HW_UART_Init(HW_UART_VCU);
            break;
        default:
            break;
    }
}
bool bsp_uart_send(bsp_uart_t uart, uint8_t *data, uint16_t len){
    switch (uart)
    {
        case BSP_UART_VCU:
            return HW_UART_Send(HW_UART_VCU, data, len);
        default:
            return false;
    }
}
bool bsp_uart_read_byte(bsp_uart_t uart, uint8_t *byte){
    switch (uart)
    {
        case BSP_UART_VCU:
            return HW_UART_ReadByte(HW_UART_VCU, byte);
        default:
            return false;
    }
}