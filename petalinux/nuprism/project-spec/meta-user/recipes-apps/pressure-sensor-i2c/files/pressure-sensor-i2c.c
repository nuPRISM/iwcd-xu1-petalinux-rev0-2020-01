/**
 * @file pressure-sensor-i2c.c
 * @author Jacob Cronin
 * @brief A test app demonstrating the functionality of the LPS25HB sensor
 * @version 0.1
 * @date 2021-03-30
 * 
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "lps25hb-i2c.h"


static uint8_t data;
static uint8_t reg;


void print_usage()
{
    printf("Pressure Sensor Test App - available commands:\n");
    printf("\twrite - Write a byte of data (-d) to a register (-r)\n");
    printf("\tread - Read a byte of data from a register (-r)\n");
    printf("\tget_temp - Read temperature registers\n");
    printf("\tget_pres - Read pressure registers\n");
    printf("\tsuto - Test all functions\n");
}


void get_opts(int argc, char **argv)
{
    int opt;

    while ((opt = getopt(argc, argv, "d:r:")) != -1)
    {
        switch (opt)
        {
            case 'd':
                data = atoi(optarg);
                break;

            case 'r':
                reg = atoi(optarg);
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
    int ret;
    int i2c_fd;

    get_opts(argc, argv);

    // Open I2C device file, exit if not successful
    i2c_fd = open(I2C_DEVICE, O_RDWR);
    if (i2c_fd < 0)
    {
        printf("Error opening I2C Device file, exiting.");
        return 1;
    }

    if (optind < argc)
    {
        if (strcmp(argv[optind], "write") == 0)
        {
            ret = lps25hb_byte_write(i2c_fd, reg, data);
        }
        else if (strcmp(argv[optind], "read") == 0)
        {
            uint8_t return_data = 0xCC;
            ret = lps25hb_byte_read(i2c_fd, reg, &return_data);
            printf("Returned data=0x%x\n", return_data);
        }
        else if (strcmp(argv[optind], "get_temp") == 0)
        {
            float temp;
            // power on device
            ret = lps25hb_byte_write(i2c_fd, LPS25HB_CONFIG_REGISTER_1, 0x80);
            usleep(5000);
            // Set config register to one-shot mode
            ret |= lps25hb_byte_write(i2c_fd, LPS25HB_CONFIG_REGISTER_2, 0x01);
            usleep(1000);
            // Read pressure
            ret = get_pressure_sensor_temp(i2c_fd, &temp);
            printf("Returned data = %f\n", temp);
        }
        else if (strcmp(argv[optind], "get_pres") == 0)
        {
            float pres;
            // power on device
            ret = lps25hb_byte_write(i2c_fd, LPS25HB_CONFIG_REGISTER_1, 0x80);
            usleep(5000);
            // Set config register to one-shot mode
            ret |= lps25hb_byte_write(i2c_fd, LPS25HB_CONFIG_REGISTER_2, 0x01);
            // Read pressure
            ret |= get_pressure(i2c_fd, &pres);
            printf("Returned data = %f hPa\n", pres);
        }
        else if (strcmp(argv[optind], "auto") == 0)
        {
            uint8_t test_reg = 0x0F;
            uint8_t data = 0xCC;
            // power on device
            ret = lps25hb_byte_write(i2c_fd, LPS25HB_CONFIG_REGISTER_1, 0x80);
    
            // Read a register
            printf("Testing byte read with 0x0F.\n");
            lps25hb_byte_read(i2c_fd, test_reg, &data);
            printf("Returned Data: 0x%x, %s\n", data, (data == 0xBD)? "PASSED" : "Failed");

            test_reg = 0x20;
            data = 0x0D;

            // write to a register
            printf("Testing byte write with r=0x%x d=0x%x.\n", test_reg, data);
            lps25hb_byte_write(i2c_fd, test_reg, data);
            data = 0xCC;
            lps25hb_byte_read(i2c_fd, test_reg, &data);
            printf("Returned Data: 0x%x, %s\n", data, (data == 0x0D)? "PASSED" : "Failed");

            uint8_t config_data[4] = {0x80, 0x01, 0, 0};
            printf("Testing aray write.\n");
            lps25hb_array_write(i2c_fd, test_reg, config_data, 4);
            for (uint8_t i = 0; i < 4; i++)
            {
                config_data[i] = 0;
            }
            lps25hb_array_read(i2c_fd, test_reg, config_data, 4);
            printf("Returned Data:\n");
            for (uint8_t i = 0; i < 4; i++)
            {
                printf("0x%x, ", config_data[i]);
            }
            printf("\n");

            float temp;
            // Read pressure
            ret = get_pressure_sensor_temp(i2c_fd, &temp);
            printf("Returned temperature data = %f\n", temp);

            float pres;
            // Set config register to one-shot mode
            ret |= lps25hb_byte_write(i2c_fd, LPS25HB_CONFIG_REGISTER_2, 0x01);
            // Read pressure
            ret |= get_pressure(i2c_fd, &pres);
            printf("Returned pressure data = %f hPa\n", pres);
        }
        else
        {
            printf("Unrecognized cmd: %s\n", argv[optind]);
            print_usage();
            ret = 1;
        }
        close(i2c_fd);
        return ret;
    }
    else
    {
        printf("No command specified!\n");
        print_usage();
        return 1;
    }
}