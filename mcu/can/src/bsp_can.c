#include "bsp_can.h"
#include "bsp_uart.h"

typedef enum {
    RX_WAIT_SOF,
    RX_ID,
    RX_LEN,
    RX_DATA,
    RX_CHK
} rx_state_t;

static rx_state_t rx_state = RX_WAIT_SOF;
static can_frame_t rx_frame;
static uint8_t rx_idx;
static uint8_t rx_chk;

static bsp_can_rx_cb_t rx_callback = 0;

void bsp_can_init(bsp_can_rx_cb_t cb)
{
    rx_callback = cb;
    rx_state = RX_WAIT_SOF;
}

static uint8_t calc_checksum(const can_frame_t *f)
{
    uint8_t chk = CAN_SOF ^ f->id ^ f->len;
    for (uint8_t i = 0; i < f->len; i++)
        chk ^= f->data[i];
    return chk;
}

void bsp_can_send(const can_frame_t *f)
{
    uint8_t chk = calc_checksum(f);

    bsp_uart_send_byte(BSP_UART_VCU, CAN_SOF);
    bsp_uart_send_byte(BSP_UART_VCU, f->id);
    bsp_uart_send_byte(BSP_UART_VCU, f->len);

    for (uint8_t i = 0; i < f->len; i++)
        bsp_uart_send_byte(BSP_UART_VCU, f->data[i]);

    bsp_uart_send_byte(BSP_UART_VCU, chk);
}

void bsp_can_rx_byte(uint8_t b)
{
    switch (rx_state)
    {
    case RX_WAIT_SOF:
        if (b == CAN_SOF)
        {
            rx_chk = b;
            rx_state = RX_ID;
        }
        break;

    case RX_ID:
        rx_frame.id = b;
        rx_chk ^= b;
        rx_state = RX_LEN;
        break;

    case RX_LEN:
        if (b > CAN_MAX_DATA_LEN)
        {
            rx_state = RX_WAIT_SOF;
            break;
        }
        rx_frame.len = b;
        rx_chk ^= b;
        rx_idx = 0;
        rx_state = (b == 0) ? RX_CHK : RX_DATA;
        break;

    case RX_DATA:
        rx_frame.data[rx_idx++] = b;
        rx_chk ^= b;
        if (rx_idx >= rx_frame.len)
            rx_state = RX_CHK;
        break;

    case RX_CHK:
        if (rx_chk == b && rx_callback)
            rx_callback(&rx_frame);
        rx_state = RX_WAIT_SOF;
        break;
    }
}
