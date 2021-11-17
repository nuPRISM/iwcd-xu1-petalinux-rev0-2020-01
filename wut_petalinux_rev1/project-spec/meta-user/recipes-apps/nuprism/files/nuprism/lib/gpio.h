#ifndef GPIO_H
#define GPIO_H

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

#define SUPPRESS_LSB_GPIO        408
#define SUPPRESS_MSB_GPIO        409
#define ADC_TRIGGER_GPIO         410
#define ADC_TRIGGER_MODE_GPI0_LSB  411
#define ADC_TRIGGER_MODE_GPI0_MSB  413
// Trigger mode 0        ++++++00 - transmisja non-stop bez triggera, 001 - software'owy trigger (0->1 /410), 010 - trigger zewnetrzny z plyti MZ, 011 - autotrigger z kanalu 0, 111 - autotrigger z kanalu 1
// 414 415 nieuzywane na razie 
#define ADC_CH0_NUM_LSB          (ADC_TRIGGER_MODE_GPI0_LSB + 5)
#define ADC_CH0_NUM_MSB          (ADC_CH0_NUM_LSB + 4)
#define ADC_CH1_NUM_LSB          (ADC_CH0_NUM_MSB + 4)
#define ADC_CH1_NUM_MSB          (ADC_CH1_NUM_LSB + 4)

#define SUPPRESS_GPIO_START SUPPRESS_LSB_GPIO
#define SUPPRESS_GPIO_END   ADC_CH1_NUM_MSB

#define DMA_BUF_SIZE_GPIO_START 428
#define DMA_BUF_SIZE_GPIO_END   459

#define ADC_NUM_MIN  0
#define ADC_NUM_MAX 19

#define ADC_CHIP_NUM_MIN 0
#define ADC_CHIP_NUM_MAX 4


int init_gpio();

#endif
