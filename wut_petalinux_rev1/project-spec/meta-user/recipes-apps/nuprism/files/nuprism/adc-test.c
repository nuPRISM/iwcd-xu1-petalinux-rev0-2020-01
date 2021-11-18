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
    printf("Usage:\n\tadc [-n adc_num] [-d SPI_devname] cmd\n\n");
    printf("Default ADC num: %d\n", DEFAULT_ADC_NUM);
    printf("Default SPI device: %s\n", DEFAULT_SPI_DEVICE);
    printf("Available commands:\n");
    printf("\tpdn  - power down\n");
    printf("\tpup  - power up\n");
    printf("\trst  - reset\n");
    printf("\tnom  - nominal mode(?)\n");
    printf("\ttst  - toggle test pattern\n");
    printf("\ttst0 - all zeros test pattern\n");
    printf("\ttst1 - all ones test pattern\n");
    printf("\tinit - initialization\n");
    printf("\tss   - set SPI slave mode(?)\n");
    printf("\tnss  - unset SPI slave mode(?)\n");
}


int main (int argc, char** argv)
{
    int opt;
    char device_name[64] = DEFAULT_SPI_DEVICE;    
	int adc_num = DEFAULT_ADC_NUM;
    
	while((opt = getopt(argc, argv, "n:d:")) != -1) {
        switch(opt) {
            case 'n':
                adc_num = atoi(optarg);
                break;
                
            case 'd':
                strcpy(device_name, optarg);
                break;
            
            case ':':
                printf("option value not specified\n");
                break;
                
            case '?':
                printf("unknown option: %c\n", optopt);
                break;
        }
    }
    if(optind < argc) {
        printf("Initializing SPI ...\n");
        int fd = spi_init(DEFAULT_SPI_DEVICE);      // \todo read SPI device name from cmd line params

        printf("Initializing CLC ...\n");
        clc_init();
        clc_set_state(CLC_ON);

        printf("Initializing GPIO ...\n");
        init_gpio();

        int ret;        
        if(strcmp(argv[optind], "pdn") == 0) {
            ret = adc_power_down();
        } else if(strcmp(argv[optind], "pup") == 0) {
            ret = adc_power_up();
        } else if(strcmp(argv[optind], "rst") == 0) {
            ret = adc_reset();
        } else if(strcmp(argv[optind], "nom") == 0) {
            ret = adc_nominal_mode(fd, adc_num);
        } else if(strcmp(argv[optind], "tst") == 0) {
            ret = adc_test(fd, adc_num, TOGGLE_TEST_PATTERN);
        } else if(strcmp(argv[optind], "tst0") == 0) {
            ret = adc_test(fd, adc_num, ALL_ZEROS_TEST_PATTERN);
        } else if(strcmp(argv[optind], "tst1") == 0) {
            ret = adc_test(fd, adc_num, ALL_ONES_TEST_PATTERN);
        } else if(strcmp(argv[optind], "init") == 0) {
            ret = adc_init(fd, adc_num);
        } else if(strcmp(argv[optind], "ss") == 0) {
            ret = adc_spi_slave_mode(fd, adc_num, true);
        } else if(strcmp(argv[optind], "nss") == 0) {
            ret = adc_spi_slave_mode(fd, adc_num, false);
        } else {
            printf("Unrecognized cmd: %s\n", argv[optind]);
            print_usage();
            return -1;
        }

        clc_set_state(CLC_ON);
        close(fd);
        return ret;
    } else {
        printf("No command specified!\n");
        print_usage();
        return -1;
    }

    

    return 0;
}
