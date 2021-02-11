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
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>

#include <sys/ioctl.h>
#include <linux/spi/spidev.h>
#include <errno.h>

#define DEBUG

#ifdef DEBUG
    #define DBG(fmt, args...) printf("DBG: " fmt, args)                                                                          
#else
    #define DBG(fmt, args...)
#endif

#define DEFAULT_SPI_DEVICE "/dev/spidev1.0"
#define DEFAULT_SPI_DELAY 0
#define DEFAULT_SPI_SPEED 500000
#define DEFAULT_SPI_BITS_PER_WORD 8

#define SPI_READ_CMD	0xC0
#define SPI_WRITE_CMD   0x40

#define ADC0_GPIO  492
#define ADC1_GPIO  493
#define ADC2_GPIO  494
#define ADC3_GPIO  495
#define ADC4_GPIO  496
#define RESET_GPIO 497
#define PDN_GPIO   498

#define NORMAL_OP_TEST_PATTERN 0x00
#define ALL_ZEROS_TEST_PATTERN 0x11
#define ALL_ONES_TEST_PATTERN  0x22
#define TOGGLE_TEST_PATTERN    0x33

// Works when mode = 0x04
static uint32_t mode = SPI_CS_HIGH;
static uint8_t bits = 8;
static uint32_t speed = 500000;
static uint16_t delay;

static uint16_t addr;
static uint8_t value;
static int adc_num = 0;

static char device_name[64] = DEFAULT_SPI_DEVICE;
static int fd;

/**
 * Verify ADC selection and set the state accodingly
 * 
 * (Invert selection so "true" appears to select the ADC)
 */
int adc_enable(int adc_num, bool state)
{
    DBG("Write to GPIO[%d]: %s ADC [%d].\n", PDN_GPIO, (state ? "Select":"Deselect"), adc_num);

    if(adc_num < 0 || adc_num > 4)
    {
        printf("invalid ADC index [%d]\nValid ADCs: [0-4]\n", adc_num);
        return -1;
    }

    char cmd[64];
    // Invert the GPIO polarity so true appears to select a specific ADC
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", (state ? false : true), (ADC0_GPIO + adc_num));

    return system(cmd);
}


/**
 * Power down all ADC
 */
int adc_power_down()
{
    DBG("Write to GPIO[%d]: Power down all ADC.\n", PDN_GPIO);

    char cmd[64];
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", true, PDN_GPIO);

    return system(cmd);
}


/**
 * Power up all ADC
 */
int adc_power_up()
{
    DBG("Write to GPIO[%d]: Power up all ADC.\n", PDN_GPIO);

    char cmd[64];
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", false, PDN_GPIO);

    return system(cmd);
}


/**
 * Reset all ADC
 */
int adc_reset()
{
    DBG("Reset all ADC: Set and clear GPIO[%d]\n", RESET_GPIO);

    int ret = system("echo 0 > /sys/class/gpio/gpio497/value"); 
    DBG("adc_reset(): ret=%d\n", ret);
    usleep(100);
    ret = system("echo 1 > /sys/class/gpio/gpio497/value"); 
    DBG("adc_reset(): ret=%d\n", ret);
    usleep(100);
    ret = system("echo 0 > /sys/class/gpio/gpio497/value ");
    DBG("adc_reset(): ret=%d\n", ret);

    return 0;
}


/**
 * @brief Create a TX buffer to read or write data to a register within the ADC peripheral
 * 
 * TX buffer should be assembled with READ/WRITE flags being transferred first, 
 * followed by address and data. 
 * * Data bus is ignored for a read command 
 * 
 * @param buffer    A pointer to a byte array containing the TX buffer 
 * @param command   Determines bit A16 and A15, specifies a read or write command
 * @param address   Address of the register being read or written to
 * @param data      Byte of data being written to a register, ignored in a read command 
 */
static void txbuffer(uint8_t *buffer, uint8_t command, uint16_t address, uint8_t data)
{
    buffer[0] = ((uint8_t)((address & 0x3F00) >> 8)) | command;
	buffer[1] = (uint8_t)(address & 0xFF);
	buffer[2] = data;
}


