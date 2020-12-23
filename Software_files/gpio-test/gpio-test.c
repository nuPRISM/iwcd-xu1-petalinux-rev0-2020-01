/*
* gpio-test.c
*
* Author: Luke Bidulka
* Company: TRIUMF
* Date: Dec 10, 2020
*
* Purpose: Test gpio functionality on the Zynq Ultrascale+ MPSoC.
*
*/

/***************************** Include Files **********************************/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <sys/ioctl.h>

#include "gpio.c"

/************************** Constant Definitions ******************************/

// SPI GPIO of interest
#define ADC0_CS 0
#define ADC1_CS 1
#define ADC2_CS 2
#define ADC3_CS 3
#define ADC4_CS 4
#define ADC_CS_MAX 4
#define ADC_RST 5
#define ADC_PDN 6

// gpio modes
#define GPIO_IN 0
#define GPIO_OUT 1
#define GPIO_HIGH 1
#define GPIO_LOW 0

#define ADC_PWR_UP 0
#define ADC_PWR_DOWN 1

/************************** Variable Definitions ******************************/



/******************************* Functions ************************************/



/********************************* Main ***************************************/

int main(int argc, char **argv) {
    char input_command[2];
    int pin;
    int val;
    int parsed_command[2];

    printf("\nGPIO test program starting...\n\n");

    // Setup necessary gpio
    gpio_export(ADC0_CS);
    gpio_set_inout(ADC0_CS, GPIO_OUT);
    gpio_export(ADC1_CS);
    gpio_set_inout(ADC1_CS, GPIO_OUT);
    gpio_export(ADC2_CS);
    gpio_set_inout(ADC2_CS, GPIO_OUT);
    gpio_export(ADC3_CS);
    gpio_set_inout(ADC3_CS, GPIO_OUT);
    gpio_export(ADC4_CS);
    gpio_set_inout(ADC4_CS, GPIO_OUT);
    gpio_export(ADC_RST);
    gpio_set_inout(ADC_RST, GPIO_OUT);
    gpio_export(ADC_PDN);
    gpio_set_inout(ADC_PDN, GPIO_OUT);

    // Main user input loop
    while (1){
        printf("Please enter pin to write to and desired value (AB, A = pin, B = value, XX to exit): ");
        scanf("%s%s", input_command, input_command+1);
        printf("\n");

        if ((input_command[0] == 'X') && (input_command[1] == 'X')){
            break;
        }

    
        pin = (int)(input_command[0] - '0');
        val = (int)(input_command[1] - '0');

        gpio_write(pin, val);

    }
    printf("\nGPIO test program complete.\n");

}

