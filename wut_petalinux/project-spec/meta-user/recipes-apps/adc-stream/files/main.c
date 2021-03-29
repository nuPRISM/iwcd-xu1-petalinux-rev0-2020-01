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
#include <stdbool.h>
#include <stdint.h>
#include <pthread.h>
#include <unistd.h>
#include <libgen.h>
#include <fcntl.h>
#include <netdb.h>
#include <assert.h>
#include <sys/mman.h>
#include <errno.h>

#define DEBUG
#include "dbg.h"

#include "adc.h"
#include "clc.h"
#include "dma-proxy.h"


int send_data(int sock_fd, uint8_t* buf, uint buf_size, struct addrinfo *pRes) {
    unsigned to_send = buf_size;
	unsigned offset = 0;
	const unsigned chunk = 1400;        // almost equal but less than MTU

    while(to_send > 0) {
		unsigned len = to_send > chunk ? chunk : to_send;
    	ssize_t numBytes = sendto(sock_fd, buf + offset, len, 0, pRes->ai_addr, pRes->ai_addrlen);
        if(numBytes < 0) {
            DBG("ERROR! sento.errno=%d (%s)\n", errno, strerror(errno));
            break; 
        } 
    	to_send -= len;
    	offset += len;
	}
    return to_send;
}


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
    DBG("thread_fun(): adc_num=%d address=%s port=%s\n", data_ptr->adc_num, data_ptr->address, data_ptr->port);

    // configure network connection
    struct addrinfo hints, *pRes;

    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_INET; //AF_UNSPEC;
    hints.ai_socktype = SOCK_DGRAM;
    hints.ai_protocol = IPPROTO_UDP;
    hints.ai_flags = AI_ADDRCONFIG;    
    assert(getaddrinfo(data_ptr->address, data_ptr->port, &hints, &pRes) == 0);
    
    // create network socket    	
    int sock_fd = socket(AF_INET, SOCK_DGRAM, 0);

    // open DMA proxy device
    struct dma_proxy_channel_interface *rx_proxy_interface_p;
	int rx_proxy_fd = open("/dev/dma_proxy_rx", O_RDWR);
	if (rx_proxy_fd < 1) {
		DBG("Unable to open DMA proxy device file\n", NULL);
		return NULL;
	}

    // Map the receive channels memory into user space so it's accessible 
	rx_proxy_interface_p = (struct dma_proxy_channel_interface *)mmap(NULL, sizeof(struct dma_proxy_channel_interface),
									PROT_READ | PROT_WRITE, MAP_SHARED, rx_proxy_fd, 0);
	if ((rx_proxy_interface_p == MAP_FAILED)) {
		DBG("Failed to mmap\n", NULL);
		return NULL;
	}
    
    // set num bytes to receive 
    int test_size = 1024;             // \todo add field ind trhead_data, param in cmd line
	rx_proxy_interface_p->length = test_size;

    DBG("Entering thread loop\n", NULL);
    system("echo 0 > /sys/class/gpio/gpio473/value"); // unset ADC supress bit
    int counter = 0;
    while(!stop) {                                  // \todo read only - mutex required?
        int dummy;
    
        // Perform a receive DMA transfer and after it finishes check the status 
	    ioctl(rx_proxy_fd, 0, &dummy);

	    if (rx_proxy_interface_p->status != PROXY_NO_ERROR) {
		    DBG("DMA proxy RX transfer error\n", NULL);
        } else {
            int ret_val = send_data(sock_fd, rx_proxy_interface_p->buffer, test_size, pRes);
            if(ret_val != 0) {
                DBG("Data not sent: ret_val=%d\n", ret_val);
            } else {
                counter++; 
            }
        }
    }
    system("echo 1 > /sys/class/gpio/gpio473/value");     // reset ADC supress bit
    DBG("Leaving thread loop, %d bytes received/sent\n", counter * test_size);

    // Unmap the proxy channel interface memory 
	munmap(rx_proxy_interface_p, sizeof(struct dma_proxy_channel_interface));

    // close DMA proxy device
    close(rx_proxy_fd);

    // close network socket
    close(sock_fd);

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
        printf("\tadc_num=0..4\n");
        printf("\tadc_mode: 0 - tst0, 1 - tst1, 2 - toggle test pattern, 3 nominal mode\n");
        return 1;
    }
  
    // verify cmd line params    
    int adc_num = atoi(argv[1]);
    if(adc_num < 0 || adc_num > 4) {
        printf("ADC #%d not found\n", adc_num);
        return 2;
    }
    
    int adc_mode = atoi(argv[2]);
    if(adc_mode < 0 || adc_mode > 3) {
        printf("Illegal ADC mode: %d\n", adc_mode);
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
    switch(adc_mode) {
        case 0:
            adc_test(fd, adc_num, ALL_ZEROS_TEST_PATTERN);
            break; 

        case 1:
            adc_test(fd, adc_num, ALL_ONES_TEST_PATTERN);
            break;

        case 2:
            adc_test(fd, adc_num, TOGGLE_TEST_PATTERN);
            break;

        default:
            adc_nominal_mode(fd, adc_num);
            break;
    }    
    close(fd);
    
    // main loop 
    bool terminate = false;
    while(!terminate) {
        printf(">> ");
        char c = getchar();
        switch(c) {
            case 's':
                DBG("Starting streaming thread: adc_num=%d dst_ip_addr=%s dst_port_num=%s\n", adc_num, argv[3], argv[4]);
                start_thread(adc_num, argv[3], argv[4]);     
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

