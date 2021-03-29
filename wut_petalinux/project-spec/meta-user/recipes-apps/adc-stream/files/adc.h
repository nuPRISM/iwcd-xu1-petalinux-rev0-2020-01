#ifndef ADC_H
#define ADC_H

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
