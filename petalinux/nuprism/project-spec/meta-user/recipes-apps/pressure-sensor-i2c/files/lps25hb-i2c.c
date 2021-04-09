#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <linux/i2c-dev.h>
#include <errno.h>

#include "lps25hb-i2c.h"

//////////////////////////////////////////////////////////////////////////////////
// Static Definitions
//////////////////////////////////////////////////////////////////////////////////

/**
 * @brief Structure containing necessary information for a LPS25HB I2C transfer
 * 
 */
static struct lps25hb_i2c_transfer_s
{
    uint8_t base_register;
    uint8_t* data;
    uint8_t bytes;
    bool auto_increment;
};

// Primative hash map indicating which registers can be written to
static bool valid_lps25hb_registers[59];
static bool lps25hb_registers_ready = false;

/** 
 * @brief Per datasheet, unit could be permanently damaged if a reserved 
 * register is written to.
 * 
 * Use a simple hash table to make sure a write will not damage device
 */
static void init_lps25hb_register_map ()
{
    uint8_t write_true[14] = {
        0x08, 0x09, 0x0A, 0x10, 
        0x20, 0x21, 0x22, 0x23, 
        0x24, 0x2E, 0x30, 0x31,
        0x39, 0x3A
    };

    for (uint8_t r = 0; r < 14; r++)
    {
        valid_lps25hb_registers[write_true[r]] = true;
    }
    lps25hb_registers_ready = true;

    _DEBUG("Map of valid write registers initialized.\n");
}

/**
 * @brief Iterates through registers to ensure all support write operations 
 * 
 * @param base_register     Starting register
 * @param register_offset   Number of registers in a sequence 
 * @return true             Registers can be written to
 * @return false            One or more register cannot be written to
 */
static bool is_valid_lps25hb_register (uint8_t base_register, uint8_t register_offset)
{
    for (uint8_t reg = base_register; (reg - base_register) < register_offset; reg++)
    {
        if (!valid_lps25hb_registers[reg])
        {
            return false;
        }
    }

    return true;
}

/**
 * @brief Perform the read transaction with the LPS25HB
 * 
 * @param fd        File descriptor for the I2C bus        
 * @param request   Structure containing register, data and other transaction info
 * @return int      Status flag, zero on success and -1 otherwise
 */
