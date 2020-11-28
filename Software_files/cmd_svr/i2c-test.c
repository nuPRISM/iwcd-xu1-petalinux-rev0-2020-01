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
#include <linux/i2c-dev.h>
#ifndef I2C_M_RD
#include <linux/i2c.h>
#endif
#include <errno.h>
#include <string.h>
#include <sys/ioctl.h>

/************************** Constant Definitions ******************************/

// Clock cleaner i2c address
#define CLK_CLNR_IIC_ADDR 0x7c

/************************** Variable Definitions ******************************/

// FD of the IIC device opened
int i2c_fd = -1;

/******************************* Functions ************************************/

// Converts input string into 16b hex address for clock cleaner. 
// Returns 0 on success and 1 on invalid address (sets addr to 0x0003 if invalid)
int convert_addr(char str[4], uint16_t *result){
    uint16_t val1, val2, val3, sum;
    int invalid_flag = 0;
    
    // First val conversion (just a bound check, should always be 0x0)
    if (str[0] != '0'){
        invalid_flag = 1;
    }
    
    // Second val conversion (max address is 0x0213 so exlude higher than 0x2)
    if (('0' <= str[1]) && (str[1] <= '2')){
        val1 = ((uint16_t)str[1] - 0x30) << 8;
    }
    else {
        invalid_flag = 1;
    }
    
    // Third val conversion
    if (('0' <= str[2]) && (str[2] <= '9')){
        val2 = ((uint16_t)str[2] - 0x30) << 4;
    }
    else if (('a' <= str[2]) && (str[2] <= 'f')){
        val2 = ((uint16_t)str[2] - 0x57) << 4;
    }
    else {
        invalid_flag = 1;
    }
    
    // Fourth val conversion 
    if (('0' <= str[3]) && (str[3] <= '9')){
        val3 = ((uint16_t)str[3] - 0x30);
    }
    else if (('a' <= str[3]) && (str[3] <= 'f')){
        val3 = ((uint16_t)str[3] - 0x57);
    }
    else {
        invalid_flag = 1;
    }
    
    // Construct converted address
    sum = val1 + val2 + val3;
    
    // We default to the device id address 0x0003 which contains 0x60 by default
    // if we have an invalid input address (ie greater than 0x0212), else we have
    // our result
    if ((invalid_flag == 1) || (sum > 0x0212)){
        *result = 0x0003;
    }
    else {
        *result = sum;
    }

    return invalid_flag;   
}

// Converts input string into 8b hex data for clock cleaner. 
// Returns 0 on success and 1 on invalid address (sets data to 0x00 if invalid)
int convert_data(char str[2], uint8_t *result){
    uint8_t val0, val1, sum;
    int invalid_flag = 0;
    
    // First val conversion 
    if (('0' <= str[0]) && (str[0] <= '9')){
        val0 = ((uint8_t)str[0] - 0x30) << 4;
    }
    else if (('a' <= str[0]) && (str[0] <= 'f')){
        val0 = ((uint8_t)str[0] - 0x57) << 4;
    }
    else {
        invalid_flag = 1;
    }
    
    // Second val conversion
    if (('0' <= str[1]) && (str[1] <= '9')){
        val1 = ((uint8_t)str[1] - 0x30);
    }
    else if (('a' <= str[1]) && (str[1] <= 'f')){
        val1 = ((uint8_t)str[1] - 0x57);
    }
    else {
        invalid_flag = 1;
    }
    
    // Construct converted address
    sum = val0 + val1;
    
    // We default to the device id address 0x0003 which contains 0x60 by default
    // if we have an invalid input address (ie greater than 0x0212), else we have
    // our result
    if (invalid_flag == 1){
        *result = 0x00;
    }
    else {
        *result = sum;
    }

    return invalid_flag;   
}


int i2c_init(int adapter){
    char filename[20];
    snprintf(filename, 19, "/dev/i2c-%d", adapter);

    // Open the device
    i2c_fd = open(filename, O_RDWR);
    if(i2c_fd < 0)
    {
        printf("ERR Cannot open the iic device: %s\n", strerror(errno));
        return 1;
    }
    return i2c_fd;
}

void i2c_close(void){
    close(i2c_fd);
}

