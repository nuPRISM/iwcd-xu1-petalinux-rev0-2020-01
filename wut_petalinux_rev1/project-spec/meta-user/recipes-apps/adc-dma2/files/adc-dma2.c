#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <pthread.h>
#include <sys/ioctl.h>
#include <sys/stat.h>  
#include <sys/mman.h>

#include "adc.h"
#include "clc.h"
#include "dma-proxy.h"

#define DEBUG
#include "dbg.h"

#define ADC_SEL0_GPIO      492
#define ADC_SEL1_GPIO      493
#define ADC_SEL2_GPIO      494
#define ADC_SEL3_GPIO      495
#define ADC_SEL4_GPIO      496
#define ADC_RESET_GPIO     497
#define ADC_PWRDN_GPIO     498
#define ADC_DMA_RESET_GPIO 499

#define ADC_GPIO_START ADC_SEL0_GPIO
#define ADC_GPIO_END   ADC_DMA_RESET_GPIO

#define SUPPRESS_LSB_GPIO        440
#define SUPPRESS_MSB_GPIO        441
#define ADC_TRIGGER_GPIO         442
#define ADC_TRIGGER_ENABLE_GPI0  443
#define ADC_CH0_NUM_LSB          444
#define ADC_CH0_NUM_MSB          448
#define ADC_CH1_NUM_LSB          449
#define ADC_CH1_NUM_MSB          453

#define SUPPRESS_GPIO_START SUPPRESS_LSB_GPIO
#define SUPPRESS_GPIO_END   ADC_CH1_NUM_MSB

#define DMA_BUF_SIZE_GPIO_START 460
#define DMA_BUF_SIZE_GPIO_END   491

#define MIN_ADC_NUM  0
#define MAX_ADC_NUM 19
#define MAX_BUF_SIZE (3 * 1024 * 1024)


static pthread_t trigger_thread = 0;
static pthread_t acq_ch0_thread = 0;
static pthread_t acq_ch1_thread = 0;

typedef struct {
    char dma_dev[32];
    char filename[32];
    unsigned int buf_size;
    int status;
} AcqData;


void *trigger_thread_fun( void *ptr ) {
    DBG("delay start\n", NULL);
    usleep(10 * 1000);
    // system("echo 1 > /sys/class/gpio/gpio442/value");     // set trigger
    // system("echo 0 > /sys/class/gpio/gpio442/value");     // unset trigger
    DBG("delay end\n", NULL);
    
    
    return NULL;
}


void *acquisition_thread_fun(void *ptr) {
    AcqData *data_ptr = (AcqData*)ptr;
    DBG("acq start: dev_name=%s, filename=%s buf_siez=%d\n", data_ptr->dma_dev, data_ptr->filename, data_ptr->buf_size);

    // open DMA device
    int	rx_proxy_fd = open(data_ptr->dma_dev, O_RDWR);
	if (rx_proxy_fd < 1) {
		DBG("Unable to open DMA proxy device file: %s", data_ptr->dma_dev);
        data_ptr->status = 1;
		return NULL;
	}

    // map DMA buffer    
    struct dma_proxy_channel_interface *rx_proxy_interface_p;
    
    rx_proxy_interface_p = (struct dma_proxy_channel_interface *)mmap(NULL, sizeof(struct dma_proxy_channel_interface),
									PROT_READ | PROT_WRITE, MAP_SHARED, rx_proxy_fd, 0);
	if (rx_proxy_interface_p == MAP_FAILED) {
		DBG("Failed to mmap buf for device %s\n", data_ptr->dma_dev);
        data_ptr->status = 2;
		return NULL;
	}

    // set buf size
    rx_proxy_interface_p->length = data_ptr->buf_size;
    DBG("thread_fun(): buf size=%d\n", rx_proxy_interface_p->length);

    // DMA transfer    
    int dummy;
    ioctl(rx_proxy_fd, 0, &dummy);
    if (rx_proxy_interface_p->status != PROXY_NO_ERROR) {
	    DBG("Proxy rx transfer error: status=%d device=%s\n", rx_proxy_interface_p->status, data_ptr->dma_dev);
        data_ptr->status = 3;
		return NULL;
    } 
    DBG("DMA transfer OK, storing data in file\n", data_ptr->filename);

    // saving received data
    FILE* file = fopen(data_ptr->filename, "wb");
    if(file == NULL) {
   	    DBG("can not open file %s\n", data_ptr->filename);
        data_ptr->status = 4;
		return NULL;
    } 
    if (!fwrite( rx_proxy_interface_p->buffer, 1, data_ptr->buf_size, file)) {
   	    DBG("File %s write error\n", data_ptr->filename);
        data_ptr->status = 5;           // \todo #define THREAD_SATUS_xxx
		return NULL;
    } 
    fclose(file);

    // Unmap the proxy channel interface memory     
    munmap(rx_proxy_interface_p, sizeof(struct dma_proxy_channel_interface));
    
    // close DMA proxy device
    close(rx_proxy_fd);
   
    data_ptr->status = 0;
    
    return NULL;
}


