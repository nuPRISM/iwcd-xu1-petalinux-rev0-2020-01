/*
* i2c-test.c
*
* Author: Luke Bidulka
* Company: TRIUMF
* Date: Nov 25, 2020
*
* Purpose: Test i2c communication with the 8t49n241 Clock Cleaner.
*
*/

/***************************** Include Files **********************************/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <linux/spi/spidev.h>
#include <errno.h>
#include <string.h>
#include <sys/ioctl.h>

#include "gpio.c"
#include "spi-test.h"

/************************** Constant Definitions ******************************/

// Clock cleaner i2c address
#define CLK_CLNR_IIC_ADDR 0x7c

// SPI GPIO of interest
#define ADC0_CS 0
#define ADC1_CS 1
#define ADC2_CS 2
#define ADC3_CS 3
#define ADC4_CS 4
#define ADC_CS_MAX 4
#define ADC_RST 5
#define ADC_PDN 6

// gpio modes
#define GPIO_IN 0
#define GPIO_OUT 1
#define GPIO_HIGH 1
#define GPIO_LOW 0

#define ADC_PWR_UP 0
#define ADC_PWR_DOWN 1

// SPI constants
#define SPI_READ_CMD	0xC0
#define SPI_WRITE_CMD   0x40
#define ADDRESS_MSB_OFFSET	1 /* MSB byte of address to read or write */
#define ADDRESS_LSB_OFFSET	2 /* LSB byte of address to read or write */
#define SPI_WRITE_SIZE		3 /* Number of bytes transfered on a register write */
#define SPI_READ_SIZE		3 /* Number of bytes transfered on a register read */

/************************** Variable Definitions ******************************/

// FD of the IIC device opened
int spi_fd = -1;

uint32_t mode;
uint32_t speed;
uint8_t bits;

/******************************* Functions ************************************/

int spi_init(void){
    char filename[20] = "/dev/spidev";
    //strcat(filename, 19, "/dev/spidev%d", adapter);

    // Open the spi device
    spi_fd = open("/dev/spidev2.0", O_RDWR);
    if(spi_fd < 0)
    {
        printf("ERR Cannot open the spi device: %s\n", strerror(errno));
        return 1;
    }
    else{
        printf("Opened spi device...\n");
    }
    return spi_fd;
}

void spi_close(void){
    close(spi_fd);
}

int spi_read(int fd, int chip, uint8_t reg, uint8_t *result){


    return 0;
}

// Initialize all adc's by sending them a hardware reset signal. All adc's share the same reset pin.
int adc3424_init(){

    // Check if spi device has been initialized. Do so if needed
    if (spi_fd == -1){
        printf("Initializing spi device...\n");
        if (spi_init() == 1){
            printf("ERR: Could not initialize spi device\n");
            return 1;
        }
    }
    // If/once spi is initialized, send the reset signal
    if (gpio_write(ADC_RST, GPIO_LOW)){
        printf("ERR: Could not write to gpio\n");
        return 1;
    }
    usleep(1);
    if (gpio_write(ADC_RST, GPIO_HIGH)){
        printf("ERR: Could not write to gpio\n");
        return 1;
    }
    usleep(1);
    if (gpio_write(ADC_RST, GPIO_LOW)){
        printf("ERR: Could not write to gpio\n");
        return 1;
    }

    // Initialize chip select signals
    if (gpio_write(ADC0_CS, GPIO_HIGH)){
        printf("ERR: Could not write to gpio\n");
        return 1;
    }
    if (gpio_write(ADC1_CS, GPIO_HIGH)){
        printf("ERR: Could not write to gpio\n");
        return 1;
    }
    if (gpio_write(ADC2_CS, GPIO_HIGH)){
        printf("ERR: Could not write to gpio\n");
        return 1;
    }
    if (gpio_write(ADC3_CS, GPIO_HIGH)){
        printf("ERR: Could not write to gpio\n");
        return 1;
    }
    if (gpio_write(ADC4_CS, GPIO_HIGH)){
        printf("ERR: Could not write to gpio\n");
        return 1;
    }

    printf("ADCs initialized.\n");
    return 0;
}

// Set status of adc pdn pin to signal to adc's if they should turn off
int adc3424_set_power(int pwr_cmd){
    int flag = 1;
    // All ADCs share the same adc powerdown pin, power down on logic HIGH
    if (pwr_cmd == ADC_PWR_UP){
        flag = gpio_write(ADC_PDN, GPIO_LOW);
    }
    else if (pwr_cmd == ADC_PWR_DOWN){
        flag = gpio_write(ADC_PDN, GPIO_HIGH);
    }

    return flag;
}

