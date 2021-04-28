#ifndef _24AA02E48_I2C_H_
#define _24AA02E48_I2C_H_

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <fcntl.h>

#define MAC_24AA02E48_I2C_ADDRESS 0xA2

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
 * @brief Read a single byte from a register of the EEPROM
 * 
 * @param fd      File descriptor for the I2C bus
 * @param reg     Specified register to read
 * @param data    Pointer to returned data
 * @return int    Return status
 */
int mac_24aa02e48_byte_read (int fd, uint8_t reg, uint8_t* data);

/**
 * @brief Write single byte to a register of the EEPROM
 * 
 * @param fd      File descriptor for the I2C bus
 * @param reg     Specified register to write to
 * @param data    Data to write
 * @return int    Return status
 */
int mac_24aa02e48_byte_write (int fd, uint8_t reg, uint8_t data);

/**
 * @brief Read a byte array from the EEPROM
 * 
 * @param fd        File descriptor for the I2C bus
 * @param reg_start First register to read, registers auto increment 
 * @param data      Pointer to byte array containing register data
 * @param bytes     Number of data bytes in transfer
 * @return int      Return status
 */
int mac_24aa02e48_sequential_read (int fd, uint8_t reg_start, uint8_t* data, uint8_t bytes);

/**
 * @brief Write up to 8-bytes sequentially to the EEPROM
 * 
 * @param fd        File descriptor for the I2C bus
 * @param reg_start First register to read, registers auto increment 
 * @param data      Pointer to byte array containing register data
 * @param bytes     Number of data bytes in transfer
 * @return int      Return status
 */
int mac_24aa02e48_page_write (int fd, uint8_t reg_start, uint8_t* data, uint8_t bytes);

#endif // _24AA02E48_I2C_H_