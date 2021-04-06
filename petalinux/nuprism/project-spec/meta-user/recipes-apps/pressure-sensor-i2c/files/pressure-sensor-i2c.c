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
    printf("\tset_ctrl - Demonstrate multi-byte transfer, writes 4 hard-coded bytes to ctrl regs\n");
    printf("\tget_ctrl - Demonstrate multi-byte transfer, reads from ctrl regs\n");
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
            ret = lps_byte_write(i2c_fd, reg, data);
        }
        else if (strcmp(argv[optind], "read") == 0)
        {
            uint8_t return_data = 0xCC;
            ret = lps_byte_read(i2c_fd, reg, &return_data);
            printf("Returned data=0x%x\n", return_data);
        }
        else if (strcmp(argv[optind], "get_temp") == 0)
        {
            uint16_t temp;
            ret = get_pressure_sensor_temp(i2c_fd, &temp);
            printf("Returned data = %d\n", temp);
        }
        else if (strcmp(argv[optind], "get_pres") == 0)
        {
            float pres;
            ret = get_pressure(i2c_fd, &pres);
            printf("Returned data = %f hPa\n", pres);
        }
        else if (strcmp(argv[optind], "set_ctrl") == 0)
        {
            uint8_t config[4] = {1, 2, 3, 4};
            ret = lps_array_write(i2c_fd, 0x20, config, 4);
            printf("Writing ");
            for (uint8_t r = 0; r < 4; r++)
            {
                printf("%x, ", config[r]);
            }
            printf("\n");
        }
        else if (strcmp(argv[optind], "get_ctrl") == 0)
        {
            uint8_t return_data[4];
            ret = lps_array_read(i2c_fd, 0x20, return_data, 4);
            printf("Current control reg values: ");
            for (uint8_t r = 0; r < 4; r++)
            {
                printf("%x, ", return_data[r]);
            }
            printf("\n");
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