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
#include <sys/stat.h>  
#include <errno.h>
#include <sys/time.h>

#define DEBUG
#include "dbg.h"

#include "adc.h"
#include "clc.h"
#include "dma-proxy.h"
#include "gpio.h"

#define DMA_CHANN_NUM_MIN 0
#define DMA_CHANN_NUM_MAX 1
#define MAX_DMA_BUF_SIZE (3 * 1024 * 1024)


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


void *trigger_thread_fun( void *ptr ) {
    // DBG("delay start\n", NULL);
    usleep(10 * 1000);
    
    char cmd[64];
    sprintf(cmd, "echo 1 > /sys/class/gpio/gpio%d/value", ADC_TRIGGER_GPIO);
    // DBG("%s\n", cmd);
    system(cmd);
    sprintf(cmd, "echo 0 > /sys/class/gpio/gpio%d/value", ADC_TRIGGER_GPIO);
    // DBG("%s\n", cmd);
    system(cmd);
    // DBG("delay end\n", NULL);
    
    return NULL;
}


typedef struct {
    int adc_num;
    int dma_chan_num;
    int buf_size;
    int num_iter;
    char *dst_ip_addrs;
    int dst_port_num;
} ThreadData;

static pthread_t acquisition_thread = NULL;
static pthread_t trigger_thread = NULL;
static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
static bool stop = false;


void *acquisition_thread_fun( void *ptr ) {
    ThreadData* data_ptr = (ThreadData*)ptr;
    DBG("thread_fun(): ADC_num=%d, DMA_dma_chan_num=%d, buf_size=%d num_iter=%d dst_ip_addrs=%s dst_port_num=%d\n", 
         data_ptr->adc_num, data_ptr->dma_chan_num, data_ptr->buf_size, data_ptr->num_iter, data_ptr->dst_ip_addrs, data_ptr->dst_port_num);
         
    // create network socket    	
    int sock_fd = socket(AF_INET, SOCK_DGRAM, 0);

    // configure network connection
    struct addrinfo hints, *pRes;
    
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_INET; //AF_UNSPEC;
    hints.ai_socktype = SOCK_DGRAM;
    hints.ai_protocol = IPPROTO_UDP;
    hints.ai_flags = AI_ADDRCONFIG;    
    char dst_port_txt[8];
    sprintf(dst_port_txt, "%d", data_ptr->dst_port_num);
    assert(getaddrinfo(data_ptr->dst_ip_addrs, dst_port_txt, &hints, &pRes) == 0);
    
    // \todo open DMA channel
    char dma_device[64];
    sprintf(dma_device, "/dev/dma_proxy_rx_%d", data_ptr->dma_chan_num);
    DBG("Opening DMA device: %s\n", dma_device);
    int	rx_proxy_fd = open(dma_device, O_RDWR);
	if (rx_proxy_fd < 1) {
	 	DBG("Unable to open DMA proxy device file: %s", dma_device);
	 	return (void*)1;
	}

    // map DMA buffer    
    struct dma_proxy_channel_interface *rx_proxy_interface_p;
    
    rx_proxy_interface_p = (struct dma_proxy_channel_interface *)mmap(NULL, sizeof(struct dma_proxy_channel_interface),
	 								PROT_READ | PROT_WRITE, MAP_SHARED, rx_proxy_fd, 0);
	if (rx_proxy_interface_p == MAP_FAILED) {
		DBG("Failed to mmap\n", NULL);
		return (void*)1;
	}
    rx_proxy_interface_p->length = data_ptr->buf_size;
    DBG("thrad_fun(): test size=%d\n", rx_proxy_interface_p->length);

    // unset suppress bit
    set_adc_suppress_bit(0);

    struct timeval begin, end;
    
    unsigned long counter = 0;
    gettimeofday(&begin, 0);

    while(!stop) {                                  // \todo read only - mutex required?
        int dummy;        
    
        // start trigger thread
        pthread_create(&trigger_thread, NULL, trigger_thread_fun, (void*)(NULL));

        // DMA transfer
        ioctl(rx_proxy_fd, 0, &dummy);

        // join trigger thread
        pthread_join(trigger_thread, NULL);

        if (rx_proxy_interface_p->status != PROXY_NO_ERROR) {
	 	    DBG("Proxy rx transfer error: status=%d\n", rx_proxy_interface_p->status);
         } else {
             int ret_val = send_data(sock_fd, rx_proxy_interface_p->buffer, data_ptr->buf_size, pRes);
             if(ret_val != 0) {
                 DBG("Data not sent: ret_val=%d\n", ret_val);
             } else {
                 counter++; 
             }
        }            
            
        if(data_ptr->num_iter > 0 && counter >= data_ptr->num_iter)
            break;
    }
    gettimeofday(&end, 0);

    // reset suppress bit
    set_adc_suppress_bit(1);

    // Unmap the proxy channel interface memory     
    munmap(rx_proxy_interface_p, sizeof(struct dma_proxy_channel_interface));
    
    // close DMA proxy device
    close(rx_proxy_fd);

    // close network socket
    close(sock_fd);

    long seconds = end.tv_sec - begin.tv_sec;
    long microseconds = end.tv_usec - begin.tv_usec;
    double elapsed_time = seconds + microseconds*1e-6;
    DBG("thrad_fun():  %lu bytes received/sent in %f [s] (%f Mb/s) \n", counter * data_ptr->buf_size, 
         elapsed_time, (double)counter * data_ptr->buf_size * 8 / 1024 / 1024 / elapsed_time);
    
    return NULL;
}



