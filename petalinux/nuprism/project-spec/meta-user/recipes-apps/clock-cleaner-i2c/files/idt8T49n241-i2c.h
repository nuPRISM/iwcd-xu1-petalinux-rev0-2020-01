/**
 * @file clc-i2c.h
 * @author Luke Bidulka, Jake Cronin (jcronin@triumf.ca)
 * @brief Clock Cleaner userspace driver API, contains read/write function definitions
 * and programming data
 * @version 0.1
 * @date 2021-02-25
 * 
 * @copyright Copyright (c) 2021
 * 
 */

#ifndef _IDT8T49N241_I2C_H_
#define _idt8T49n241_I2C_H_

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <fcntl.h>

// I2C_DEVICE is defined the same in each sensor header
#ifndef I2C_DEVICE
  #define I2C_DEVICE "/dev/i2c-0"
#endif // I2C_DEVICE

#define CLOCK_CLEANER_SLAVE_ADDR	0xF8
#define CLOCK_CLEANER_SCLK_RATE		100000
#define CLOCK_CLEANER_INIT_REG		0x0039
#define CLOCK_CLEANER_START_VAL		0x0F
#define CLOCK_CLEANER_STOP_VAL		0x00

#define ON                          true
#define OFF                         false

// from: https://gist.github.com/jlintz/1192247
#ifndef _DEBUG
  #ifdef DEBUG
    #define _DEBUG(fmt, args...) printf("%s:%s:%d: "fmt, __FILE__, __FUNCTION__, __LINE__, ##args)                                                                          
  #else
    #define _DEBUG(fmt, args...)
  #endif // DEBUG
#endif // _DEBUG


#ifdef USE_SMBUS
  __s32 i2c_smbus_access (int file, char read_write, __u8 command, int size, union i2c_smbus_data *data);
  __s32 i2c_smbus_read_byte_data (int file, __u8 command);
  __s32 i2c_smbus_write_byte_data (int file, __u8 command, __u8 value);
#endif // USE_SMBUS

/**
 * @brief Returns the size of an array
 */
#ifndef ARRAY_SIZE
  #define ARRAY_SIZE(a)       (sizeof(a) / sizeof((a)[0]))
#endif // ARRAY_SIZE

#define REV_ID(id_data)     (id_data[0] >> 4)
#define DEV_ID(id_data)     (((uint16_t)id_data[0] << 12) | ((uint16_t)id_data[1] << 4) | ((uint16_t)id_data[2] >> 4))
#define DASH_CODE(id_data)  (((uint16_t)(id_data[2] & 0xFF) << 7) |  ((uint16_t)id_data[3] >> 1))

// Structure definitions for reading device ID and internal status registers
struct clock_cleaner_id_s
{
    uint8_t rev_id; 
    uint16_t dev_id; 
    uint16_t dash_code;
};


struct clock_cleaner_status_s
{
    uint8_t gpio;
    bool INT; 
    bool eep_err;
    bool boot_fail; 
    bool eep_done;
};

/**
 * @brief Read one byte of data from the 8T49N241 clock cleaner via I2C 
 * 
 * @param fd         File descriptor for the I2C bus
 * @param reg        Clock Cleaner register to read from
 * @param data       Data returned from register 
 * @return int       Status flag
 */
int idt8T49n241_byte_read (int fd, uint16_t reg, uint8_t *data);

/**
 * @brief Write one byte of data to the 8T49N241 clock cleaner via I2C 
 * 
 * @param fd         File descriptor for the I2C bus
 * @param reg        Clock Cleaner register to write to
 * @param data       Data sent to register 
 * @return int       Status flag
 */
int idt8T49n241_byte_write (int fd, uint16_t reg, uint8_t data);

/**
 * @brief Read an array of data from the clock cleaner starting from a specfied address
 * 
 * @param fd          File descriptor for the I2C bus
 * @param reg         Start register for the block read
 * @param data        Pointer to returned data array
 * @param bytes       Number of bytes/registers to read
 * @return int       Status flag
 */
int idt8T49n241_array_read (int fd, uint16_t reg, uint8_t* data, uint16_t bytes);

/**
 * @brief Write an array of data to the clock cleaner starting from a specified address 
 * 
 * @param fd          File descriptor for the I2C bus
 * @param reg         Start register for the block write
 * @param data        Pointer to data array to write
 * @param bytes       Number of bytes/registers to write
 * @return int        Status flag
 */
int idt8T49n241_array_write (int fd, uint16_t reg, uint8_t* data, uint16_t bytes);

/**
 * @brief Turn the clock cleaner on or off
 * 
 * @param fd          File descriptor for the I2C bus
 * @param state       on/off state
 * @return int        Status flag
 */
int idt8T49n241_set_state (int fd, bool state);


/**
 * @brief Executes the clock cleaner initialization program in clock-cleaner-config.h
 * 
 * @param fd          File descriptor for the I2C bus
 * @return int        Status flag
 */
int idt8T49n241_init (int fd);

/**
 * @brief 
 * 
 * @param fd              File descriptor for the I2C bus
 * @param idt8T49n241_id  Clock Cleaner id inforamtion structure
 * @return int            Status flag
 */
int idt8T49n241_read_id (int fd, struct clock_cleaner_id_s* idt8T49n241_id);


/**
 * @brief Read the status flags 
 * 
 * @param fd          File descriptor for the I2C bus
 * @param idt8T49n241_status  Clock cleaner status flags structure 
 * @return int        Status flag
 */
int idt8T49n241_read_status (int fd, struct clock_cleaner_status_s* idt8T49n241_status);

#endif // _IDT8T49N241_I2C_H_