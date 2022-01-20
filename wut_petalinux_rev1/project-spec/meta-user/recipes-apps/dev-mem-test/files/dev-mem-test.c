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
#include <stdint.h>
#include <assert.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>


#define BUF_SIZE 2048

int main(int argc, char **argv)
{
    void* pAddress = ((void*)0x82000000);
	uint32_t buf[BUF_SIZE];

	uint8_t *pAddr = (uint8_t*)pAddress;
	size_t pageSize = getpagesize();
	size_t mappedSize = ((sizeof(uint32_t) * BUF_SIZE / pageSize) + 2) * pageSize;
	size_t offset = ((size_t)pAddr) & (pageSize-1);
	size_t target = ((size_t)pAddr) & (~(pageSize-1));

	printf("pageSize=0x%lx mappedSize=0x%lx offset=0x%lx target=0x%lx\n", pageSize, mappedSize, offset, target);


	int devMemFd = open("/dev/mem", O_RDWR);   // | O_DSYNC);
	assert(devMemFd > 0);
	printf("dev/mem opened\n");

	uint8_t *pMapBase = (uint8_t*)mmap(NULL, mappedSize, PROT_READ | PROT_WRITE, MAP_SHARED, devMemFd, target);
	printf("Buffer mapped: target=%p offset=%llx mapbase=%p\n", target, offset, pMapBase);
	assert(pMapBase != ((uint8_t*)-1));

	printf("Press Enter to continue ...\n");	
	int c = getchar();

	int ret = munmap(pMapBase, mappedSize);
	printf("Buffer unmapped, ret=%d\n", ret);

	close(devMemFd);
	printf("dev/mem closed\n");

    return 0;
}
