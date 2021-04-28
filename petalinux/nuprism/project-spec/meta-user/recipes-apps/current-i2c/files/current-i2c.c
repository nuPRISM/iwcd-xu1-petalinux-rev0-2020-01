#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "ina219-i2c.h"


static uint16_t data;
static uint8_t reg;

extern struct ina219_profile_s current_ldo1;
extern struct ina219_profile_s current_ldo2;
extern struct ina219_profile_s current_ldo3;
extern struct ina219_profile_s current_ldo4;
extern struct ina219_profile_s current_ldo5;
extern struct ina219_profile_s current_ldo6;

extern struct ina219_profile_s current_poe12;
extern struct ina219_profile_s current_poe3p3;


void print_usage()
{
    printf("Current Sensor Test App - available commands:\n");
    printf("\twrite - Write a byte of data (-d) to a register (-r)\n");
    printf("\tread - Read a byte of data from a register (-r)\n");
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
        return -1;
    }

    if (optind < argc)
    {
        if (strcmp(argv[optind], "write") == 0)
        {
            ret = ina219_write(i2c_fd, current_ldo5, reg, data);
        }
        else if (strcmp(argv[optind], "read") == 0)
        {
            uint16_t return_data = 0xCCCC;
            ret = ina219_read(i2c_fd, current_ldo5, reg, &return_data);
            printf("Returned data=0x%x\n", return_data);
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