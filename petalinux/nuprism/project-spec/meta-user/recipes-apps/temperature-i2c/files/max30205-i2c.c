#include <stdlib.h>
#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <unistd.h>
#include <linux/i2c-dev.h>
#include <errno.h>

#include "max30205-i2c.h"

#define WRITE_BUFFER(reg, data)     {reg, (uint8_t)(data >> 8), (uint8_t)(data & 0x00FF)}

#define MAX30205_ADDRESS(sensor_no) (((uint8_t)MAX30205_ARRAY_BASE >> 1) + sensor_no)

//////////////////////////////////////////////////////////////////////////////////
// Static Definitions
//////////////////////////////////////////////////////////////////////////////////

/**
 * @brief Structure containing necessary information for a MAX30205 I2C transfer
 * 
 */
static struct max30205_i2c_transfer_s
{
    uint8_t sensor_index;
    uint8_t base_register;
    uint8_t* data;
    uint8_t bytes;
};
static float max30205_temperature_conversion = (1 << 8);


static int max30205_i2c_read_transfer (int fd, struct max30205_i2c_transfer_s* request)
{
    uint8_t sensor_addr = MAX30205_ADDRESS(request->sensor_index);
    uint8_t pointer_register = request->base_register;
    _DEBUG("Address=0x%x, Register=0x%x\n", sensor_addr << 1, reg);

    struct i2c_msg msgs[2] = {
        {sensor_addr, 0, 1, &pointer_register},
        {sensor_addr, I2C_M_RD, request->bytes, request->data}
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = msgs,
        .nmsgs = 2,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in max30205_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}


static int max30205_i2c_write_transfer (int fd, struct max30205_i2c_transfer_s* command)
{
    uint8_t sensor_addr = MAX30205_ADDRESS(command->sensor_index);
    uint8_t* buffer = (uint8_t*)malloc((command->bytes + 1) * sizeof(uint8_t));

    buffer[0] = command->base_register;
    memcpy(buffer+1, command->data, command->bytes * sizeof(uint8_t));

    _DEBUG("Address=0x%x, Register=0x%x\n", sensor_addr << 1, reg);

    struct i2c_msg msgs = {
        .addr = sensor_addr,
        .flags = 0,
        .len = command->bytes + 1,
        .buf = buffer,
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = &msgs,
        .nmsgs = 1,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in max30205_write\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
        return -1;
    }

    free(buffer);

    return 0;
}

//////////////////////////////////////////////////////////////////////////////////
// API functions
//////////////////////////////////////////////////////////////////////////////////

uint8_t max30205_get_i2c_address (uint8_t sensor_no)
{
    return MAX30205_ADDRESS(sensor_no);
}


int max30205_get_temp (int fd, uint8_t sensor_no, float* temperature)
{
    uint8_t raw_temperature_data[2];
    struct max30205_i2c_transfer_s get_temp = {
        .sensor_index = sensor_no,
        .base_register = MAX30205_TEMP_REGISTER,
        .data = raw_temperature_data,
        .bytes = 2
    };
    int ret;

    ret = max30205_i2c_read_transfer(fd, &get_temp);

    if (ret == 0)
    {
        *temperature = (float)(raw_temperature_data[0] << 8);
        *temperature += (float)(raw_temperature_data[1]);

        *temperature /= max30205_temperature_conversion;
    }

    return ret;
}


int max30205_get_config (int fd, uint8_t sensor_no, uint8_t* data)
{
    struct max30205_i2c_transfer_s get_config = {
        .sensor_index = sensor_no,
        .base_register = MAX30205_CONFIG_REGISTER,
        .data = data,
        .bytes = 1
    };
    return max30205_i2c_read_transfer(fd, &get_config);
}


int max30205_set_config (int fd, uint8_t sensor_no, uint8_t data)
{
    struct max30205_i2c_transfer_s set_config = {
        .sensor_index = sensor_no,
        .base_register = MAX30205_CONFIG_REGISTER,
        .data = &data,
        .bytes = 1
    };
    return max30205_i2c_write_transfer(fd, &set_config);
}


int max30205_get_t_hyst (int fd, uint8_t sensor_no, float* t_hyst)
{
    uint8_t raw_temperature_data[2];
    struct max30205_i2c_transfer_s get_t_hyst = {
        .sensor_index = sensor_no,
        .base_register = MAX30205_T_HYST_REGISTER,
        .data = raw_temperature_data,
        .bytes = 2
    };
    int ret;

    ret = max30205_i2c_read_transfer(fd, &get_t_hyst);

    if (ret == 0)
    {
        *t_hyst = (float)(raw_temperature_data[0] << 8);
        *t_hyst += (float)(raw_temperature_data[1]);

        *t_hyst /= max30205_temperature_conversion;
    }

    return ret;
}


int max30205_set_t_hyst (int fd, uint8_t sensor_no, float t_hyst)
{
    uint16_t unsigned_data = (uint16_t)(t_hyst * max30205_temperature_conversion);
    uint8_t data_buffer[2] = {(uint8_t)(unsigned_data >> 8), (uint8_t)(unsigned_data & 0xFF)};

    struct max30205_i2c_transfer_s set_t_hyst = {
        .sensor_index = sensor_no,
        .base_register = MAX30205_T_HYST_REGISTER,
        .data = data_buffer,
        .bytes = 2
    };
    return max30205_i2c_write_transfer(fd, &set_t_hyst);
}


int max30205_get_t_os (int fd, uint8_t sensor_no, float* t_os)
{
    uint8_t raw_temperature_data[2];
    struct max30205_i2c_transfer_s get_t_os = {
        .sensor_index = sensor_no,
        .base_register = MAX30205_T_OS_REGISTER,
        .data = raw_temperature_data,
        .bytes = 2
    };
    int ret;

    ret = max30205_i2c_read_transfer(fd, &get_t_os);

    if (ret == 0)
    {
        *t_os = (float)(raw_temperature_data[0] << 8);
        *t_os += (float)(raw_temperature_data[1]);

        *t_os /= max30205_temperature_conversion;
    }

    return ret;
}


int max30205_set_t_os (int fd, uint8_t sensor_no, float t_os)
{
    uint16_t unsigned_data = (uint16_t)(t_os * max30205_temperature_conversion);
    uint8_t data_buffer[2] = {(uint8_t)(unsigned_data >> 8), (uint8_t)(unsigned_data & 0xFF)};

    struct max30205_i2c_transfer_s set_t_os = {
        .sensor_index = sensor_no,
        .base_register = MAX30205_T_OS_REGISTER,
        .data = data_buffer,
        .bytes = 2
    };
    return max30205_i2c_write_transfer(fd, &set_t_os);
}
