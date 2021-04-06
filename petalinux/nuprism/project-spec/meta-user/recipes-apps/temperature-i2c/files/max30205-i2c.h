/**
 * @file max30205-i2c.h
 * @author Jake Cronin (jcronin@triumf.ca)
 * @brief API functions to control a MAX30205 sensor via I2C
 * 
 * Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX30205.pdf
 * 
 * @version 0.1
 * @date 2021-03-24
 * 
 * @copyright Copyright (c) 2021
 * 
 */

#ifndef _MAX30205_I2C_H_
#define _MAX30205_I2C_H_

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <string.h>

#include <fcntl.h>

#define TEMP_SENSOR_ARRAY_BASE  0x90  // First temperature sensor address
#define SENSOR_COUNT            3

#define TEMP_REG                0x00
#define CONFIG_REG              0x01

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
 * @brief Returns the I2C address of a sensor using its index
 * 
 * @param sensor_no Sensor index number
 * @return uint8_t  I2C address
 */
uint8_t max_get_i2c_address (uint8_t sensor_no);

/**
 * @brief Get A temperature reading from the MAX30205 sensor.
 * 
 * @param fd          File descriptor for the I2C bus
 * @param sensor_no   The selected sensor unit
 * @param temperature Temperature data as floating point number
 * @return int        Return status, zero on success
 */
int get_temp (int fd, uint8_t sensor_no, float* temperature);

/**
 * @brief Read the configuration register (Reads a byte rather than a word)
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param sensor_no   The selected sensor unit 
 * @param data        Returned byte
 * @return int        Return status, zero on success
 */
int max_get_config (int fd, uint8_t sensor_no, uint8_t* data);

/**
 * @brief Write to the configuration register (write a byte rather than a word)
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param sensor_no   The selected sensor unit 
 * @param data        Data to write
 * @return int        Return status, zero on success
 */
int max_set_config (int fd, uint8_t sensor_no, uint8_t data);

/**
 * @brief Simplified read function, reads a word of data from a register and flips bytes
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param sensor_no   The selected sensor unit 
 * @param reg         Register to read
 * @param data        Returned word of data
 * @return int        Return status, zero on success 
 */
int max_get_register (int fd, uint8_t sensor_no, uint8_t reg, uint16_t* data);

/**
 * @brief Simplified write function, flip bytes and write a word to a register
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param sensor_no   The selected sensor unit  
 * @param reg         Register to write to 
 * @param data        Word of data to write 
 * @return int        Return status, zero on success  
 */
int max_set_register (int fd, uint8_t sensor_no, uint8_t reg, uint16_t data);

/**
 * @brief Read a word of data from the selected MAX30205 sensor
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param sensor_no   The selected sensor unit 
 * @param reg         Starting register to read from 
 * @param data        Pointer to returned data array
 * @param bytes       Number of bytes to write
 * @return int        Return status, zero on success
 */
int max_read (int fd, uint8_t sensor_no, uint8_t reg, uint8_t* data, uint8_t bytes);

/**
 * @brief Write a byte array of data to a specified register (reg >= 1, bytes <= 6)
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param sensor_no   The selected sensor unit 
 * @param reg         Starting register to write to
 * @param data        Byte array to write, every two bytes will be written to incrementing registers
 * @param bytes       Number of bytes to write
 * @return int        Return status, zero on success
 */
int max_write (int fd, uint8_t sensor_no, uint8_t reg, uint8_t* data, uint8_t bytes);

#endif // _MAX30205_I2C_H_