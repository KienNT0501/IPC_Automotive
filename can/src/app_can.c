#include "app_can.h"


static void app_can_on_rx(const can_frame_t *f)
{
    switch (f->id)
    {
    case CAN_ID_CMD_RUN:
        
        app_event_push(APP_EVENT_CMD_RUN);
        break;

    case CAN_ID_CMD_STOP:
        app_event_push(APP_EVENT_CMD_STOP);
        break;

    case CAN_ID_CMD_STATUS:
        app_event_push(APP_EVENT_CMD_STATUS);
        break;

    default:
        break;
    }
}

void app_can_init(void)
{
    bsp_can_init(app_can_on_rx);
}

void app_can_send_sensor(uint16_t speed, uint8_t battery)
{
    can_frame_t f = {0};

    f.id  = CAN_ID_SENSOR;
    f.len = 3;
    f.data[0] = (uint8_t)(speed >> 8);
    f.data[1] = (uint8_t)(speed & 0xFF);
    f.data[2] = battery;
    app_can_log_frame(&f);
    bsp_can_send(&f);
}

void app_can_send_dtc(uint16_t dtc)
{
    can_frame_t f = {0};
    f.id  = CAN_ID_DTC;
    f.len = 2;
    f.data[0] = (uint8_t)(dtc >> 8);
    f.data[1] = (uint8_t)(dtc & 0xFF);
    
    bsp_can_send(&f);
}

void app_can_read_vcu(void){
    uint8_t ch;
    while (bsp_uart_read_byte(BSP_UART_VCU, &ch))
    {
        bsp_can_rx_byte(ch);
    }
}

void app_can_log_frame(const can_frame_t *f){
    LOG("CAN id=0x%03X len=%d data:", f->id, f->len);
    for (int i = 0; i < f->len; i++)
    {
        LOG(" %02X", f->data[i]);
    }
    LOG("\r\n");
}
