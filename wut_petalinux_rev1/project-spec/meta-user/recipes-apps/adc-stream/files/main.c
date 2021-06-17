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


#define ADC_SEL0_GPIO      492
#define ADC_SEL1_GPIO      493
#define ADC_SEL2_GPIO      494
#define ADC_SEL3_GPIO      495
#define ADC_SEL4_GPIO      496
#define ADC_RESET_GPIO     497
#define ADC_PWRDN_GPIO     498
#define ADC_DMA_RESET_GPIO 499

#define ADC_GPIO_START ADC_SEL0_GPIO
#define ADC_GPIO_END   ADC_DMA_RESET_GPIO

#define SUPPRESS_LSB_GPIO 440
#define SUPPRESS_MSB_GPIO 441
#define ADC_TRIGGER_GPIO  442

#define SUPPRESS_GPIO_START SUPPRESS_LSB_GPIO
#define SUPPRESS_GPIO_END   ADC_TRIGGER_GPIO

#define DMA_BUF_SIZE_GPIO_START 460
#define DMA_BUF_SIZE_GPIO_END   491


int gpio_init() {               // \todo rewrite using WZAB GPIO module
    struct stat stat_buf;   
    if(stat("/sys/class/gpio/gpio492/value", &stat_buf) == 0) {
        DBG("GPIO already initialized\n", NULL);
        return 1;
    }

    for(int i = ADC_GPIO_START; i <= ADC_GPIO_END; i++) {
        char cmd[64];
        
        sprintf(cmd, "echo %d > /sys/class/gpio/export", i);
        DBG("%s\n", cmd);
        system(cmd);
        
        sprintf(cmd, "echo out > /sys/class/gpio/gpio%d/direction", i);
        DBG("%s\n", cmd);
        system(cmd);
        
        // \todo set default values
    }
    
    for(int i = SUPPRESS_LSB_GPIO; i <= SUPPRESS_GPIO_END; i++) {
        char cmd[64];
        
        sprintf(cmd, "echo %d > /sys/class/gpio/export", i);
        DBG("%s\n", cmd);
        system(cmd);
        
        sprintf(cmd, "echo out > /sys/class/gpio/gpio%d/direction", i);
        DBG("%s\n", cmd);
        system(cmd);   
        
        switch(i) {
            case SUPPRESS_LSB_GPIO:
            case SUPPRESS_MSB_GPIO:
                sprintf(cmd, "echo 1 > /sys/class/gpio/gpio%d/value", i);
                break;
                
            case ADC_TRIGGER_GPIO:
                sprintf(cmd, "echo 0 > /sys/class/gpio/gpio%d/value", i);
                break;
        }
        DBG("%s\n", cmd);
        system(cmd);
    }
    
    for(int i = DMA_BUF_SIZE_GPIO_START; i <= DMA_BUF_SIZE_GPIO_END; i++) {
        char cmd[64];
        
        sprintf(cmd, "echo %d > /sys/class/gpio/export", i);
        DBG("%s\n", cmd);
        system(cmd);
        
        sprintf(cmd, "echo out > /sys/class/gpio/gpio%d/direction", i);
        DBG("%s\n", cmd);
        system(cmd);
        
        sprintf(cmd, "echo 0 > /sys/class/gpio/gpio%d/value", i);        
        DBG("%s\n", cmd);
        system(cmd);
    }
    
    return 0;       // \todo verify system cmd error codes, return appropiate value
}


int set_dma_buf_size(int buf_size) {
    buf_size = buf_size >> 2;           // buffer size must be set a a number of 4 byte words
    
    for(int i = DMA_BUF_SIZE_GPIO_START; i <= DMA_BUF_SIZE_GPIO_END; i++) {
        char cmd[64];
    
        sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", (buf_size & 0x01), i);        
        DBG("%s\n", cmd);
        system(cmd);
        
        buf_size = buf_size >> 1;
    }
    
    return 0;       // \todo verify system cmd error codes, return appropiate value
}


int dma_reset() {
    system("echo 0 > /sys/class/gpio/gpio499/value"); 
    usleep(500 * 1000);
    system("echo 1 > /sys/class/gpio/gpio499/value"); 

    return 0;       // \todo verify system cmd error codes, return appropiate value
}


