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
#include <stdbool.h>
#include <stdint.h>
#include <pthread.h>
#include <unistd.h>
#include <libgen.h>

#define DEBUG
#include "dbg.h"

#include "adc.h"
#include "clc.h"

typedef struct {
    int adc_num;
    char* address;
    char* port;
} thread_data;


static pthread_t thread;
static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
static bool stop = false;


void *thread_fun( void *ptr ) {
    thread_data* data_ptr = (thread_data*)ptr;
    
    DBG("Entering thread loop: adc_num=%d address=%s port=%s\n", data_ptr->adc_num, data_ptr->address, data_ptr->port);
    int i = 0;
    while(!stop) {                  // \todo read only - mutex required?
        printf("i=%d\n", i++);
        usleep(500*1000);
    }
    DBG("Leaving thread loop\n", NULL);
    return NULL;
}


void start_thread(int adc_num, char* address, char* port) {               
    DBG("start_thread(): adc_num=%d address=%s port=%s\n", adc_num, address, port);
    static thread_data data;
    data.adc_num = adc_num;
    data.address = address;
    data.port = port;
    
    pthread_mutex_lock(&mutex);
    stop = false;
    pthread_mutex_unlock(&mutex);
    
    DBG("Starting thread ...\n", NULL);
    pthread_create(&thread, NULL, thread_fun, (void*)(&data));
}


void stop_thread() {
    DBG("stop_thread()\n", NULL);
    pthread_mutex_lock(&mutex);
    stop = true;
    pthread_mutex_unlock(&mutex);
    
    DBG("Waiting for thread to join ...\n", NULL);
    pthread_join(thread, NULL);
    DBG("Thread joined\n", NULL);
}


int main(int argc, char **argv)
{
    if(argc < 3) {
        printf("Usage:\n\t%s adc_num dst_ip_addr dst_port_num\n\n", basename(argv[0]));
        return 1;
    }
  
    // verify cmd line params    
    int adc_num = atoi(argv[1]);
    if(adc_num < 0 || adc_num > 4) {
        printf("ADC #%d not found, terminating ... \n", adc_num);
        return 2;
    }

    // initialize/start clock cleaner
    int ret_val = clc_init();                     // \todo terminate if ret_val != 0
    DBG("clc_init(): ret_val=%d\n", ret_val);
    ret_val = clc_set_state(CLC_ON);
    DBG("clc_state(ON): ret_val=%d\n", ret_val);

    // initilize SPI/ADC
    int fd = spi_init(DEFAULT_SPI_DEVICE);          // \todo optional param in cmd line to change device name
    if(fd < 0) {
        printf("SPI device not openend/configured - terminating ... \n");
        return 3;                                   // \toco clse SPI device if opened
    }
    adc_reset();
    adc_init(fd, adc_num);
    // adc_nominal_mode()? adc_test()?  \todo add cmd line param to select ADC mode
    close(fd);
    
    // main loop 
    bool terminate = false;
    while(!terminate) {
        printf(">> ");
        char c = getchar();
        switch(c) {
            case 's':
                DBG("Starting streaming thread: adc_num=%d dst_ip_addr=%s dst_port_num=%s\n", adc_num, argv[2], argv[3]);
                start_thread(adc_num, argv[2], argv[3]);     // \todo read address, port from cmd line !!
                break;
                
            case 'p':
                DBG("Stopping streaming thread\n", NULL);
                stop_thread();
                break;
                
            case 'q':
                stop_thread();
                terminate = true;
                break;
                
            case '\n':
                break;
                
            default:
                printf("\ns - Start, p - stoP, q - Quit\n");
                break;
        }
    }
    
    // stop clock cleaner
    ret_val =clc_set_state(CLC_ON);    
    DBG("clc_state(OFF): ret_val=%d\n", ret_val);
    
    return 0;
}

