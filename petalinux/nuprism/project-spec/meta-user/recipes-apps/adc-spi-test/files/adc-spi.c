#include <stdio.h>
#include <unistd.h>
#include <sys/ioctl.h>

#include "adc-spi.h"

// Nominal mode init sequence
static struct adc_spi_prog
{
    uint16_t reg;
    uint8_t data;
} adc_init_sequence [] = {
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

// spi-dev configurations
static struct spi_configuration
{
    uint32_t mode;
    uint8_t bits;
    uint32_t speed;
    uint16_t delay;
} spi_config = {SPI_CS_HIGH, 8, 500000, 0};


uint8_t adc_reg_count = ARRAY_SIZE(adc_init_sequence);


void adc_set_mode (int spidev_mode)
{
    spi_config.mode = spidev_mode;
}


void adc_set_bits (int spidev_bits_per_word)
{
    spi_config.bits = spidev_bits_per_word;
}


void adc_set_speed (int spidev_speed)
{
    if (spidev_speed > MAX_SPI_SPEED_HZ || spidev_speed < MIN_SPI_SPEED_HZ)
    {
        printf("Chosen SCLK of %d Hz is invalic.\n", spidev_speed);
        return;
    }

    spi_config.speed = spidev_speed;
}


void adc_set_delay (int spidev_delay)
{
    spi_config.delay = spidev_delay;
}


int adc_enable (int adc_num)
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


int adc_disable (int adc_num)
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


int adc_power_down (void)
{
    int ret;
    DBG("adc_power_down(): Write true to GPIO[%d].\n", PDN_GPIO);

    char cmd[64];
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", true, PDN_GPIO);

    ret = system(cmd);
    DBG("adc_power_down(): ret=%d\n", ret);

    return ret;
}


int adc_power_up (void)
{
    int ret;
    DBG("adc_power_up(): Write false to GPIO[%d].\n", PDN_GPIO);

    char cmd[64];
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", false, PDN_GPIO);

    ret = system(cmd);
    DBG("adc_power_up(): ret=%d\n", ret);

    return ret;
}


int adc_reset (void)
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


int adc_read (int fd, uint16_t reg, uint8_t* data)
{
    // For an adc register read, the data in the TX buffer is ignored by the adc
    uint8_t txbuf[3] = TX_BUFFER(SPI_READ_CMD, reg, 0xFF);
    uint8_t rxbuf[3] = {0};
    DBG("adc_read(): address=0x%x\n", reg);

    struct spi_ioc_transfer tr = {
		.tx_buf = (unsigned long)txbuf,
		.rx_buf = (unsigned long)rxbuf,
		.len = 3,
		.delay_usecs = spi_config.delay,
		.speed_hz = spi_config.speed,
		.bits_per_word = spi_config.bits,
        .tx_nbits = 1,
        .rx_nbits = 1
	};

    if (ioctl(fd, SPI_IOC_MESSAGE(1), &tr) < 0)
    {
        perror("ioctl(SPI_IOC_MESSAGE) in adc_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }
    else
    {
        *data = rxbuf[2];
    }

    return 0;
}


int adc_write (int fd, uint16_t reg, uint8_t data)
{
    uint8_t txbuf[3] = TX_BUFFER(SPI_WRITE_CMD, reg, data);

    DBG("adc_write(): address=0x%x, data=0x%x\n", reg, data);

    struct spi_ioc_transfer tr = {
		.tx_buf = (unsigned long)txbuf,
		.rx_buf = (unsigned long)NULL,
		.len = 3,
		.delay_usecs = spi_config.delay,
		.speed_hz = spi_config.speed,
		.bits_per_word = spi_config.bits,
        .tx_nbits = 1,
        .rx_nbits = 1
	};

    if (ioctl(fd, SPI_IOC_MESSAGE(1), &tr) < 0)
    {
        perror("ioctl(SPI_IOC_MESSAGE) in adc_write\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}


int adc_init (int fd, int adc_num)
{
    int ret = 0;

    DBG("adc_init(): num=%d\n", adc_num);
    adc_enable(adc_num);

    for (uint8_t i = 0; i < adc_reg_count; i++)
    {
        ret |= adc_write(fd, adc_init_sequence[i].reg, adc_init_sequence[i].data);
    }

    adc_disable(adc_num);
    DBG("adc_init(): ret=%d\n", ret);

    return ret;
}


int adc_init_all (int fd)
{
    int ret = 0; 

    for (int adc = 0; adc < ADC_COUNT; adc++)
    {
        ret |= adc_init(fd, adc);
    }

    return ret;
}


int adc_read_back (int fd, int adc_num)
{
    uint16_t reg;
    uint8_t data;
    int ret = 0;

    DBG("adc_read_back(): num=%d\n", adc_num);
    adc_enable(adc_num);

    for (uint8_t i = 0; i < adc_reg_count; i++)
    {
        reg = adc_init_sequence[i].reg;
        data = 0xCC;

        ret |= adc_read(fd, reg, &data);
        
        DBG("Read-back %s for register, 0x%x (sent=0x%x, returned=0x%x)\n",
            (data == adc_init_sequence[i].data ? "PASSED":"FAILED"),
            adc_init_sequence[i].reg, adc_init_sequence[i].data, data);
    }

    adc_disable(adc_num);
    DBG("adc_read_back(): ret=%d\n", ret);
    
    return ret;
}


void adc_nominal_mode (int fd, int adc_num)
{
    DBG("adc_nominal_mode(): num=%d\n", adc_num);

    adc_enable(adc_num);

    int ret = adc_write(fd, 0x06, 0x00); // Register 06h: normal output

    DBG("adc_test: reg 06h, ret=%d\n", ret);
    
    adc_disable(adc_num);
}


int adc_set_test_pattern (int fd, int adc_num, uint8_t* test_patterns, uint16_t custom_tp)
{
    DBG("adc_set_test_pattern(): num=%d\n", adc_num);
    int ret = 0;
    uint16_t regs[5] = {0x06, 0X0A, 0x0B, 0x0E, 0x0F};
    uint8_t data[5] = {
        0x02,
        (test_patterns[0] & 0x0F) << 4 | (test_patterns[1] & 0x0F),
        (test_patterns[2] & 0x0F) << 4 | (test_patterns[3] & 0x0F),
        custom_tp >> 4,
        (custom_tp & 0X00F) << 4
    };

    adc_enable(adc_num);

    for (int i = 0; i < 5; i++)
    {
        ret |= adc_write(fd, regs[i], data[i]);
    }

    adc_disable(adc_num);

    return ret;
}


int adc_spi_slave_mode (int adc_num, bool value)
{
    DBG("adc_spi_slave_mode(%d, %d) - not implemented\n", adc_num, value);
    return 0;
}


int adc_spi_init (int fd)
{
    int status = 0;

    // spi mode
    status |= ioctl(fd, SPI_IOC_WR_MODE32, &spi_config.mode);
    status |= ioctl(fd, SPI_IOC_RD_MODE32, &spi_config.mode);
    if (status == -1)
    {
        printf("can't get spi mode\n");
        return status;
    }

    // bits per word
    status |= ioctl(fd, SPI_IOC_WR_BITS_PER_WORD, &spi_config.bits);
    status |= ioctl(fd, SPI_IOC_RD_BITS_PER_WORD, &spi_config.bits);
    if (status == -1)
    {
        printf("can't get bits per word\n");
        return status;
    }

    // max speed hz
    status |= ioctl(fd, SPI_IOC_WR_MAX_SPEED_HZ, &spi_config.speed);
    status |= ioctl(fd, SPI_IOC_RD_MAX_SPEED_HZ, &spi_config.speed);
    if (status == -1)
    {
        printf("can't get max speed hz\n");
        return status;
    }

    return status;
}