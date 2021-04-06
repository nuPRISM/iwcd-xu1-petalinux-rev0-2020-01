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
#ifndef _HDC_1080_I2C_H_
#define _HDC_1080_I2C_H_

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

///////////////////////////////////////////////////////////////////
// Internal struct access function
///////////////////////////////////////////////////////////////////

/**
 * @brief Shows the current temperature resolution
 * 
 * @return enum resolution 
 */
enum resolution hdc_get_temp_resolution (void);

/**
 * @brief Shows the current humidity resolution
 * 
 * @return enum resolution 
 */
enum resolution hdc_get_humid_resolution (void);

/**
 * @brief Shows whether the HDC1080 is in dual (true) or single (false)
 * 
 * @return true 
 * @return false 
 */
bool hdc_get_dual (void);

/**
 * @brief Shows if the heater is enabled (true) or disabled (false)
 * 
 * @return uint16_t 
 */
bool hdc_get_heater (void);

/**
 * @brief Perform a software reset by setting the MSB config bit 
 *        Software reset is self-clearing
 * 
 * @param fd         File descriptor for the I2C bus
 * @return int       Status, zero on success
 */
int hdc_sw_reset (int fd);

/**
 * @brief 
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param dual        Dual mode setting
 * @param temp_config Temperature resolution
 * @param hum_config  Humidity resolution
 * @return int        Status, zero on success
 */
int hdc_set_mode (int fd, bool dual, bool heater, enum resolution temp_config, enum resolution humid_config);

/**
 * @brief Returns a humidity measurement
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param config      Configuration word
 * @return int        Status, zero on success
 */
int hdc_get_mode (int fd, uint16_t* config);

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
int hdc_get_all (int fd, float* temperature, float* humidity);

///////////////////////////////////////////////////////////////////
//
// General I2C write/read function - Do not recomment using these
//
///////////////////////////////////////////////////////////////////

/**
 * @brief Read a word of data from a register of the HDC1080
 * 
 * @param fd        File descriptor for the I2C bus 
 * @param reg       Register to read from
 * @param data      Returned data
 * @return int      Status, zero on success
 */
int hdc_read (int fd, uint8_t reg, uint16_t* data);

/**
 * @brief 
 * 
 * @param fd        File descriptor for the I2C bus 
 * @param reg       Register to write to
 * @param data      Data to write 
 * @return int      Status, zero on success
 */
int hdc_write (int fd, uint8_t reg, uint16_t data);

#endif // _HDC_1080_I2C_H_