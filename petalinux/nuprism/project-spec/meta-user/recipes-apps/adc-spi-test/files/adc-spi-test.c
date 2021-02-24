#include <stdio.h>
#include <unistd.h>

#define DEBUG
#include "adc-spi.h"

#define NORMAL_OP_TEST_PATTERN  0x00
#define ALL_ZEROS_TEST_PATTERN  0x11
#define ALL_ONES_TEST_PATTERN   0x22
#define TOGGLE_TEST_PATTERN     0x33

static uint32_t mode = SPI_CS_HIGH;
static uint8_t  bits = 8;
static uint32_t speed = 500000;
static uint16_t delay = 0;

static uint16_t addr;
static uint8_t value;
static int adc_num;
static char device_name[64] = DEFAULT_SPI_DEVICE;

// Use config data defined in adc-spi
extern uint8_t adc_cfg_data[];
extern uint8_t adc_register_count;


int adc_test(int adc_num, uint8_t test_pattern)
{
    DBG("adc_test(): num=%d\n", adc_num);

    adc_enable(adc_num);

    int ret = adc_write(0x06, 0x02);           // Register 06h: Test pattern output enabled
    DBG("adc_test: reg 06h, ret=%d\n", ret);
    ret = adc_write(0x0A, test_pattern);       // Register 0Ah: test pattern for channel A, B Toggle pattern: data alternate between 101010101010 and 010101010101 
    DBG("adc_test: reg 0Ah, ret=%d\n", ret);
    ret = adc_write(0x0B, test_pattern);       // Register 0Ah: test pattern for channel C, D Toggle pattern: data alternate between 101010101010 and 010101010101 
    DBG("adc_test: reg 0AB, ret=%d\n", ret);

    adc_disable(adc_num);

    return 0;
}


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

	while ((opt = getopt(argc, argv, "n:d:m:b:s:a:v:")) != -1)
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

            case 'a':
                addr = atoi(optarg);
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

    get_opts(argc, argv);

    // These values will be set by default
    adc_set_mode(mode);
    adc_set_bits(bits);
    adc_set_speed(speed);
    adc_set_delay(delay);
    
    if (optind < argc)
    {
        if (adc_open(device_name) != 0)
        {
            return -1;
        }
        if (adc_spi_init() != 0)
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
            ret = adc_init(adc_num, adc_cfg_data, adc_register_count);
        }
        else if (strcmp(argv[optind], "rb") == 0)
        {
            ret = adc_read_back(adc_num, adc_cfg_data, adc_register_count);
        }
        else if (strcmp(argv[optind], "read") == 0)
        {
            uint8_t data = 0xCC;
            adc_enable(adc_num);

            ret = adc_read(addr, &data);
            DBG("address=%d, ret=%d, value=0x%x\n", addr, ret, data);
            
            adc_disable(adc_num);
        }
        else if (strcmp(argv[optind], "write") == 0)
        {
            adc_enable(adc_num);

            ret = adc_write(addr, value);
            DBG("address=%d, value=%d, ret=%d\n", addr, value, ret);

            adc_disable(adc_num);
        }
        else if (strcmp(argv[optind], "nom") == 0)
        {
            adc_nominal_mode(adc_num);
        }
        else if (strcmp(argv[optind], "tst") == 0)
        {
            ret = adc_test(adc_num, TOGGLE_TEST_PATTERN);
        }
        else if (strcmp(argv[optind], "tst0") == 0)
        {
            ret = adc_test(adc_num, ALL_ZEROS_TEST_PATTERN);
        }
        else if (strcmp(argv[optind], "tst1") == 0)
        {
            ret = adc_test(adc_num, ALL_ONES_TEST_PATTERN);
        } 
        else
        {
            printf("Unrecognized cmd: %s\n", argv[optind]);
            print_usage();
            return -1;
        }

        adc_close();
        return ret;
    }
    else
    {
        printf("No command specified!\n");
        print_usage();
        return -1;
    }
}