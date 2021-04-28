#include <stdlib.h>
#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <unistd.h>
#include <linux/i2c-dev.h>
#include <errno.h>

#include "24aa02e48-i2c.h"

#define TO_BYTES(word)      {(uint8_t)(word >> 8), (uint8_t)(word & 0xFF)}
#define TO_WORD(bytes)      (((uint16_t)bytes[0] << 8) | (uint16_t)bytes[1])

//////////////////////////////////////////////////////////////////////////////////
// Static Definitions
//////////////////////////////////////////////////////////////////////////////////

static struct mac_24aa02e48_i2c_transfer
{
    uint8_t i2c_address;
    uint8_t base_reg;
    uint8_t* data;
    uint8_t bytes;
};


// Setting pointer resgister is a seperate function to allow for delayed reads
static int mac_24aa02e48_i2c_set_pointer (int fd, struct mac_24aa02e48_i2c_transfer* pointer)
{
    uint8_t sensor_addr = pointer->i2c_address >> 1;
    int status;

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

    status = ioctl(fd, I2C_RDWR, &msgset);

    if (status < 0)
    {
        perror("ioctl(I2C_RDWR) in ina219_write\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
    }

    return status;
}


static int mac_24aa02e48_i2c_read_transfer (int fd, struct mac_24aa02e48_i2c_transfer* request)
{
    uint8_t sensor_addr = request->i2c_address >> 1;
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


static int mac_24aa02e48_i2c_write_transfer (int fd, struct mac_24aa02e48_i2c_transfer* command)
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

int mac_24aa02e48_byte_read (int fd, uint8_t reg, uint8_t* data)
{
    struct mac_24aa02e48_i2c_transfer read = {
        .i2c_address = MAC_24AA02E48_I2C_ADDRESS,
        .base_reg = reg,
        .data = data,
        .bytes = 1,
    };
    int status;

    status = mac_24aa02e48_i2c_set_pointer(fd, &read);

    if (status < 0)
    {
        perror("Failed to set address pointer.\n");
        return status;
    }

    status = mac_24aa02e48_i2c_read_transfer(fd, &read);

    return status;
}


int mac_24aa02e48_byte_write (int fd, uint8_t reg, uint8_t data)
{
    struct mac_24aa02e48_i2c_transfer write = {
        .i2c_address = MAC_24AA02E48_I2C_ADDRESS,
        .base_reg = reg,
        .data = &data,
        .bytes = 1,
    };

    return mac_24aa02e48_i2c_write_transfer(fd, &write);
}


int mac_24aa02e48_sequential_read (int fd, uint8_t reg_start, uint8_t* data, uint8_t bytes)
{
    struct mac_24aa02e48_i2c_transfer read = {
        .i2c_address = MAC_24AA02E48_I2C_ADDRESS,
        .base_reg = reg_start,
        .data = data,
        .bytes = bytes,
    };
    int status;

    status = mac_24aa02e48_i2c_set_pointer(fd, &read);

    if (status < 0)
    {
        perror("Failed to set address pointer.\n");
        return status;
    }

    status = mac_24aa02e48_i2c_read_transfer(fd, &read);

    return status;
}


int mac_24aa02e48_page_write (int fd, uint8_t reg_start, uint8_t* data, uint8_t bytes)
{
    if (bytes > 8)
    {
        perror("Byte array size exceeds maximum page size, exiting.\n");
        return -1;
    }

    struct mac_24aa02e48_i2c_transfer write = {
        .i2c_address = MAC_24AA02E48_I2C_ADDRESS,
        .base_reg = reg_start,
        .data = data,
        .bytes = bytes,
    };

    return mac_24aa02e48_i2c_write_transfer(fd, &write);
}