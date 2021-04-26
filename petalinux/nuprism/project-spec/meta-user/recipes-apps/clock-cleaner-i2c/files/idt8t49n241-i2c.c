#include <stdlib.h>
#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <unistd.h>
#include <linux/i2c-dev.h>
#include <errno.h>
#include "idt8t49n241-i2c.h"
#include "clock-cleaner-config.h"

#define WRITE_BUFFER(reg, data)     {(uint8_t)(reg >> 8), (uint8_t)(reg & 0x00FF), data}
#define READ_BUFFER(reg)            {(uint8_t)(reg >> 8), (uint8_t)(reg & 0x00FF)}

static uint16_t init_prog_size = ARRAY_SIZE(idt8T49n241_init_program);

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

//////////////////////////////////////////////////////////////////////////////////
// Static Definitions
//////////////////////////////////////////////////////////////////////////////////

static struct idt8T49n241_i2c_transfer
{
    uint16_t base_reg;
    uint8_t* data;
    uint16_t bytes;
    bool auto_increment;
};

// Developed by Luke Bidulka, TRIUMF
// Read the given I2C slave device's register and return the read value in `*result`:
static int idt8T49n241_i2c_read_transfer (int fd, struct idt8T49n241_i2c_transfer* request)
{
    uint8_t slave_addr = CLOCK_CLEANER_SLAVE_ADDR >> 1;
    uint8_t buffer[2] = READ_BUFFER(request->base_reg);
    uint16_t i2c_read_flags = I2C_M_RD;
    int status;

    if (!request->auto_increment)
    {
        i2c_read_flags |= I2C_M_NOSTART;
    }

    struct i2c_msg msgs[2] = {
        {slave_addr, 0, 2, buffer},
        {slave_addr, i2c_read_flags, request->bytes, request->data}
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = msgs,
        .nmsgs = 2,
    };

    status = ioctl(fd, I2C_RDWR, &msgset);

    if (status < 0)
    {
        perror("ioctl(I2C_RDWR) in idt8T49n241_i2c_read_transfer\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
    }

    return status;
}

// Developed by Luke Bidulka, TRIUMF
// Write to an I2C slave device's register:
static int idt8T49n241_i2c_write_transfer (int fd, struct idt8T49n241_i2c_transfer* command)
{
    uint8_t slave_addr = CLOCK_CLEANER_SLAVE_ADDR >> 1;
    uint16_t buffer_size = command->bytes + 2; // 2 comes from register address
    uint8_t* buffer = (uint8_t*)malloc(buffer_size * sizeof(uint8_t));
    int status;

    buffer[0] = (uint8_t)(command->base_reg >> 8);
    buffer[1] = (uint8_t)(command->base_reg & 0xFF);
    memcpy(buffer+2, command->data, command->bytes * sizeof(uint8_t));

    struct i2c_msg msg = {
        .addr = slave_addr,
        .flags = 0,
        .len = buffer_size,
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
        perror("ioctl(I2C_RDWR) in idt8T49n241_i2c_write_transfer()\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
    }

    return status;
}

//////////////////////////////////////////////////////////////////////////////////
// API functions
//////////////////////////////////////////////////////////////////////////////////

int idt8T49n241_byte_read (int fd, uint16_t reg, uint8_t* data)
{
    struct idt8T49n241_i2c_transfer byte_read = {
        .base_reg = reg,
        .data = data,
        .bytes = 1,
        .auto_increment = false,
    };

    return idt8T49n241_i2c_read_transfer(fd, &byte_read);
}


int idt8T49n241_byte_write (int fd, uint16_t reg, uint8_t data)
{
    struct idt8T49n241_i2c_transfer byte_write = {
        .base_reg = reg,
        .data = &data,
        .bytes = 1,
        .auto_increment = false,
    };

    return idt8T49n241_i2c_write_transfer(fd, &byte_write);
}


int idt8T49n241_array_read (int fd, uint16_t reg, uint8_t* data, uint16_t bytes)
{
    struct idt8T49n241_i2c_transfer array_read = {
        .base_reg = reg,
        .data = data,
        .bytes = bytes,
        .auto_increment = true,
    };

    return idt8T49n241_i2c_read_transfer(fd, &array_read);
}


int idt8T49n241_array_write (int fd, uint16_t reg, uint8_t* data, uint16_t bytes)
{
    struct idt8T49n241_i2c_transfer array_write = {
        .base_reg = reg,
        .data = data,
        .bytes = bytes,
        .auto_increment = false,
    };

    return idt8T49n241_i2c_write_transfer(fd, &array_write);
}


int idt8T49n241_set_state (int fd, bool state)
{
    uint8_t data = (uint8_t)(state ? CLOCK_CLEANER_START_VAL : CLOCK_CLEANER_STOP_VAL);

    return idt8T49n241_byte_write(fd, CLOCK_CLEANER_INIT_REG, data);
}


int idt8T49n241_init (int fd)
{
    int ret;
    struct idt8T49n241_i2c_transfer init_program = {
        .base_reg = 0x0000,
        .data = idt8T49n241_init_program,
        .bytes = init_prog_size,
        .auto_increment = false,
    };
    ret = idt8T49n241_i2c_write_transfer(fd, &init_program);

    _DEBUG("idt8T49n241_init(), write to 0x00 - 0x200, ret=%d\n", ret);

    if (ret == 0)
    {
        // If init sequence is successful, enable Clock cleaner
        ret = idt8T49n241_set_state(fd, ON);
    }

    return ret;
}


int idt8T49n241_read_id (int fd, struct clock_cleaner_id_s* idt8T49n241_id)
{
    uint8_t id[4];
    uint16_t id_base_reg = 0x2;

    if (idt8T49n241_array_read(fd, id_base_reg, id, 4) != 0)
    {
        return -1;
    }

    idt8T49n241_id->rev_id = REV_ID(id);
    idt8T49n241_id->dev_id = DEV_ID(id);
    idt8T49n241_id->dash_code = DASH_CODE(id);

    return 0;
}


int idt8T49n241_read_status (int fd, struct clock_cleaner_status_s* idt8T49n241_status)
{
    uint8_t status[4];

    if (idt8T49n241_array_read(fd, 0x20C, status, 2) != 0 ||
        idt8T49n241_array_read(fd, 0x210, status+2, 2) != 0)
    {
        return -1;
    }

    idt8T49n241_status->gpio = status[0] & 0x0F; 
    idt8T49n241_status->INT = (bool)(status[1] & 0x01);
    idt8T49n241_status->eep_err = (bool)((status[2] & 0x02) >> 1);
    idt8T49n241_status->boot_fail = (bool)(status[2] & 0x01);
    idt8T49n241_status->eep_done = (bool)(status[3] & 0x01);

    return 0;
}
