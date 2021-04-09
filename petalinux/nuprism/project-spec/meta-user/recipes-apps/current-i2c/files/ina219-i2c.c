#include <stdlib.h>
#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <unistd.h>
#include <linux/i2c-dev.h>
#include <errno.h>

#include "ina219-i2c.h"

#define TO_BYTES(word)      {(uint8_t)(word >> 8), (uint8_t)(word & 0xFF)}
#define TO_WORD(bytes)      (((uint16_t)bytes[0] << 8) | (uint16_t)bytes[1])

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

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in ina219_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}


static int ina219_i2c_write_transfer (int fd, struct ina219_i2c_transfer* command)
{
    uint8_t sensor_addr = command->i2c_address >> 1;
    _DEBUG("Address=0x%x, Register=0x%x\n", command->i2c_address, command->base_reg);

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

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in ina219_write\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
        return -1;
    }

    free(buffer);

    return 0;
}

//////////////////////////////////////////////////////////////////////////////////
// API functions
//////////////////////////////////////////////////////////////////////////////////

int ina219_read (int fd, uint8_t reg, uint16_t* data)
{
    uint8_t data_buffer[2];
    struct ina219_i2c_transfer read = {
        //.i2c_address = ,
        .base_reg = reg,
        .data = data_buffer,
        .bytes = 2,
    };
    int ret;

    ret = ina219_i2c_set_pointer(fd, &read);
    ret |= ina219_i2c_read_transfer(fd, &read);

    if (ret == 0)
    {
        *data = TO_WORD(data_buffer);
    }

    return ret;
}


int ina219_write (int fd, uint8_t reg, uint16_t data)
{
    uint8_t data_buffer[2] = TO_BYTES(data);

    struct ina219_i2c_transfer write = {
        //.i2c_address = ,
        .base_reg = reg,
        .data = data_buffer,
        .bytes = 2,
    };

    return ina219_i2c_write_transfer(fd, &write);
}
