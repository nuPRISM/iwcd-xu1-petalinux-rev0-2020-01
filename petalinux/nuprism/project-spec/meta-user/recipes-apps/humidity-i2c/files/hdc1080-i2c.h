/**
 * @file hdc1080-i2c.h
 * @author Jacob Cronin
 * @brief 
 * 
 *  Datasheet: https://www.ti.com/lit/ds/symlink/hdc1080.pdf?HQS=dis-dk-null-digikeymode-dsf-pf-null-wwe&ts=1616613245121
 * 
 * @version 0.1
 * @date 2021-03-30
 * 
 * @copyright Copyright (c) 2021
 * 
 */
#ifndef _hdc_1080_I2C_H_
#define _hdc_1080_I2C_H_

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <fcntl.h>

#define HDC1080_I2C_ADDRESS 0x80 

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
 * @brief Used to set temperature and humidity resolution.
 *  
 *  HIGH  -> 14-bit
 *  MED   -> 11-bit
 *  LOW   -> 8-bit
 * 
 * ** LOW only applies to humidity measurements
 * 
 */
enum resolution { HIGH, MED, LOW };

/**
 * @brief Read a word of data from a register of the HDC1080
 * 
 * @param fd        File descriptor for the I2C bus 
 * @param reg       Register to read from
 * @param data      Returned data
 * @return int      Status, zero on success
 */
int hdc1080_read (int fd, uint8_t reg, uint16_t* data);

/**
 * @brief 
 * 
 * @param fd        File descriptor for the I2C bus 
 * @param reg       Register to write to
 * @param data      Data to write 
 * @return int      Status, zero on success
 */
int hdc1080_write (int fd, uint8_t reg, uint16_t data);

/**
 * @brief 
 * 
 * @param fd              File descriptor for the I2C bus 
 * @param config_setting  Word containing new config
 * @return int            Status, zero on success
 */
int hdc1080_set_configuration (int fd, uint16_t config_setting);

/**
 * @brief Returns a humidity measurement
 * 
 * @param fd              File descriptor for the I2C bus 
 * @param config_setting  Configuration word
 * @return int            Status, zero on success
 */
int hdc1080_get_configuration (int fd, uint16_t* config_setting);

/**
 * @brief Get the hdc1080 temperature reading 
 * 
 * @param fd          File descriptor for the I2C bus
 * @param temperature Temperature reading
 * @return int        Status, zero on success
 */
int get_hdc1080_temp (int fd, float* temperature);

/**
 * @brief Get the hdc1080 humidity reading
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param humidity    humidty reading
 * @return int        Status, zero on success
 */
int get_humidity (int fd, float* humidity);

/**
 * @brief Read both temperature and humidity if in dual mode
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param temperature Temperature measurement
 * @param humidity    Temperature measurement
 * @return int        Status, zero on success
 */
int hdc1080_get_all (int fd, float* temperature, float* humidity);

#endif // _hdc_1080_I2C_H_