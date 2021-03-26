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
#include <stdbool.h>
#include <pthread.h>
#include <unistd.h>
#include <libgen.h>

#define DEBUG

#ifdef DEBUG
    #define DBG(fmt, args...) printf("DBG: " fmt, args)                                                                          
#else
    #define DBG(fmt, args...)
#endif    

typedef struct {
    char* address;
    char* port;
} dst_info;


static pthread_t thread;
static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
static bool stop = false;


void *thread_fun( void *ptr ) {
    dst_info* info_ptr = (dst_info*)ptr;
    
    DBG("Entering thread loop: address=%s port=%s\n", info_ptr->address, info_ptr->port);
    int i = 0;
    while(!stop) {                  // \todo read only - mutex required?
        printf("i=%d\n", i++);
        usleep(500*1000);
    }
    DBG("Leaving thread loop\n", NULL);
    return NULL;
}


void start_thread(char* address, char* port) {               // \todo add address, port
    DBG("start_thread()\n", NULL);
    static dst_info info;
    info.address = address;
    info.port = port;
    
    pthread_mutex_lock(&mutex);
    stop = false;
    pthread_mutex_unlock(&mutex);
    
    DBG("Starting thread ...\n", &info);
    pthread_create(&thread, NULL, thread_fun, (void*)(&info));
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
        printf("Usage:\n\t%s dst_ip_addr dst_port_num\n\n", basename(argv[0]));
        return 1;
    }
    
    bool terminate = false;
    while(!terminate) {
        printf(">> ");
        char c = getchar();
        switch(c) {
            case 's':
                DBG("Starting streaming thread: dst_ip_addr=%s dst_port_num=%s\n", argv[1], argv[2]);
                start_thread(argv[1], argv[2]);     // \todo read address, port from cmd line !!
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
    
    
    return 0;
}