static int lps25hb_i2c_read_transfer (int fd, struct lps25hb_i2c_transfer_s* request)
{
    uint8_t slave_addr = (uint8_t)(LPS25HB_I2C_ADDRESS >> 1);
    uint8_t reg = request->base_register;

    if (request->auto_increment)
    {
        reg |= 0x80;
    }

    struct i2c_msg msgs[2] = {
        {slave_addr, 0, 1, &reg},
        {slave_addr, I2C_M_RD, request->bytes, request->data}
    };
    struct i2c_rdwr_ioctl_data msgset = {
        .msgs = msgs,
        .nmsgs = 2,
    };

    if (ioctl(fd, I2C_RDWR, &msgset) < 0)
    {
        perror("ioctl(I2C_RDWR) in lps25hb_i2c_read_transfer\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}

/**
 * @brief Perform a write transaction with the LPS25HB
 * 
 * @param fd        File descriptor for the I2C bus        
 * @param command   Structure containing register, data and other transaction info
 * @return int      Status flag, zero on success and -1 otherwise
 */
static int lps25hb_i2c_write_transfer (int fd, struct lps25hb_i2c_transfer_s* command)
{
    uint8_t slave_addr = (uint8_t)(LPS25HB_I2C_ADDRESS >> 1);

    // Check registers are valid to write to 
    if (!lps25hb_registers_ready)
    {
        init_lps25hb_register_map();
    }

    if (!is_valid_lps25hb_register(command->base_register, command->bytes))
    {
        printf("Attempt to write to invalid register.\n");
        return -1;
    }

    uint8_t* buffer = (uint8_t*)malloc((command->bytes + 1) * sizeof(uint8_t));

    buffer[0] = command->base_register;

    if (command->auto_increment)
    {
        buffer[0] |= 0x80;
    }

    memcpy(buffer+1, command->data, command->bytes * sizeof(uint8_t));

    struct i2c_msg msg = {
        .addr = slave_addr,
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
        perror("ioctl(I2C_RDWR) in lps25hb_i2c_write_transfer\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
        return -1;
    }

    free(buffer);

    return 0;
}

//////////////////////////////////////////////////////////////////////////////////
// API functions
//////////////////////////////////////////////////////////////////////////////////

int lps25hb_byte_read (int fd, uint8_t reg, uint8_t* data)
{
    _DEBUG("Address=0x%x, Register=0x%x\n", LPS25HB_I2C_ADDRESS, reg);
    struct lps25hb_i2c_transfer_s byte_read = {
        .base_register = reg,
        .data = data,
        .bytes = 1,
        .auto_increment = false,
    };

    return lps25hb_i2c_read_transfer(fd, &byte_read);
}


int lps25hb_byte_write (int fd, uint8_t reg, uint8_t data)
{
    _DEBUG("Address=0x%x, Register=0x%x, Data=0x%x\n", LPS25HB_I2C_ADDRESS, reg, data);
    struct lps25hb_i2c_transfer_s byte_write = {
        .base_register = reg,
        .data = &data,
        .bytes = 1,
        .auto_increment = false,
    };

    return lps25hb_i2c_write_transfer(fd, &byte_write);
}


int lps25hb_array_read (int fd, uint8_t base_reg, uint8_t* data, uint8_t bytes)
{
    _DEBUG("Address=0x%x, Register=0x%x\n", LPS25HB_I2C_ADDRESS, base_reg);
    struct lps25hb_i2c_transfer_s multi_byte_read = {
        .base_register = base_reg,
        .data = data,
        .bytes = bytes,
        .auto_increment = true,
    };
    
    return lps25hb_i2c_read_transfer(fd, &multi_byte_read);
}


int lps25hb_array_write (int fd, uint8_t base_reg, uint8_t* data, uint8_t bytes)
{
    _DEBUG("Address=0x%x, Register=0x%x\n", LPS25HB_I2C_ADDRESS, reg);
    struct lps25hb_i2c_transfer_s multi_byte_write = {
        .base_register = base_reg,
        .data = data,
        .bytes = bytes,
        .auto_increment = true,
    };

    return lps25hb_i2c_write_transfer(fd, &multi_byte_write);
}


int lps25hb_wait_for_status_ok (int fd, uint8_t status_bit, bool* status)
{
    uint8_t lps25hb_status_register = 0x27;
    uint8_t odr;
    uint32_t data_rate;
    uint8_t register_data;
    struct lps25hb_i2c_transfer_s read_odr = {
        .base_register = LPS25HB_CONFIG_REGISTER_1,
        .data = &odr,
        .bytes = 1,
        .auto_increment = false,
    };
    struct lps25hb_i2c_transfer_s status_reg = {
        .base_register = lps25hb_status_register,
        .data = &register_data,
        .bytes = 1,
        .auto_increment = false,
    };
    int ret = lps25hb_i2c_read_transfer(fd, &read_odr);

    if (ret != 0)
    {
        printf("Failed to read odr configuration.\n");
        return ret;
    }

    odr = (*(read_odr.data) & 0x7F) >> 4;

    switch (odr)
    {
        case 0:
        data_rate = 0; // odr = 0 means one-shot mode
        break;
        
        case 1:
        data_rate = 1000000; // 1-Hz measure interval
        break;

        case 2: 
        data_rate = 142858; // 7-Hz measure interval
        break;
        
        case 3:
        data_rate = 80000; // 12.5-Hz measure interval
        break;

        case 4: 
        data_rate = 40000; // 25-Hz measure interval
        break;
    }

    *status = false;

    // Check once, if not available, wait datasheet specifed delay and check once more before exiting 
    ret = lps25hb_i2c_read_transfer(fd, &status_reg);

    *status = ((register_data & status_bit) > 0) ? true : false;

    if (*status == false || ret != 0)
    {
        usleep(data_rate);
        
        ret = lps25hb_i2c_read_transfer(fd, &status_reg);

        *status = ((register_data & status_bit) > 0) ? true : false;
    }

    return ret;
}


int get_pressure (int fd, float* pressure)
{
    uint8_t lps25hb_pressure_base_register = 0x28;
    uint8_t raw_pressure_data[3];
    int signed_data;
    struct lps25hb_i2c_transfer_s read_pressure = {
        .base_register = lps25hb_pressure_base_register,
        .data = raw_pressure_data,
        .bytes = 3,
        .auto_increment = true,
    };
    int ret;
    bool measure_ready;

    ret = lps25hb_wait_for_status_ok(fd, LPS25HB_STATUS_P_DA, &measure_ready);

    if (ret != 0 || measure_ready != true)
    {
        printf("Failed to read pressure.\n");
        return ret;
    }

    ret = lps25hb_i2c_read_transfer(fd, &read_pressure);

    if (ret == 0)
    {
        signed_data = (int)raw_pressure_data[2] << 16;
        signed_data |= (int)raw_pressure_data[1] << 8;
        signed_data |= (int)raw_pressure_data[0];

        // check sign
        if ((raw_pressure_data[2] & 0x80) > 0)
        {
            signed_data |= (int)0xFF000000;
        }

        *pressure = (float)signed_data / 4096.0F;
    }

    return ret;
}


int get_pressure_sensor_temp (int fd, float* temperature)
{
    uint8_t lps25hb_temperature_base_register = 0x2B;
    uint8_t raw_temperature_data[2];
    int signed_data;
    struct lps25hb_i2c_transfer_s read_temperature = {
        .base_register = lps25hb_temperature_base_register,
        .data = raw_temperature_data,
        .bytes = 2,
        .auto_increment = true,
    };
    int ret;
    bool measure_ready;

    ret = lps25hb_wait_for_status_ok(fd, LPS25HB_STATUS_T_DA, &measure_ready);

    if (ret != 0 || measure_ready != true)
    {
        printf("Failed to read temperature.\n");
        return ret;
    }

    ret = lps25hb_i2c_read_transfer(fd, &read_temperature);

    if (ret == 0)
    {
        signed_data = (int)raw_temperature_data[1] << 8;
        signed_data |= (int)raw_temperature_data[0];

        // check sign
        if ((raw_temperature_data[1] & 0x80) > 0)
        {
            signed_data |= (int)0xFFFF0000;
        }

        *temperature = ((float)signed_data / 480.0F) + 42.5F;
    }

    return ret;
}


int lps25hb_who_am_i (int fd, uint8_t* address)
{
    return lps25hb_byte_read(fd, 0x0F, address);
}
