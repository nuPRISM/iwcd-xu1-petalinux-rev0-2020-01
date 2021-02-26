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

struct init_sequence {
    uint16_t reg;
    uint8_t data;
};

struct init_sequence adc_init_sequence [] = {
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

uint8_t adc_reg_count = ARRAY_SIZE(adc_init_sequence);


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
    int ret;
    DBG("adc_enable(): adc_num=%d\n", adc_num);

    if (adc_num < 0 || adc_num > 4)
    {
        printf("invalid ADC index [%d]\nValid ADCs: [0-4]\n", adc_num);
        return -1;
    }

    char cmd[64];
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", false, (ADC0_GPIO + adc_num));

    ret = system(cmd);
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

    ret = system("echo 0 > /sys/class/gpio/gpio497/value");
    if (ret != 0)
    {
        DBG("adc_reset(): ret=%d\n", ret);
        return ret;
    }
    usleep(1);

    ret = system("echo 1 > /sys/class/gpio/gpio497/value");
    if (ret != 0)
    {
        DBG("adc_reset(): ret=%d\n", ret);
        return ret;
    }
    usleep(1);

    ret = system("echo 0 > /sys/class/gpio/gpio497/value");
    DBG("adc_reset(): ret=%d\n", ret);

    return ret;
}


int adc_read(uint16_t address, uint8_t* data)
{
    // For an adc register read, the data in the TX buffer is ignored by the adc
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

    if (ioctl(fd, SPI_IOC_MESSAGE(1), &tr) < 0)
    {
        DBG("ERR could not read adc register: %s\n", strerror(errno));
        return -1;
    }
    else
    {
        *data = rxbuf[2];
    }

    return 0;
}


int adc_write(uint16_t address, uint8_t data)
{
    uint8_t txbuf[3] = TX_BUFFER(SPI_WRITE_CMD, address, data);

    DBG("adc_write(): address=0x%x, data=0x%x\n", address, data);

    struct spi_ioc_transfer tr = {
		.tx_buf = (unsigned long)txbuf,
		.rx_buf = (unsigned long)NULL,
		.len = 3,
		.delay_usecs = delay,
		.speed_hz = speed,
		.bits_per_word = bits,
        .tx_nbits = 1,
        .rx_nbits = 1
	};

    if (ioctl(fd, SPI_IOC_MESSAGE(1), &tr) < 0)
    {
        DBG("ERR could not write to adc register: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}


int adc_init(int adc_num)
{
    int ret = 0;

    DBG("adc_init(): num=%d\n", adc_num);
    adc_enable(adc_num);

    for (uint8_t i = 0; i < adc_reg_count; i++)
    {
        ret |= adc_write(adc_init_sequence[i].reg, adc_init_sequence[i].data);
    }

    adc_disable(adc_num);
    DBG("adc_init(): ret=%d\n", ret);
    
    return ret;
}


int adc_read_back(int adc_num)
{
    uint8_t return_data = 0xCC;
    int ret = 0;

    DBG("adc_read_back(): num=%d\n", adc_num);
    adc_enable(adc_num);

    for (uint8_t i = 0; i < adc_reg_count; i++)
    {
        ret |= adc_read(adc_init_sequence[i].reg, &return_data);
        
        DBG("Read-back %s for register, 0x%x (sent=0x%x, returned=0x%x)\n",
            (return_data == adc_init_sequence[i].data ? "PASSED":"FAILED"),
            adc_init_sequence[i].reg, adc_init_sequence[i].data, return_data);

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