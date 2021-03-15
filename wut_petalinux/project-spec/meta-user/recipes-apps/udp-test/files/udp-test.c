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


int main(int argc, char **argv)
{
	if(argc < 4) {
        printf("usage:\n\t%s block_size dst_addr dst_port\n", argv[0]);
        return 1;
    }
    
    int buf_size = atoi(argv[1]);
    uint8_t* buf = malloc(buf_size);
    for(int i = 0; i < buf_size; i++) {
        buf[i] = (uint8_t)(i & 0xff);
    }
    
    send_data(buf, buf_size, argv[2], argv[3]);
    
    free(buf);
    
    
    return 0;
}

