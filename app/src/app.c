#include "app.h"
#include "bsp_led.h"
#include "hw_button.h"
#include "app_event.h"
#include "app_cmd.h"
#include "bsp_uart.h"

void app_init(void)
{
    //bsp_led_init();
    //hw_button_init(HW_BUTTON_USER);
    bsp_uart_init(BSP_UART_VCU);
}

void app_loop() {
    app_event_t evt;
    app_cmd_process();
    while (app_event_pop(&evt))
    {
        switch (evt)
        {
        case APP_EVENT_BUTTON_PRESS:
            bsp_led_toggle();
            LOG("LED kien!\r\n");
            break;
        case APP_EVENT_CMD_RUN:
            LOG("CMD RUN!\r\n");
            break;
        case APP_EVENT_CMD_STOP:
            LOG("CMD STOP!\r\n");
            break;
        case APP_EVENT_CMD_STATUS:
            LOG("CMD STATUS!\r\n");
            break;
        default:
            break;
        }
    }
}