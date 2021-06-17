#ifndef CLC_H
#define CLC_H

#define CLC_ON 1
#define CLC_OFF 0

int i2c_read(int i2c_fd, uint8_t slave_addr, uint16_t reg, uint8_t *result);
int i2c_write(int i2c_fd, uint8_t slave_addr, uint16_t reg, uint8_t data);
int clc_init();
int clc_set_state(int state);
int clc_read_id(uint8_t* id);


#endif
