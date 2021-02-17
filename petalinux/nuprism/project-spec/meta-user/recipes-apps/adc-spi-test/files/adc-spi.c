/*
* Copyright (C) 2013 - 2016  Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without restriction,
* including without limitation the rights to use, copy, modify, merge,
* publish, distribute, sublicense, and/or sell copies of the Software,
* and to permit persons to whom the Software is furnished to do so,
* subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included
* in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
* IN NO EVENT SHALL XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
* CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in this
* Software without prior written authorization from Xilinx.
*
*/

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#define DEBUG // this should be defined in adc-spi-test.c
#include <sys/ioctl.h>

#include "adc-spi.h"

// spi-dev configurations
static uint32_t mode = SPI_CS_HIGH;
static uint8_t bits = 8;
static uint32_t speed = 500000;
static uint16_t delay = 0;

static int fd;

uint16_t adc_reg_addr[] = {0x1, 0x3, 0x4, 0x5, 0x6, 0x7, 0x9, 0xa, 0xb, 0xe, 0xf, 0x13, 0x15, 0x25, 0x27,
                           0x11d, 0x122, 0x134, 0x139, 0x21d, 0x222, 0x234, 0x239, 0x308, 0x41d, 0x422,
                           0x434, 0x439, 0x51d, 0x522, 0x534, 0x539, 0x608, 0x70a};

uint8_t adc_cfg_data[]  = {0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
                           0x0, 0x2, 0x28, 0x8, 0x0, 0x2, 0x28, 0x8, 0x0, 0x0, 0x2, 0x28, 0x8, 0x0, 0x2,
                           0x28, 0x8, 0x0, 0x1};

uint8_t adc_register_count = ARRAY_SIZE(adc_reg_addr);

void adc_set_mode(int spidev_mode)
{
    mode = spidev_mode;
}


void adc_set_bits(int spidev_bits_per_word)
{
    bits = spidev_bits_per_word;
}


void adc_set_speed(int spidev_speed)
{
    if (spidev_speed > MAX_SPI_SPEED_HZ || spidev_speed < MIN_SPI_SPEED_HZ)
    {
        printf("Chosen SCLK of %d Hz is invalic.\n", spidev_speed);
        return;
    }

    speed = spidev_speed;
}


void adc_set_delay(int spidev_delay)
{
    delay = spidev_delay;
}


int adc_enable(int adc_num)
{
    DBG("adc_enable(): adc_num=%d\n", adc_num);

    if (adc_num < 0 || adc_num > 4)
    {
        printf("invalid ADC index [%d]\nValid ADCs: [0-4]\n", adc_num);
        return -1;
    }

    char cmd[64];
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", false, (ADC0_GPIO + adc_num));

    int ret = system(cmd);
    DBG("adc_enable(): ret=%d\n", ret);

    return ret;
}


int adc_disable(int adc_num)
{
    int ret;
    DBG("adc_disable(): adc_num=%d\n", adc_num);

    if (adc_num < 0 || adc_num > 4)
    {
        printf("invalid ADC index [%d]\nValid ADCs: [0-4]\n", adc_num);
        return -1;
    }

    char cmd[64];
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", true, (ADC0_GPIO + adc_num));

    ret = system(cmd);
    DBG("adc_disable(): ret=%d\n", ret);

    return ret;
}


int adc_power_down()
{
    int ret;
    DBG("adc_power_down(): Write true to GPIO[%d].\n", PDN_GPIO);

    char cmd[64];
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", true, PDN_GPIO);

    ret = system(cmd);
    DBG("adc_power_down(): ret=%d\n", ret);

    return ret;
}


int adc_power_up()
{
    int ret;
    DBG("adc_power_up(): Write false to GPIO[%d].\n", PDN_GPIO);

    char cmd[64];
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", false, PDN_GPIO);

    ret = system(cmd);
    DBG("adc_power_up(): ret=%d\n", ret);

    return ret;
}


int adc_reset()
{
    int ret = 0;
    DBG("adc_reset(): toggle GPIO[%d] to perform a hardware reset.\n", RESET_GPIO);

    ret |= system("echo 0 > /sys/class/gpio/gpio497/value");
    if (ret != 0)
    {
        DBG("adc_reset(): ret=%d\n", ret);
        return ret;
    }
    usleep(1);

    ret |= system("echo 1 > /sys/class/gpio/gpio497/value");
    if (ret != 0)
    {
        DBG("adc_reset(): ret=%d\n", ret);
        return ret;
    }
    usleep(1);

    ret |= system("echo 0 > /sys/class/gpio/gpio497/value");
    DBG("adc_reset(): ret=%d\n", ret);

    return ret;
}


