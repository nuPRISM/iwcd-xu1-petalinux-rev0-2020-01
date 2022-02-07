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
#include "gpio.h"
#include "dma-proxy.h"

#define DEBUG
#include "dbg.h"

#define MIN_ADC_NUM  0
#define MAX_ADC_NUM 19
#define MAX_BUF_SIZE (3 * 1024 * 1024)
#define DMA_CH0 0
#define DMA_CH1 1


static pthread_t trigger_thread = 0;
static pthread_t acq_ch0_thread = 0;
static pthread_t acq_ch1_thread = 0;

typedef struct {
    char dma_dev[32];
    char filename[32];
    unsigned int buf_size;
    int adc_mode;
    int status;
} AcqData;


void *trigger_thread_fun( void *ptr ) {
    DBG("delay start\n", NULL);
    usleep(10 * 1000);
    
    char cmd[64];
    //system("echo 1 > /sys/class/gpio/gpio442/value");     // set trigger
    sprintf(cmd, "echo 1 > /sys/class/gpio/gpio%d/value", ADC_TRIGGER_GPIO);
    DBG("%s\n", cmd);
    system(cmd);
    //system("echo 0 > /sys/class/gpio/gpio442/value");     // unset trigger
    sprintf(cmd, "echo 0 > /sys/class/gpio/gpio%d/value", ADC_TRIGGER_GPIO);
    DBG("%s\n", cmd);
    system(cmd);
    DBG("delay end\n", NULL);
    
    return NULL;
}


void *acquisition_thread_fun(void *ptr) {
    AcqData *data_ptr = (AcqData*)ptr;
    fprintf(stdout, "acq start: dev_name=%s, filename=%s buf_size=%d adc_mode=%d\n", data_ptr->dma_dev, data_ptr->filename, data_ptr->buf_size, data_ptr->adc_mode);

    data_ptr->status = 0;

    // open DMA device
    int	rx_proxy_fd = open(data_ptr->dma_dev, O_RDWR);
	if (rx_proxy_fd < 1) {
		fprintf(stdout, "Unable to open DMA proxy device file: %s", data_ptr->dma_dev);
        data_ptr->status = 1;
		return NULL;
	}

    // map DMA buffer    
    struct dma_proxy_channel_interface *rx_proxy_interface_p;
    
    rx_proxy_interface_p = (struct dma_proxy_channel_interface *)mmap(NULL, sizeof(struct dma_proxy_channel_interface),
								PROT_READ | PROT_WRITE, MAP_SHARED, rx_proxy_fd, 0);
	if (rx_proxy_interface_p == MAP_FAILED) {
		fprintf(stdout, "Failed to mmap buf for device %s\n", data_ptr->dma_dev);
        data_ptr->status = 2;
		return NULL;
	}

    // set buf size
    rx_proxy_interface_p->length = data_ptr->buf_size;
    fprintf(stdout, "thread_fun(): buf size=%d\n", rx_proxy_interface_p->length);

    // DMA transfer    
    int dummy;
    ioctl(rx_proxy_fd, 0, &dummy);
    if (rx_proxy_interface_p->status != PROXY_NO_ERROR) {
	    fprintf(stdout, "Proxy rx transfer error: status=%d device=%s\n", rx_proxy_interface_p->status, data_ptr->dma_dev);
        data_ptr->status = 3;
		//return NULL;
        goto cleanup;
    } 
    fprintf(stdout, "DMA transfer OK, storing data in file\n", data_ptr->filename);

    // saving received data
    FILE* file = fopen(data_ptr->filename, "wb");
    if(file == NULL) {
   	    DBG("can not open file %s\n", data_ptr->filename);
        data_ptr->status = 4;
		//return NULL;
        goto cleanup;
    } 
    if (!fwrite( rx_proxy_interface_p->buffer, 1, data_ptr->buf_size, file)) {
   	    DBG("File %s write error\n", data_ptr->filename);
        data_ptr->status = 5;           // \todo #define THREAD_STTUS_xxx
		//return NULL;
        goto cleanup;
    } 
    fclose(file);

    if(data_ptr->adc_mode == 2) {           // toggle test pattern
        uint16_t* buf_uint_ptr = (uint16_t*)(rx_proxy_interface_p->buffer);
        unsigned int num_samples = data_ptr->buf_size / 2;
    
        int pattern[2] = {0x0555, 0xfaaa};
        int offset;

        if(*buf_uint_ptr == pattern[0]) {
            offset = 0;
        } else if(*buf_uint_ptr == pattern[1]) {
            offset = 1;
        } else {
            DBG("ERROR! inorrect sample #1\n", NULL);
            data_ptr->status = 6;           // \todo #define THREAD_STTUS_xxx
        }
        for(int i = 0; i < num_samples; i++) {
            if(buf_uint_ptr[i] != pattern[(i + offset) % 2]) {
                DBG("ERROR! incorrect sample #%d\n", i);
                data_ptr->status = 6;           // \todo #define THREAD_STTUS_xxx
                break;
            }
        }
    }

cleanup:        
    // Unmap the proxy channel interface memory     
    munmap(rx_proxy_interface_p, sizeof(struct dma_proxy_channel_interface));
    
    // close DMA proxy device
    close(rx_proxy_fd);
   
    return NULL;
}




