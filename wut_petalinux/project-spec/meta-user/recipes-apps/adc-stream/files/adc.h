#ifndef ADC_H
#define ADC_H

#define DEFAULT_SPI_DEVICE "/dev/spidev1.0"

#define NORMAL_OP_TEST_PATTERN 0x00
#define ALL_ZEROS_TEST_PATTERN 0x11
#define ALL_ONES_TEST_PATTERN  0x22
#define TOGGLE_TEST_PATTERN    0x33


int spi_init(char* device_name);

int adc_enable(int adc_num, bool state);
int adc_read(int fd, uint16_t address, uint8_t* data);
int adc_write(int fd, uint16_t address, uint8_t data);

int adc_power_down();
int adc_power_up();

int adc_reset();
int adc_init(int fd, int adc_num);

int adc_nominal_mode(int fd, int adc_num);
int adc_test(int fd, int adc_num, uint8_t test_pattern);



#endif
