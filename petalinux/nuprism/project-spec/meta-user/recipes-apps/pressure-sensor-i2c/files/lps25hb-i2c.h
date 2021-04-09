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

#define LPS25HB_STATUS_P_OR 0x20
#define LPS25HB_STATUS_T_OR 0x10
#define LPS25HB_STATUS_P_DA 0x02
#define LPS25HB_STATUS_T_DA 0x01

#define LPS25HB_CONFIG_REGISTER_1 0X20
#define LPS25HB_CONFIG_REGISTER_2 0X21
#define LPS25HB_CONFIG_REGISTER_3 0X22
#define LPS25HB_CONFIG_REGISTER_4 0X23

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
 * @brief Read a single byte of data from the LPS25HB.
 * 
 * @param fd        File descriptor for the I2C bus
 * @param reg       Register to read data from
 * @param data      Pointer to returned byte of data
 * @return int      Status flag, zero on success and -1 otherwise
 */
int lps25hb_byte_read (int fd, uint8_t reg, uint8_t* data);

/**
 * @brief Write a single byte of data to the PS25HB.
 * 
 * @param fd        File descriptor for the I2C bus
 * @param reg       Register to write data to
 * @param data      Byte of data to write
 * @return int      Status flag, zero on success and -1 otherwise
 */
int lps25hb_byte_write (int fd, uint8_t reg, uint8_t data);

/**
 * @brief Read an array of data from the LPS25HB.
 * 
 * @param fd        File descriptor for the I2C bus
 * @param base_reg  First register to read data from
 * @param data      Pointer to an array of bytes populated by LPS25HB
 * @param bytes     Size of byte array
 * @return int      Status flag, zero on success and -1 otherwise
 */
int lps25hb_array_read (int fd, uint8_t base_reg, uint8_t* data, uint8_t bytes);

/**
 * @brief Write an array of data to the LPS25HB.
 * 
 * @param fd        File descriptor for the I2C bus
 * @param base_reg  First register to write data to
 * @param data      Pointer to an array of bytes to write
 * @param bytes     Size of byte array
 * @return int      Status flag, zero on success and -1 otherwise
 */
int lps25hb_array_write (int fd, uint8_t base_reg, uint8_t* data, uint8_t bytes);

/**
 * @brief Reads current output data rate config, waits for desired status flag 
 * 
 * @param fd          File descriptor for the I2C bus 
 * @param status_bit  The bit (position in byte) to wait for
 * @param status      On success, this will be set
 * @return int        Status flag, zero on success   
 */
int lps25hb_wait_for_status_ok (int fd, uint8_t status_bit, bool* status);

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
int get_pressure_sensor_temp (int fd, float* temperature);

/**
 * @brief Returns the contents on the who_am_i register. (hard-coded to 0XBD)
 * 
 * @param fd        File descriptor for the I2C bus
 * @param address   Address returned from who_am_i
 * @return int      Status flag, zero on success and -1 otherwise 
 */
int lps25hb_who_am_i (int fd, uint8_t* address);

#endif // _LPS25HB_I2C_H_