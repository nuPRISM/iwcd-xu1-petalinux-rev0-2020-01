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
#include <stdint.h>
#include <string.h>
#include <netdb.h>
#include <assert.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/mman.h>

#include "dma-proxy.h"


#define DEBUG

#ifdef DEBUG
    #define DBG(fmt, args...) printf("DBG: " fmt, args)                                                                          
#else
    #define DBG(fmt, args...)
#endif    
    


int send_data(uint8_t* buf, uint buf_size, char* dst_addr, char* dst_port) {
    struct addrinfo hints, *pRes;
    
    DBG("send data: buf_size=%d addr=%s port=%s\n", buf_size, dst_addr, dst_port);
    
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_INET; //AF_UNSPEC;
    hints.ai_socktype = SOCK_DGRAM;
    hints.ai_protocol = IPPROTO_UDP;
    hints.ai_flags = AI_ADDRCONFIG;    
    assert(getaddrinfo(dst_addr, dst_port, &hints, &pRes) == 0);
    
    // create socket    	
    int sock_fd = socket(AF_INET, SOCK_DGRAM, 0);
    
    unsigned to_send = buf_size;
	unsigned offset = 0;
	const unsigned chunk = 1400;
    while(to_send > 0) {
		unsigned len = to_send > chunk ? chunk : to_send;
    	ssize_t numBytes = sendto(sock_fd, buf + offset, len, 0, pRes->ai_addr, pRes->ai_addrlen);
        if(numBytes < 0) {
            DBG("ERROR! sento.errno=%d (%s)\n", errno, strerror(errno));
            break; 
        } else {
            DBG("sento.numBytes=%ld\n", numBytes);                    
        }
    	to_send -= len;
    	offset += len;
	}       
    close(sock_fd);
    
    return to_send;    // 0 if OK, > 0 if error
}


int main(int argc, char **argv) {
    struct dma_proxy_channel_interface *rx_proxy_interface_p;
	int rx_proxy_fd;
    int dummy;

	if(argc < 4) {
        printf("usage:\n\t%s block_size dst_addr dst_port\n", argv[0]);
        return 1;
    }

    rx_proxy_fd = open("/dev/dma_proxy_rx", O_RDWR);
	if (rx_proxy_fd < 1) {
		printf("Unable to open DMA proxy device file");
		exit(EXIT_FAILURE);
	}
    
    /* Map the receive channels memory into user space so it's accessible */
	rx_proxy_interface_p = (struct dma_proxy_channel_interface *)mmap(NULL, sizeof(struct dma_proxy_channel_interface),
									PROT_READ | PROT_WRITE, MAP_SHARED, rx_proxy_fd, 0);
	if ((rx_proxy_interface_p == MAP_FAILED)) {
		printf("Failed to mmap\n");
		exit(EXIT_FAILURE);
	}

    int test_size = atoi(argv[1]);

    /* set num bytes to receive */
	rx_proxy_interface_p->length = test_size;

	/* Perform a receive DMA transfer and after it finishes check the status */
	ioctl(rx_proxy_fd, 0, &dummy);

	if (rx_proxy_interface_p->status != PROXY_NO_ERROR) {
		printf("DMA proxy RX transfer error\n");
    } else {
        printf("DMA transfer finished, sending %d bytes to %s:%s ...\n", test_size, argv[2], argv[3]);
        if(send_data(rx_proxy_interface_p->buffer, test_size, argv[2], argv[3]) == 0) {
            printf("OK - all data sent\n");
        } else {
            printf("ERROR - data NOT sent!\n");
        }
    }
    
    /* Unmap the proxy channel interface memory and close the device files before leaving */
	munmap(rx_proxy_interface_p, sizeof(struct dma_proxy_channel_interface));
	close(rx_proxy_fd);

    return 0;
}