int init_gpio() {
    struct stat stat_buf;   
    if(stat("/sys/class/gpio/gpio492/value", &stat_buf) == 0) {
        DBG("GPIO already initialized\n", NULL);
        return 1;
    }

    for(int i = ADC_GPIO_START; i <= ADC_GPIO_END; i++) {
        char cmd[64];
        
        sprintf(cmd, "echo %d > /sys/class/gpio/export", i);
        DBG("%s\n", cmd);
        system(cmd);
        
        sprintf(cmd, "echo out > /sys/class/gpio/gpio%d/direction", i);
        DBG("%s\n", cmd);
        system(cmd);
        
        // \todo set default values
    }
    
    for(int i = SUPPRESS_LSB_GPIO; i <= SUPPRESS_GPIO_END; i++) {
        char cmd[64];
        
        sprintf(cmd, "echo %d > /sys/class/gpio/export", i);
        DBG("%s\n", cmd);
        system(cmd);
        
        sprintf(cmd, "echo out > /sys/class/gpio/gpio%d/direction", i);
        DBG("%s\n", cmd);
        system(cmd);   
        
        switch(i) {
            case SUPPRESS_LSB_GPIO:
            case SUPPRESS_MSB_GPIO:
                sprintf(cmd, "echo 1 > /sys/class/gpio/gpio%d/value", i);
                break;
                
            case ADC_TRIGGER_GPIO:
                sprintf(cmd, "echo 0 > /sys/class/gpio/gpio%d/value", i);
                break;
        }
        DBG("%s\n", cmd);
        system(cmd);
    }
    
    for(int i = DMA_BUF_SIZE_GPIO_START; i <= DMA_BUF_SIZE_GPIO_END; i++) {
        char cmd[64];
        
        sprintf(cmd, "echo %d > /sys/class/gpio/export", i);
        DBG("%s\n", cmd);
        system(cmd);
        
        sprintf(cmd, "echo out > /sys/class/gpio/gpio%d/direction", i);
        DBG("%s\n", cmd);
        system(cmd);
        
        sprintf(cmd, "echo 0 > /sys/class/gpio/gpio%d/value", i);        
        DBG("%s\n", cmd);
        system(cmd);
    }
    
    return 0;       // \todo verify system cmd error codes, return appropiate value
}


int set_adc_num(int chan_num, int adc_num) {
    int first_gpio, last_gpio;
    
    switch(chan_num) {
        case 0:
            first_gpio = ADC_CH0_NUM_LSB;
            last_gpio  = ADC_CH0_NUM_MSB;
            break;
        
        case 1:
            first_gpio = ADC_CH1_NUM_LSB;
            last_gpio  = ADC_CH1_NUM_MSB;
            break;
            
        default:
            printf("Illegal channel number: %d\n", chan_num);
            return -1;
    }
    for(int i = first_gpio; i <= last_gpio; i++) {
        char cmd[64];
    
        sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", (adc_num & 0x01), i);        
        DBG("%s\n", cmd);
        system(cmd);
        
        adc_num >>= 1;
    }
    return 0;
}


int set_dma_buf_size(int buf_size) {
    buf_size = buf_size >> 2;           // buffer size must be set a a number of 4 byte words
    
    for(int i = DMA_BUF_SIZE_GPIO_START; i <= DMA_BUF_SIZE_GPIO_END; i++) {
        char cmd[64];
    
        sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", (buf_size & 0x01), i);        
        DBG("%s\n", cmd);
        system(cmd);
        
        buf_size = buf_size >> 1;
    }
    
    return 0;       // \todo verify system cmd error codes, return appropiate value
}


int adc_config(int fd, int adc_num, int adc_mode) {
    adc_init(fd, adc_num);        
    switch(adc_mode) {
        case 0:
            adc_test(fd, adc_num, ALL_ZEROS_TEST_PATTERN);
            break; 

        case 1:
            adc_test(fd, adc_num, ALL_ONES_TEST_PATTERN);
            break;

        case 2:
            adc_test(fd, adc_num, TOGGLE_TEST_PATTERN);
            break;

        case 3:
            adc_test(fd, adc_num, DIGITAL_RAMP_PATTERN);
            break;

        case 4:
            adc_sine_wave_test(fd, adc_num);
            break;

        default:
            adc_nominal_mode(fd, adc_num);
            break;
    }
    return 0;           // \tod verify adc_xxx(0 functions return codes
}


int dma_reset() {
    system("echo 0 > /sys/class/gpio/gpio499/value"); 
    usleep(500 * 1000);
    system("echo 1 > /sys/class/gpio/gpio499/value"); 

    return 0;       // \todo verify system cmd error codes, return appropiate value
}


