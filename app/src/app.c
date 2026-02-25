#include "app.h"
#include "bsp_led.h"
#include "hw_button.h"
#include "app_event.h"



void app_init(void)
{
    bsp_led_init();
    hw_button_init(HW_BUTTON_USER);
}

void app_loop() {
    app_event_t evt;
    while (app_event_pop(&evt))
    {
        switch (evt)
        {
        case APP_EVENT_BUTTON_PRESS:
            bsp_led_toggle();
            break;
        default:
            break;
        }
    }
}