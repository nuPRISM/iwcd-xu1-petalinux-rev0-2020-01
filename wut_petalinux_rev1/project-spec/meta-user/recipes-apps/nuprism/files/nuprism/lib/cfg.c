#include "cfg.h"

#define DEBUG
#include "dbg.h"


int configure(struct Config* cfg_ptr) {
	DBG("auto_trig_thr=%d dummy=%d\n", cfg_ptr->auto_trig_thr, cfg_ptr->dummy);
	void* pAddress = ((void*)0x82000000);		// config BRAM block address to be found in the device tree decompiled file

	uint8_t *pAddr = (uint8_t*)pAddress;
	size_t pageSize = getpagesize();
	size_t mappedSize = ((sizeof(struct Config) / pageSize) + 2) * pageSize;
	size_t offset = ((size_t)pAddr) & (pageSize-1);
	size_t target = ((size_t)pAddr) & (~(pageSize-1));
	DBG("pageSize=0x%lx mappedSize=0x%lx offset=0x%lx target=0x%lx\n", pageSize, mappedSize, offset, target);

	int devMemFd = open("/dev/mem", O_RDWR);   // | O_DSYNC);
	if(devMemFd < 0) {
		return 1;
	}
	DBG("dev/mem opened\n", NULL);
	uint8_t *pMapBase = (uint8_t*)mmap(NULL, mappedSize, PROT_READ | PROT_WRITE, MAP_SHARED, devMemFd, target);
	if(pMapBase == ((uint8_t*)-1)) {
		return 2;
	}
	DBG("Buffer mapped: target=%p offset=%llx mapbase=%p\n", target, offset, pMapBase);

	uint8_t *pTarget = ((uint8_t*)pMapBase) + offset;	
	memcpy(pTarget, cfg_ptr, sizeof(struct Config));
	DBG("configuration copied to BRAM\n", NULL);
	
	int ret = munmap(pMapBase, mappedSize);
	DBG("Buffer unmapped, ret=%d\n", ret);

	close(devMemFd);
	DBG("dev/mem closed\n", NULL);

	return 0;
}
