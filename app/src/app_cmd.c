#include "app_cmd.h"
#include "bsp_uart.h"
#include "app_event.h"
#include <string.h>

#define CMD_BUF_SIZE 64

static char cmd_buf[CMD_BUF_SIZE];
static uint8_t cmd_idx = 0;

void app_cmd_process(void)
{
    uint8_t ch;
    
    while (bsp_uart_read_byte(BSP_UART_VCU, &ch))
    {
        
        /* Enter hoặc newline → parse */
        if (ch == '\r' || ch == '\n')
        {
            if (cmd_idx == 0)
                continue;   // <<< QUAN TRỌNG

            cmd_buf[cmd_idx] = '\0';
            cmd_idx = 0;

            if (strcmp(cmd_buf, "run") == 0)
            {
                app_event_push(APP_EVENT_CMD_RUN);
            }
            else if (strcmp(cmd_buf, "stop") == 0)
            {
                app_event_push(APP_EVENT_CMD_STOP);
            }
            else if (strcmp(cmd_buf, "status") == 0)
            {
                app_event_push(APP_EVENT_CMD_STATUS);
            }
            else
            {
                app_event_push(APP_EVENT_CMD_ERROR);
            }
        }
        else
        {
            if (cmd_idx < CMD_BUF_SIZE - 1)
            {
                cmd_buf[cmd_idx++] = ch;
            }
        }
    }
}