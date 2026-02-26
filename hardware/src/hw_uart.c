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
    //bsp_led_toggle();
    LOG("HW INIT! \n\r");
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
    // if (huart->Instance == USART2)
    // {
    //     // Nếu gặp Enter (picocom thường gửi \r hoặc \n)
    //     if (rx_byte == '\r' || rx_byte == '\n')
    //     {
    //         uint8_t newline[] = "\r\n";

    //         // Xuống dòng mới
    //         HAL_UART_Transmit(&huart2, newline, 2, 10);

    //         // In nội dung đã nhập
    //         if (rx_idx > 0)
    //         {
    //             HAL_UART_Transmit(&huart2, rx_buf, rx_idx, 10);
    //             HAL_UART_Transmit(&huart2, newline, 2, 10);
    //         }

    //         // 🧹 Clear buffer
    //         rx_idx = 0;
    //     }
    //     else
    //     {
    //         // Lưu byte vào buffer nếu còn chỗ
    //         if (rx_idx < HW_UART_RX_BUF_SIZE)
    //         {
    //             rx_buf[rx_idx++] = rx_byte;
    //         }
    //     }

    //     // Re-arm RX interrupt
    //     HAL_UART_Receive_IT(&huart2, &rx_byte, 1);
    // }
    if (huart->Instance == USART2)
    {
        //bsp_led_toggle();
        uint16_t next = next_index(rx_head);

        if (next != rx_tail)
        {
            rx_buf[rx_head] = rx_byte;
            rx_head = next;
        }

        HAL_UART_Receive_IT(&huart2, &rx_byte, 1);
    }
}