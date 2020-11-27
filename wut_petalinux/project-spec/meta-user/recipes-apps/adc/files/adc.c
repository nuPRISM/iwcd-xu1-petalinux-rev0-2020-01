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
#include <stdbool.h>


#define SPI_DEVICE "/dev/spidev1.0"


int adc_power_down() {
    printf("adc_power_down() - not implemented\n");
    return 0;
}


int adc_power_up() {
    printf("adc_power_up() - not implemented\n");
    return 0;
}


int adc_reset() {
    printf("adc_reset() - not implemented\n");
    return 0;
}


int adc_nominal_mode() {
    printf("adc_nominal_mode() - not implemented\n");
    return 0;
}


int adc_test() {
    printf("adc_test() - not implemented\n");
    return 0;
}


int adc_init() {
    printf("adc_init() - not implemented\n");
    return 0;
}


int adc_spi_slave_mode(bool value) {
    printf("adc_spi_slave_mode(%d) - not implemented\n", value);
    return 0;
}


void print_usage() {
    printf("AC/DC controller - available commands:\n");
    printf("\tpdn  - power down\n");
    printf("\tpup  - power up\n");
    printf("\trst  - reset\n");
    printf("\tnom  - nominal mode(?)\n");
    printf("\ttst  - test\n");
    printf("\tinit - initialization\n");
    printf("\tss   - set SPI slave mode(?)\n");
    printf("\tnss  - unset SPI slave mode(?)\n");
}


int main(int argc, char **argv)
{
	if(argc == 1) {
        print_usage();
        return 1;
    }
    
    if(strcmp(argv[1], "pdn") == 0) {
        return adc_power_down();
    } else if(strcmp(argv[1], "pup") == 0) {
        return adc_power_up();
    } else if(strcmp(argv[1], "rst") == 0) {
        return adc_reset();
    } else if(strcmp(argv[1], "nom") == 0) {
        return adc_nominal_mode();
    } else if(strcmp(argv[1], "tst") == 0) {
        return adc_test();
    } else if(strcmp(argv[1], "init") == 0) {
        return adc_init();
    } else if(strcmp(argv[1], "ss") == 0) {
        return adc_spi_slave_mode(true);
    } else if(strcmp(argv[1], "nss") == 0) {
        return adc_spi_slave_mode(false);
    }
    // unrecognized command
    print_usage();
	return 1;
}

