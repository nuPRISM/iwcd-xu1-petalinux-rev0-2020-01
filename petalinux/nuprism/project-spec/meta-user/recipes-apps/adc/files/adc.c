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

#include <linux/spi/spidev.h>
#include <sys/ioctl.h>

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

static uint32_t mode;
static uint8_t bits = 8;
static uint32_t speed = 500000;
static uint16_t delay;




int adc_gpio_init() {               // \todo use WZAB GPIO module
    // export gpios
    system("echo 492 > /sys/class/gpio/export");       // GPIO 0: SEL0
    system("echo 493 > /sys/class/gpio/export");       // GPIO 1: SEL1
    system("echo 494 > /sys/class/gpio/export");       // GPIO 2: SEL2
    system("echo 495 > /sys/class/gpio/export");       // GPIO 3: SEL3
    system("echo 496 > /sys/class/gpio/export");       // GPIO 4: SEL4
    system("echo 497 > /sys/class/gpio/export");       // GPIO 5: RESET - active high, pulldown resistor
    system("echo 498 > /sys/class/gpio/export");       // GPIO 6: POWER DOWN - configured via SPI (?), pulldown resistor

    // configure gpios
    system("echo out > /sys/class/gpio/gpio492/direction");
    system("echo out > /sys/class/gpio/gpio493/direction");
    system("echo out > /sys/class/gpio/gpio494/direction");
    system("echo out > /sys/class/gpio/gpio495/direction"); 
    system("echo out > /sys/class/gpio/gpio496/direction");
    system("echo out > /sys/class/gpio/gpio497/direction"); 
    system("echo out > /sys/class/gpio/gpio498/direction");

    // unset PDN - power up ADCs
    system("echo 0 > /sys/class/gpio/gpio498/value");

    // reset ADCs
    system("echo 0 > /sys/class/gpio/gpio497/value"); 
    usleep(500);
    system("echo 1 > /sys/class/gpio/gpio497/value"); 
    usleep(100);
    system("echo 0 > /sys/class/gpio/gpio497/value ");
    
    return 0;       // \todo verify all system commands
}


int adc_enable(int adc_num, bool state) {
    if(adc_num < 0 || adc_num > 4) {
        DBG("incorrect ADC num=%d\n", adc_num);
        return -1;
    }
    char cmd[64];
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", state, ADC0_GPIO + adc_num);
    int ret = system(cmd);
    DBG("adc_enable(): %s, ret=%d\n", cmd, ret);
    return ret;
}


/**
The device includes a mode where the contents of the internal registers can be read back using the SDOUT pin.
This readback mode may be useful as a diagnostic check to verify the serial interface communication between
the external controller and the ADC. The procedure to read the contents of the serial registers is as follows:
1. Drive the SEN pin low.
2. Set the R/W bit (A15) to 1. This setting disables any further writes to the registers.
3. Set bit A14 in the address field to 1.
4. Initiate a serial interface cycle specifying the address of the register (A13 to A0) whose content must be read.
5. The device outputs the contents (D7 to D0) of the selected register on the SDOUT pin.
6. The external controller can latch the contents at the SCLK rising edge.
7. To enable register writes, reset the R/W register bit to 0.
*/
int adc_read(int fd, uint16_t address, uint8_t* data) {
    return -1;
}


/**
The device internal register can be programmed with these steps:
1. Drive the SEN pin low,
2. Set the R/W bit to 0 (bit A15 of the 16-bit address),
3. Set bit A14 in the address field to 1,
4. Initiate a serial interface cycle by specifying the address of the register (A13 to A0) whose content must be written, and
5. Write the 8-bit data that are latched in on the SCLK rising edge.
 */
int adc_write(int fd, uint16_t address, uint8_t data) {
    DBG("adc_write(): address=%04x, data=%02x\n", address, data);

    uint8_t txbuf[3];
    txbuf[0] = ((uint8_t)((address & 0xFF00) >> 8)) | SPI_WRITE_CMD;
	txbuf[1] = (uint8_t)(address & 0xFF);
	txbuf[2] = data;

    struct spi_ioc_transfer tr = {
		.tx_buf = (unsigned long)txbuf,
		.rx_buf = (unsigned long)NULL,
		.len = 3,
		.delay_usecs = delay,   //DEFAULT_SPI_DELAY,
		.speed_hz = speed,      //DEFAULT_SPI_SPEED,
		.bits_per_word = bits,  //DEFAULT_SPI_BITS_PER_WORD,
        //.tx_nbits = 4,          // SPI_TX_QUAD
        //.rx_nbits = 4           // SPI_RX_QUAD
	};
    int ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
    DBG("adc_write(): ret=%d\n", ret);
    return ret;
}


