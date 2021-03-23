/*
* Copyright (C) 2013 - 2016  Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without restriction,
* including without limitation the rights to use, copy, modify, merge,
* publish, distribute, sublicense, and/or sell copies of the Software,
* and to permit persons to whom the Software is furnished to do so,
* subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included
* in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
* IN NO EVENT SHALL XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
* CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in this
* Software without prior written authorization from Xilinx.
*
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "clc-i2c.h"


void print_usage()
{
    printf("Clock cleaner - available commands:\n");
    printf("\tid\n");
    printf("\tinit\n");
    printf("\tstart\n");
    printf("\tstop\n");
}


int main(int argc, char **argv)
{
	if (argc == 1)
    {
        print_usage();
        return 1;
    }
    clc_open(CLOCK_CLEANER_I2C_DEVICE);
    
    int ret;
    if (strcmp(argv[1], "init") == 0) 
    {
        ret = clc_init();
    }
    else if (strcmp(argv[1], "status") == 0)
    {
        struct clock_cleaner_status stat; 
        ret = clc_read_status(&stat);

        printf("***Clock Cleaner Status***\n");
        printf("\tGPIO Pin Values, GPIO[3:0] = %x\n", stat.gpio);
        printf("\tDevice Interrupt Status: %s\n", (stat.INT) ? "true":"false");
        printf("\tCRC Mismatch on EEPROM Read: %s\n", (stat.eep_err) ? "true":"false");
        printf("\tSerial EEPROM Read Fail: %s\n", (stat.boot_fail) ? "true":"false");
        printf("\tSerial EEPROM Read Cycle Complete: %s\n", (stat.eep_done) ? "true":"false");
    }
    else if (strcmp(argv[1], "write") == 0)
    {
        ret = clc_write(CLOCK_CLEANER_SLAVE_ADDR, (uint16_t)atoi(argv[2]), (uint8_t)atoi(argv[3]));
        printf("Register=0x%x, Data=0x%x\n", (uint16_t)atoi(argv[2]), (uint8_t)atoi(argv[3]));
    }
    else if (strcmp(argv[1], "read") == 0)
    {
        uint8_t return_data = 0xCC; 
        ret = clc_read(CLOCK_CLEANER_SLAVE_ADDR, (uint16_t)atoi(argv[2]), &return_data);
        printf("Register=0x%x, Data=0x%x\n", (uint16_t)atoi(argv[2]), return_data);
        return_data = 0xCC;
    }
    else if (strcmp(argv[1], "start") == 0)
    {
        ret = clc_set_state(ON);
    }
    else if (strcmp(argv[1], "stop") == 0)
    {
        ret = clc_set_state(OFF);
    }
    else if (strcmp(argv[1], "id") == 0)
    {
        struct clock_cleaner_id clc_id;
        ret = clc_read_id(&clc_id);
        if (ret == 0)
        {
            printf("CLC id:\n\tREV_ID=%02x\n\tDEV_ID=%02x\n\tDASH_CODE=%02x\n", 
                    clc_id.rev_id, clc_id.dev_id, clc_id.dash_code);
        }
        else
        {
            printf("CLC/I2C error\n");
        }
    }
    else
    {
        // unrecognized command
        print_usage();
        clc_close();
	    return 1;
    }
    clc_close();

    if (ret == 0)
    {
        printf("OK\n");
        return 0;
    }
    else
    {
        printf("ERROR! ret=%d\n", ret);   
        return 1;
    }
}