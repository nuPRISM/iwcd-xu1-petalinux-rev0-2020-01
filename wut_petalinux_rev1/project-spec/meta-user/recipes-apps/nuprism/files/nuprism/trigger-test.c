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
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <unistd.h>


#include "gpio.h"
#include "adc.h"
#include "clc.h"


void print_usage() {
    printf("Usage:\n\ttrigtest trigger_mode\n");
    printf("\t0 - non-stop trigger\n");
    printf("\t1 - software trigger\n");
    printf("\t2 - external trigger\n");
    printf("\t3 - auto chan 0 trigger\n");
    printf("\t7 - auto chan 1 trigger\n");
}


int main (int argc, char** argv)
{
    if(argc < 2) {
        print_usage();
        return 1;
    }

    init_gpio();    
    switch(atoi(argv[1])) {
        case 0: 
            adc_trigger_mode(NON_STOP_TRIGGER_MODE);
            break;
    
        case 1: 
            adc_trigger_mode(SOFTWARE_TRIGGER_MODE);
            break;

        case 2:
            adc_trigger_mode(EXTERNAL_TRIGGER_MODE);
            break;
        
        case 3:
            adc_trigger_mode(AUTO_TRIGGER_CHAN0_MODE);
            break;

        case 7:
            adc_trigger_mode(AUTO_TRIGGER_CHAN1_MODE);
            break;

        default:
            printf("Unrecognized trigger mode: %s\n", argv[1]);
            return 1;

    }
    return 0;
}
