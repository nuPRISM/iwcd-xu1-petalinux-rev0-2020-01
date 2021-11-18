#ifndef CLC_H
#define CLC_H

#include <stdint.h>

#define CLC_ON  1
#define CLC_OFF 0

int clc_init();
int clc_set_state(int state);
int clc_read_id(uint8_t* id);

#endif