static void transfer(int fd)
{
	int ret;
    int array_len = 3;

    uint16_t data_address = 0x0001;

	uint8_t tx[] = { ((uint8_t)((data_address & 0xFF00) >> 8)) | SPI_READ_CMD, (uint8_t)(data_address & 0xFF), DONT_CARE_DATA };
	uint8_t rx[3] = {0xff, 0xff, 0xff};

	struct spi_ioc_transfer tr = {
		.tx_buf = (unsigned long)tx,
		.rx_buf = (unsigned long)rx,
		.len = array_len,
		.delay_usecs = 1,
		.speed_hz = speed,
		.bits_per_word = bits,
	};

    printf("Sending spi transfer...\n");
	ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
	if (ret < 1)
		printf("ERR: can't send spi message");
        return 1;

	for (ret = 0; ret < array_len; ret++) {
		if (!(ret % 6))
			puts("");
		printf("%.2X ", rx[ret]);
	}
    printf("%.2X ", rx[0]);
    printf("%.2X ", rx[1]);
    printf("%.2X \n", rx[2]);
    return 0;
}


/********************************* Main ***************************************/

int main(int argc, char **argv) {
    int adapter_num;
    int ret = 0;
    char addr_str[4];
    char data_str[2];
    char input_command[1];

    uint16_t data_address = 0x0003; // Default to 0x0003
    uint8_t write_data = 0x00;
    uint8_t buff[10];
    uint8_t result = 0;

    printf("\nSPI test program starting...\n\n");

    // Not using this right now, adapter is hardcoded
    if (argc != 1){
        printf("Usage: spi-test <spi adapter number>\n");
        return 1;
    }

    // Create the device name string
    //adapter_num = atoi(argv[1]);   
    // Initialize the i2c device
    printf("Initializing SPI device...\n");
    spi_init();

    /*
	 * spi mode
	 */
	ret = ioctl(spi_fd, SPI_IOC_RD_MODE32, &mode);
	if (ret == -1)
		printf("ERR: can't get spi mode\n");

	/*
	 * bits per word
	 */
	ret = ioctl(spi_fd, SPI_IOC_RD_BITS_PER_WORD, &bits);
	if (ret == -1)
		printf("ERR: can't get bits per word\n");

	/*
	 * max speed hz
	 */
	ret = ioctl(spi_fd, SPI_IOC_RD_MAX_SPEED_HZ, &speed);
	if (ret == -1)
		printf("ERR: can't get max speed hz\n");

	printf("spi mode: 0x%x\n", mode);
	printf("bits per word: %d\n", bits);
	printf("max speed: %d Hz (%d KHz)\n", speed, speed/1000);

    // Setup necessary gpio
    gpio_export(ADC0_CS);
    gpio_set_inout(ADC0_CS, GPIO_OUT);
    gpio_export(ADC1_CS);
    gpio_set_inout(ADC1_CS, GPIO_OUT);
    gpio_export(ADC2_CS);
    gpio_set_inout(ADC2_CS, GPIO_OUT);
    gpio_export(ADC3_CS);
    gpio_set_inout(ADC3_CS, GPIO_OUT);
    gpio_export(ADC4_CS);
    gpio_set_inout(ADC4_CS, GPIO_OUT);
    gpio_export(ADC_RST);
    gpio_set_inout(ADC_RST, GPIO_OUT);
    gpio_export(ADC_PDN);
    gpio_set_inout(ADC_PDN, GPIO_OUT);

    // Set ADC power on
    adc3424_set_power(ADC_PWR_UP);

    // Startup ADCs
    adc3424_init();

    while (1) {
        printf("Please enter command (r: read settings, w: write, e: exit): ");
        scanf("%s", input_command);
        printf("\n");

        // Read command
        if (input_command[0] == 'r'){

            uint16_t data_address = 0x1;

            int selected_chip;

            // Get desired chip 
            printf("Please enter chip id: ");
            scanf("%d", &selected_chip);
            if ((selected_chip < 0) || (selected_chip > 4)){
                selected_chip = 0;
            }
            printf("\nChip %d selected.\n", selected_chip);

            struct spi_ioc_transfer xfer;
            uint8_t txbuf[32], rxbuf[32];
            uint64_t *bp;
            int len, status;

            // Initialize memory to 0's
            memset(&xfer, 0, sizeof xfer);
            len = sizeof xfer;

            // Init rx and tx buf values
            txbuf[0] = ((uint8_t)((data_address & 0xFF00) >> 8)) | SPI_READ_CMD;
	        txbuf[1] = (uint8_t)(data_address & 0xFF);
	        txbuf[2] = DONT_CARE_DATA;

            rxbuf[0] = 0xFF;
	        rxbuf[1] = 0xFF;
	        rxbuf[2] = 0xFF;

            // Set message in transfer
            xfer.tx_buf = (uint64_t)txbuf;
            xfer.len = SPI_READ_SIZE;

            xfer.rx_buf = (uint64_t)rxbuf;
            xfer.len = SPI_READ_SIZE;

            printf("Transmission(%d): \n", status);
            printf("tx_buf[0]: 0x%02x \n", txbuf[0]);
            printf("tx_buf[1]: 0x%02x \n", txbuf[1]);
            printf("tx_buf[2]: 0x%02x \n", txbuf[2]);

            printf("rx_buf[0]: 0x%02x \n", rxbuf[0]);
            printf("rx_buf[1]: 0x%02x \n", rxbuf[1]);
            printf("rx_buf[2]: 0x%02x \n", rxbuf[2]);
            printf("\n");

            gpio_write(selected_chip, GPIO_LOW);

            // SPI_IOC_MESSAGE(N) sends spi message. N indicates the number of messages
            status = ioctl(spi_fd, SPI_IOC_MESSAGE(1), xfer);
            if (status < 0) {
                printf("ERR: SPI_IOC_MESSAGE :(\n");
                break;
            }

            gpio_write(selected_chip, GPIO_HIGH);

            // Get returned values
            //txbuf = xfer.tx_buf;
            //rxbuf = xfer.rx_buf;
            printf("Buffer response(%d): \n", status);
            printf("tx_buf[0]: 0x%02x \n", txbuf[0]);
            printf("tx_buf[1]: 0x%02x \n", txbuf[1]);
            printf("tx_buf[2]: 0x%02x \n", txbuf[2]);
            printf("rx_buf[0]: 0x%02x \n", rxbuf[0]);
            printf("rx_buf[1]: 0x%02x \n", rxbuf[1]);
            printf("rx_buf[2]: 0x%02x \n", rxbuf[2]);
            printf("\n");

            bp = xfer.tx_buf;

            printf("Pointer response(%d): \n", status);
            printf("tx_buf[0]: 0x%02x \n", *bp);
            printf("tx_buf[1]: 0x%02x \n", *(bp++));
            printf("tx_buf[2]: 0x%02x \n", *(bp++));

            bp = xfer.rx_buf;

            printf("rx_buf[0]: 0x%02x \n", bp);
            printf("rx_buf[1]: 0x%02x \n", *(bp++));
            printf("rx_buf[2]: 0x%02x \n", *(bp++));
            printf("\n");

            printf("spidev-test transfer:\n");
            transfer(spi_fd);
            printf("\n");

            // // Get address to read from
            // printf("Please enter 16b register read address in hex (ex: 006a): 0x");
            // scanf("%4s", addr_str);

            // // Convert input string to hex address
            // if(convert_addr(addr_str, &data_address)){
            //         printf("ERR: Invalid address, defaulting to 0x%x\n", data_address);
            // }

            // // Read initial val
            // printf("\nReading from: 0x%x\n\n", data_address);
            // if (spi_read(CLK_CLNR_IIC_ADDR, data_address, &result) != 0){
            //     // Error (printed inside i2c_read() function)
            // }
            // else {
            //     printf("Read succesful\n");
            //     printf("buffer[0]: 0x%x\n\n", result);
            // }
        }
        // Write command
        else if (input_command[0] == 'w'){
            printf("I wish I could write..\n");
            // // Get address to write to and data to write
            // printf("Please enter 16b register write address in hex (ex: 006a): 0x");
            // scanf("%4s", addr_str);
            // printf("\nPlease enter 8b data to write in hex (ex: 09): 0x");
            // scanf("%2s", data_str);
            // printf("\n");

            // // Convert address string to hex address
            // if(convert_addr(addr_str, &data_address)){
            //         printf("ERR: Invalid address\n");
            //         break;
            // }

            // // Convert data string to write data
            // if(convert_data(data_str, &write_data)){
            //         printf("ERR: Invalid data\n");
            //         break;
            // }

            // // Read initial val
            // printf("\nReading from: 0x%x\n\n", data_address);
            // if (i2c_read(CLK_CLNR_IIC_ADDR, data_address, &result) != 0){
            //     // Error (printed inside i2c_read() function)
            // }
            // else {
            //     printf("Read succesful\n");
            //     printf("buffer[0]: 0x%x\n\n", result);
            // }

            // // Write new val
            // printf("\nWriting to: 0x%x\n\n", data_address);
            // if (i2c_write(CLK_CLNR_IIC_ADDR, data_address, write_data) != 0){
            //     // Error (printed inside i2c_write() function)
            // }
            // else {
            //     printf("Write succesful\n");
            // }

            // // Read changed val
            // printf("\nChecking: 0x%x\n\n", data_address);
            // if (i2c_read(CLK_CLNR_IIC_ADDR, data_address, &result) != 0){
            //     // Error (printed inside i2c_read() function)
            // }
            // else {
            //     printf("Read succesful\n");
            //     printf("buffer[0]: 0x%x\n\n", result);
            // }
        }

        // Exit command
        else if (input_command[0] == 'e'){
            printf("Exiting...\n\n");
            break;
        }
        // Invalid command
        else{
            printf("Invalid command.\n\n");
        }
    }

    // Close the device
    spi_close();

    printf("Test Complete\n");

    return 0;
}