int adc_power_down() {
    DBG("adc_power_down(): all ADCs - GPIO=%d\n", PDN_GPIO);
    int ret = system("echo 1 > /sys/class/gpio/gpio497/value"); 
    DBG("adc_power_down(): ret=%d\n", ret);

    return 0;
}


int adc_power_up() {
    DBG("adc_power_up(): all ADCs - GPIO=%d\n", PDN_GPIO);
    int ret = system("echo 0 > /sys/class/gpio/gpio497/value"); 
    DBG("adc_power_up(): ret=%d\n", ret);

    return 0;
}


int adc_reset() {
    DBG("adc_reset(): all ADCs - GPIO=%d\n", RESET_GPIO);

    int ret = system("echo 0 > /sys/class/gpio/gpio497/value"); 
    DBG("adc_reset(): ret=%d\n", ret);
    usleep(500);
    ret = system("echo 1 > /sys/class/gpio/gpio497/value"); 
    DBG("adc_reset(): ret=%d\n", ret);
    usleep(100);
    ret = system("echo 0 > /sys/class/gpio/gpio497/value ");
    DBG("adc_reset(): ret=%d\n", ret);

    return 0;
}


int adc_nominal_mode(int fd, int adc_num) {
    DBG("adc_nominal_mode(): num=%d\n", adc_num);

    adc_enable(adc_num, true);

    int ret = adc_write(fd, 0x06, 0x00);          // Register 06h: normal output
    DBG("adc_test: reg 06h, ret=%d\n", ret);
    
    adc_enable(adc_num, false);
    
    return 0;
}


int adc_test(int fd, int adc_num, uint8_t test_pattern) {
    DBG("adc_test(): num=%d\n", adc_num);

    adc_enable(adc_num, true);

    int ret = adc_write(fd, 0x06, 0x02);           // Register 06h: Test pattern output enabled
    DBG("adc_test: reg 06h, ret=%d\n", ret);
    ret = adc_write(fd, 0x0A, test_pattern);       // Register 0Ah: test pattern for channel A, B Toggle pattern: data alternate between 101010101010 and 010101010101 
    DBG("adc_test: reg 0Ah, ret=%d\n", ret);
    ret = adc_write(fd, 0x0B, test_pattern);       // Register 0Ah: test pattern for channel C, D Toggle pattern: data alternate between 101010101010 and 010101010101 
    DBG("adc_test: reg 0AB, ret=%d\n", ret);

    adc_enable(adc_num, false);

    return 0;
}


int adc_init(int fd, int adc_num) {
    uint16_t adc_init_cfg_addr [] = {0x1, 0x3, 0x4, 0x5, 0x6, 0x7, 0x9, 0xa, 0xb, 0xe, 0xf, 0x13, 0x15, 0x25, 0x27,
                                     0x11d, 0x122, 0x134, 0x139, 0x21d, 0x222, 0x234, 0x239, 0x308, 0x41d, 0x422,
                                     0x434, 0x439, 0x51d, 0x522, 0x534, 0x539, 0x608, 0x70a};

    uint8_t adc_init_cfg_data [] =  {0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
                                     0x0, 0x2, 0x28, 0x8, 0x0, 0x2, 0x28, 0x8, 0x0, 0x0, 0x2, 0x28, 0x8, 0x0, 0x2,
                                     0x28, 0x8, 0x0, 0x1};
    DBG("adc_init(): num=%d\n", adc_num);
    adc_enable(adc_num, true);
    int ret = 0;
    for(int i = 0; i < sizeof(adc_init_cfg_addr)/sizeof(uint16_t); i++) {
        ret |= adc_write(fd, adc_init_cfg_addr[i], adc_init_cfg_data[i]);
    }
    adc_enable(adc_num, false);
    DBG("adc_init(): ret=%d\n", ret);
    
    return ret;
}


int adc_spi_slave_mode(int fd, int adc_num, bool value) {
    DBG("adc_spi_slave_mode(%d, %d) - not implemented\n", adc_num, value);
    return 0;
}