void start_acquisition_thread(int adc_num, int dma_chan_num, int buf_size, int num_iter, char *dst_ip_addrs, int dst_port_num) {               
    DBG("start_thread(): ADC_num=%d, DMA_chan_num=%d, buf_size=%d num_iter=%d dst_ip_addrs=%s dst_port_num=%d\n", adc_num, dma_chan_num, buf_size, num_iter, dst_ip_addrs, dst_port_num);
    
    static ThreadData data;
    data.adc_num = adc_num;
    data.dma_chan_num = dma_chan_num;
    data.buf_size = buf_size;
    data.num_iter = num_iter;
    data.dst_ip_addrs = dst_ip_addrs;
    data.dst_port_num = dst_port_num;
    
    pthread_mutex_lock(&mutex);
    stop = false;
    pthread_mutex_unlock(&mutex);
    
    DBG("Starting acquisition thread ...\n", NULL);
    pthread_create(&acquisition_thread, NULL, acquisition_thread_fun, (void*)(&data));
}


void stop_acquisition_thread() {
    DBG("stop_thread()\n", NULL);
    pthread_mutex_lock(&mutex);
    stop = true;
    pthread_mutex_unlock(&mutex);
    
    DBG("Waiting for acquisition thread to join ...\n", NULL);
    if(acquisition_thread != NULL)
        pthread_join(acquisition_thread, NULL);
    DBG("Acquisition tThread joined\n", NULL);
}




void print_usage() {
    printf("Usage:\n\tadc_stream2 -m ADC_num -c DMA_channel_num -p ADC_mode -b buf_size_kB -q num_iter -d dst_ip_addrs -p dst_port_num\n");
}


