#include "app.h"
#include "app_event.h"
#include "app_button.h"
#include "app_battery.h"
#include "app_cmd.h"
void app_init(void){
    
    bsp_uart_init(BSP_UART_VCU);
    app_can_init();
    app_battery_init();
    bsp_led_init();
    hw_button_init(HW_BUTTON_USER);
}

void app_loop(){

    app_battery_send_vcu();
    
    app_button_read();

    app_can_read_vcu();

    app_event_handle();
}