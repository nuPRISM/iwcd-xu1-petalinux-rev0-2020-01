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
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdint.h>
#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <linux/i2c-dev.h>
#include <errno.h>


#define I2C_DEVICE "/dev/i2c-0"

#define CLOCK_CLEANER_SLAVE_ADDR	0x7C
#define CLOCK_CLEANER_SCLK_RATE		100000
#define CLOCK_CLEANER_INIT_REG		0x0039
#define CLOCK_CLEANER_INIT_VAL		0x0F
#define CLOCK_CLEANER_STOP_VAL		0x00

#define DEBUG
#include "dbg.h"

#include "clc.h"


// from XU1_rev0/SDK_NuPRISM/xu1_nuprism_cmdsvr/src/clock_cleaner.c
uint8_t init_clock_cleaner_settings[] = {
    0x09,0x50,0x00,0x60,0x60,0x01,0x7c,0x01,0x03,0x00,0x00,0x00,0x01,0xe9,0x00,0x01,0xe9,0x00,0x5b,0xb0,
    0x00,0x5b,0xb0,0x7d,0x6d,0x00,0x00,0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff,0x0b,0x3f,0x00,0x18,0x00,
    0x00,0x00,0x00,0x00,0x01,0x00,0x00,0xd0,0x0f,0x00,0x00,0x00,0x00,0x00,0x0f,0x00,0x00,0x00,0x00,0x00,
    0x00,0x44,0x44,0x01,0x00,0x02,0x00,0x00,0x0c,0x00,0x00,0x0c,0x00,0x00,0x0c,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0xe0,0x02,0x2b,0x20,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x13,0x00,0x00,0x13,0x00,
    0x00,0x53,0x27,0xcc,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x53,0x00,0x04,0x12,0x01,0x9d,0x51,0x01,
    0x9d,0x51,0x3f,0xff,0x00,0x21,0x0f,0x07,0x01,0x0b,0xde
};


#ifdef USE_SMBUS
__s32 i2c_smbus_access(int file, char read_write, __u8 command, int size, union i2c_smbus_data *data)
{
  struct i2c_smbus_ioctl_data args;
  __s32 err;

  args.read_write = read_write;
  args.command = command;
  args.size = size;
  args.data = data;

  err = ioctl(file, I2C_SMBUS, &args);
  if (err == -1)  {
    DBG("errno=%d (%s)\n", errno, strerror(errno));
  }
  return err;
}


__s32 i2c_smbus_read_byte_data(int file, __u8 command)
{
  union i2c_smbus_data data;
  int err;

  err = i2c_smbus_access(file, I2C_SMBUS_READ, command,
                         I2C_SMBUS_BYTE_DATA, &data);
  if (err < 0)
    return err;

  return 0x0FF & data.byte;
}


__s32 i2c_smbus_write_byte_data(int file, __u8 command, __u8 value)
{
  union i2c_smbus_data data;
  data.byte = value;
  return i2c_smbus_access(file, I2C_SMBUS_WRITE, command,
                          I2C_SMBUS_BYTE_DATA, &data);
}
#endif

// Developed by Luke Bidulka, TRIUMF
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
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }

    *result = inbuf[0];
    return 0;
}

// Developed by Luke Bidulka, TRIUMF
// Write to an I2C slave device's register:
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
        printf("ERR couldn't write: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}


int clc_init() {
    int fd = open(I2C_DEVICE, O_RDWR);
    if(fd == -1) {
        DBG("Device %s not opened\n", I2C_DEVICE);
        return 1;
    }
    DBG("device %s opened\n", I2C_DEVICE);

    int ret = 0;    
    for(uint16_t reg = 0; reg < sizeof(init_clock_cleaner_settings)/sizeof(uint8_t); reg++) {
        ret |= i2c_write(fd, CLOCK_CLEANER_SLAVE_ADDR, reg, init_clock_cleaner_settings[reg]);
        DBG("reg=%04x data=%02x ret=%d\n", reg, init_clock_cleaner_settings[reg], ret);
        usleep(5000);
    }

    close(fd);
    DBG("device %s closed\n", I2C_DEVICE);

    return ret;
}


int clc_set_state(int state) {
    int fd = open(I2C_DEVICE, O_RDWR);
    if(fd == -1) {
        DBG("Device %s not opened\n", I2C_DEVICE);
        return 1;
    }

    int ret = i2c_write(fd, CLOCK_CLEANER_SLAVE_ADDR, CLOCK_CLEANER_INIT_REG, state ? CLOCK_CLEANER_INIT_VAL : CLOCK_CLEANER_STOP_VAL);
    usleep(5000);
    close(fd);

    return ret;
}


int clc_read_id(uint8_t* id) {
    int fd = open(I2C_DEVICE, O_RDWR);
    if(fd == -1) {
        DBG("Device %s not opened\n", I2C_DEVICE);
        return 1;
    }
    DBG("device %s opened\n", I2C_DEVICE);

    int ret = 0;    
    ret |= i2c_read(fd, CLOCK_CLEANER_SLAVE_ADDR, 0x02, id);            // \todo #define
    ret |= i2c_read(fd, CLOCK_CLEANER_SLAVE_ADDR, 0x03, id + 1);            // \todo #define
    ret |= i2c_read(fd, CLOCK_CLEANER_SLAVE_ADDR, 0x04, id + 2);            // \todo #define
    ret |= i2c_read(fd, CLOCK_CLEANER_SLAVE_ADDR, 0x05, id + 3);            // \todo #define

    close(fd);

    return ret;
}