/**
 * The device includes a mode where the contents of the internal registers can be read back using the SDOUT pin.
 * This readback mode may be useful as a diagnostic check to verify the serial interface communication between
 * the external controller and the ADC. The procedure to read the contents of the serial registers is as follows:
 *  1. Drive the SEN pin low.
 *  2. Set the R/W bit (A15) to 1. This setting disables any further writes to the registers.
 *  3. Set bit A14 in the address field to 1.
 *  4. Initiate a serial interface cycle specifying the address of the register (A13 to A0) whose content must be read.
 *  5. The device outputs the contents (D7 to D0) of the selected register on the SDOUT pin.
 *  6. The external controller can latch the contents at the SCLK rising edge.
 *  7. To enable register writes, reset the R/W register bit to 0.
 * 
 * @param fd        file descriptor for SPI driver
 * @param address   Address of the register being read
 * @param data      Data returned from transfer
*/
int adc_read(int fd, uint16_t address, uint8_t* data)
{
    uint8_t txbuf[3] = {0};
    uint8_t rxbuf[3] = {0};

    txbuffer(txbuf, SPI_READ_CMD, address, 0xFF);

    DBG("TX: 0x%x%x%x\n", txbuf[2], txbuf[1], txbuf[0]);

    struct spi_ioc_transfer tr = {
		.tx_buf = (unsigned long)txbuf,
		.rx_buf = (unsigned long)rxbuf,
		.len = 3,
		.delay_usecs = delay,   //DEFAULT_SPI_DELAY,
		.speed_hz = speed,      //DEFAULT_SPI_SPEED,
		.bits_per_word = bits,  //DEFAULT_SPI_BITS_PER_WORD,
        .tx_nbits = 1,
        .rx_nbits = 1
	};
    int ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
    DBG("adc_read(): ret=%d\n", ret);

    if (ret >= 0)
    {
        DBG("RX: 0x%x%x%x\n", rxbuf[2], rxbuf[1], rxbuf[0]);
        *data = rxbuf[2];
    }

    return ret;
}


/**
 * The device internal register can be programmed with these steps:
 *  1. Drive the SEN pin low,
 *  2. Set the R/W bit to 0 (bit A15 of the 16-bit address),
 *  3. Set bit A14 in the address field to 1,
 *  4. Initiate a serial interface cycle by specifying the address of the register (A13 to A0) whose content must be written, and
 *  5. Write the 8-bit data that are latched in on the SCLK rising edge.
 * 
 * @param fd        file descriptor for SPI driver
 * @param address   Address of the register being written to
 * @param data      Data being transferred
 */
int adc_write(int fd, uint16_t address, uint8_t data)
{
    uint8_t txbuf[3] = {0};
    uint8_t rxbuf[3] = {0};

    txbuffer(txbuf, SPI_WRITE_CMD, address, data);

    struct spi_ioc_transfer tr = {
		.tx_buf = (unsigned long)txbuf,
		.rx_buf = (unsigned long)rxbuf,
		.len = 3,
		.delay_usecs = delay,   //DEFAULT_SPI_DELAY,
		.speed_hz = speed,      //DEFAULT_SPI_SPEED,
		.bits_per_word = bits,  //DEFAULT_SPI_BITS_PER_WORD,
        .tx_nbits = 1,
        .rx_nbits = 1 
	};

    int ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
    DBG("adc_write(): ret=%d\n", ret);

    return ret;
}


/**
 * Write specific data to all ADC
 * 
 * Address        Data
 * ====================
 *  0x001         0xFF
 *  0x003         0x00
 *  0x004         0x00
 *  0x005         0x00
 *  0x006         0x00
 *  0x007         0x00
 *  0x009         0x00
 *  0x00a         0x00
 *  0x00b         0x00
 *  0x00e         0x00
 *  0x00f         0x00
 *  0x013         0x00
 *  0x015         0x00
 *  0x025         0x00
 *  0x027         0x00
 *  0x11d         0x00
 *  0x122         0x02
 *  0x134         0x28
 *  0x139         0x08
 *  0x21d         0x00
 *  0x222         0x02
 *  0x234         0x28
 *  0x239         0x08
 *  0x308         0x00
 *  0x41d         0x00
 *  0x422         0x02
 *  0x434         0x28
 *  0x439         0x08
 *  0x51d         0x00
 *  0x522         0x02
 *  0x534         0x28
 *  0x539         0x08
 *  0x608         0x00
 *  0x70a         0x01
 */
int adc_init(int fd, int adc_num)
{
    uint16_t adc_init_cfg_addr [] = {0x1, 0x3, 0x4, 0x5, 0x6, 0x7, 0x9, 0xa, 0xb, 0xe, 0xf, 0x13, 0x15, 0x25, 0x27,
                                     0x11d, 0x122, 0x134, 0x139, 0x21d, 0x222, 0x234, 0x239, 0x308, 0x41d, 0x422,
                                     0x434, 0x439, 0x51d, 0x522, 0x534, 0x539, 0x608, 0x70a};

    uint8_t adc_init_cfg_data [] =  {0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
                                     0x0, 0x2, 0x28, 0x8, 0x0, 0x2, 0x28, 0x8, 0x0, 0x0, 0x2, 0x28, 0x8, 0x0, 0x2,
                                     0x28, 0x8, 0x0, 0x1};
    DBG("adc_init(): num=%d\n", adc_num);
    adc_enable(adc_num, true);

    int ret = 0;
    for(int i = 0; i < sizeof(adc_init_cfg_addr)/sizeof(uint16_t); i++)
    {
        ret |= adc_write(fd, adc_init_cfg_addr[i], adc_init_cfg_data[i]);
    }

    adc_enable(adc_num, false);
    DBG("adc_init(): ret=%d\n", ret);
    
    return ret;
}