void print_usage() {
    printf("Usage:\n\tadc_stream2 -m ADC_num_ch1 -n ADC_num_ch2 -p ADC_mode_ch0 -q ADC_mode_ch1 -b buf_size [init]\n");
    printf("\tADC_num_chx=0..19\n");
    printf("\tadc_mode: 0 - tst0, 1 - tst1, 2 - toggle test pattern, 3 - digital ramp pattern, 4 -sine wave pattern, 5 - nominal mode \n");
}


int main(int argc, char **argv)
{
	int opt;
    int adc_ch0_num, adc_ch1_num;
    int adc_ch0_mode, adc_ch1_mode;
    int buf_size;
    static AcqData acq_ch0_data, acq_ch1_data;
    
    
    adc_ch0_num = adc_ch1_num = buf_size = -1;
    while((opt = getopt(argc, argv, "m:n:p:q:b:")) != -1) {
        switch(opt) {
            case 'm':
                adc_ch0_num = atoi(optarg);
                break;
                
            case 'n':
                adc_ch1_num = atoi(optarg);
                break;

            case 'p':
                adc_ch0_mode = atoi(optarg);
                break;

            case 'q':
                adc_ch1_mode = atoi(optarg);
                break;
                
            case 'b':
                buf_size = atoi(optarg);
                break;
            
            case ':':
                printf("option value not specified\n");
                print_usage();
                exit(1);
                
            case '?':
                printf("option value not specified: %c\n", optopt);
                print_usage();
                exit(1);
        }
    }

    if(adc_ch0_num < MIN_ADC_NUM || adc_ch0_num > MAX_ADC_NUM) {
        printf("Illegal value: ADC_num_ch0=%d\n", adc_ch0_num);
        print_usage();
        exit(1);
    }
    
    if(adc_ch1_num < MIN_ADC_NUM || adc_ch1_num > MAX_ADC_NUM) {
        printf("Illegal value: ADC_num_ch1=%d\n", adc_ch1_num);
        exit(1);
    }
    
    if(buf_size < 0 || buf_size > MAX_BUF_SIZE) {
        printf("Illegal value: buf_size=%d\n", buf_size);
        exit(1);
    }

    for(int index = optind; index < argc; index++) {
        if(strcmp(argv[index], "init") == 0) {
            init_gpio();
        }
    }
    
    printf("ADC_num_ch0=%d, ADC_num_ch1=%d, adc_ch0_mode=%d, adc_ch1_mode=%dbuf_size=%d\n", adc_ch0_num, adc_ch1_num, adc_ch0_mode, adc_ch1_mode, buf_size);
    
    // set ADC num for DMA channels
    set_adc_num(0, adc_ch0_num);
    set_adc_num(1, adc_ch1_num);

    // set DMA buuffer size
    set_dma_buf_size(buf_size);

    // initialize/start clock cleaner
    int ret_val = clc_init();                     // \todo terminate if ret_val != 0
    DBG("clc_init(): ret_val=%d\n", ret_val);
    ret_val = clc_set_state(CLC_ON);
    DBG("clc_state(ON): ret_val=%d\n", ret_val);

    // initilize SPI/ADC
    int fd = spi_init(DEFAULT_SPI_DEVICE);          // \todo optional param in cmd line to change device name
    if(fd < 0) {
        printf("SPI device not opened/configured - terminating ... \n");
        return 3;                                   // \todo close SPI device if opened
    }
    adc_reset();

    // configure & set ADC mode
    adc_config(fd, adc_ch0_num, adc_ch0_mode);          // \todo verify config_adc() return code
    adc_config(fd, adc_ch1_num, adc_ch1_mode);    

    // close SPI dev
    close(fd);

    // reset DMA
    dma_reset();
                
    // configure acqusition threads
    strcpy(acq_ch0_data.dma_dev, "/dev/dma_proxy_rx_0");
    strcpy(acq_ch1_data.dma_dev, "/dev/dma_proxy_rx_1");
    strcpy(acq_ch0_data.filename, "dma_ch0.bin");
    strcpy(acq_ch1_data.filename, "dma_ch1.bin");
    acq_ch1_data.buf_size = acq_ch0_data.buf_size = buf_size;

    printf("Press ENTER to continue...");
    int c = getchar();
        
    // start all threads
    system("echo 0 > /sys/class/gpio/gpio441/value");        // unset ADC supress bit        
    pthread_create(&trigger_thread, NULL, trigger_thread_fun, (void*)(NULL));
    pthread_create(&acq_ch0_thread, NULL, acquisition_thread_fun, (void*)(&acq_ch0_data));
    pthread_create(&acq_ch1_thread, NULL, acquisition_thread_fun, (void*)(&acq_ch1_data));
    system("echo 1 > /sys/class/gpio/gpio441/value");        // reset ADC supress bit        
    
    // wait for all threads to finish executing
    pthread_join(trigger_thread, NULL);
    pthread_join(acq_ch0_thread, NULL);
    pthread_join(acq_ch1_thread, NULL);
    DBG("DMA threads joined: status ch0=%d, ch1=%d\n", acq_ch0_data.status, acq_ch1_data.status);
    
	return 0;
}
