/**
 * @file adc-spi.h
 * @author Jake Cronin (jcronin@triumf.ca)
 * @brief ADC SPI control API. Supports read and write operations to all 
 *        registers in the ADC array
 * @version 0.1
 * @date 2021-02-23
 * 
 * @copyright Copyright (c) 2021
 * 
 */

#ifndef _ADC_SPI_H_
#define _ADC_SPI_H_

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
// #include <errno.h>

#include <linux/spi/spidev.h>

#ifdef DEBUG
  #define DBG(fmt, args...) printf("DBG: " fmt, args)
#else
  #define DBG(fmt, args...)
#endif

// Default values passed to spi-dev
#define DEFAULT_SPI_DEVICE        "/dev/spidev1.0"
#define DEFAULT_SPI_DELAY_USEC    0
#define MAX_SPI_SPEED_HZ          20000000
#define MIN_SPI_SPEED_HZ          500
#define DEFAULT_SPI_SPEED_HZ      500000
#define DEFAULT_SPI_BITS_PER_WORD 8

// Read and write commands as specified in the TI ADC342x datasheet
#define SPI_READ_CMD	          0xC0
#define SPI_WRITE_CMD             0x40

// Used to specify relevant GPIO pins 
#define ADC0_GPIO                 492
#define ADC1_GPIO                 493
#define ADC2_GPIO                 494
#define ADC3_GPIO                 495
#define ADC4_GPIO                 496
#define RESET_GPIO                497
#define PDN_GPIO                  498

/**
 * @brief Create a TX buffer to read or write data to a register within the ADC peripheral
 * 
 * TX buffer should be assembled with READ/WRITE flags being transferred first, 
 * followed by address and data. 
 * * Data bus is ignored for a read command 
 * 
 * @param command   Determines bit A16 and A15, specifies a read or write command
 * @param address   Address of the register being read or written to
 * @param data      Byte of data being written to a register, ignored in a read command
 */
#define TX_BUFFER(command, address, data) {((uint8_t)((address & 0x3F00) >> 8)) | command, \
                                           (uint8_t)(address & 0xFF), \
                                           data}

/**
 * @brief Returns the size of an array
 */
#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))


/**
 * @brief Set mode for spi transfers
 * 
 * @param spidev_mode New mode configuration
 */
void adc_set_mode(int spidev_mode);


/**
 * @brief Set bits per word for spi transfers
 * 
 * @param spidev_bits_per_byte New bits per word for transfers
 */
void adc_set_bits(int spidev_bits_per_byte);


/**
 * @brief Set speed for spi transfers
 * 
 * @param adc_num New transfer speed
 */
void adc_set_speed(int spidev_speed);


/**
 * @brief Set mode for spi transfers
 * 
 * @param adc_num New delay between last bit transferred and chip deselect
 */
void adc_set_delay(int spidev_delay);


/**
 * @brief Verify ADC selection and enable the device for read/write transfer
 * 
 * @param adc_num   Index of the selected ADC
 * 
 * @return          Zero on success, uses negative numbers as error codes
 */
int adc_enable(int adc_num);


/**
 * @brief Verify ADC selection and disable the device for read/write transfer
 * 
 * @param adc_num   Index of the selected ADC
 * 
 * @return          Zero on success, uses negative numbers as error codes
 */
int adc_disable(int adc_num);


/**
 * @brief Power down all ADC peripherals by setting GPIO 498
 * 
 * @return Zero on success, uses negative numbers as error codes
 */
int adc_power_down(void);


/**
 * @brief Power up all ADC peripherals by clearing GPIO 498
 * 
 * @return Zero on success, uses negative numbers as error codes
 */
int adc_power_up(void);


/**
 * @brief Perform a hardware reset for all ADC peripherals
 * 
 * After power-up, the internal registers must be initialized to their 
 * default values through a hardware reset by applying a high pulse on 
 * the RESET pin (of durations greater than 10 ns)
 * 
 * @return Zero if a successful reset occures, uses negative numbers as error codes
 */
int adc_reset(void);


/**
 * The device includes a mode where the contents of the internal registers can be read back using the SDOUT pin.
 * This readback mode may be useful as a diagnostic check to verify the serial interface communication between
 * the external controller and the ADC. The procedure to read the contents of the serial registers is as follows:
 *  1. Drive the SEN pin low.
 *  2. Set the R/W bit (A15) to 1. This setting disables any further writes to the registers.
 *  3. Set bit A14 in the address field to 1.
 *  4. Initiate a serial interface cycle specifying the address of the register (A13 to A0) whose content must be read.
 *  5. The device outputs the contents (D7 to D0) of the selected register on the SDOUT pin.
 *  6. The external controller can latch the contents at the SCLK rising edge.
 *  7. To enable register writes, reset the R/W register bit to 0.
 * 
 * @param address   Address of the register being read
 * @param data      Address to store data returned from transfer
 * 
 * @return          ioctl returns the number of bytes transferred upon success
*/
int adc_read(uint16_t address, uint8_t* data);


/**
 * The device internal register can be programmed with these steps:
 *  1. Drive the SEN pin low,
 *  2. Set the R/W bit to 0 (bit A15 of the 16-bit address),
 *  3. Set bit A14 in the address field to 1,
 *  4. Initiate a serial interface cycle by specifying the address of the register (A13 to A0) whose content must be written, and
 *  5. Write the 8-bit data that are latched in on the SCLK rising edge.
 * 
 * @param address   Address of the register being written to
 * @param data      Data being transferred
 * 
 * @return          ioctl returns the number of bytes transferred upon success
 */
int adc_write(uint16_t address, uint8_t data);


/**
 * @brief Populate all registers of a specific ADC with specific data values
 * 
 * @param adc_num   The ADC to write to
 * @param cfg_data  Array containing the data to write to each register
 * @param data_size The size of the data array param, must match the register array size
 * 
 * @return          Return number of bytes per transfer if all registers were successfully populated.
 */
int adc_init(int adc_num, uint8_t cfg_data[], uint8_t data_size);


/**
 * @brief Read back the contents of each ADC register and compare with the data sent in adc_init()
 * to verify connection between FPGA and ADC at power-on 
 * 
 * @param adc_num   The ADC to write to 
 * 
 * @return          Return number of bytes per transfer if all registers were successfully read.
 */
int adc_read_back(int adc_num, uint8_t cfg_data[], uint8_t data_size);


/**
 * @brief Write 0x00 t0 register 0x06, placing the ADC in nominal mode
 * 
 * @param adc_num   The ADC to write to 
 */
void adc_nominal_mode(int adc_num);

/** 
 * @brief Open SPI device
 * 
 * @param device_name Filename for the ADC SPI driver
 */
int adc_open(char device_name[]);


/** 
 * @brief Close SPI device
 */
void adc_close(void);


/**
 * @brief Configure SPI driver by setting the default mode, bits per word and speed for a transfer
 * 
 * @return On successful configuration, zero is returned
 */
int adc_spi_init(void);

#endif // _ADC_SPI_H_