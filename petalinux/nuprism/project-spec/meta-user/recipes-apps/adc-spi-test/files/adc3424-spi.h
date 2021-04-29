/**
 * @file adc-spi.h
 * @author Jake Cronin (jcronin@triumf.ca)
 * @brief ADC SPI control API. Supports read and write operations to all 
 *        registers in the ADC array
 * Datasheet: https://www.ti.com/lit/ds/symlink/adc3424.pdf?ts=1611786006264&ref_url=https%253A%252F%252Fwww.ti.com%252Fstore%252Fti%252Fen%252Fp%252Fproduct%252F%253Fp%253DADC3424IRTQT%2526HQS%253Dcorp-tistore-null-storeinv-invf-store-findchips-wwe
 * 
 * @version 0.1
 * @date 2021-02-23
 * 
 */
#ifndef _ADC_SPI_H_
#define _ADC_SPI_H_

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <errno.h>
#include <fcntl.h>

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
#define SPI_READ_CMD	            0xC0
#define SPI_WRITE_CMD             0x40

// Used to specify relevant GPIO pins 
#define ADC0_GPIO                 492
#define ADC1_GPIO                 493
#define ADC2_GPIO                 494
#define ADC3_GPIO                 495
#define ADC4_GPIO                 496
#define RESET_GPIO                497
#define PDN_GPIO                  498

#define ADC_COUNT                 5

#define ADC_TP_NOMINAL            0x0
#define ADC_TP_ZERO               0x1
#define ADC_TP_ONES               0X2
#define ADC_TP_ALTERNATE          0x3
#define ADC_TP_RAMP               0x4
#define ADC_TP_CUSTOM             0x5
#define ADC_TP_DESKEW             0x6
#define ADC_TP_PRBS               0x8
#define ADC_TP_SINE               0x9

/**
 * @brief Returns the size of an array
 */
#ifndef ARRAY_SIZE
  #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
#endif // ARRAY_SIZE

/**
 * @brief Configure SPI driver by setting the default mode, bits per word and speed for a transfer
 * 
 * @param fd        File descriptor for the SPI bus
 * @return int      Return status
 */
int adc3424_spi_init (int fd, uint32_t mode, uint8_t bits, uint32_t speed, uint16_t delay);

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
 * @param fd        File descriptor for the SPI bus
 * @param reg       Register to read from
 * @param data      Pointer to return data
 * 
 * @return          ioctl returns the number of bytes transferred upon success
*/
int adc3424_read (int fd, uint16_t reg, uint8_t* data);

/**
 * The device internal register can be programmed with these steps:
 *  1. Drive the SEN pin low,
 *  2. Set the R/W bit to 0 (bit A15 of the 16-bit address),
 *  3. Set bit A14 in the address field to 1,
 *  4. Initiate a serial interface cycle by specifying the address of the register (A13 to A0) whose content must be written, and
 *  5. Write the 8-bit data that are latched in on the SCLK rising edge.
 * 
 * @param fd        File descriptor for the SPI bus
 * @param reg       Register to write to
 * @param data      Data to write
 * 
 * @return          ioctl returns the number of bytes transferred upon success
 */
int adc3424_write (int fd, uint16_t reg, uint8_t data);

/**
 * @brief Verify ADC selection and enable the device for read/write transfer
 * 
 * @param adc_num   Index of the selected ADC
 * 
 * @return          Return status
 */
int adc3424_enable (int adc_num);

/**
 * @brief Verify ADC selection and disable the device for read/write transfer
 * 
 * @param adc_num   Index of the selected ADC
 * 
 * @return          Return status
 */
int adc3424_disable (int adc_num);

/**
 * @brief Power down all ADC peripherals by setting GPIO 498
 * 
 * @return          Return status
 */
int adc3424_power_down (void);

/**
 * @brief Power up all ADC peripherals by clearing GPIO 498
 * 
 * @return          Return status
 */
int adc3424_power_up (void);

/**
 * @brief Perform a hardware reset for all ADC peripherals
 * 
 * After power-up, the internal registers must be initialized to their 
 * default values through a hardware reset by applying a high pulse on 
 * the RESET pin (of durations greater than 10 ns)
 * 
 * @return          Return status
 */
int adc3424_reset (void);

/**
 * @brief Populate all registers of a specific ADC with specific data values
 * 
 * @param adc_num   The ADC to write to
 * 
 * @param fd        File descriptor for the SPI bus
 * @return          Return number of bytes per transfer if all registers were successfully populated.
 */
int adc3424_init (int fd, int adc_num);

/**
 * @brief Write 0x00 t0 register 0x06, placing the ADC in nominal mode
 * 
 * @param fd        File descriptor for the SPI bus
 * @param adc_num   The ADC to write to 
 * @return          Return status
 */
int adc3424_nominal_mode (int fd, int adc_num);

/**
 * @brief Not currently implemented.
 * 
 * @param fd
 * @param adc_num 
 * @param test_patterns
 * @param custom_tp
 * @return int 
 */
int adc3424_set_test_pattern (int fd, int adc_num, uint8_t* test_patterns, uint16_t custom_tp);

#endif // _ADC_SPI_H_