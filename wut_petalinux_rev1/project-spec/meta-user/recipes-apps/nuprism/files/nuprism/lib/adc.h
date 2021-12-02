#ifndef ADC_H
#define ADC_H

#define DEFAULT_ADC_NUM 0
#define DEFAULT_SPI_DEVICE "/dev/spidev1.0"

#define NORMAL_OP_TEST_PATTERN 0x00
#define ALL_ZEROS_TEST_PATTERN 0x11
#define ALL_ONES_TEST_PATTERN  0x22
#define TOGGLE_TEST_PATTERN    0x33
#define DIGITAL_RAMP_PATTERN   0x44
#define SINE_WAVE_PATTERN_AB   0x99
#define SINE_WAVE_PATTERN_CD   0xbb

// Trigger mode 0        ++++++00 - transmisja non-stop bez triggera, 001 - software'owy trigger (0->1 /410), 010 - trigger zewnetrzny z plyti MZ, 011 - autotrigger z kanalu 0, 111 - autotrigger z kanalu 1
// 414 415 nieuzywane na razie 
#define NON_STOP_TRIGGER_MODE   0x00
#define SOFTWARE_TRIGGER_MODE   0x01
#define EXTERNAL_TRIGGER_MODE   0x02
#define AUTO_TRIGGER_CHAN0_MODE 0x03
#define AUTO_TRIGGER_CHAN1_MODE 0x07

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
int adc_sine_wave_test(int fd, int adc_num);

int adc_trigger_mode(int trigger_mode);

int adc_config(int fd, int adc_num, int adc_mode);
int config_all_adcs(int adc_mode);

#endif
