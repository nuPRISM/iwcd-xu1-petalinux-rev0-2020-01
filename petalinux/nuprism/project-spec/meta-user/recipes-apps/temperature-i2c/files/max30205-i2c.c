#include <stdlib.h>
#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <unistd.h>
#include <linux/i2c-dev.h>
#include <errno.h>

#include "max30205-i2c.h"

#define WRITE_BUFFER(reg, data)     {reg, (uint8_t)(data >> 8), (uint8_t)(data & 0x00FF)}
#define MAX30205_ADDRESS(sensor_no) (((uint8_t)TEMP_SENSOR_ARRAY_BASE >> 1) + sensor_no)

///////////////////////////////////////////////////////////////////
// API functions
///////////////////////////////////////////////////////////////////

uint8_t max_get_i2c_address (uint8_t sensor_no)
{
    return MAX30205_ADDRESS(sensor_no);
}


int get_temp (int fd, uint8_t sensor_no, float* temperature)
{
    uint16_t raw_data = 0xCCCC;
    float div = (1 << 8); // per datasheet

    if (max_get_register(fd, sensor_no, TEMP_REG, &raw_data) != 0)
    {
        return 1;
    }

    *temperature = (float)raw_data;
    *temperature /= div;

    return 0;
}


int max_get_config (int fd, uint8_t sensor_no, uint8_t* data)
{
    return max_read(fd, sensor_no, CONFIG_REG, data, 1);
}


int max_set_config (int fd, uint8_t sensor_no, uint8_t data)
{
    return max_write(fd, sensor_no, CONFIG_REG, &data, 1);
}


int max_get_register (int fd, uint8_t sensor_no, uint8_t reg, uint16_t* data)
{
    uint8_t byte_array[2];
    int status;
    
    status = max_read(fd, sensor_no, reg, byte_array, 2);

    if (status == 0)
    {
        *data = byte_array[0];
        *data <<= 8;
        *data |= byte_array[1];
    }

    return status;
}


int max_set_register (int fd, uint8_t sensor_no, uint8_t reg, uint16_t data)
{
    uint8_t byte_array[2] = {(uint8_t)(data >> 8), (uint8_t)(data & 0xFF)};

    return max_write(fd, sensor_no, reg, byte_array, 2);
}


int max_read (int fd, uint8_t sensor_no, uint8_t reg, uint8_t* data, uint8_t bytes)
{
    uint8_t sensor_addr = MAX30205_ADDRESS(sensor_no);
    _DEBUG("Address=0x%x, Register=0x%x\n", sensor_addr << 1, reg);

    struct i2c_msg msgs[2] = {
        {sensor_addr, 0, 1, &reg},
        {sensor_addr, I2C_M_RD, bytes, data}
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = msgs,
        .nmsgs = 2,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in max_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}


int max_write (int fd, uint8_t sensor_no, uint8_t reg, uint8_t* data, uint8_t bytes)
{
    uint8_t sensor_addr = MAX30205_ADDRESS(sensor_no);
    uint8_t* buffer = (uint8_t*)malloc((bytes + 1) * sizeof(uint8_t));

    buffer[0] = reg;
    memcpy(buffer+1, data, bytes * sizeof(uint8_t));

    _DEBUG("Address=0x%x, Register=0x%x\n", sensor_addr << 1, reg);

    struct i2c_msg msgs = {
        .addr = sensor_addr,
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
        perror("ioctl(I2C_RDWR) in max_write\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
        return -1;
    }

    free(buffer);

    return 0;
}
