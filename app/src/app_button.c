#include "app_button.h"

void app_button_read(void) {
    if (hw_button_get_and_clear())
    {
        app_event_push(APP_EVENT_BUTTON_PRESS);
    }
}