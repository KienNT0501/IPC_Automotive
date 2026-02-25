#ifndef APP_EVENT_H
#define APP_EVENT_H
#include <stdbool.h>
typedef enum
{
    APP_EVENT_NONE = 0,
    APP_EVENT_CMD_RUN,
    APP_EVENT_CMD_STOP,
    APP_EVENT_CMD_ERROR,
    APP_EVENT_CMD_STATUS,
    APP_EVENT_TICK_100MS,
    APP_EVENT_SYSTEM_OK,
    APP_EVENT_BUTTON_PRESS
} app_event_t;

void app_event_init(void);
bool app_event_push(app_event_t evt);
bool app_event_pop(app_event_t *evt);
bool app_event_available(void);

#endif