void print_usage() {
    printf("ADC controller - available commands:\n");
    printf("\tpdn  - power down\n");
    printf("\tpup  - power up\n");
    printf("\trst  - reset\n");
    printf("\tnom  - nominal mode(?)\n");
    printf("\ttst  - toggle test pattern\n");
    printf("\ttst0 - all zeros test pattern\n");
    printf("\ttst1 - all ones test pattern\n");
    printf("\tinit - initialization\n");
    printf("\tss   - set SPI slave mode(?)\n");
    printf("\tnss  - unset SPI slave mode(?)\n");
}


int main(int argc, char **argv)
{
    int opt;
    char device_name[64] = DEFAULT_SPI_DEVICE;    
	int adc_num = 0;
    
	while((opt = getopt(argc, argv, "n:d:")) != -1) {
        switch(opt) {
            case 'n':
                adc_num = atoi(optarg);
                break;
                
            case 'd':
                strcpy(device_name, optarg);
                break;
            
            case ':':
                printf("option value not specified\n");
                break;
                
            case '?':
                printf("unknown option: %c\n", optopt);
                break;
        }
    }
    
    if(optind < argc) {
        // adc_gpio_init();  moved to the gpio_init.sh located in /etc/init.d and linked to /etc/rd5.d

        // open SPI device        
        int fd = open(device_name, O_RDWR);
        if(fd == -1) {
            DBG("can not open device: %s\n", device_name);
            return -1;
        }

        /*
	     * spi mode
	     */
	    int ret = ioctl(fd, SPI_IOC_WR_MODE32, &mode);
	    if (ret == -1) {
		    printf("can't set spi mode");
            return -1;
        }

	    ret = ioctl(fd, SPI_IOC_RD_MODE32, &mode);
	    if (ret == -1) {
		    printf("can't get spi mode");
            return -1;
        }

	    /*
	     * bits per word
	     */
	    ret = ioctl(fd, SPI_IOC_WR_BITS_PER_WORD, &bits);
	    if (ret == -1) {
		    printf("can't set bits per word");
            return -1;
        }

	    ret = ioctl(fd, SPI_IOC_RD_BITS_PER_WORD, &bits);
	    if (ret == -1) {
		    printf("can't get bits per word");
            return -1;
        }

	    /*
	     * max speed hz
	     */
	    ret = ioctl(fd, SPI_IOC_WR_MAX_SPEED_HZ, &speed);
	    if (ret == -1) {
		    printf("can't set max speed hz");
            return -1;
        }

	    ret = ioctl(fd, SPI_IOC_RD_MAX_SPEED_HZ, &speed);
	    if (ret == -1) {
		    printf("can't get max speed hz");
            return -1;
        }

	    printf("spi mode: 0x%x\n", mode);
	    printf("bits per word: %d\n", bits);
	    printf("max speed: %d Hz (%d KHz)\n", speed, speed/1000);

        if(strcmp(argv[optind], "pdn") == 0) {
            ret = adc_power_down();
        } else if(strcmp(argv[optind], "pup") == 0) {
            ret = adc_power_up();
        } else if(strcmp(argv[optind], "rst") == 0) {
            ret = adc_reset();
        } else if(strcmp(argv[optind], "nom") == 0) {
            ret = adc_nominal_mode(fd, adc_num);
        } else if(strcmp(argv[optind], "tst") == 0) {
            ret = adc_test(fd, adc_num, TOGGLE_TEST_PATTERN);
        } else if(strcmp(argv[optind], "tst0") == 0) {
            ret = adc_test(fd, adc_num, ALL_ZEROS_TEST_PATTERN);
        } else if(strcmp(argv[optind], "tst1") == 0) {
            ret = adc_test(fd, adc_num, ALL_ONES_TEST_PATTERN);
        } else if(strcmp(argv[optind], "init") == 0) {
            ret = adc_init(fd, adc_num);
        } else if(strcmp(argv[optind], "ss") == 0) {
            ret = adc_spi_slave_mode(fd, adc_num, true);
        } else if(strcmp(argv[optind], "nss") == 0) {
            ret = adc_spi_slave_mode(fd, adc_num, false);
        } else {
            printf("Unrecognized cmd: %s\n", argv[optind]);
            print_usage();
            return -1;
        }
        close(fd);
        return ret;
    } else {
        printf("No command specified!\n");
        return -1;
    }
}