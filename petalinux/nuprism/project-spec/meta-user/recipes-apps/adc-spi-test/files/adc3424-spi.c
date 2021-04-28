#include <stdio.h>
#include <unistd.h>
#include <sys/ioctl.h>

#include "adc3424-spi.h"

/**
 * @brief Create a TX buffer to read or write data to a register within the ADC peripheral
 * 
 * TX buffer should be assembled with READ/WRITE flags being transferred first, 
 * followed by address and data. 
 * * Data bus is ignored for a read command 
 * 
 * @param command   Determines bit A16 and A15, specifies a read or write command
 * @param address   Address of the register being read or written to
 * @param data      Byte of data being written to a register, ignored in a read command
 */
#define TX_BUFFER(command, address, data) {((uint8_t)((address & 0x3F00) >> 8)) | command, \
                                           (uint8_t)(address & 0xFF), \
                                           data}

// Nominal mode init sequence
static struct adc3424_spi_prog
{
    uint16_t reg;
    uint8_t data;
} adc3424_init_sequence [] = {
    {0x001, 0xFF}, {0x003, 0x00}, {0x004, 0x00}, {0x005, 0x00}, 
    {0x006, 0x00}, {0x007, 0x00}, {0x009, 0x00}, {0x00a, 0x00}, 
    {0x00b, 0x00}, {0x00e, 0x00}, {0x00f, 0x00}, {0x013, 0x00}, 
    {0x015, 0x00}, {0x025, 0x00}, {0x027, 0x00}, {0x11d, 0x00}, 
    {0x122, 0x02}, {0x134, 0x28}, {0x139, 0x08}, {0x21d, 0x00}, 
    {0x222, 0x02}, {0x234, 0x28}, {0x239, 0x08}, {0x308, 0x00}, 
    {0x41d, 0x00}, {0x422, 0x02}, {0x434, 0x28}, {0x439, 0x08}, 
    {0x51d, 0x00}, {0x522, 0x02}, {0x534, 0x28}, {0x539, 0x08}, 
    {0x608, 0x00}, {0x70a, 0x01},
};
uint8_t adc3424_reg_count = ARRAY_SIZE(adc3424_init_sequence);

//////////////////////////////////////////////////////////////////////////////////
// Static Definitions
//////////////////////////////////////////////////////////////////////////////////

static int adc3424_spi_read_transfer (int fd, uint16_t reg, uint8_t* data)
{
    // For an adc register read, the data in the TX buffer is ignored by the adc
    DBG("adc3424_spi_read_transfer(): address=0x%x\n", reg);
    uint8_t txbuf[3] = TX_BUFFER(SPI_READ_CMD, reg, 0xFF);
    uint8_t rxbuf[3];
    int status;

    struct spi_ioc_transfer tr = {
		.tx_buf = (unsigned long)txbuf,
		.rx_buf = (unsigned long)rxbuf,
		.len = 3,
        .tx_nbits = 1,
        .rx_nbits = 1
	};

    status = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);

    if (status < 0)
    {
        perror("ioctl(SPI_IOC_MESSAGE) in adc3424_spi_read_transfer\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return status;
    }
    
    *data = rxbuf[2];

    return status;
}


static int adc3424_spi_write_transfer (int fd, uint16_t reg, uint8_t data)
{
    DBG("adc3424_spi_write_transfer(): address=0x%x, data=0x%x\n", reg, data);
    uint8_t txbuf[3] = TX_BUFFER(SPI_WRITE_CMD, reg, data);
    int status;

    struct spi_ioc_transfer tr = {
		.tx_buf = (unsigned long)txbuf,
		.rx_buf = (unsigned long)NULL,
		.len = 3,
        .tx_nbits = 1,
        .rx_nbits = 1
	};

    status = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);

    if (status < 0)
    {
        perror("ioctl(SPI_IOC_MESSAGE) in adc3424_spi_write_transfer\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
        return status;
    }

    return status;
}


static int adc3424_set_gpio (bool state, int gpio)
{
    char cmd[64];

    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", state, gpio);

    return system(cmd);
}

//////////////////////////////////////////////////////////////////////////////////
// API functions
//////////////////////////////////////////////////////////////////////////////////

int adc3424_spi_init (int fd, uint32_t mode, uint8_t bits, uint32_t speed, uint16_t delay)
{
    int status = 0;

    // spi mode
    status |= ioctl(fd, SPI_IOC_WR_MODE32, &mode);
    status |= ioctl(fd, SPI_IOC_RD_MODE32, &mode);

    if (status < 0)
    {
        printf("can't get spi mode\n");
        return status;
    }

    // bits per word
    status |= ioctl(fd, SPI_IOC_WR_BITS_PER_WORD, &bits);
    status |= ioctl(fd, SPI_IOC_RD_BITS_PER_WORD, &bits);

    if (status < 0)
    {
        printf("can't get bits per word\n");
        return status;
    }

    // max speed hz
    status |= ioctl(fd, SPI_IOC_WR_MAX_SPEED_HZ, &speed);
    status |= ioctl(fd, SPI_IOC_RD_MAX_SPEED_HZ, &speed);

    if (status < 0)
    {
        printf("can't get max speed hz\n");
        return status;
    }

    return status;
}


