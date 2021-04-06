#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <unistd.h>
#include <linux/i2c-dev.h>
#include <errno.h>

#include "hdc1080-i2c.h"

// Create a byte array using register byte and data word
#define WR_BUFF(reg, data)  {reg, (uint8_t)(data >> 8), (uint8_t)(data & 0xFF)}

// Swap bytes of a 2-byte array
#define R_BUFF_DATA(data)   (((uint16_t)data[0] << 8) | (uint16_t)data[1])


///////////////////////////////////////////////////////////////////
// Static Definitions
///////////////////////////////////////////////////////////////////

static void reverse_bytes (uint8_t* array, uint8_t bytes)
{
    for (uint8_t i = 0; i < bytes / 2; i++)
    {
        array[bytes-i-1] = array[bytes-i-1] ^ array[i];
        array[i]         = array[bytes-i-1] ^ array[i];
        array[bytes-i-1] = array[bytes-i-1] ^ array[i];
    }
}

// Internal structure for configureation 
static struct hdc1080_configuration
{
    enum resolution temp;
    enum resolution humid;
    bool dual;
    bool heater;
} config = {HIGH, HIGH, true, false};


static void hdc_usleep (enum resolution res)
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

///////////////////////////////////////////////////////////////////
// API functions
///////////////////////////////////////////////////////////////////

/**
 * @brief API to read current HDC1080 configuration 
 * 
 */

enum resolution hdc_get_temp_resolution ()
{
    return config.temp;
}


enum resolution hdc_get_humid_resolution ()
{
    return config.humid;
}


bool hdc_get_dual ()
{
    return config.dual;
}


bool hdc_get_heater ()
{
    return config.heater;
}

// End of config API

int hdc_sw_reset (int fd)
{
    uint16_t rst = 0x8000;
    int status = hdc_write(fd, 0x02, rst);

    if (status == 0)
    {
        config.dual = true;
        config.temp = HIGH;
        config.humid = HIGH;
        config.heater = false;
    }

    return status;
}


int hdc_set_mode (int fd, bool dual, bool heater, enum resolution temp_config, enum resolution humid_config)
{
    uint16_t settings = 0;
    int status;

    // Enable/disable heater
    settings |= (uint16_t)heater << 13;
    // Set acquisition mode
    settings |= (uint16_t)dual << 12;
    // Set temperature resolution
    settings |= (uint16_t)temp_config << 10;
    // Set humidity resolution
    settings |= (uint16_t)humid_config << 8;

    status = hdc_write(fd, 0x02, settings);

    if (status == 0)
    {
        config.dual = dual;
        config.temp = temp_config;
        config.humid = humid_config;
        config.heater = heater;
    }

    return status;
}


int hdc_get_mode (int fd, uint16_t* config)
{
    return hdc_read(fd, 0x02, config);
}


int get_hdc1080_temp (int fd, float* temperature)
{
    uint8_t sensor_addr = HDC1080_I2C_ADDRESS >> 1;
    uint8_t data_buffer[2];
    uint8_t reg = 0x00;
    _DEBUG("Address=0x%x, Register=0x%x\n", HDC1080_I2C_ADDRESS, reg);

    if (config.dual == false)
    {
        perror("HDC1080 is currently in dual mode.\n");
        return -1;
    }

    struct i2c_msg msgs[2] = {
        {sensor_addr, 0, 1, &reg},
        {sensor_addr, I2C_M_RD, 2, data_buffer}
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = msgs,
        .nmsgs = 1,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in hdc_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
    };

    hdc_usleep(config.temp);

    msgset.msgs = (msgs+1);
    msgset.nmsgs = 1;

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in hdc_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }
    *temperature = (float)R_BUFF_DATA(data_buffer);

    // Per datasheet
    *temperature /= (1 << 16);
    *temperature *= (float)165.00;
    *temperature -= (float)40.00;

    return 0;
}


int get_humidity (int fd, float* humidity)
{
    uint8_t sensor_addr = HDC1080_I2C_ADDRESS >> 1;
    uint8_t data_buffer[2];
    uint8_t reg = 0x01;
    _DEBUG("Address=0x%x, Register=0x%x\n", HDC1080_I2C_ADDRESS, reg);

    if (config.dual == false)
    {
        perror("HDC1080 is currently in dual mode.\n");
        return -1;
    }

    struct i2c_msg msgs[2] = {
        {sensor_addr, 0, 1, &reg},
        {sensor_addr, I2C_M_RD, 2, data_buffer}
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = msgs,
        .nmsgs = 1,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in hdc_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
    };

    hdc_usleep(config.humid);

    msgset.msgs = (msgs+1);
    msgset.nmsgs = 1;

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in hdc_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }
    *humidity = (float)R_BUFF_DATA(data_buffer);

    // Per datasheet
    *humidity /= (1 << 16);
    *humidity *= (float)100.00;

    return 0;
}


int hdc_get_all (int fd, float* temperature, float* humidity)
{
    uint8_t sensor_addr = HDC1080_I2C_ADDRESS >> 1;
    uint8_t data_buffer[4];
    uint8_t reg = 0x00;
    _DEBUG("Address=0x%x, Register=0x%x\n", HDC1080_I2C_ADDRESS, reg);

    if (config.dual == false)
    {
        perror("HDC1080 is currently in single mode.\n");
        return -1;
    }

    struct i2c_msg msgs[2] = {
        {sensor_addr, 0, 1, &reg},
        {sensor_addr, I2C_M_RD, 4, data_buffer}
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = msgs,
        .nmsgs = 1,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in hdc_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
    };

    hdc_usleep(config.temp);
    hdc_usleep(config.humid);

    msgset.msgs = (msgs+1);
    msgset.nmsgs = 1;

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in hdc_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }

    uint8_t* temp = data_buffer;
    uint8_t* humid = (data_buffer+2);

    *temperature = (float)R_BUFF_DATA(temp);
    *humidity = (float)R_BUFF_DATA(humid);

    // Per datasheet
    *temperature /= (1 << 16);
    *temperature *= (float)165.00;
    *temperature -= (float)40.00;

    // Per datasheet
    *humidity /= (1 << 16);
    *humidity *= (float)100.00;

    return 0;
}


int hdc_read (int fd, uint8_t reg, uint16_t* data)
{
    uint8_t sensor_addr = HDC1080_I2C_ADDRESS >> 1;
    uint8_t data_buffer[2];
    _DEBUG("Address=0x%x, Register=0x%x\n", HDC1080_I2C_ADDRESS, reg);

    struct i2c_msg msgs[2] = {
        {sensor_addr, 0, 1, &reg},
        {sensor_addr, I2C_M_RD, 2, data_buffer}
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = msgs,
        .nmsgs = 2,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in hdc_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }
    *data = R_BUFF_DATA(data_buffer);

    return 0;
}


int hdc_write (int fd, uint8_t reg, uint16_t data)
{
    uint8_t sensor_addr = HDC1080_I2C_ADDRESS >> 1;
    uint8_t buffer[3] = WR_BUFF(reg, data);
    _DEBUG("Address=0x%x, Register=0x%x, Data=0x%x\n", HDC1080_I2C_ADDRESS, reg, data);

    struct i2c_msg msgs = {
        .addr = sensor_addr,
        .flags = 0,
        .len = 3,
        .buf = buffer,
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = &msgs,
        .nmsgs = 1,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in hdc_write\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}