int adc_read(uint16_t address, uint8_t* data)
{
    // For an adc register read, the data in the TX is ignored by the adc
    uint8_t txbuf[3] = TX_BUFFER(SPI_READ_CMD, address, 0xFF);
    uint8_t rxbuf[3] = {0};
    DBG("adc_read(): address=0x%x\n", address);

    struct spi_ioc_transfer tr = {
		.tx_buf = (unsigned long)txbuf,
		.rx_buf = (unsigned long)rxbuf,
		.len = 3,
		.delay_usecs = delay,
		.speed_hz = speed,
		.bits_per_word = bits,
        .tx_nbits = 1,
        .rx_nbits = 1
	};
    int ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);

    DBG("adc_read(): ret=%d\n", ret);

    if (ret >= 0)
    {
        *data = rxbuf[2];
    }

    return ret;
}


int adc_write(uint16_t address, uint8_t data)
{
    uint8_t txbuf[3] = TX_BUFFER(SPI_WRITE_CMD, address, data);
    uint8_t rxbuf[3] = {0};
    DBG("adc_write(): address=0x%x, data=0x%x\n", address, data);

    struct spi_ioc_transfer tr = {
		.tx_buf = (unsigned long)txbuf,
		.rx_buf = (unsigned long)rxbuf,
		.len = 3,
		.delay_usecs = delay,
		.speed_hz = speed,
		.bits_per_word = bits,
        .tx_nbits = 1,
        .rx_nbits = 1
	};

    int ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);

    DBG("adc_write(): ret=%d\n", ret);

    return ret;
}


int adc_init(int adc_num, uint8_t cfg_data[], uint8_t data_size)
{
    int ret = 0;

    if (data_size != adc_register_count)
    {
        DBG("adc_read_back(): Size mismatch between data (%d) and register map (%d).\n", data_size, adc_register_count);
        return -1;
    }

    DBG("adc_init(): num=%d\n", adc_num);
    adc_enable(adc_num);

    for (uint8_t i = 0; i < adc_register_count; i++)
    {
        ret |= adc_write(adc_reg_addr[i], cfg_data[i]);
    }

    adc_disable(adc_num);
    DBG("adc_init(): ret=%d\n", ret);
    
    return ret;
}


int adc_read_back(int adc_num, uint8_t cfg_data[], uint8_t data_size)
{
    uint8_t return_data = 0xCC;
    int ret = 0;

    if (data_size != adc_register_count)
    {
        DBG("adc_read_back(): Size mismatch between data (%d) and register map (%d).\n", data_size, adc_register_count);
        return -1;
    }

    DBG("adc_read_back(): num=%d\n", adc_num);
    adc_enable(adc_num);

    for (uint8_t i = 0; i < adc_register_count; i++)
    {
        ret |= adc_read(adc_reg_addr[i], &return_data);
        
        printf("Read-back %s for register, 0x%x (sent=0x%x, returned=0x%x\n", 
                (return_data == cfg_data[i] ? "PASSED":"FAILED"), 
                adc_reg_addr[i], cfg_data[i], return_data);

        return_data = 0xCC;
    }

    adc_disable(adc_num);
    DBG("adc_read_back(): ret=%d\n", ret);
    
    return ret;
}


void adc_nominal_mode(int adc_num)
{
    DBG("adc_nominal_mode(): num=%d\n", adc_num);

    adc_enable(adc_num);

    int ret = adc_write(0x06, 0x00); // Register 06h: normal output
    DBG("adc_test: reg 06h, ret=%d\n", ret);
    
    adc_disable(adc_num);
}


int adc_spi_slave_mode(int adc_num, bool value)
{
    DBG("adc_spi_slave_mode(%d, %d) - not implemented\n", adc_num, value);
    return 0;
}


int adc_open(char device_name[])
{
    fd = open(device_name, O_RDWR);
    if (fd == -1)
    {
        printf("Cannot open device, \"%s\"\n", device_name);
        return -1;
    }

    return 0;
}


void adc_close()
{
    close(fd);
}


int adc_spi_init()
{
    int status = 0;

    // spi mode
    status |= ioctl(fd, SPI_IOC_WR_MODE32, &mode);
    status |= ioctl(fd, SPI_IOC_RD_MODE32, &mode);
    if (status == -1)
    {
        printf("can't get spi mode\n");
        return status;
    }

    // bits per word
    status |= ioctl(fd, SPI_IOC_WR_BITS_PER_WORD, &bits);
    status |= ioctl(fd, SPI_IOC_RD_BITS_PER_WORD, &bits);
    if (status == -1)
    {
        printf("can't get bits per word\n");
        return status;
    }

    // max speed hz
    status |= ioctl(fd, SPI_IOC_WR_MAX_SPEED_HZ, &speed);
    status |= ioctl(fd, SPI_IOC_RD_MAX_SPEED_HZ, &speed);
    if (status == -1)
    {
        printf("can't get max speed hz\n");
        return status;
    }

    return status;
}