int adc3424_read (int fd, uint16_t reg, uint8_t* data)
{
    return adc3424_spi_read_transfer(fd, reg, data);
}


int adc3424_write (int fd, uint16_t reg, uint8_t data)
{
    return adc3424_spi_write_transfer(fd, reg, data);
}


int adc3424_enable (int adc_num)
{
    int status;
    DBG("adc3424_enable(): adc_num=%d\n", adc_num);

    if (adc_num < 0 || adc_num > 4)
    {
        printf("invalid ADC index [%d]\nValid ADCs: [0-4]\n", adc_num);
        return -1;
    }

    status = adc3424_set_gpio(false, ADC0_GPIO + adc_num);

    DBG("adc3424_enable(): ret=%d\n", ret);

    return status;
}


int adc3424_disable (int adc_num)
{
    int status;
    DBG("adc3424_disable(): adc_num=%d\n", adc_num);

    if (adc_num < 0 || adc_num > 4)
    {
        printf("invalid ADC index [%d]\nValid ADCs: [0-4]\n", adc_num);
        return -1;
    }

    status = adc3424_set_gpio(true, ADC0_GPIO + adc_num);

    DBG("adc3424_disable(): ret=%d\n", status);

    return status;
}


int adc3424_power_down (void)
{
    int status;
    DBG("adc3424_power_down(): Write true to GPIO[%d].\n", PDN_GPIO);

    status = adc3424_set_gpio(true, PDN_GPIO);

    DBG("adc3424_power_down(): ret=%d\n", status);

    return status;
}


int adc3424_power_up (void)
{
    int status;
    DBG("adc3424_power_up(): Write false to GPIO[%d].\n", PDN_GPIO);

    status = adc3424_set_gpio(false, PDN_GPIO);

    DBG("adc3424_power_up(): ret=%d\n", status);

    return status;
}


int adc3424_reset (void)
{
    int status = 0;
    DBG("adc3424_reset(): toggle GPIO[%d] to perform a hardware reset.\n", RESET_GPIO);

    status = adc3424_set_gpio(false, RESET_GPIO);

    if (status < 0)
    {
        DBG("adc3424_reset(): ret=%d\n", status);
        return status;
    }

    usleep(1);

    status = adc3424_set_gpio(true, RESET_GPIO);

    if (status < 0)
    {
        DBG("adc3424_reset(): ret=%d\n", status);
        return status;
    }

    usleep(1);

    status = adc3424_set_gpio(false, RESET_GPIO);

    DBG("adc3424_reset(): ret=%d\n", status);

    return status;
}


int adc3424_init (int fd, int adc_num)
{
    int status = 0;
    uint16_t reg;
    uint8_t data;

    DBG("adc3424_init(): num=%d\n", adc_num);
    adc3424_enable(adc_num);

    for (uint8_t i = 0; i < adc3424_reg_count; i++)
    {
        reg = adc3424_init_sequence[i].reg;
        data = adc3424_init_sequence[i].data;

        status |= adc3424_spi_write_transfer(fd, reg, data);
    }

    adc3424_disable(adc_num);
    DBG("adc3424_init(): ret=%d\n", status);

    return status;
}


int adc3424_nominal_mode (int fd, int adc_num)
{
    DBG("adc3424_nominal_mode(): num=%d\n", adc_num);

    adc3424_enable(adc_num);

    int status = adc3424_spi_write_transfer(fd, 0x06, 0x00); // Register 06h: normal output
    
    adc3424_disable(adc_num);

    return status;
}


int adc3424_set_test_pattern (int fd, int adc_num, uint8_t* test_patterns, uint16_t custom_tp)
{
    DBG("adc3424_set_test_pattern(): num=%d\n", adc_num);
    int status = 0;
    uint16_t regs[5] = {0x06, 0X0A, 0x0B, 0x0E, 0x0F};
    uint8_t data[5] = {
        0x02,
        (test_patterns[0] & 0x0F) << 4 | (test_patterns[1] & 0x0F),
        (test_patterns[2] & 0x0F) << 4 | (test_patterns[3] & 0x0F),
        custom_tp >> 4,
        (custom_tp & 0X00F) << 4
    };

    adc3424_enable(adc_num);

    for (int i = 0; i < 5; i++)
    {
        status |= adc3424_spi_write_transfer(fd, regs[i], data[i]);
    }

    adc3424_disable(adc_num);

    return status;
}


int adc3424_spi_slave_mode (int adc_num, bool value)
{
    DBG("adc3424_spi_slave_mode(%d, %d) - not implemented\n", adc_num, value);
    return 0;
}
