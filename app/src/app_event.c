// app_event.c
#include "app_event.h"
#include "stm32f1xx_hal.h"

#define EVENT_QUEUE_SIZE 16

static volatile app_event_t event_buf[EVENT_QUEUE_SIZE];
static volatile uint8_t head = 0;
static volatile uint8_t tail = 0;

static inline uint8_t next_index(uint8_t idx)
{
    return (uint8_t)((idx + 1) % EVENT_QUEUE_SIZE);
}

void app_event_init(void)
{
    head = tail = 0;
}

bool app_event_available(void)
{
    return (head != tail);
}

bool app_event_push(app_event_t evt)
{
    uint8_t next = next_index(head);

    if (next == tail)
    {
        /* Queue full → drop event or set error flag */
        return false;
    }

    event_buf[head] = evt;
    head = next;
    return true;
}

bool app_event_pop(app_event_t *evt)
{
    if (head == tail)
        return false;

    *evt = event_buf[tail];
    tail = next_index(tail);
    return true;
}
