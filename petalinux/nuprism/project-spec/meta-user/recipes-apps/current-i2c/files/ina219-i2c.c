#include <stdlib.h>
#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <unistd.h>
#include <linux/i2c-dev.h>
#include <errno.h>

#include "ina219-i2c.h"

#define TO_BYTES(word)  {(uint8_t)(word >> 8), (uint8_t)(word & 0xFF)}
#define TO_WORD(bytes)  (((uint16_t)bytes[0] << 8) | (uint16_t)bytes[1])

const struct ina219_profile_s current_ldo1 = { 0x84, 0.100F};
const struct ina219_profile_s current_ldo2 = { 0x88, 1.000F};
const struct ina219_profile_s current_ldo3 = { 0x86, 200.0F};
const struct ina219_profile_s current_ldo4 = { 0x8C, 1.000F};
const struct ina219_profile_s current_ldo5 = { 0x82, 1.000F};
const struct ina219_profile_s current_ldo6 = { 0x8A, 0.100F};

const struct ina219_profile_s current_poe12 = { 0x8E, 0.050F};
const struct ina219_profile_s current_poe3p3 = { 0x90, 0.050F};

//////////////////////////////////////////////////////////////////////////////////
// Static Definitions
//////////////////////////////////////////////////////////////////////////////////

static struct ina219_i2c_transfer
{
    uint8_t i2c_address;
    uint8_t base_reg;
    uint8_t* data;
    uint8_t bytes;
};

// Setting pointer resgister is a seperate function to allow for delayed reads
static int ina219_i2c_set_pointer (int fd, struct ina219_i2c_transfer* pointer)
{
    uint8_t sensor_addr = pointer->i2c_address >> 1;

    struct i2c_msg msg = {
        .addr = sensor_addr,
        .flags = 0,
        .len = 1,
        .buf = &(pointer->base_reg),
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = &msg,
        .nmsgs = 1,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in ina219_i2c_set_pointer\n");
        printf("ERR couldn't set pointer register: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}


static int ina219_i2c_read_transfer (int fd, struct ina219_i2c_transfer* request)
{
    uint8_t sensor_addr = request->i2c_address >> 1;
    uint8_t data_buffer[2];
    int status;

    struct i2c_msg msg = {
        .addr = sensor_addr,
        .flags = I2C_M_RD,
        .len = request->bytes,
        .buf = request->data,
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = &msg,
        .nmsgs = 1,
    };

    status = ioctl(fd, I2C_RDWR, &msgset);

    if (status < 0)
    {
        perror("ioctl(I2C_RDWR) in ina219_write\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
    }

    return status;
}


static int ina219_i2c_write_transfer (int fd, struct ina219_i2c_transfer* command)
{
    _DEBUG("Address=0x%x, Register=0x%x\n", command->i2c_address, command->base_reg);
    uint8_t sensor_addr = command->i2c_address >> 1;
    int status;

    uint8_t* buffer = (uint8_t*)malloc((command->bytes + 1) * sizeof(uint8_t));

    buffer[0] = command->base_reg;
    memcpy(buffer+1, command->data, command->bytes * sizeof(uint8_t));

    struct i2c_msg msg = {
        .addr = sensor_addr,
        .flags = 0,
        .len = command->bytes + 1,
        .buf = buffer,
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = &msg,
        .nmsgs = 1,
    };

    status = ioctl(fd, I2C_RDWR, &msgset);

    free(buffer);

    if (status < 0)
    {
        perror("ioctl(I2C_RDWR) in ina219_write\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
    }

    return status;
}

//////////////////////////////////////////////////////////////////////////////////
// API functions
//////////////////////////////////////////////////////////////////////////////////

int ina219_read (int fd, const struct ina219_profile_s unit, uint8_t reg, uint16_t* data)
{
    uint8_t data_buffer[2];
    struct ina219_i2c_transfer read = {
        .i2c_address = unit.i2c_address,
        .base_reg = reg,
        .data = data_buffer,
        .bytes = 2,
    };
    int status;

    status = ina219_i2c_set_pointer(fd, &read);

    if (status < 0)
    {
        perror("Failed to set pointer address.\n");
        return status;
    }

    status = ina219_i2c_read_transfer(fd, &read);

    if (status >= 0)
    {
        *data = TO_WORD(data_buffer);
    }

    return status;
}


int ina219_write (int fd, const struct ina219_profile_s unit, uint8_t reg, uint16_t data)
{
    uint8_t data_buffer[2] = TO_BYTES(data);

    struct ina219_i2c_transfer write = {
        .i2c_address = unit.i2c_address,
        .base_reg = reg,
        .data = data_buffer,
        .bytes = 2,
    };

    return ina219_i2c_write_transfer(fd, &write);
}


int ina219_get_calibration (int fd, const struct ina219_profile_s unit, uint16_t* data)
{
    uint8_t data_buffer[2];
    struct ina219_i2c_transfer read = {
        .i2c_address = unit.i2c_address,
        .base_reg = 0x5,
        .data = data_buffer,
        .bytes = 2,
    };
    int status;

    status = ina219_i2c_set_pointer(fd, &read);

    if (status < 0)
    {
        perror("Failed to set pointer address.\n");
        return status;
    }

    status = ina219_i2c_read_transfer(fd, &read);

    if (status >= 0)
    {
        *data = TO_WORD(data_buffer);
    }

    return status;
}


int ina219_set_calibration (int fd, const struct ina219_profile_s unit, uint16_t data)
{
    uint8_t data_buffer[2] = TO_BYTES(data & 0xFFFE);

    struct ina219_i2c_transfer write = {
        .i2c_address = unit.i2c_address,
        .base_reg = 0x5,
        .data = data_buffer,
        .bytes = 2,
    };

    return ina219_i2c_write_transfer(fd, &write);
}
