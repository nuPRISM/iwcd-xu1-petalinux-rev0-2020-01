#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "24aa02e48-i2c.h"


static uint8_t data;
static uint8_t reg;


void print_usage()
{
    printf("Pressure Sensor Test App - available commands:\n");
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
            printf("Register: 0x%x\n", reg);
            printf("Data: 0x%x\n", data);
            ret = mac_24aa02e48_byte_write(i2c_fd, reg, data);
        }
        else if (strcmp(argv[optind], "read") == 0)
        {
            uint8_t return_data = 0xCC;
            printf("Register: 0x%x\n", reg);
            ret = mac_24aa02e48_byte_read(i2c_fd, reg, &return_data);
            printf("Returned data=0x%x\n", return_data);
        }
        else if (strcmp(argv[optind], "seq_read") == 0)
        {
            uint8_t return_data[8];
            printf("Register: 0x%x\n", reg);
            ret = mac_24aa02e48_sequential_read(i2c_fd, reg, return_data, 8);

            printf("Returned data=");
            for (int i = 0 ; i < 8; i++)
            {
                printf("%x, ", return_data[i]);
            }
            printf("\n");
        }
        else if (strcmp(argv[optind], "page_write") == 0)
        {
            uint8_t data[8] = {1, 2, 3, 4, 5, 6, 7, 8};
            printf("Register: 0x%x\n", reg);
            ret = mac_24aa02e48_page_write(i2c_fd, reg, data, 8);

            printf("%d", ret);
            printf("write data=");
            for (int i = 0 ; i < 8; i++)
            {
                printf("%x, ", data[i]);
            }
            printf("\nstatus= %s\n", (ret >= 0) ? "PASS": "FAIL");
        }
        else if (strcmp(argv[optind], "read") == 0)
        {
            uint8_t return_data = 0xCC;
            printf("Register: 0x%x\n", reg);
            ret = mac_24aa02e48_byte_read(i2c_fd, reg, &return_data);
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