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
#include <string.h>

#define I2C_DEVICE "/dev/i2c-0"
#define I2C_ADDRESS 0x7c


int clc_init() {
    printf("clc_init() - not implemented\n");
    return 0;
}


int clc_start() {
    printf("clc_start() - not implemented\n");
    return 0;
}


int clc_stop() {
    printf("clc_stop() - not implemented\n");
    return 0;
}


void print_usage() {
    printf("Clock cleaner - available commands:\n");
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
    
    if(strcmp(argv[1], "init") == 0) {
        return clc_init();
    } else if(strcmp(argv[1], "start") == 0) {
        return clc_start();
    } else if(strcmp(argv[1], "stop") == 0) {
        return clc_stop();
    }
    // unrecognized command
    print_usage();
	return 1;
}