static pthread_t trigger_thread = NULL;

void *trigger_thread_fun( void *ptr ) {
    DBG("delay start\n", NULL);
    usleep(10 * 1000);
    system("echo 1 > /sys/class/gpio/gpio442/value");     // set trigger
    system("echo 0 > /sys/class/gpio/gpio442/value");     // unset trigger
    DBG("delay end\n", NULL);
}


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

//static struct dma_proxy_channel_interface *rx_proxy_interface_p;


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

    // open DMA device
    int	rx_proxy_fd = open("/dev/dma_proxy_rx", O_RDWR);
	if (rx_proxy_fd < 1) {
		DBG("Unable to open DMA proxy device file", NULL);
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
    rx_proxy_interface_p->length = data_ptr->test_size;
    DBG("thrad_fun(): test size=%d\n", rx_proxy_interface_p->length);

    system("echo 0 > /sys/class/gpio/gpio441/value"); // unset ADC supress bit        

    struct timeval begin, end;
    gettimeofday(&begin, 0);

    unsigned long counter = 0;
    while(!stop) {                                  // \todo read only - mutex required?
        int dummy;

        pthread_create(&trigger_thread, NULL, trigger_thread_fun, (void*)(NULL));
        ioctl(rx_proxy_fd, 0, &dummy);
        pthread_join(trigger_thread, NULL);

	    if (rx_proxy_interface_p->status != PROXY_NO_ERROR) {
		    DBG("Proxy rx transfer error: status=%d\n", rx_proxy_interface_p->status);
        } else {
            int ret_val = send_data(sock_fd, rx_proxy_interface_p->buffer, data_ptr->test_size, pRes);
            if(ret_val != 0) {
                DBG("Data not sent: ret_val=%d\n", ret_val);
            } else {
                counter++; 
            }
        }            
    }
    gettimeofday(&end, 0);

    system("echo 1 > /sys/class/gpio/gpio441/value"); // set ADC supress bit

    // Unmap the proxy channel interface memory     
    munmap(rx_proxy_interface_p, sizeof(struct dma_proxy_channel_interface));
    
    // close DMA proxy device
    close(rx_proxy_fd);

    // close network socket
    close(sock_fd);

    long seconds = end.tv_sec - begin.tv_sec;
    long microseconds = end.tv_usec - begin.tv_usec;
    double elapsed_time = seconds + microseconds*1e-6;
    DBG("Leaving thread loop, %lu bytes received/sent in %f [s] (%f Mb/s) \n", counter * data_ptr->test_size, 
         elapsed_time, (double)counter * data_ptr->test_size * 8 / 1024 / 1024 / elapsed_time);

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

    // set DMA buuffer size
    set_dma_buf_size(test_size);

    // initialize/start clock cleaner
    int ret_val = clc_init();                     // \todo terminate if ret_val != 0
    DBG("clc_init(): ret_val=%d\n", ret_val);
    ret_val = clc_set_state(CLC_ON);
    DBG("clc_state(ON): ret_val=%d\n", ret_val);

    // initilize SPI/ADC
    int fd = spi_init(DEFAULT_SPI_DEVICE);          // \todo optional param in cmd line to change device name
    if(fd < 0) {
        printf("SPI device not opened/configured - terminating ... \n");
        return 3;                                   // \toco clse SPI device if opened
    }
    adc_reset();
    
    // configure & set ADC mode
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

    dma_reset();
    
    // main loop 
    bool terminate = false;
    bool running = false;
    while(!terminate) {
        printf(">> ");
        char c = getchar();
        switch(c) {
            case 's':
                if(!running) {
                    running = true;
                    DBG("Starting streaming thread: adc_num=%d test_size=%d dst_ip_addr=%s dst_port_num=%s\n", adc_num, test_size, argv[4], argv[5]);
                    start_thread(adc_num, test_size, argv[4], argv[5]);     
                } else {
                    DBG("Streaming thread already running\n", NULL);
                }
                break;
                
            case 'p':
                DBG("Stopping streaming thread\n", NULL);
                stop_thread();
                running = false;
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

