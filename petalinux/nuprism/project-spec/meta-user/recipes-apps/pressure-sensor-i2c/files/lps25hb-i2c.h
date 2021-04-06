/**
 * @file lps25hb-i2c.h
 * @author Jake Cronin (jcronin@triumf.ca)
 * @brief This file contains an API to handle I2C communication with the LPS25HB pressure sensor.
 * 
 * Datasheet: https://www.st.com/content/ccc/resource/technical/document/datasheet/9a/4c/aa/72/1f/45/4e/24/DM00141379.pdf/files/DM00141379.pdf/jcr:content/translations/en.DM00141379.pdf
 * 
 * @version 0.1
 * @date 2021-03-24
 * 
 */

#ifndef _LPS25HB_I2C_H_
#define _LPS25HB_I2C_H_

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <string.h>

#include <fcntl.h>

#define LPS25HB_I2C_ADDRESS 0xB8

// I2C_DEVICE is defined the same in each sensor header
#ifndef I2C_DEVICE
  #define I2C_DEVICE "/dev/i2c-0"
#endif // I2C_DEVICE

// from: https://gist.github.com/jlintz/1192247
#ifndef _DEBUG
  #ifdef DEBUG
    #define _DEBUG(fmt, args...)      printf("%s:%s:%d: "fmt, __FILE__, __FUNCTION__, __LINE__, ##args)                                                                          
  #else
    #define _DEBUG(fmt, args...)
  #endif // DEBUG
#endif // _DEBUG

/**
 * @brief Get pressure reading from the LPS25HB.
 * 
 * @param fd        File descriptor for the I2C bus
 * @param pressure  Returned pressure reading
 * @return int      Status flag, zero on success and -1 otherwise
 */
int get_pressure (int fd, float* pressure);

/**
 * @brief Read registers 0x2b and 0x2c and concatinate bytes to return temperature.
 * 
 * @param fd          File descriptor for the I2C bus
 * @param temperature Pointer to returned temperature reading
 * @return int        Status flag, zero on success and -1 otherwise 
 */
int get_pressure_sensor_temp (int fd, uint16_t* temperature);

/**
 * @brief Set the pressure reference registers (0x08 - 0x0A)
 * 
 * @param fd        File descriptor for the I2C bus
 * @param reference Byte array to write to registers 
 * @return int      Status flag, zero on success and -1 otherwise 
 */
int set_pressure_ref (int fd, uint8_t* reference);

/**
 * @brief Read the pressure reference registers (0x08 - 0x0A)
 * 
 * @param fd        File descriptor for the I2C bus
 * @param reference Byte array containing registers readout
 * @return int      Status flag, zero on success and -1 otherwise 
 */
int get_pressure_ref (int fd, uint8_t* reference);

/**
 * @brief Returns the contents on the who_am_i register. (hard-coded to 0XBD)
 * 
 * @param fd        File descriptor for the I2C bus
 * @param address   Address returned from who_am_i
 * @return int      Status flag, zero on success and -1 otherwise 
 */
int lps_who_am_i (int fd, uint8_t* address);

/**
 * @brief Write directly to the four control registers of the LPS25HB.
 * 
 * @param fd        File descriptor for the I2C bus
 * @param config    pointer to config data, base address corresponds to 0x20
 * @return int      Status flag, zero on success and -1 otherwise 
 */
int lps_set_ctrl (int fd, uint8_t* config);

/**
 * @brief Read directly from the four control registers of the LPS25HB.
 * 
 * @param fd        File descriptor for the I2C bus
 * @param config    pointer to config data, base address corresponds to 0x20
 * @return int      Status flag, zero on success and -1 otherwise 
 */
int lps_get_ctrl (int fd, uint8_t* config);

/**
 * @brief Read a single byte of data from the LPS25HB.
 * 
 * @param fd        File descriptor for the I2C bus
 * @param reg       Register to read data from
 * @param data      Pointer to returned byte of data
 * @return int      Status flag, zero on success and -1 otherwise
 */
int lps_byte_read (int fd, uint8_t reg, uint8_t* data);

/**
 * @brief Write a single byte of data to the PS25HB.
 * 
 * @param fd        File descriptor for the I2C bus
 * @param reg       Register to write data to
 * @param data      Byte of data to write
 * @return int      Status flag, zero on success and -1 otherwise
 */
int lps_byte_write (int fd, uint8_t reg, uint8_t data);

/**
 * @brief Read an arbitrarily large array of data from the LPS25HB.
 * 
 * @param fd        File descriptor for the I2C bus
 * @param start_reg First register to read data from
 * @param data      Pointer to an array of bytes populated by LPS25HB
 * @param bytes     Size of byte array
 * @return int      Status flag, zero on success and -1 otherwise
 */
int lps_array_read (int fd, uint8_t start_reg, uint8_t* data, uint8_t bytes);

/**
 * @brief Write an arbitrarily large array of data to the LPS25HB.
 * 
 * @param fd        File descriptor for the I2C bus
 * @param start_reg First register to write data to
 * @param data      Pointer to an array of bytes to write
 * @param bytes     Size of byte array
 * @return int      Status flag, zero on success and -1 otherwise
 */
int lps_array_write (int fd, uint8_t start_reg, uint8_t* data, uint8_t bytes);

#endif // _LPS25HB_I2C_H_