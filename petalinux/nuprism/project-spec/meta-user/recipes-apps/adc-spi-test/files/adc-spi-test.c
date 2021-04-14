#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "adc-spi.h"

static uint32_t mode = SPI_CS_HIGH;
static uint8_t  bits = 8;
static uint32_t speed = 500000;
static uint16_t delay = 0;

static uint16_t _register;
static uint8_t value;
static int adc_num;
static uint8_t pattern [4];
static uint16_t custom_pattern;
static char device_name[64] = DEFAULT_SPI_DEVICE;


void print_usage()
{
    printf("ADC controller - available commands:\n");
    printf("\tpdn  - power down\n");
    printf("\tpup  - power up\n");
    printf("\trst  - reset\n");
    printf("\tinit - initialization\n");
    printf("\tread - Perform single read\n");
    printf("\twr   - Perform single write\n");
    printf("\tnom  - nominal mode(?)\n");
    printf("\ttst  - toggle test pattern\n");
    printf("\ttst0 - all zeros test pattern\n");
    printf("\ttst1 - all ones test pattern\n");
}


void get_opts(int argc, char **argv)
{
    int opt;

	while ((opt = getopt(argc, argv, "n:d:m:b:s:r:A:B:C:D:C:p:v:")) != -1)
    {
        switch (opt)
        {
            case 'n':
                adc_num = atoi(optarg);
                break;

            case 's':
                speed = atoi(optarg);
                break;

            case 'd':
                strcpy(device_name, optarg);
                break;

            case 'r':
                _register = atoi(optarg);
                break;

            case 'A':
                pattern[0] = atoi(optarg);
                break;

            case 'B':
                pattern[1] = atoi(optarg);
                break;

            case 'C':
                pattern[2] = atoi(optarg);
                break;

            case 'D':
                pattern[3] = atoi(optarg);
                break;

            case 'p':
                custom_pattern = atoi(optarg);
                break;

            case 'v':
                value = atoi(optarg);
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
    int ret = 0;
    int spi_fd;

    get_opts(argc, argv);

    // These values will be set by default
    adc_set_mode(mode);
    adc_set_bits(bits);
    adc_set_speed(speed);
    adc_set_delay(delay);
    
    // Open I2C device file, exit if not successful
    spi_fd = open(device_name, O_RDWR);
    if (spi_fd < 0)
    {
        printf("Cannot open device, \"%s\"\n", device_name);
        return -1;
    }

    if (optind < argc)
    {
        if (adc_spi_init(spi_fd) != 0)
        {
            return -1;
        }

	    printf("spi mode: 0x%x\n", mode);
	    printf("bits per word: %d\n", bits);
	    printf("max speed: %d Hz (%d KHz)\n", speed, speed/1000);

        if (strcmp(argv[optind], "pdn") == 0)
        {
            ret = adc_power_down();
        }
        else if (strcmp(argv[optind], "pup") == 0)
        {
            ret = adc_power_up();
        }
        else if (strcmp(argv[optind], "rst") == 0)
        {
            ret = adc_reset();
        }
        else if (strcmp(argv[optind], "init") == 0)
        {
            ret = adc_init(spi_fd, adc_num);
        }
        else if (strcmp(argv[optind], "rb") == 0)
        {
            ret = adc_read_back(spi_fd, adc_num);
        }
        else if (strcmp(argv[optind], "read") == 0)
        {
            uint8_t return_data = 0xCC;
            adc_enable(adc_num);

            ret = adc_read(spi_fd, _register, &return_data);
            printf("register=%d, ret=%d, value=0x%x\n", _register, ret, return_data);
            
            adc_disable(adc_num);
        }
        else if (strcmp(argv[optind], "write") == 0)
        {
            adc_enable(adc_num);

            ret = adc_write(spi_fd, _register, value);
            DBG("register=%d, value=%d, ret=%d\n", _register, value, ret);

            adc_disable(adc_num);
        }
        else if (strcmp(argv[optind], "nom") == 0)
        {
            adc_nominal_mode(spi_fd, adc_num);
        }
        else if (strcmp(argv[optind], "tst") == 0)
        {
            ret = adc_set_test_pattern(spi_fd, adc_num, pattern, custom_pattern);
        }
        else if (strcmp(argv[optind], "tst0") == 0)
        {
            uint8_t patterns[4] = {ADC_TP_ALTERNATE};
            ret = adc_set_test_pattern(spi_fd, adc_num, patterns, 0);
        }
        else if (strcmp(argv[optind], "tst1") == 0)
        {
            uint8_t patterns[4] = {ADC_TP_ZERO};
            ret = adc_set_test_pattern(spi_fd, adc_num, patterns, 0);
        }
        else if (strcmp(argv[optind], "tst2") == 0)
        {
            uint8_t patterns[4] = {ADC_TP_ONES};
            ret = adc_set_test_pattern(spi_fd, adc_num, patterns, 0);
        } 
        else
        {
            printf("Unrecognized cmd: %s\n", argv[optind]);
            print_usage();
            close(spi_fd);
            return -1;
        }

        close(spi_fd);
        return ret;
    }
    else
    {
        printf("No command specified!\n");
        print_usage();
        return -1;
    }
}