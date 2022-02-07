#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>  

// #define DEBUG
#include "dbg.h"

#include "gpio.h"


int init_gpio() {
    DBG("init_gpio()\n", NULL);

    struct stat stat_buf;   
    char gpio_dev_name[64];
    sprintf(gpio_dev_name, "/sys/class/gpio/gpio%d/value", ADC_DMA_RESET_GPIO);
    //if(stat("/sys/class/gpio/gpio492/value", &stat_buf) == 0) {
    if(stat(gpio_dev_name, &stat_buf) == 0) {
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
			case ADC_TRIGGER_MODE_GPI0_LSB:
                sprintf(cmd, "echo 1 > /sys/class/gpio/gpio%d/value", i);           // software trigger mode
                break;
                
            default:
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


	for(int i = PACKET_NUM_LSB; i <= PACKET_NUM_MSB; i++) {
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

	for(int i = DELAY_CTRL_LSB; i <= DELAY_CTRL_MSB; i++) {
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


int dma_reset() {
    char cmd[64];
    //system("echo 0 > /sys/class/gpio/gpio499/value"); 
    sprintf(cmd, "echo 0 > /sys/class/gpio/gpio%d/value", ADC_DMA_RESET_GPIO);
    system(cmd);
    
    usleep(500 * 1000);
    //system("echo 1 > /sys/class/gpio/gpio499/value"); 
    sprintf(cmd, "echo 1 > /sys/class/gpio/gpio%d/value", ADC_DMA_RESET_GPIO);
    system(cmd);
    
    return 0;       // \todo verify system cmd error codes, return appropiate value
}


int set_adc_suppress_bit(int state) {
    char cmd[64];
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", (state > 0 ? 1 : 0), SUPPRESS_MSB_GPIO);
    DBG("%s\n", cmd);
    system(cmd);

    return 0;       // \todo verify system cmd error codes, return appropiate value
}


int set_loop_suppress_bit(int state) {
    char cmd[64];
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", (state > 0 ? 1 : 0), SUPPRESS_LSB_GPIO);
    DBG("%s\n", cmd);
    system(cmd);

    return 0;       // \todo verify system cmd error codes, return appropiate value
}


int set_trigger_enable_bit(int state) {
	char cmd[64];
    sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", (state > 0 ? 1 : 0), TRIGGER_ENABLE);
    DBG("%s\n", cmd);
    system(cmd);

    return 0;       // \todo verify system cmd error codes, return appropiate value
}


int set_num_packets(int num_packets) {
	char cmd[64];

    for(int i = PACKET_NUM_LSB; i < TRIGGER_ENABLE; i++) {
        sprintf(cmd, "echo %d > /sys/class/gpio/gpio%d/value", (num_packets & 0x0001), i);
        DBG("set_num_packets(): cmd=%s\n", cmd);
        int ret = system(cmd); 
        DBG("set_num_packets(): ret=%d\n", ret);
        num_packets = num_packets >> 1;
    }
	return 0;
}






