#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <unistd.h>
#include <linux/i2c-dev.h>
#include <errno.h>

#include "clc-i2c.h"
#include "clock-cleaner-config.h"

#define WRITE_BUFFER(reg, data)     {(uint8_t)(reg >> 8), (uint8_t)(reg & 0x00FF), data}
#define READ_BUFFER(reg)            {(uint8_t)(reg >> 8), (uint8_t)(reg & 0x00FF)}

static uint16_t boot_sequence_size = ARRAY_SIZE(clc_boot_program);

#ifdef USE_SMBUS
__s32 i2c_smbus_access (int file, char read_write, __u8 command, int size, union i2c_smbus_data *data)
{
    struct i2c_smbus_ioctl_data args;
    __s32 err;

    args.read_write = read_write;
    args.command = command;
    args.size = size;
    args.data = data;

    err = ioctl(file, I2C_SMBUS, &args);
    if (err == -1)
    {
        _DEBUG("errno=%d (%s)\n", errno, strerror(errno));
    }
    return err;
}


__s32 i2c_smbus_read_byte_data (int file, __u8 command)
{
    union i2c_smbus_data data;
    int err;

    err = i2c_smbus_access(file, I2C_SMBUS_READ, command, I2C_SMBUS_BYTE_DATA, &data);

    if (err < 0)
    {
        return err;
    }

    return 0x0FF & data.byte;
}


__s32 i2c_smbus_write_byte_data (int file, __u8 command, __u8 value)
{
    union i2c_smbus_data data;
    data.byte = value;

    return i2c_smbus_access(file, I2C_SMBUS_WRITE, command, I2C_SMBUS_BYTE_DATA, &data);
}
#endif // USE_SMBUS

// Developed by Luke Bidulka, TRIUMF
// Read the given I2C slave device's register and return the read value in `*result`:
int clc_read (int fd, uint8_t slave_addr, uint16_t reg, uint8_t *return_data)
{
    uint8_t buffer[2] = READ_BUFFER(reg);

    struct i2c_msg msgs[2] = {
        {slave_addr, 0, 2, buffer},
        {slave_addr, (I2C_M_RD | I2C_M_NOSTART), 1, return_data}
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = msgs,
        .nmsgs = 2,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in clc_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}

// Developed by Luke Bidulka, TRIUMF
// Write to an I2C slave device's register:
int clc_write (int fd, uint8_t slave_addr, uint16_t reg, uint8_t data)
{
    uint8_t buffer[3] = WRITE_BUFFER(reg, data);
    uint8_t attempt = 0; 

    struct i2c_msg msgs = {
        .addr = slave_addr,
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
        perror("ioctl(I2C_RDWR) in clc_write\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}

int clc_set_state (int fd, int state)
{
    uint16_t _register = (uint16_t)CLOCK_CLEANER_INIT_REG;
    uint8_t data = (uint8_t)(state ? CLOCK_CLEANER_INIT_VAL : CLOCK_CLEANER_STOP_VAL);

    return clc_write(fd, CLOCK_CLEANER_SLAVE_ADDR, _register, data);
}


int clc_init (int fd)
{
    int ret = 0, status;
    uint16_t reg;
    uint8_t data;

    for (uint16_t i = 0; i < boot_sequence_size; i++)
    {
        reg = clc_boot_program[i].reg;
        data = clc_boot_program[i].data;

        status = clc_write(fd, CLOCK_CLEANER_SLAVE_ADDR, reg, data);
        _DEBUG("reg=%04x data=%02x ret=%d\n", reg, data, status);
        ret |= status;

        usleep(5000);
    }

    return ret;
}


int clc_read_id (int fd, struct clock_cleaner_id* clc_id)
{
    uint8_t id[4];
    uint16_t id_base_reg = 0x2;

    for (uint8_t i = 0; i < 4; i++)
    {
        if (clc_read(fd, CLOCK_CLEANER_SLAVE_ADDR, (uint16_t)(0x02+i), id+i) != 0)
        {
            return -1;
        }
    }
    clc_id->rev_id = REV_ID(id);
    clc_id->dev_id = DEV_ID(id);
    clc_id->dash_code = DASH_CODE(id);

    return 0;
}


int clc_read_status (int fd, struct clock_cleaner_status* clc_status)
{
    uint8_t status[4];
    uint16_t status_registers[3] = {0x20C, 0x20D, 0X210, 0X211};

    for (uint8_t i = 0; i < 4; i++)
    {
        if (clc_read(fd, CLOCK_CLEANER_SLAVE_ADDR, status_registers[i], status+i) != 0)
        {
            return -1;
        }
    }
    clc_status->gpio = status[0] & 0x0F; 
    clc_status->INT = (bool)(status[1] & 0x01);
    clc_status->eep_err = (bool)((status[2] & 0x02) >> 1);
    clc_status->boot_fail = (bool)(status[2] & 0x01);
    clc_status->eep_done = (bool)(status[3] & 0x01);

    return 0;
}