void print_usage() {
    printf("Usage:\n\tadcdmatest -m ADC_num_ch1 -n ADC_num_ch2 -p ADC_mode -q num_iter -b buf_size [B] -i [ 0 | 1 ] -t trigger_mode\n");
    printf("\tADC_num_chx=0..19\n");
    printf("\tadc_mode: 0 - tst0, 1 - tst1, 2 - toggle test pattern, 3 - digital ramp pattern, 4 -sine wave pattern, 5 - nominal mode \n");
    printf("\ttrigger mode: 0 - non-stop, 1 - software (default), 2 - external, 3 - auto chan 0, 7 - auto chan 1\n");
}



int main(int argc, char **argv)
{
	int opt;
    int adc_ch0_num, adc_ch1_num;
    int adc_mode;
    int buf_size;
	int num_iter;
    int trigger_mode = SOFTWARE_TRIGGER_MODE;
    static AcqData acq_ch0_data, acq_ch1_data;
    int interactive = 0;
    
    
    adc_ch0_num = adc_ch1_num = buf_size = -1;
    while((opt = getopt(argc, argv, "m:n:p:q:b:i:t:")) != -1) {
        switch(opt) {
            case 'm':
                adc_ch0_num = atoi(optarg);
                break;
                
            case 'n':
                adc_ch1_num = atoi(optarg);
                break;

            case 'p':
                adc_mode = atoi(optarg);
                break;
                
            case 'b':
                buf_size = atoi(optarg);
                break;

           case 'q':
                num_iter = atoi(optarg);
                break;

            case 'i':
                interactive = atoi(optarg);
                break;

            case 't':
                trigger_mode = atoi(optarg);
                break;


            case ':':
                printf("? option value not specified: %c\n", optopt);
                print_usage();
                exit(1);


            case '?':
                printf("? option value not specified: %c\n", optopt);
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

    /*for(int index = optind; index < argc; index++) {
        if(strcmp(argv[index], "init") == 0) {
            init_gpio();
        }
    }*/
	fprintf(stdout, "Configuring DMA transfer ...\n");
    init_gpio();        // \todo use WZAB multi-gpio module !!!
    
    // set ADC num for DMA channels
    set_adc_num(DMA_CH0, adc_ch0_num);
    set_adc_num(DMA_CH1, adc_ch1_num);

    // set DMA buffer size
    set_dma_buf_size(buf_size);

    // initialize/start clock cleaner
    int ret_val = clc_init();                     // \todo terminate if ret_val != 0
    DBG("clc_init(): ret_val=%d\n", ret_val);
    ret_val = clc_set_state(CLC_ON);
    DBG("clc_state(ON): ret_val=%d\n", ret_val);

    // open SPI dev
    int fd = spi_init(DEFAULT_SPI_DEVICE);          // \todo optional param in cmd line to change device name
    if(fd < 0) {
        printf("SPI device not opened/configured - terminating ... \n");
        return 3;                                   // \todo close SPI device if opened
    }

    // configure & set all ADCs
    adc_reset();
    for(int i = 0; i <= 4; i++) {
        adc_config(fd, i, adc_mode);          // \todo verify config_adc() return code
    }

    // close SPI dev
    close(fd);

    // reset DMA
    dma_reset();

    // set trigger mode
    switch(trigger_mode) {
        case 0: 
            adc_trigger_mode(NON_STOP_TRIGGER_MODE);
            break;
    
        case 1: 
            adc_trigger_mode(SOFTWARE_TRIGGER_MODE);
            break;

        case 2:
            adc_trigger_mode(EXTERNAL_TRIGGER_MODE);
            break;
        
        case 3:
            adc_trigger_mode(AUTO_TRIGGER_CHAN0_MODE);
            break;

        case 7:
            adc_trigger_mode(AUTO_TRIGGER_CHAN1_MODE);
            break;

        default:
            printf("Unrecognized trigger mode: %d\n", trigger_mode);
            return 1;
    }
                
    // configure acqusition threads
    strcpy(acq_ch0_data.dma_dev, "/dev/dma_proxy_rx_0");
    strcpy(acq_ch1_data.dma_dev, "/dev/dma_proxy_rx_1");
    //strcpy(acq_ch0_data.filename, "dma_ch0.bin");
    //strcpy(acq_ch1_data.filename, "dma_ch1.bin");
	char filename[64];
	sprintf(filename, "dma_ch0_m%02d_t%d.bin", adc_ch0_num, trigger_mode);
	strcpy(acq_ch0_data.filename, filename);
	sprintf(filename, "dma_ch1_n%02d_t%d.bin", adc_ch1_num, trigger_mode);
	strcpy(acq_ch1_data.filename, filename);

    acq_ch1_data.buf_size = acq_ch0_data.buf_size = buf_size;
    acq_ch1_data.adc_mode = acq_ch0_data.adc_mode = adc_mode;

	// num_iter == num_packets
	set_num_packets(num_iter);

	fprintf(stderr, "ADC_num_ch0=%d, ADC_num_ch1=%d, adc_mode=%d, buf_size=%d num_iter=%d trigger_mode=%d\n", adc_ch0_num, adc_ch1_num, adc_mode, buf_size, num_iter, trigger_mode);    
    if(interactive) {
	    printf("Press ENTER to continue...");
	    int c = getchar();
    }

    
	set_trigger_enable_bit(1);
	for(int i = 0; i < num_iter; i++) {
		fprintf(stdout, "DMA transfer #%d\n", i + 1);

		// unset ADC supress bit        
        set_adc_suppress_bit(0);

		// start all threads
		if(trigger_mode == 1) {			// only if SOFTWARE_TRIGGER_MODE
			pthread_create(&trigger_thread, NULL, trigger_thread_fun, (void*)(NULL));
		}
		pthread_create(&acq_ch0_thread, NULL, acquisition_thread_fun, (void*)(&acq_ch0_data));
		pthread_create(&acq_ch1_thread, NULL, acquisition_thread_fun, (void*)(&acq_ch1_data));
		
		// wait for all threads to finish executing
		if(trigger_mode == 1) {			// only if SOFTWARE_TRIGGER_MODE
			pthread_join(trigger_thread, NULL);
		}
		pthread_join(acq_ch0_thread, NULL);
		pthread_join(acq_ch1_thread, NULL);
		
		// reset ADC supress bit        
        set_adc_suppress_bit(1);
		fprintf(stdout, "DMA threads joined: status ch0=%d, ch1=%d\n", acq_ch0_data.status, acq_ch1_data.status);
	}    
	set_trigger_enable_bit(0);
	return 0;
}

