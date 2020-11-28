/*
* cc-i2c.c
*
* Author: Luke Bidulka
* Company: TRIUMF
* Date: Nov 25, 2020
*
* Purpose: Provide i2c communication functions for the 8t49n241 Clock Cleaner.
*
*/

/***************************** Include Files **********************************/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <linux/i2c-dev.h>
#ifndef I2C_M_RD
#include <linux/i2c.h>
#endif
#include <errno.h>
#include <string.h>
#include <sys/ioctl.h>

/******************************* Functions ************************************/

// Open the adapter
int i2c_init(int *i2c_fd_p, int adapter){
    char filename[20];
    int i2c_fd;
    snprintf(filename, 19, "/dev/i2c-%d", adapter);

    // Open the device
    i2c_fd = open(filename, O_RDWR);
    if(i2c_fd < 0)
    {
        printf("ERR Cannot open the i2c device: %s\n", strerror(errno));
        return 1;
    }

    *i2c_fd_p = i2c_fd;

    return 0;
}

// Close the adapter
void i2c_close(int i2c_fd){
    close(i2c_fd);
}

// Read the given I2C slave device's register and return the read value in `*result`:
int i2c_read(int i2c_fd, uint8_t slave_addr, uint16_t reg, uint8_t *result) {
    int retval;
    uint8_t outbuf[2], inbuf[1];
    struct i2c_msg msgs[2];
    struct i2c_rdwr_ioctl_data msgset[1];

    msgs[0].addr = slave_addr;
    msgs[0].flags = 0;
    msgs[0].len = 2;
    msgs[0].buf = outbuf;

    msgs[1].addr = slave_addr;
    msgs[1].flags = I2C_M_RD | I2C_M_NOSTART;
    msgs[1].len = 1;
    msgs[1].buf = inbuf;

    msgset[0].msgs = msgs;
    msgset[0].nmsgs = 2;

    outbuf[0] = (uint8_t) (reg >> 8);
    outbuf[1] = (uint8_t) (reg&0x00FF);

    inbuf[0] = 0;

    *result = 0;
    if (ioctl(i2c_fd, I2C_RDWR, &msgset) < 0) {
        perror("ioctl(I2C_RDWR) in i2c_read\n");
        printf("ERR couldn't read from 0x%x%x: %s\n", outbuf[0], outbuf[1], strerror(errno));
        return -1;
    }

    *result = inbuf[0];
    return 0;
}

// Write to the I2C slave device's register:
int i2c_write(int i2c_fd, uint8_t slave_addr, uint16_t reg, uint8_t data) {
    int retval;
    uint8_t outbuf[3];

    struct i2c_msg msgs[1];
    struct i2c_rdwr_ioctl_data msgset[1];

    outbuf[0] = (uint8_t) (reg >> 8);
    outbuf[1] = (uint8_t) (reg&0x00FF);
    outbuf[2] = data;

    msgs[0].addr = slave_addr;
    msgs[0].flags = 0;
    msgs[0].len = 3;
    msgs[0].buf = outbuf;

    msgset[0].msgs = msgs;
    msgset[0].nmsgs = 1;

    if (ioctl(i2c_fd, I2C_RDWR, &msgset) < 0) {
        perror("ioctl(I2C_RDWR) in i2c_write\n");
        printf("ERR couldn't write to 0x 0x%x%x: %s\n", outbuf[0], outbuf[1], strerror(errno));
        return -1;
    }

    return 0;
}
