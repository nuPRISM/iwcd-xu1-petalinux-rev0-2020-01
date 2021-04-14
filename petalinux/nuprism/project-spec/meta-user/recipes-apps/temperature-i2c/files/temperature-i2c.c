/**
 * @file temperature-i2c.c
 * @author Jacob Cronin
 * @brief A simple test App demoing the MAX30205 sensors functions
 * @version 0.1
 * @date 2021-04-01
 * 
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "max30205-i2c.h"


static uint16_t data;
static uint8_t reg;
static uint8_t sensor_no;


void print_usage()
{
    printf("Pressure Sensor Test App - available commands:\n");
    printf("\twrite - Write a byte of data (-d) to a register (-r)\n");
    printf("\tread - Read a byte of data from a register (-r)\n");
    printf("\twr_arr - Demonstrates how write can be used with arrays\n");
    printf("\tre_arr - Demonstrates how read can be used with arrays\n");
    printf("\tshow_temp - Read temperature registers\n");
}


void get_opts(int argc, char **argv)
{
    int opt;

    while ((opt = getopt(argc, argv, "d:r:n:")) != -1)
    {
        switch (opt)
        {
            case 'd':
                data = atoi(optarg);
                break;

            case 'r':
                reg = atoi(optarg);
                break;

            case 'n':
                sensor_no = atoi(optarg);
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
        if (strcmp(argv[optind], "show_temp") == 0)
        {
            float return_data[MAX30205_SENSOR_COUNT];
        
            for (uint8_t i = 0; i < MAX30205_SENSOR_COUNT; i++)
            {
                ret |= max30205_get_temp(i2c_fd, i, (return_data+i));
            }
            // Seperate debug statements from printed result
            for (uint8_t i = 0; i < MAX30205_SENSOR_COUNT; i++)
            {
                printf("%f\t", return_data[i]);
            }
            printf("\n");
        }
        else if (strcmp(argv[optind], "auto") == 0)
        {
            float data;
        
            ret |= max30205_get_temp(i2c_fd, sensor_no, &data);
            printf("%f\t", data);

            uint8_t conf_data = 0x80;
            ret |= max30205_set_config(i2c_fd, sensor_no, conf_data);
            conf_data = 0xCC;
            ret |= max30205_get_config(i2c_fd, sensor_no, &conf_data);
            printf("%x, %s\n", conf_data, (conf_data == 0x80) ? "PASSED" : "FAILED");

            data = -10.125;
            printf("Testing read/write to 0x02.\n");
            ret |= max30205_set_t_hyst(i2c_fd, sensor_no, data);
            data = 0.00;
            ret |= max30205_get_t_hyst(i2c_fd, sensor_no, &data);
            printf("%f, %s\n", data, (data == 10.125) ? "PASSED" : "FAILED");

            data = 10.125;
            printf("Testing read/write to 0x03.\n");
            ret |= max30205_set_t_os(i2c_fd, sensor_no, data);
            data = 0.00;
            ret |= max30205_get_t_os(i2c_fd, sensor_no, &data);
            printf("%f, %s\n", data, (data == 10.125) ? "PASSED" : "FAILED");
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