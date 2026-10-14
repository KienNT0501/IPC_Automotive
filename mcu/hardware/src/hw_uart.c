#include "hw_uart.h"
#include "main.h"
#include "stm32f1xx_hal.h"
#include "bsp_uart.h"

/* ================= CONFIG ================= */

#define HW_UART_RX_BUF_SIZE   128u
extern UART_HandleTypeDef huart2;
uint8_t rx_idx = 0;
/* ================= PRIVATE DATA ================= */

static uint8_t rx_buf[HW_UART_RX_BUF_SIZE];
static volatile uint16_t rx_head = 0;
static volatile uint16_t rx_tail = 0;
uint8_t rx_byte;

/* ================= PRIVATE HELPERS ================= */

static inline uint16_t next_index(uint16_t idx)
{
    return (uint16_t)((idx + 1u) % HW_UART_RX_BUF_SIZE);
}

/* ================= PUBLIC API ================= */

void HW_UART_Init(HW_UART_t uart)
{
    if (uart != HW_UART_VCU){
        return;
    }
    HAL_UART_Receive_IT(&huart2, &rx_byte, 1);
}

bool HW_UART_Send(HW_UART_t uart, uint8_t *data, uint16_t len)
{
    if ((uart != HW_UART_VCU) || (data == NULL) || (len == 0))
        return false;

    return (HAL_UART_Transmit(&huart2, data, len, HAL_MAX_DELAY) == HAL_OK);
}

bool HW_UART_ReadByte(HW_UART_t uart, uint8_t *byte)
{
    
    if ((uart != HW_UART_VCU) || (byte == NULL)){
        return false;
    }
    if (rx_head == rx_tail){
        return false;
    }
    *byte = rx_buf[rx_tail];
    rx_tail = next_index(rx_tail);
    return true;
}



void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
    if (huart->Instance == USART2)
    {
        uint16_t next = next_index(rx_head);

        if (next != rx_tail)
        {
            rx_buf[rx_head] = rx_byte;
            rx_head = next;
        }

        HAL_UART_Receive_IT(&huart2, &rx_byte, 1);
    }
}