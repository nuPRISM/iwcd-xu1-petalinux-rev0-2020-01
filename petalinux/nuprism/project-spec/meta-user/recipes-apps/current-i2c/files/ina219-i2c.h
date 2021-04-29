/**
 * @file ina219-i2c.h
 * @author Jake Cronin (jcronin@triumf.ca)
 * @brief  Current/Voltage sensor user space driver API, contains read/write function definitions
 * and programming data
 * Datasheet: https://learn.adafruit.com/adafruit-ina219-current-sensor-breakout/downloads
 * 
 * @version 0.1
 * @date 2021-04-29
 * 
 */
#ifndef _INA219_I2C_H_
#define _INA219_I2C_H_

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <fcntl.h>

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
 * @brief Struct containing shunt resistor and I2C address for each sensor
 * 
 */
struct ina219_profile_s
{
    uint8_t i2c_address;
    float shunt_resistor;
};

/**
 * @brief Read a single byte of data from a register of the INA219
 * 
 * @param fd      File descriptor for the I2C bus
 * @param unit    The sensor to interact with, contained resistor value and addr        
 * @param reg     Register to read from
 * @param data    Pointer to retunred data
 * @return int    Status flag
 */
int ina219_read (int fd, const struct ina219_profile_s unit, uint8_t reg, uint16_t* data);

/**
 * @brief Write a single byte of data to a register of the INA219
 * 
 * @param fd      File descriptor for the I2C bus
 * @param unit    The sensor to interact with, contained resistor value and addr        
 * @param reg     Register to write to
 * @param data    Pointer to retunred data
 * @return int    Status flag
 */
int ina219_write (int fd, const struct ina219_profile_s unit, uint8_t reg, uint16_t data);

#endif // _INA219_I2C_H_