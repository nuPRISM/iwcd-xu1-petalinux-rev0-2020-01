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

#define MAX30205_ARRAY_BASE       0x90  // First temperature sensor address
#define MAX30205_SENSOR_COUNT     3

#define MAX30205_TEMP_REGISTER    0x00
#define MAX30205_CONFIG_REGISTER  0x01
#define MAX30205_T_HYST_REGISTER  0X02
#define MAX30205_T_OS_REGISTER    0X03

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
uint8_t max30205_get_i2c_address (uint8_t sensor_no);

/**
 * @brief Get A temperature reading from the MAX30205 sensor.
 * 
 * @param fd          File descriptor for the I2C bus
 * @param sensor_no   The selected sensor unit
 * @param temperature Temperature data as floating point number
 * @return int        Return status, zero on success
 */
int max30205_get_temp (int fd, uint8_t sensor_no, float* temperature);

/**
 * @brief Read the configuration register (Reads a byte rather than a word)
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param sensor_no   The selected sensor unit 
 * @param data        Returned byte
 * @return int        Return status, zero on success
 */
int max30205_get_config (int fd, uint8_t sensor_no, uint8_t* data);

/**
 * @brief Write to the configuration register (write a byte rather than a word)
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param sensor_no   The selected sensor unit 
 * @param data        Data to write
 * @return int        Return status, zero on success
 */
int max30205_set_config (int fd, uint8_t sensor_no, uint8_t data);

/**
 * @brief Get the current value of the T_HYST register as a converted floating-point number
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param sensor_no   The selected sensor unit 
 * @param t_hyst      Floating-point representation of the register contents
 * @return int        Return status, zero on success
 */
int max30205_get_t_hyst (int fd, uint8_t sensor_no, float* t_hyst);

/**
 * @brief Write a floating point number to the T_HYST register, conversion is handled by function
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param sensor_no   The selected sensor unit 
 * @param t_hyst      Floating point number to write
 * @return int        Return status, zero on success
 */
int max30205_set_t_hyst (int fd, uint8_t sensor_no, float t_hyst);

/**
 * @brief Get the current value of the T_OS register as a converted floating-point number
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param sensor_no   The selected sensor unit 
 * @param t_os        Floating-point representation of the register contents
 * @return int        Return status, zero on success
 */
int max30205_get_t_os (int fd, uint8_t sensor_no, float* t_os);

/**
 * @brief Write a floating point number to the T_OS register, conversion is handled by function 
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param sensor_no   The selected sensor unit 
 * @param t_os        Floating point number to write
 * @return int        Return status, zero on success
 */
int max30205_set_t_os (int fd, uint8_t sensor_no, float t_os);

#endif // _MAX30205_I2C_H_