#include <stdlib.h>
#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <unistd.h>
#include <linux/i2c-dev.h>
#include <errno.h>

#include "hdc1080-i2c.h"

#define TO_BYTES(word)      {(uint8_t)(word >> 8), (uint8_t)(word & 0xFF)}
#define TO_WORD(bytes)      (((uint16_t)bytes[0] << 8) | (uint16_t)bytes[1])

#define TEMPERATURE(temp)   ((temp * 165.0F / 65536.0F) - 40.0F)
#define HUMIDITY(humid)     (humid * 100.0F / 65536.0F)

//////////////////////////////////////////////////////////////////////////////////
// Static Definitions
//////////////////////////////////////////////////////////////////////////////////

static struct hdc1080_i2c_transfer
{
    uint8_t base_reg;
    uint8_t* data;
    uint8_t bytes;
};


static void hdc1080_usleep (enum resolution res)
{
    int delay;
    int padding = 2500; // Datasheet specified values didn't work

    switch (res)
    {
        case HIGH:
        delay = 6500;
        break;

        case MED:
        delay = 3850; 
        break; 

        case LOW:
        delay = 2500;
        break;
    }

    usleep(delay + padding);
}

// Setting pointer resgister is a seperate function to allow for delayed reads
static int hdc1080_i2c_set_pointer (int fd, struct hdc1080_i2c_transfer* pointer)
{
    uint8_t sensor_addr = HDC1080_I2C_ADDRESS >> 1;

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
        perror("ioctl(I2C_RDWR) in hdc1080_i2c_set_pointer\n");
        printf("ERR couldn't set pointer register: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}


static int hdc1080_i2c_read_transfer (int fd, struct hdc1080_i2c_transfer* request)
{
    uint8_t sensor_addr = HDC1080_I2C_ADDRESS >> 1;
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
        perror("ioctl(I2C_RDWR) in hdc1080_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}


static int hdc1080_i2c_write_transfer (int fd, struct hdc1080_i2c_transfer* command)
{
    uint8_t sensor_addr = HDC1080_I2C_ADDRESS >> 1;
    _DEBUG("Address=0x%x, Register=0x%x\n", HDC1080_I2C_ADDRESS, command->base_reg);

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
        perror("ioctl(I2C_RDWR) in hdc1080_write\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
        return -1;
    }

    free(buffer);

    return 0;
}

//////////////////////////////////////////////////////////////////////////////////
// API functions
//////////////////////////////////////////////////////////////////////////////////

int hdc1080_read (int fd, uint8_t reg, uint16_t* data)
{
    uint8_t data_buffer[2];
    struct hdc1080_i2c_transfer read = {
        .base_reg = reg,
        .data = data_buffer,
        .bytes = 2,
    };
    int ret;

    ret = hdc1080_i2c_set_pointer(fd, &read);
    ret |= hdc1080_i2c_read_transfer(fd, &read);

    if (ret == 0)
    {
        *data = TO_WORD(data_buffer);
    }

    return ret;
}


int hdc1080_write (int fd, uint8_t reg, uint16_t data)
{
    uint8_t data_buffer[2] = TO_BYTES(data);

    struct hdc1080_i2c_transfer write = {
        .base_reg = reg,
        .data = data_buffer,
        .bytes = 2,
    };

    return hdc1080_i2c_write_transfer(fd, &write);
}


int hdc1080_sw_reset (int fd)
{
    uint8_t rst[2] = {0x80, 0x00};
    struct hdc1080_i2c_transfer reset = {
        .base_reg = 0x02,
        .data = rst,
        .bytes = 2,
    };

    return hdc1080_i2c_write_transfer(fd, &reset);
}


int hdc1080_set_configuration (int fd, uint16_t config_setting)
{
    uint8_t byte_array[2] = {(uint8_t)(config_setting >> 8), (uint8_t)(config_setting & 0x00FF)};
    struct hdc1080_i2c_transfer config = {
        .base_reg = 0x02,
        .data = byte_array,
        .bytes = 2,
    };

    return hdc1080_i2c_write_transfer(fd, &config);
}


int hdc1080_get_configuration (int fd, uint16_t* config)
{
    uint8_t byte_array[2];
    int ret;
    struct hdc1080_i2c_transfer read_config = {
        .base_reg = 0x02,
        .data = byte_array,
        .bytes = 2,
    };

    ret = hdc1080_i2c_set_pointer(fd, &read_config);
    ret |= hdc1080_i2c_read_transfer(fd, &read_config);

    if (ret == 0)
    {
        *config = TO_WORD(byte_array);
    }

    return ret;
}


int get_hdc1080_temp (int fd, float* temperature)
{
    uint8_t data_buffer[2];
    uint16_t config;
    enum resolution resolution;
    bool dual;
    int ret;

    struct hdc1080_i2c_transfer get_temp = {
        .base_reg = 0x00,
        .data = data_buffer,
        .bytes = 2,
    };

    ret = hdc1080_get_configuration(fd, &config);

    dual = (bool)((config >> 12) & 0x0001);
    resolution = (config >> 10) & 0x0001;

    printf("%d\n", config);

    if ((config & 0x1000) > 0 || ret != 0)
    {
        perror("HDC1080 is currently in dual mode.\n");
        return -1;
    }

    ret = hdc1080_i2c_set_pointer(fd, &get_temp);

    hdc1080_usleep(resolution);

    ret |= hdc1080_i2c_read_transfer(fd, &get_temp);

    if (ret == 0)
    {
        *temperature = TEMPERATURE((float)TO_WORD(data_buffer));
    }

    return 0;
}


int get_humidity (int fd, float* humidity)
{
    uint8_t data_buffer[2];
    uint16_t config;
    enum resolution resolution;
    bool dual;
    int ret;

    struct hdc1080_i2c_transfer get_humid = {
        .base_reg = 0x01,
        .data = data_buffer,
        .bytes = 2,
    };

    ret = hdc1080_get_configuration(fd, &config);

    dual = (bool)((config >> 12) & 0x0001);
    resolution = (config >> 8) & 0x0003;

    printf("%d\n", config);

    if ((config & 0x1000) > 0 || ret != 0)
    {
        perror("HDC1080 is currently in dual mode.\n");
        return -1;
    }

    ret = hdc1080_i2c_set_pointer(fd, &get_humid);

    hdc1080_usleep(resolution);

    ret |= hdc1080_i2c_read_transfer(fd, &get_humid);

    if (ret == 0)
    {
        *humidity = HUMIDITY((float)TO_WORD(data_buffer));
    }

    return 0;
}


int hdc1080_get_all (int fd, float* temperature, float* humidity)
{
    uint8_t data_buffer[4];
    uint16_t config;
    enum resolution temp_res, humid_res;
    bool dual;
    int ret;

    struct hdc1080_i2c_transfer get_all = {
        .base_reg = 0x00,
        .data = data_buffer,
        .bytes = 4,
    };

    ret = hdc1080_get_configuration(fd, &config);

    dual = (bool)((config >> 12) & 0x0001);
    temp_res = (config >> 10) & 0x0001;
    humid_res = (config >> 8) & 0x0003;

    printf("%d\n", config);

    if ((config & 0x1000) == 0 || ret != 0)
    {
        perror("HDC1080 is currently in single mode.\n");
        return -1;
    }

    ret = hdc1080_i2c_set_pointer(fd, &get_all);

    hdc1080_usleep(temp_res);
    hdc1080_usleep(humid_res);

    ret |= hdc1080_i2c_read_transfer(fd, &get_all);

    *temperature = (float)TO_WORD(data_buffer);
    *humidity = (float)TO_WORD((uint8_t*)(data_buffer+2));

    if (ret == 0)
    {
        *temperature = TEMPERATURE(*temperature);
        *humidity = HUMIDITY(*humidity);
    }

    return 0;
}
