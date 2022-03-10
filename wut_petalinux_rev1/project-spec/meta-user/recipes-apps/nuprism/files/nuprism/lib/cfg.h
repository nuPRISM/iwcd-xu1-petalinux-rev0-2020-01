#ifndef _CONFIG_H_
#define _CONFIG_H_

#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <assert.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>


struct Config {
	uint16_t auto_trig_thr;
	uint16_t dummy;
};


int configure(struct Config* cfg_ptr);

#endif
