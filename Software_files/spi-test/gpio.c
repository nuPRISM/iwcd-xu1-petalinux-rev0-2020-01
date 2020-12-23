/*
* gpio.c
*
* Author: Luke Bidulka
* Company: TRIUMF
* Date: Deec 2, 2020
*
* Purpose: Initialize and provide communcation with the AXI gpio for NuPRISM.
*
*/

/***************************** Include Files **********************************/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <sys/ioctl.h>

/************************** Constant Definitions ******************************/

// gpio modes
#define GPIO_IN 0
#define GPIO_OUT 1

/************************** Variable Definitions ******************************/

/******************************* Functions ************************************/

// The GPIO has to be exported to be able to see it
// in sysfs
int gpio_export(int pin){
    int exp_fd; 
    char gpio[4];

    exp_fd = open("/sys/class/gpio/export", O_WRONLY);
    if (exp_fd < 0)
    {
        printf("Cannot open GPIO to export it\n");
        return 1;
    }
  
    // Base address of axi gpio is 492
    snprintf(gpio, 4, "49%d", 2 + pin);
    printf("Exporting %s\n", gpio);

    write(exp_fd, gpio, 4);
    close(exp_fd);
  
    printf("GPIO exported successfully\n");
    return 0;
}

// Set gpio pin to input or output
int gpio_set_inout(int pin, int mode){
    int dir_fd;
    char path_full[100] = "/sys/class/gpio/gpio";
    char path_pin[4];    

    // Open device
    snprintf(path_pin, 4, "49%d", 2 + pin);
    printf("Setting direction of %s to %d\n", path_pin, mode);
    strcat(path_full, path_pin);
    strcat(path_full, "/direction");


    dir_fd = open(path_full, O_RDWR);
    if (dir_fd < 0)
    {
        printf("ERR: Cannot open GPIO direction\n");
        return 1;
    }
    // Set mode
    if (mode == GPIO_IN){
        write(dir_fd, "in", 4);
    }
    if (mode == GPIO_OUT){
        write(dir_fd, "out", 4);
    }
    else{
        printf("ERR: Invalid GPIO mode\n");
        return 1;
    }
    close(dir_fd);
}

int gpio_write(int pin, int write_val){
    int val_fd;
    char path_full[100] = "/sys/class/gpio/gpio";
    char path_pin[4];    

    // Open device
    snprintf(path_pin, 4, "49%d", 2 + pin);
    printf("Writing %d to %s (%d)\n", write_val, path_pin, pin);
    strcat(path_full, path_pin);
    strcat(path_full, "/direction");

    val_fd = open(path_full, O_RDWR);
  
    if (val_fd < 0)
    {
        printf("ERR: Cannot open GPIO value\n");
        return 1;
    }

    // write value to pin
    if (write_val){
        write(val_fd, "1", 2);
    }
    else if (!write_val){
        write(val_fd, "0", 2);
    }
    else {
        printf("ERR: Invalid GPIO write value\n");
        return 1;
    }
    
    return 0;
}

int gpio_read(void){
    return 0;
}