/**
 * Configure SPI driver
 */
int adc_spi_inti()
{
    int status = 0;
    // open SPI device        
    fd = open(device_name, O_RDWR);
    if(fd == -1)
    {
        printf("Cannot open device, \"%s\"\n", device_name);
        return -1;
    }

    // spi mode
    status |= ioctl(fd, SPI_IOC_WR_MODE32, &mode);
    status |= ioctl(fd, SPI_IOC_RD_MODE32, &mode);
    if (status == -1)
    {
        printf("can't get spi mode");
        return status;
    }

    // bits per word
    status |= ioctl(fd, SPI_IOC_WR_BITS_PER_WORD, &bits);
    status |= ioctl(fd, SPI_IOC_RD_BITS_PER_WORD, &bits);
    if (status == -1)
    {
        printf("can't get bits per word");
        return status;
    }

    // max speed hz
    status |= ioctl(fd, SPI_IOC_WR_MAX_SPEED_HZ, &speed);
    status |= ioctl(fd, SPI_IOC_RD_MAX_SPEED_HZ, &speed);
    if (status == -1)
    {
        printf("can't get max speed hz");
        return status;
    }

    return status;
}


int adc_spi_slave_mode(int fd, int adc_num, bool value)
{
    DBG("adc_spi_slave_mode(%d, %d) - not implemented\n", adc_num, value);
    return 0;
}


void print_usage()
{
    printf("ADC controller - available commands:\n");
    printf("\tpdn  - power down\n");
    printf("\tpup  - power up\n");
    printf("\trst  - reset\n");
    printf("\tinit - initialization\n");
    printf("\tread - Perform single read\n");
    printf("\twr   - Perform single write\n");
}

void get_opts(int argc, char **argv)
{
    int opt;
    
	while((opt = getopt(argc, argv, "n:d:m:b:s:a:v:")) != -1)
    {
        switch(opt)
        {
            case 'n':
                adc_num = atoi(optarg);
                break;

            case 's':
                speed = atoi(optarg);
                break;

            case 'd':
                strcpy(device_name, optarg);
                break;

            case 'a':
                addr = atoi(optarg);
                break;

            case 'v':
                value = atoi(optarg);
                break;

            case ':':
                printf("option value not specified\n");
                break;
                
            case '?':
                printf("unknown option: %c\n", optopt);
                break;
        }
    }
}


int main(int argc, char **argv)
{
    int ret = 0;

    get_opts(argc, argv);
    
    if(optind < argc)
    {
        if (adc_spi_inti() != 0) return -1;

	    printf("spi mode: 0x%x\n", mode);
	    printf("bits per word: %d\n", bits);
	    printf("max speed: %d Hz (%d KHz)\n", speed, speed/1000);

        if(strcmp(argv[optind], "pdn") == 0)
        {
            ret = adc_power_down();
        }
        else if(strcmp(argv[optind], "pup") == 0)
        {
            ret = adc_power_up();
        }
        else if(strcmp(argv[optind], "rst") == 0)
        {
            ret = adc_reset();
        }
        else if(strcmp(argv[optind], "init") == 0)
        {
            ret = adc_init(fd, adc_num);
        }
        else if(strcmp(argv[optind], "read") == 0)
        {
            uint8_t data = 0xCC;
            adc_enable(adc_num, true);

            int ret = adc_read(fd, addr, &data);
            DBG("address=%d, ret=%d, value=0x%x\n", addr, ret, data);
            
            adc_enable(adc_num, false);
        }
        else if(strcmp(argv[optind], "wr") == 0)
        {
            adc_enable(adc_num, true);

            int ret = adc_write(fd, addr, value);
            DBG("address=%d, value=%d, ret=%d\n", addr, value, ret);
            
            adc_enable(adc_num, false);
        }
        else
        {
            printf("Unrecognized cmd: %s\n", argv[optind]);
            print_usage();
            return -1;
        }
        close(fd);
        return ret;
    }
    else
    {
        printf("No command specified!\n");
        print_usage();
        return -1;
    }
}