#ifndef _24AA02E48_I2C_H_
#define _24AA02E48_I2C_H_

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <fcntl.h>

#define MAC_24AA02E48_I2C_ADDRESS 0xA1

// I2C_DEVICE is defined the same in each sensor header
#ifndef I2C_DEVICE
  #define I2C_DEVICE "/dev/i2c-0"
#endif // I2C_DEVICE

// from: https://gist.github.com/jlintz/1192247
#ifndef _DEBUG
  #ifdef DEBUG
    #define _DEBUG(fmt, args...) printf("%s:%s:%d: "fmt, __FILE__, __FUNCTION__, __LINE__, ##args)                                                                          
  #else
    #define _DEBUG(fmt, args...)
  #endif // DEBUG
#endif // _DEBUG

/**
 * @brief Read a word of data from a register of the HDC1080
 * 
 * @param fd        File descriptor for the I2C bus 
 * @param reg       Register to read from
 * @param data      Returned data
 * @return int      Status, zero on success
 */
int mac_24aa02e48_read (int fd, uint8_t reg, uint16_t* data);

/**
 * @brief 
 * 
 * @param fd        File descriptor for the I2C bus 
 * @param reg       Register to write to
 * @param data      Data to write 
 * @return int      Status, zero on success
 */
int mac_24aa02e48_write (int fd, uint8_t reg, uint16_t data);

#endif // _24AA02E48_I2C_H_