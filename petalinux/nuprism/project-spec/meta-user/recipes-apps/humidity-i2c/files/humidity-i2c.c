/**
 * @file humidity-i2c.c
 * @author Jacob Cronin
 * @brief A test app demonstrating the functionality of the HDC1080 sensor
 * @version 0.1
 * @date 2021-03-31
 * 
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "hdc1080-i2c.h"


static uint16_t data;
static uint8_t reg;
static bool mode;


void print_usage()
{
    printf("Pressure Sensor Test App - available commands:\n");
    printf("\twrite - Write a byte of data (-d) to a register (-r)\n");
    printf("\tread - Read a byte of data from a register (-r)\n");
    printf("\tget_temp - Read temperature registers, mode must be set correctly\n");
    printf("\tget_hum - Read humidity registers, mode must be set correctly\n");
    printf("\tget_al - Read both temperature and humidity registers, mode must be set correctly\n");
    printf("\tset_mode - Demonstrate multi-byte transfer, writes 4 hard-coded bytes to ctrl regs\n");
    printf("\tget_mode - Demonstrate multi-byte transfer, reads from ctrl regs\n");
}


void get_opts(int argc, char **argv)
{
    int opt;

    while ((opt = getopt(argc, argv, "d:r:m:")) != -1)
    {
        switch (opt)
        {
            case 'd':
                data = atoi(optarg);
                break;

            case 'r':
                reg = atoi(optarg);
                break;

            case 'm':
                mode = atoi(optarg);
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
        return -1;
    }

    if (optind < argc)
    {
        if (strcmp(argv[optind], "write") == 0)
        {
            ret = hdc_write(i2c_fd, reg, data);
        }
        else if (strcmp(argv[optind], "read") == 0)
        {
            uint16_t return_data = 0xCCCC; // if this value is returned, read is likely not working
            ret = hdc_read(i2c_fd, reg, &return_data);
            printf("Returned data=0x%x\n", return_data);
        }
        else if (strcmp(argv[optind], "set_mode") == 0)
        {
            enum resolution t_res = HIGH;
            enum resolution h_res = HIGH;

            ret = hdc_set_mode(i2c_fd, mode, 0, t_res, h_res);

            if (ret == 0)
            {
                printf("Mode Set temp_res = high, humid_res = high, dual = %d\n", mode);
            }
        }
        else if (strcmp(argv[optind], "get_mode") == 0)
        {
            uint16_t config;

            ret = hdc_get_mode(i2c_fd, &config);

            if (ret == 0)
            {
                printf("Mode = 0x%x\n", config);
            }
        }
        else if (strcmp(argv[optind], "get_temp") == 0)
        {
            float temp;

            ret = get_hdc1080_temp(i2c_fd, &temp);
            if (ret < 0)
            {
                printf("Test failed, make sure set_mode has been executed first.\n");
            }
            printf("Returned data = %f degC\n", temp);
        }
        else if (strcmp(argv[optind], "get_hum") == 0)
        {
            float humid;

            ret = get_humidity(i2c_fd, &humid);
            printf("Returned data = %f %%RH\n", humid);
        }
        else if (strcmp(argv[optind], "get_all") == 0)
        {
            float humid;
            float temp;

            ret = hdc_get_all(i2c_fd, &temp, &humid);

            printf("humidity = %f %%RH\n", humid);
            printf("temperature = %f degC\n", temp);
        }
        else
        {
            printf("Unrecognized cmd: %s\n", argv[optind]);
            print_usage();
            ret = -1;
        }
        close(i2c_fd);
        return ret;
    }
    else
    {
        printf("No command specified!\n");
        print_usage();
        return -1;
    }
}