int main(int argc, char **argv)
{
	int opt;
    int adc_num = 0;
    int dma_chan_num = 0;
    int adc_mode = 2;
    int buf_size = 1024;
	int num_iter = 0;
    char dst_ip_addrs[64] = "192.168.112.69";
    int dst_port_num = 9999;
    
    while((opt = getopt(argc, argv, "m:c:p:q:b:d:t:h")) != -1) {
        switch(opt) {
            case 'm':
                adc_num = atoi(optarg);
                break;
                
            case 'c':
                dma_chan_num = atoi(optarg);
                break;

            case 'p':
                adc_mode = atoi(optarg);
                break;
                
            case 'b':
                buf_size = 1024 * atoi(optarg);
                break;

            case 'q':
                num_iter = atoi(optarg);
                break;
                
            case 'd':
                strcpy(dst_ip_addrs, optarg);
                break;
                
            case 't':
                dst_port_num = atoi(optarg);
                break;
                
            case 'h':
            case ':':
            case '?':
                print_usage();
                exit(1);
        }
    }

    if(adc_num < ADC_NUM_MIN || adc_num > ADC_NUM_MAX) {
        printf("Illegal value: ADC_num_ch0=%d\n", adc_num);
        print_usage();
        exit(1);
    }
    
    if(dma_chan_num < DMA_CHANN_NUM_MIN || dma_chan_num > DMA_CHANN_NUM_MAX) {
        printf("Illegal value: ADC_num_ch1=%d\n", dma_chan_num);
        exit(1);
    }
    
    if(buf_size < 0 || buf_size > MAX_DMA_BUF_SIZE) {
        printf("Illegal value: buf_size=%d\n", buf_size);
        exit(1);
    }
    DBG("ADC_num=%d, DMA_chan_num=%d, buf_size=%d num_iter=%d dst_ip_addrs=%s dst_port_num=%d\n", adc_num, dma_chan_num, buf_size, num_iter, dst_ip_addrs, dst_port_num);
    
    init_gpio();        // \todo use WZAB multi-gpio module !!!
    
    // set ADC num for DMA channels
    if(set_adc_num(dma_chan_num, adc_num) != 0) {
        printf("ADC #%d not set for DMA channel #%d\n", adc_num, dma_chan_num);
        exit(1);
    }
    
    // set DMA buuffer size
    if(set_dma_buf_size(buf_size) != 0) {
        printf("DMA buffer size not set\n");
        exit(1);
    }

    // initialize/start clock cleaner
    printf("Clock cleaner initialization ...\n");
    if(clc_init() != 0) {
        printf("Clock cleaner not initialized\n");
        exit(1);
    }
    if(clc_set_state(CLC_ON) != 0) {
        printf("Clock cleaner not switched ON\n");
        exit(1);
    }

    // configuring ADCs
    if(config_all_adcs(adc_mode) != 0) {
        printf("ADCs not configured\n");
        exit(1);
    }
    
    // DMA reset
    if(dma_reset() != 0) {
        printf("DMA reset error\n");
        exit(1);
    }
    
    if(num_iter == 0) {     // interactive mode
        bool terminate = false;
        bool running = false;
        while(!terminate) {
            printf(">> ");
            char c = getchar();
            switch(c) {
                case 's':
                    if(!running) {
                        running = true;
                        DBG("Starting streaming thread\n", NULL);
                        start_acquisition_thread(adc_num, dma_chan_num, buf_size, num_iter, dst_ip_addrs, dst_port_num);
                    } else {
                        DBG("Streaming thread already running\n", NULL);
                    }
                    break;
                    
                case 'p':
                    DBG("Stopping streaming thread\n", NULL);
                    stop_acquisition_thread();
                    running = false;
                    break;
                    
                case 'q':
                    stop_acquisition_thread();
                    terminate = true;
                    break;
                    
                case '\n':
                    break;
                    
                default:
                    printf("\ns - Start, p - stoP, q - Quit\n");
                    break;
            }
        }        
    } else {                // non-iteractive mode
        start_acquisition_thread(adc_num, dma_chan_num, buf_size, num_iter, dst_ip_addrs, dst_port_num);
        if(acquisition_thread != NULL)
            pthread_join(acquisition_thread, NULL);
    }
    
    // \todo stop clock cleaner
    if(clc_set_state(CLC_OFF) != 0) {
        printf("Clock cleaner not switched OFF\n");
        exit(1);
    }

	return 0;
}

