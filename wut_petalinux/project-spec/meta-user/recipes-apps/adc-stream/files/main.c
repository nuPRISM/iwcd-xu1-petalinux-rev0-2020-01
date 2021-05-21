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
#include <sys/ioctl.h>
#include <errno.h>
#include <time.h>

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
    unsigned int test_size;
    char* address;
    char* port;
} thread_data;


static pthread_t thread = NULL;
static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
static bool stop = false;

static struct dma_proxy_channel_interface *rx_proxy_interface_p;


void *thread_fun( void *ptr ) {
    thread_data* data_ptr = (thread_data*)ptr;
    DBG("thread_fun(): adc_num=%d test_size=%d address=%s port=%s\n", data_ptr->adc_num, data_ptr->test_size, data_ptr->address, data_ptr->port);

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
	rx_proxy_interface_p->length = data_ptr->test_size;

    DBG("Entering thread loop\n", NULL);
    system("echo 0 > /sys/class/gpio/gpio441/value"); // unset ADC supress bit
    unsigned long counter = 0;
    clock_t begin = clock();
    while(!stop) {                                  // \todo read only - mutex required?
        int dummy;
    
        system("echo 1 > /sys/class/gpio/gpio442/value");     // set trigger
        // Perform a receive DMA transfer and after it finishes check the status 
	    ioctl(rx_proxy_fd, 0, &dummy);
        system("echo 0 > /sys/class/gpio/gpio442/value");     // unset trigger


	    if (rx_proxy_interface_p->status != PROXY_NO_ERROR) {
		    DBG("DMA proxy RX transfer error\n", NULL);
        } else {
            int ret_val = send_data(sock_fd, rx_proxy_interface_p->buffer, data_ptr->test_size, pRes);
            if(ret_val != 0) {
                DBG("Data not sent: ret_val=%d\n", ret_val);
            } else {
                counter++; 
            }
        }
    }
    clock_t end = clock();
    system("echo 1 > /sys/class/gpio/gpio441/value");     // reset ADC supress bit

    double elapsed_time = (double)(end - begin) / CLOCKS_PER_SEC;
    DBG("Leaving thread loop, %lu bytes received/sent in %f [s] (%f Mb/s) \n", counter * data_ptr->test_size, 
         elapsed_time, counter * data_ptr->test_size * 8 / 1024 / 1024 / elapsed_time);

    // Unmap the proxy channel interface memory 
	munmap(rx_proxy_interface_p, sizeof(struct dma_proxy_channel_interface));

    // close DMA proxy device
    close(rx_proxy_fd);

    // close network socket
    close(sock_fd);

    return NULL;
}


void start_thread(int adc_num, unsigned int test_size, char* address, char* port) {               
    DBG("start_thread(): adc_num=%d test_size=%d address=%s port=%s\n", adc_num, test_size, address, port);
    static thread_data data;
    data.adc_num = adc_num;
    data.test_size = test_size;
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
    if(thread != NULL)
        pthread_join(thread, NULL);
    DBG("Thread joined\n", NULL);
}


int gpio_init() {
    // \todo implement using WZAB multi_gpio module
}


int dma_reset() {
    system("echo 0 > /sys/class/gpio/gpio499/value"); 
    usleep(500 * 1000);
    system("echo 1 > /sys/class/gpio/gpio499/value"); 
}


int set_dma_buffer_size(test_size) {
    // \todo immpelement
}


int main(int argc, char **argv)
{
    if(argc < 6) {
        printf("Usage:\n\t%s adc_num adc_mode test_size_in_kB dst_ip_addr dst_port_num\n\n", basename(argv[0]));
        printf("\tadc_num=0..4\n");
        printf("\tadc_mode: 0 - tst0, 1 - tst1, 2 - toggle test pattern, 3 - digital ramp pattern, 4 -sine wave pattern, 5 - nominal mode \n");
        return 1;
    }
  
    // verify cmd line params    
    int adc_num = atoi(argv[1]);
    if(adc_num < 0 || adc_num > 4) {
        printf("ADC #%d not found\n", adc_num);
        return 2;
    }
    
    int adc_mode = atoi(argv[2]);
    if(adc_mode < 0 || adc_mode > 5) {
        printf("Illegal ADC mode: %d\n", adc_mode);
        return 2;
    } 

    unsigned int test_size = atoi(argv[3]) * 1024;
    if(test_size == 0 || test_size > TEST_SIZE) {
        printf("Illegal test size %d\n", test_size);
        return 2;
    }

    // initialize GPIO
    gpio_init();

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
    
    // set ADC mode
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

        case 3:
            adc_test(fd, adc_num, DIGITAL_RAMP_PATTERN);
            break;

        case 4:
            adc_sine_wave_test(fd, adc_num);
            break;

        default:
            adc_nominal_mode(fd, adc_num);
            break;
    }    
    close(fd);

    set_dma_buffer_size(test_size);

    dma_reset();
    
    // main loop 
    bool terminate = false;
    while(!terminate) {
        printf(">> ");
        char c = getchar();
        switch(c) {
            case 's':
                DBG("Starting streaming thread: adc_num=%d test_size=%d dst_ip_addr=%s dst_port_num=%s\n", adc_num, test_size, argv[4], argv[5]);
                start_thread(adc_num, test_size, argv[4], argv[5]);     
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
    ret_val =clc_set_state(CLC_OFF);    
    DBG("clc_state(OFF): ret_val=%d\n", ret_val);
    
    return 0;
}

