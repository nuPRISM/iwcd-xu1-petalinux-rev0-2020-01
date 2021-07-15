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
#include <unistd.h>
#include <sys/stat.h>  

#define DEBUG
#include "dbg.h"

#define MIN_ADC_NUM  0
#define MAX_ADC_NUM  4
#define MIN_CHAN_NUM 0
#define MAX_CHAN_NUM 8

#define DELAY_LSB_GPIO    460
#define DELAY_MSB_GPIO    (DELAY_LSB_GPIO + 8) 
#define LOAD_ENABLE_GPIO  (DELAY_LSB_GPIO + 9) 
#define CHAN_NUM_LSB_GPIO (DELAY_LSB_GPIO + 10) 
#define CHAN_NUM_MSB_GPIO (DELAY_LSB_GPIO + 13) 
#define ADC_NUM_LSB_GPIO  (DELAY_LSB_GPIO + 14) 
#define ADC_NUM_MSB_GPIO  (DELAY_LSB_GPIO + 16) 

#define DELAY_GPIO_START DELAY_LSB_GPIO
#define DELAY_GPIO_END   ADC_NUM_MSB_GPIO


int init_gpio() {
    struct stat stat_buf;   
    char gpio_dev_name[64];
    sprintf(gpio_dev_name, "/sys/class/gpio/gpio%d/value", DELAY_GPIO_START);
    if(stat(gpio_dev_name, &stat_buf) == 0) {
        DBG("GPIO already initialized\n", NULL);
        return 1;
    }

    for(int i = DELAY_GPIO_START; i <= DELAY_GPIO_END; i++) {
        char cmd[64];
        
        sprintf(cmd, "echo %d > /sys/class/gpio/export", i);
        DBG("%s\n", cmd);
        system(cmd);
        
        sprintf(cmd, "echo out > /sys/class/gpio/gpio%d/direction", i);
        DBG("%s\n", cmd);
        system(cmd);
        
        // \todo set default values
    }    
    return 0;           // \todo check system return values
}


int set_adc_num(int adc_num) {
    for(int i = ADC_NUM_LSB_GPIO; i <= ADC_NUM_MSB_GPIO; i++) {
        char cmd[64];
    
        sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", (adc_num & 0x01), i);        
        DBG("%s\n", cmd);
        system(cmd);
        
        adc_num = adc_num >> 1;
    }
    return 0;           // \todo check system return values
}


int set_chan_num(int chan_num) {
    for(int i = CHAN_NUM_LSB_GPIO; i <= CHAN_NUM_MSB_GPIO; i++) {
        char cmd[64];
    
        sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", (chan_num & 0x01), i);        
        DBG("%s\n", cmd);
        system(cmd);
        
        chan_num = chan_num >> 1;
    }
    return 0;           // \todo check system return values
}


int set_delay(int delay) {
    for(int i = DELAY_LSB_GPIO; i <= DELAY_MSB_GPIO; i++) {
        char cmd[64];
    
        sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", (delay & 0x01), i);        
        DBG("%s\n", cmd);
        system(cmd);
        
        delay = delay >> 1;
    }
    return 0;           // \todo check system return values
}
    
    
int update_lvds() {
    char cmd[64];

    sprintf(cmd, "echo 1 > /sys/class/gpio/gpio%d/value", LOAD_ENABLE_GPIO);        
    DBG("%s\n", cmd);
    system(cmd);
    
    usleep(100 * 100);      // \todo check required delay value

    sprintf(cmd, "echo 0 > /sys/class/gpio/gpio%d/value", LOAD_ENABLE_GPIO);        
    DBG("%s\n", cmd);
    system(cmd);

    return 0;           // \todo check system return values
}


void print_usage() {
    printf("Usage:\n\tlvds -m ADC_num -c chan_num -d delay\n");
    printf("\tADC_num=0..4\n");
    printf("\tchan_num=0..7 diff lvds chan, 8 - frame clock\n");
    printf("\tdelay=0..?\n");
}


int main(int argc, char **argv)
{
	int adc_num = -1;
    int chan_num = -1;
    int delay = 0;
    
    int opt;
    while((opt = getopt(argc, argv, "m:d:c:")) != -1) {
        switch(opt) {
            case 'm':
                adc_num = atoi(optarg);
                break;
                
            case 'c':
                chan_num = atoi(optarg);
                break;

            case 'd':
                delay = atoi(optarg);
                break;
            
            case ':':
                printf("(:) option value not specified: %c\n", optopt);
                print_usage();
                return 1;


            case '?':
                printf("(?) option value not specified: %c\n", optopt);
                print_usage();
                return 1;
        }
    }
    
    if(adc_num < MIN_ADC_NUM || adc_num > MAX_ADC_NUM) {
        printf("Illegal adc_num value: %d\n", adc_num);
        return 1;
    }
    if(chan_num < MIN_CHAN_NUM || chan_num > MAX_CHAN_NUM) {
        printf("Illegal chan_num value: %d\n", chan_num);
        return 1;
    }
    // \todo validate delay value
    
    init_gpio();
    set_adc_num(adc_num);
    set_chan_num(chan_num);
    set_delay(delay);
    update_lvds();
    
	return 0;
}
