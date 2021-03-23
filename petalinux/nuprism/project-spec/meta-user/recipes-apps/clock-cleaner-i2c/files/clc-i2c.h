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

#ifndef _CLC_I2C_H_
#define _CLC_I2C_H_

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>

#define CLOCK_CLEANER_I2C_DEVICE    "/dev/i2c-0"

#define CLOCK_CLEANER_SLAVE_ADDR	0x7C
#define CLOCK_CLEANER_SCLK_RATE		100000
#define CLOCK_CLEANER_INIT_REG		0x0039
#define CLOCK_CLEANER_INIT_VAL		0x0F
#define CLOCK_CLEANER_STOP_VAL		0x00

// Number of times to write to a register before returning failed status
#define CLC_MAX_ATTEMPT             3

#define ON                          true
#define OFF                         false

#define WRITE_BUFFER(reg, data)     {(uint8_t)(reg >> 8), (uint8_t)(reg & 0x00FF), data}
#define READ_BUFFER(reg)            {(uint8_t)(reg >> 8), (uint8_t)(reg & 0x00FF)}

#define DEBUG   // remove this

// from: https://gist.github.com/jlintz/1192247
#ifdef DEBUG
  #define _DEBUG(fmt, args...)      printf("%s:%s:%d: "fmt, __FILE__, __FUNCTION__, __LINE__, ##args)                                                                          
#else
  #define _DEBUG(fmt, args...)
#endif // DEBUG

#ifdef USE_SMBUS
  __s32 i2c_smbus_access(int file, char read_write, __u8 command, int size, union i2c_smbus_data *data);
  __s32 i2c_smbus_read_byte_data(int file, __u8 command);
  __s32 i2c_smbus_write_byte_data(int file, __u8 command, __u8 value);
#endif // USE_SMBUS

/**
 * @brief Returns the size of an array
 */
#define ARRAY_SIZE(a)       (sizeof(a) / sizeof((a)[0]))

#define REV_ID(id_data)     (id_data[0] >> 4)
#define DEV_ID(id_data)     (((uint16_t)id_data[0] << 12) | ((uint16_t)id_data[1] << 4) | ((uint16_t)id_data[2] >> 4))
#define DASH_CODE(id_data)  (((uint16_t)(id_data[2] & 0xFF) << 7) |  ((uint16_t)id_data[3] >> 1))


struct clock_cleaner_id {
    uint8_t rev_id; 
    uint16_t dev_id; 
    uint16_t dash_code;
};

struct clock_cleaner_status {
    uint8_t gpio;
    bool INT; 
    bool eep_err;
    bool boot_fail; 
    bool eep_done;
};


/**
 * @brief Open the i2c device file and store the file descriptor
 * 
 * @param device string containing the device file name 
 */
void clc_open(char device[]);


/**
 * @brief Clode the Clock Cleaner file descriptor 
 * 
 */
void clc_close(void);


/**
 * @brief Read one byte of data from the 8T49N241 clock cleaner via I2C 
 * 
 * @param slave_addr  I2C address of the Clock Cleaner 
 * @param reg         Clock Cleaner register to read from
 * @param return_data Data returned from register 
 * @return int        Status flag
 */
int clc_read(uint8_t slave_addr, uint16_t reg, uint8_t *return_data);


/**
 * @brief Write one byte of data to the 8T49N241 clock cleaner via I2C 
 * 
 * @param slave_addr I2C address of the Clock Cleaner  
 * @param reg        Clock Cleaner register to write to
 * @param data       Data sent to register 
 * @return int       Status flag
 */
int clc_write(uint8_t slave_addr, uint16_t reg, uint8_t data);


/**
 * @brief 
 * 
 * @param state 
 * @return int 
 */
int clc_set_state(int state);


/**
 * @brief 
 * 
 * @return int 
 */
int clc_init(void);


/**
 * @brief 
 * 
 * @param clc_id 
 * @return int 
 */
int clc_read_id(struct clock_cleaner_id* clc_id);


/**
 * @brief 
 * 
 * @param clc_status 
 * @return int 
 */
int clc_read_status(struct clock_cleaner_status* clc_status);

#endif // _CLC_I2C_H_