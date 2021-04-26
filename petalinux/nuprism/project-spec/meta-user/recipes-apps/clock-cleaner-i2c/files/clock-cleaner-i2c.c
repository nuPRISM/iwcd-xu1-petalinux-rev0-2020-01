#include <stdlib.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "idt8t49n241-i2c.h"

static uint8_t data;
static uint16_t reg;
static uint16_t bytes;


void print_usage()
{
    printf("Clock cleaner Test App - available commands:\n");
    printf("\twrite - Write a byte of data (-d) to a register (-r)\n");
    printf("\tread - Read a byte of data from a register (-r)\n");
    printf("\tinit - Program the clock cleaner unit\n");
    printf("\tstart - Enable the clock cleaner (default)\n");
    printf("\tstop - Disable the clock cleaner\n");
    printf("\tstatus - Read status flags\n");
    printf("\tid - Read clock cleaner identification\n");
}


void get_opts(int argc, char **argv)
{
    int opt;

    while ((opt = getopt(argc, argv, "d:r:m:b:")) != -1)
    {
        switch (opt)
        {
            case 'd':
                data = atoi(optarg);
                break;

            case 'r':
                reg = atoi(optarg);
                break;

            case 'b':
                bytes = atoi(optarg);
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
            ret = idt8T49n241_byte_write(i2c_fd, reg, data);
            printf("Register=0x%x, Data=0x%x\n", reg, data);
        }
        else if (strcmp(argv[optind], "read") == 0)
        {
            uint8_t return_data = 0xCC; 
            ret = idt8T49n241_byte_read(i2c_fd, reg, &return_data);
            printf("Register=0x%x, Data=0x%x\n", reg, return_data);
        }
        else if (strcmp(argv[optind], "arr_read") == 0)
        {
            uint8_t* return_data = (uint8_t*)malloc(bytes * sizeof(uint8_t));
            ret = idt8T49n241_array_read(i2c_fd, reg, return_data, bytes);

            for (int i = 0; i < bytes; i ++)
            {
                printf("%x, ", return_data[i]);
            }
            printf("\n");
            free(return_data);
        }
        else if (strcmp(argv[optind], "init") == 0) 
        {
            ret = idt8T49n241_init(i2c_fd);
        }
        else if (strcmp(argv[optind], "start") == 0)
        {
            ret = idt8T49n241_set_state(i2c_fd, ON);
        }
        else if (strcmp(argv[optind], "stop") == 0)
        {
            ret = idt8T49n241_set_state(i2c_fd, OFF);
        }
        else if (strcmp(argv[optind], "status") == 0)
        {
            struct clock_cleaner_status_s stat; 
            ret = idt8T49n241_read_status(i2c_fd, &stat);

            printf("***Clock Cleaner Status***\n");
            printf("\tGPIO Pin Values, GPIO[3:0] = %x\n", stat.gpio);
            printf("\tDevice Interrupt Status: %s\n", (stat.INT) ? "true":"false");
            printf("\tCRC Mismatch on EEPROM Read: %s\n", (stat.eep_err) ? "true":"false");
            printf("\tSerial EEPROM Read Fail: %s\n", (stat.boot_fail) ? "true":"false");
            printf("\tSerial EEPROM Read Cycle Complete: %s\n", (stat.eep_done) ? "true":"false");
        }
        else if (strcmp(argv[optind], "id") == 0)
        {
            struct clock_cleaner_id_s idt8T49n241_id;
            ret = idt8T49n241_read_id(i2c_fd, &idt8T49n241_id);
            if (ret == 0)
            {
                printf("CLC id:\n\tREV_ID=%02x\n\tDEV_ID=%02x\n\tDASH_CODE=%02x\n", 
                        idt8T49n241_id.rev_id, idt8T49n241_id.dev_id, idt8T49n241_id.dash_code);
            }
            else
            {
                printf("CLC/I2C error\n");
            }
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