// Read the given I2C slave device's register and return the read value in `*result`:
int i2c_read(uint8_t slave_addr, uint16_t reg, uint8_t *result) {
    int retval;
    uint8_t outbuf[2], inbuf[1];
    struct i2c_msg msgs[2];
    struct i2c_rdwr_ioctl_data msgset[1];

    msgs[0].addr = slave_addr;
    msgs[0].flags = 0;
    msgs[0].len = 2;
    msgs[0].buf = outbuf;

    msgs[1].addr = slave_addr;
    msgs[1].flags = I2C_M_RD | I2C_M_NOSTART;
    msgs[1].len = 1;
    msgs[1].buf = inbuf;

    msgset[0].msgs = msgs;
    msgset[0].nmsgs = 2;

    outbuf[0] = (uint8_t) (reg >> 8);
    outbuf[1] = (uint8_t) (reg&0x00FF);

    inbuf[0] = 0;

    *result = 0;
    if (ioctl(i2c_fd, I2C_RDWR, &msgset) < 0) {
        perror("ioctl(I2C_RDWR) in i2c_read\n");
        printf("ERR couldn't read: %s\n", strerror(errno));
        return -1;
    }

    *result = inbuf[0];
    return 0;
}

// Write to the I2C slave device's register:
int i2c_write(uint8_t slave_addr, uint16_t reg, uint8_t data) {
    int retval;
    uint8_t outbuf[3];

    struct i2c_msg msgs[1];
    struct i2c_rdwr_ioctl_data msgset[1];

    outbuf[0] = (uint8_t) (reg >> 8);
    outbuf[1] = (uint8_t) (reg&0x00FF);
    outbuf[2] = data;

    msgs[0].addr = slave_addr;
    msgs[0].flags = 0;
    msgs[0].len = 3;
    msgs[0].buf = outbuf;

    msgset[0].msgs = msgs;
    msgset[0].nmsgs = 1;

    if (ioctl(i2c_fd, I2C_RDWR, &msgset) < 0) {
        perror("ioctl(I2C_RDWR) in i2c_write\n");
        printf("ERR couldn't write: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}

/********************************* Main ***************************************/

int main(int argc, char **argv)
{
    int adapter_num;
    char addr_str[4];
    char data_str[2];
    char input_command[1];
    uint16_t data_address = 0x0003; // Default to 0x0003
    uint8_t write_data = 0x00;
    uint8_t buff[10];
    uint8_t result = 0;

    printf("\nI2C test program starting...\n\n");

    if (argc != 2){
        printf("Usage: i2c-test <iic adapter number>\n");
        return 1;
    }

    // Create the device name string
    adapter_num = atoi(argv[1]);   
    // Initialize the i2c device
    i2c_init(adapter_num);

    while (1) {
        printf("Please enter command (r: read, w: write, e: exit): ");
        scanf("%s", input_command);
        printf("\n");

        // Read command
        if (input_command[0] == 'r'){
            // Get address to read from
            printf("Please enter 16b register read address in hex (ex: 006a): 0x");
            scanf("%4s", addr_str);

            // Convert input string to hex address
            if(convert_addr(addr_str, &data_address)){
                    printf("ERR: Invalid address, defaulting to 0x%x\n", data_address);
            }

            // Read initial val
            printf("\nReading from: 0x%x\n\n", data_address);
            if (i2c_read(CLK_CLNR_IIC_ADDR, data_address, &result) != 0){
                // Error (printed inside i2c_read() function)
            }
            else {
                printf("Read succesful\n");
                printf("buffer[0]: 0x%x\n\n", result);
            }
        }
        // Write command
        else if (input_command[0] == 'w'){
            // Get address to write to and data to write
            printf("Please enter 16b register write address in hex (ex: 006a): 0x");
            scanf("%4s", addr_str);
            printf("\nPlease enter 8b data to write in hex (ex: 09): 0x");
            scanf("%2s", data_str);
            printf("\n");

            // Convert address string to hex address
            if(convert_addr(addr_str, &data_address)){
                    printf("ERR: Invalid address\n");
                    break;
            }

            // Convert data string to write data
            if(convert_data(data_str, &write_data)){
                    printf("ERR: Invalid data\n");
                    break;
            }

            // Read initial val
            printf("\nReading from: 0x%x\n\n", data_address);
            if (i2c_read(CLK_CLNR_IIC_ADDR, data_address, &result) != 0){
                // Error (printed inside i2c_read() function)
            }
            else {
                printf("Read succesful\n");
                printf("buffer[0]: 0x%x\n\n", result);
            }

            // Write new val
            printf("\nWriting to: 0x%x\n\n", data_address);
            if (i2c_write(CLK_CLNR_IIC_ADDR, data_address, write_data) != 0){
                // Error (printed inside i2c_write() function)
            }
            else {
                printf("Write succesful\n");
            }

            // Read changed val
            printf("\nChecking: 0x%x\n\n", data_address);
            if (i2c_read(CLK_CLNR_IIC_ADDR, data_address, &result) != 0){
                // Error (printed inside i2c_read() function)
            }
            else {
                printf("Read succesful\n");
                printf("buffer[0]: 0x%x\n\n", result);
            }
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
    i2c_close();

    printf("Test Complete\n");

    return 0;
}
