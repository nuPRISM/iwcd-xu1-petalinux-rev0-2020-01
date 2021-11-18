/* Hello World program.
*
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


#if HAVE_CONFIG_H
#include <config.h>
#endif

#include <stdio.h>
#include <stdio.h>
#include <string.h>

#include "clc.h"

void print_usage() {
    printf("Clock cleaner - available commands:\n");
    printf("\tid\n");
    printf("\tinit\n");
    printf("\tstart\n");
    printf("\tstop\n");
}


int main(int argc, char **argv)
{
	if(argc == 1) {
        print_usage();
        return 1;
    }
    
    int ret;
    if(strcmp(argv[1], "init") == 0) {
        ret = clc_init();
    } else if(strcmp(argv[1], "start") == 0) {
        ret = clc_set_state(CLC_ON);
    } else if(strcmp(argv[1], "stop") == 0) {
        ret = clc_set_state(CLC_OFF);
    } else if (strcmp(argv[1], "id") == 0) {
        uint8_t id[4];
        ret = clc_read_id(id);
        if(ret == 0) {
            printf("CLC id=%02x %02x %02x %02x\n", id[0], id[1], id[2], id[3]);
        } else {
            printf("CLC/I2C error\n");
        }
    } else {
        // unrecognized command
        print_usage();
	    return 1;
    }

    if(ret == 0) {
        printf("OK\n");
        return 0;
    } else {
        printf("ERROR! ret=%d\n", ret);   
        return 1;
    }
}

