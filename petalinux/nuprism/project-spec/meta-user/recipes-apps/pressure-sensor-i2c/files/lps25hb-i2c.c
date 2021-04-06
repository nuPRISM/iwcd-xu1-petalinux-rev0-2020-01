#include <stdlib.h>
#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <linux/i2c-dev.h>
#include <errno.h>

#include "lps25hb-i2c.h"

///////////////////////////////////////////////////////////////////
// Static Definitions
///////////////////////////////////////////////////////////////////

// Primative hash map indicating which registers can be written to
static bool valid_registers[59];
static bool registers_ready = false; 

/** 
 * @brief Per datasheet, unit could be permanently damaged if a reserved 
 * register is written to.
 * 
 * Use a primative hash table to make sure a write will not damage device
 */
static void init_register_map ()
{
    uint8_t write_true[14] = {
        0x08, 0x09, 0x0A, 0x10, 
        0x20, 0x21, 0x22, 0x23, 
        0x24, 0x2E, 0x30, 0x31,
        0x39, 0x3A
    };

    for (uint8_t r = 0; r < 14; r++)
    {
        valid_registers[write_true[r]] = true;
    }
    registers_ready = true;
}

/**
 * @brief Iterates through registers to ensure all support write operations 
 * 
 * @param reg       Starting register
 * @param offset    number of registers in a sequence 
 * @return true     Registers can be written to
 * @return false    One or more register cannot be written to
 */
static bool is_valid_register (uint8_t start_reg, uint8_t offset)
{
    for (uint8_t reg = start_reg; (reg - start_reg) < offset; reg++)
    {
        if (!valid_registers[reg])
        {
            return false;
        }
    }
    return true;
} 

///////////////////////////////////////////////////////////////////
// API functions
///////////////////////////////////////////////////////////////////

int get_pressure (int fd, float* pressure)
{
    int raw_pressure;

    int status = lps_array_read(fd, 0x28, &raw_pressure, 3);

    if (status == 0)
    {
        *pressure = (float)raw_pressure;
        *pressure /= (float)4096.00;
    }

    return status;
}


int get_pressure_sensor_temp (int fd, uint16_t* temperature)
{
    uint8_t raw_temp[2];

    int status = lps_array_read(fd, 0x2B, raw_temp, 2);

    if (status != 0)
    {
        *temperature = raw_temp;
    }

    return status;
}


int set_pressure_ref (int fd, uint8_t* reference)
{
    return lps_array_write(fd, 0x08, reference, 3);
}


int get_pressure_ref (int fd, uint8_t* reference)
{
    return lps_array_read(fd, 0x08, reference, 3);
}


int lps_who_am_i (int fd, uint8_t* address)
{
    return lps_byte_read(fd, 0x0F, address);
}


int lps_set_ctrl (int fd, uint8_t* config)
{
    return lps_array_write(fd, 0x20, config, 4);
}


int lps_get_ctrl (int fd, uint8_t* config)
{
    return lps_array_read(fd, 0x20, config, 4);
}


int lps_byte_read (int fd, uint8_t reg, uint8_t* data)
{
    _DEBUG("Address=0x%x, Register=0x%x\n", LPS25HB_I2C_ADDRESS, reg);
    uint8_t slave_addr = (uint8_t)(LPS25HB_I2C_ADDRESS >> 1);

    struct i2c_msg msgs[2] = {
        {slave_addr, 0, 1, &reg},
        {slave_addr, I2C_M_RD, 1, data}
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = msgs,
        .nmsgs = 2,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in lps_byte_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}


int lps_byte_write (int fd, uint8_t reg, uint8_t data)
{
    _DEBUG("Address=0x%x, Register=0x%x, Data=0x%x\n", LPS25HB_I2C_ADDRESS, reg, data);
    uint8_t slave_addr = (uint8_t)(LPS25HB_I2C_ADDRESS >> 1);
    uint8_t buffer[2] = {reg, data};

    // Check register is valid to write to 
    if (!registers_ready)
    {
        init_register_map();
    }

    if (!is_valid_register(reg, 1))
    {
        printf("Attempt to write to invalid register");
        return -1;
    }

    struct i2c_msg msgs = {
        .addr = slave_addr,
        .flags = 0,
        .len = 2,
        .buf = buffer,
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = &msgs,
        .nmsgs = 1,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in lps_byte_write\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}


int lps_array_read (int fd, uint8_t start_reg, uint8_t* data, uint8_t bytes)
{
    uint8_t slave_addr = (uint8_t)(LPS25HB_I2C_ADDRESS >> 1);
    uint8_t reg = start_reg | 0x80;

    struct i2c_msg msgs[2] = {
        {slave_addr, 0, 1, &reg},
        {slave_addr, I2C_M_RD, bytes, data}
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = msgs,
        .nmsgs = 2,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in lps_array_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}


int lps_array_write (int fd, uint8_t start_reg, uint8_t* data, uint8_t bytes)
{
    uint8_t slave_addr = (uint8_t)(LPS25HB_I2C_ADDRESS >> 1);

    // Check registers are valid to write to 
    if (!registers_ready)
    {
        init_register_map();
    }

    if (!is_valid_register(start_reg, bytes))
    {
        printf("Attempt to write to invalid register");
        return -1;
    }

    uint8_t* buffer = (uint8_t*)malloc((bytes + 1) * sizeof(uint8_t));

    buffer[0] = start_reg | 0x80;
    memcpy(buffer+1, data, bytes * sizeof(uint8_t));

    struct i2c_msg msgs = {
        .addr = slave_addr,
        .flags = 0,
        .len = bytes + 1,
        .buf = buffer,
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = &msgs,
        .nmsgs = 1,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in lps_array_write\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
        return -1;
    }

    free(buffer);

    return 0;
}
