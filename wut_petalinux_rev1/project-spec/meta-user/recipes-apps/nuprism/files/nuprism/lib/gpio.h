#ifndef GPIO_H
#define GPIO_H

#define SUPPRESS_LSB_GPIO        344   /* 408 */
#define SUPPRESS_MSB_GPIO        345   /* 409 */
#define ADC_TRIGGER_GPIO         346   /* 410 */
#define ADC_TRIGGER_MODE_GPI0_LSB  347 /* 411 */
#define ADC_TRIGGER_MODE_GPI0_MSB  348 /* 413 */
// Trigger mode 0        ++++++00 - transmisja non-stop bez triggera, 001 - software'owy trigger (0->1 /410), 010 - trigger zewnetrzny z plyti MZ, 011 - autotrigger z kanalu 0, 111 - autotrigger z kanalu 1
// 414 415 nieuzywane na razie 
#define ADC_CH0_NUM_LSB          (ADC_TRIGGER_MODE_GPI0_LSB + 5)
#define ADC_CH0_NUM_MSB          (ADC_CH0_NUM_LSB + 4)
#define ADC_CH1_NUM_LSB          (ADC_CH0_NUM_MSB + 4)
#define ADC_CH1_NUM_MSB          (ADC_CH1_NUM_LSB + 4)

#define SUPPRESS_GPIO_START SUPPRESS_LSB_GPIO
#define SUPPRESS_GPIO_END   (SUPPRESS_LSB_GPIO + 19)      /* ADC_CH1_NUM_MSB */

#define DMA_BUF_SIZE_GPIO_START 364   /* 428 */
#define DMA_BUF_SIZE_GPIO_END   395   /* 459 */

// 396 .. 427 PACKET_NUM inputs

#define PACKET_NUM_LSB  428
#define PACKET_NUM_MSB  (PACKET_NUM_LSB + 31)
#define TRIGGER_ENABLE  PACKET_NUM_MSB

#define DELAY_CTRL_LSB 460
#define DELAY_CTRL_MSB (DELAY_CTRL_LSB + 31)

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


#define ADC_NUM_MIN  0
#define ADC_NUM_MAX 19

#define ADC_CHIP_NUM_MIN 0
#define ADC_CHIP_NUM_MAX 4


int init_gpio();

int set_adc_num(int chan_num, int adc_num);
int set_dma_buf_size(int buf_size);
int dma_reset();
int set_adc_suppress_bit(int state);
int set_loop_suppress_bit(int state);
int set_trigger_enable_bit(int state);
int set_num_packets(int num_packets);

#endif
