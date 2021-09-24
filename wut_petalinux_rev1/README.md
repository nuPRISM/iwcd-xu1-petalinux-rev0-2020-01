# Rev. 1 

## Create petalinux project

```
petalinux-create -t project -n wut_petalinux_rev1 --template zynqMP
```

## Import hardware/configure project

```
petalinux-config --get-hw-description <Vivado_directory_with_valid_XSA_file>
```

## Build petalinux distro

```
petalinux-build
```

## Pack distro for booting from SD card

```
petalinux-package --boot --u-boot --fpga images/linux/system.bit --format BIN --force
```

### SD card formatting

The SD card used to boot the petalinux distrubution should be formatted as follows:

* 1 GB vfat partition
* ? GB ext4 partition (all available space on SD card)

### Copy distro files to the SD card

```
    cp images/linux/boot.scr   /mnt/SD_VFAT_ROOT_DIR
    cp images/linux/image.ub   /mnt/SD_VFAT_ROOT_DIR
    cp images/linux/BOOT.BIN   /mnt/SD_VFAT_ROOT_DIR

    tar -xzvf images/linux/rootfs.tar.gz /mnt/SD_EXT4_ROOT_DIR
```

### Board booting

1. connect USB, JTAG, Ethernet and power cables
1. power on the board
1. open serial port connection:
```
    sudo minicom -D /dev/ttyACM0
```
**WARNING!** the ```/dev/ttyACM0``` is not available unless the board is powered on

1. wait for the U-Booot prompt, write the following command: 
```    
    boot    
```
1. Linux starts to boot, wait for the shell prompt, write Linux command

### TFTP booting 

1. power on the board, open serial connection
1. wait for the U-Booot prompt (FSBL, U-Boot is loaded form SD card), write the following command to read boot image from TFTP server and boot card: 

```
dhcp 0x10000000 192.168.112.69:image.ub
bootm 0x10000000

```

## I2C support (required for the clock cleaner configuration)

1. Run petalinux filesystem configiration utility:
```
      petalinux-config -c rootfs
```
1. Select `i2c-tools` in the `Filesystem packages -> base -> i2c-tools` menu
1. build petalinux, pack distro for [...] booting
1. detect available I2C devices:
```
root@wut_petalinux_rev1:~# i2cdetect -l                                         
i2c-0   i2c             Cadence I2C at ff020000                 I2C adapter     
```
1. detect chips available through the `/dev/i2c-0` device:
```
root@wut_petalinux_rev1:~# i2cdetect -y 0                                       
Warning: Can't use SMBus Quick Write command, will skip some addresses          
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f                             
00:                                                                             
10:                                                                             
20:                                                                             
30: -- -- -- -- -- -- -- --                                                     
40:                                                                             
50: -- 51 -- -- -- -- -- -- -- -- -- -- 5c -- -- --                             
60:                                                                             
70:                                                                             
```

## SPI support (required for the ADC configuration)

Run kernel configuration utility:
```
    petalinux-config -c kernel
```
Select `User mode SPI device driver support` as built-in in the `Device Drivers --> SPI support menu`

Add the following lines to the `system-user.dtsi` in the `$PROJECT_ROOT/project-spec/meta-user/recipes-bsp/device-tree/files` directory:
```
&spi0{
  is-decoded-cs = <0>;
  num-cs = <1>;
  status = "okay";
  bus-num = <0>;
  spidev@0x00 {
    compatible = "spidev";
    spi-max-frequency = <1000000>;
    spi-cpol;
    spi-cpha;
    reg = <0>;
    bus-num = <0>;
  };
};

&spi1{
   status = "okay";
   is-decoded-cs = <0>;
   num-cs = <1>;
   status = "okay";
   bus-num = <1>;
   spidev@0x00 {
     compatible = "spidev";
     spi-max-frequency = <1000000>;
     spi-cpol;
     spi-cpha;
     reg = <0>;
     bus-num = <1>;
  };
};

```

Rebuild the project, create text/human readable device tree configuration file using the following command:
```
dtc -I dtb -O dts -o system_2021-06-16.dts images/linux/system.dtb 

```
verify, that two `spidev`-compatible devices are available:
```
[...]

		spi@ff040000 {
			compatible = "cdns,spi-r1p6";
			status = "okay";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x13 0x4>;
			reg = <0x0 0xff040000 0x0 0x1000>;
			clock-names = "ref_clk", "pclk";
			#address-cells = <0x1>;
			#size-cells = <0x0>;
			power-domains = <0xc 0x23>;
			clocks = <0x3 0x3a 0x3 0x1f>;
			is-decoded-cs = <0x0>;
			num-cs = <0x1>;
			bus-num = <0x0>;
			phandle = <0x61>;

			spidev@0x00 {
				compatible = "spidev";
				spi-max-frequency = <0xf4240>;
				spi-cpol;
				spi-cpha;
				reg = <0x0>;
				bus-num = <0x0>;
			};
		};

		spi@ff050000 {
			compatible = "cdns,spi-r1p6";
			status = "okay";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x14 0x4>;
			reg = <0x0 0xff050000 0x0 0x1000>;
			clock-names = "ref_clk", "pclk";
			#address-cells = <0x1>;
			#size-cells = <0x0>;
			power-domains = <0xc 0x24>;
			clocks = <0x3 0x3b 0x3 0x1f>;
			is-decoded-cs = <0x0>;
			num-cs = <0x1>;
			bus-num = <0x1>;
			phandle = <0x62>;

			spidev@0x00 {
				compatible = "spidev";
				spi-max-frequency = <0xf4240>;
				spi-cpol;
				spi-cpha;
				reg = <0x0>;
				bus-num = <0x1>;
			};
		};

[...]
```
Boot the board, verify if the `/dev/spidev1.0` device is available.


## DMA support

Add/enable `dma_proxy` driver in the petalinux project:
```
petalinux-create -t modules -n dma-proxy --enable
```
Copy driver source files (avilable e.g. in the project github repository) to the `$PROJECT_ROOT/project-spec/meta-user/recipes-modules` directory.

Add following lines:
```
&amba_pl {
    dma_proxy{
        compatible ="xlnx,dma_proxy";
        dmas = <&axi_dma_0 0
                &axi_dma_0 1>;
        dma-names = "dma_proxy_tx", "dma_proxy_rx";
    };
};

```
to the the `system-user.dtsi` in the `$PROJECT_ROOT/project-spec/meta-user/recipes-bsp/device-tree/files` directory.
Rebuild projects, power up the board, load the dma_proxy driver:
```
    modprobe dma_proxy
```
verify if the `/dev/dma_proxy_rx` and `/dev/dma_proxy_tx` devices are available.


## GPIO

```
root@wut_petalinux_rev1:~# ls /sys/class/gpio/    
export       gpio413      gpio419      gpio431      gpio437      gpio443      gpio449      gpio455      gpio461      gpio467      gpio473      gpio494      gpiochip234
gpio408      gpio414      gpio420      gpio432      gpio438      gpio444      gpio450      gpio456      gpio462      gpio468      gpio474      gpio495      gpiochip408
gpio409      gpio415      gpio421      gpio433      gpio439      gpio445      gpio451      gpio457      gpio463      gpio469      gpio475      gpio496      gpiochip428
gpio410      gpio416      gpio428      gpio434      gpio440      gpio446      gpio452      gpio458      gpio464      gpio470      gpio476      gpio497      gpiochip460
gpio411      gpio417      gpio429      gpio435      gpio441      gpio447      gpio453      gpio459      gpio465      gpio471      gpio492      gpio498      gpiochip492
gpio412      gpio418      gpio430      gpio436      gpio442      gpio448      gpio454      gpio460      gpio466      gpio472      gpio493      gpio499      unexport

```

GPIO lines are mapped as follows (in the current hardware project!):

```
#define ADC_SEL0_GPIO      492
#define ADC_SEL1_GPIO      493
#define ADC_SEL2_GPIO      494
#define ADC_SEL3_GPIO      495
#define ADC_SEL4_GPIO      496
#define ADC_RESET_GPIO     497
#define ADC_PWRDN_GPIO     498
#define ADC_DMA_RESET_GPIO 499

#define SUPPRESS_LSB_GPIO        408
#define SUPPRESS_MSB_GPIO        409
#define ADC_TRIGGER_GPIO         410
#define ADC_TRIGGER_ENABLE_GPI0  411
#define ADC_CH0_NUM_LSB          412
#define ADC_CH0_NUM_MSB          416
#define ADC_CH1_NUM_LSB          417
#define ADC_CH1_NUM_MSB          421

#define DMA_BUF_SIZE_GPIO_START 428
#define DMA_BUF_SIZE_GPIO_END   459

#define DELAY_LSB_GPIO    460
#define DELAY_MSB_GPIO    (DELAY_LSB_GPIO + 8) 
#define LOAD_ENABLE_GPIO  (DELAY_LSB_GPIO + 9) 
#define CHAN_NUM_LSB_GPIO (DELAY_LSB_GPIO + 10) 
#define CHAN_NUM_MSB_GPIO (DELAY_LSB_GPIO + 13) 
#define ADC_NUM_LSB_GPIO  (DELAY_LSB_GPIO + 14) 
#define ADC_NUM_MSB_GPIO  (DELAY_LSB_GPIO + 16) 

```


## Clock cleaner test

Run the following commands (as a root in the petalinux console):
```
     clc init
     clc start
```
Open `hw_ila4` in the Vivado project, run immediate trigger (>>). If antyhing (most often 0x000) is dispplayed in the ADCs then the clock is correctly initialized.


## ADC test

Run the following commands (as a root in the petalinux console):
```
     clc init
     clc start

     adc gpio
     adc int
     adc -n 0 tst
``` 

Open `hw_ila4` in the Vivado project, run immediate trigger (>>). Values 0xa95 and 0x56a should be displayed in the ADC/LVDS lines


## dma_proxy driver test

Run the following comands:
```
    modprobe dma_proxy

    echo 440 > /sys/class/gpio/export
    echo out > /sys/class/gpio/gpio440/direction
    echo 0 > /sys/class/gpio/gpio440/value

    dma-proxy-test 100 65536
```



## Measurement data readout

```
root@wut_petalinux_rev1:~# adc-dma2                                                                                                                                          
Illegal value: ADC_num_ch0=-1                                                                                                                                                
Usage:                                                                                                                                                                       
        adc_stream2 -m ADC_num_ch1 -n ADC_num_ch2 -p ADC_mode -q num_iter -b buf_size -i [ 0 | 1 ]                                                                           
        ADC_num_chx=0..19                                                                                                                                                    
        adc_mode: 0 - tst0, 1 - tst1, 2 - toggle test pattern, 3 - digital ramp pattern, 4 -sine wave pattern, 5 - nominal mode                                              
```

```
root@wut_petalinux_rev1:~# adc-dma2 -m 0 -n 1 -p 2 -q 1 -b 1024 -i 1                                                                                                         
DBG: GPIO already initialized                                                                                                                                                
DBG: echo 0 > /sys/class/gpio/gpio412/value                                                                                                                                  
DBG: echo 0 > /sys/class/gpio/gpio413/value                                                                                                                                  
DBG: echo 0 > /sys/class/gpio/gpio414/value                                                                                                                                  
DBG: echo 0 > /sys/class/gpio/gpio415/value

[...]

BG: adc_enable(): echo 0 > /sys/class/gpio/gpio496/value, ret=0                                                                                                             
ADC_num_ch0=0, ADC_num_ch1=1, adc_mode=2, buf_size=1024 num_iter=1                                                                                                           
Press ENTER to continue...                                                                                                                                                   
DBG: echo 0 > /sys/class/gpio/gpio409/value                                                                                                                                  
DBG: delay start                                                                                                                                                             
DBG: acq start: dev_name=/dev/dma_proxy_rx_0, filename=dma_ch0.bin buf_size=1024 adc_mode=2                                                                                  
DBG: acq start: dev_name=/dev/dma_proxy_rx_1, filename=dma_ch1.bin buf_size=1024 adc_mode=2                                                                                  
DBG: thread_fun(): buf size=1024                                                                                                                                             
DBG: thread_fun(): buf size=1024                                                                                                                                             
DBG: echo 1 > /sys/class/gpio/gpio410/value                                                                                                                                  
DBG: DMA transfer OK, storing data in file                                                                                                                                   
DBG: DMA transfer OK, storing data in file                                                                                                                                   
DBG: echo 0 > /sys/class/gpio/gpio410/value                                                                                                                                  
DBG: delay end                                                                                                                                                               
DBG: echo 1 > /sys/class/gpio/gpio409/value                                                                                                                                  
DMA threads joined: status ch0=0, ch1=0
```

```
root@wut_petalinux_rev1:~# ls -l                                                                                                                                             
total 8                                                                                                                                                                      
-rw-r--r--    1 root     root          1024 Jul 15 15:23 dma_ch0.bin                                                                                                         
-rw-r--r--    1 root     root          1024 Jul 15 15:23 dma_ch1.bin                                                                                                         
root@wut_petalinux_rev1:~# hexdump dma_ch0.bin                                                                                                                               
0000000 faaa 0555 faaa 0555 faaa 0555 faaa 0555                                                                                                                              
*                                                                                                                                                                            
0000400                                                                                                                                                                      
root@wut_petalinux_rev1:~# hexdump dma_ch1.bin                                                                                                                               
0000000 0555 faaa 0555 faaa 0555 faaa 0555 faaa                                                                                                                              
*                                                                                                                                                                            
0000400
```


| Buffer size [kB] | DMA transfer | Streaming [kb/s] |
|-----------------:|:------------:|------------------|
| 1                |     +        |                  |
| 2                |     +        |                  |
| 4                |     +        |                  |
| 8                |     +        |                  |
| 16               |     +        |                  |
| 32               |     +        |                  |
| 64               |     +        |                  |
| 128              |     +        |                  |
| 256              |     +        |                  |
| 512              |     +        |                  |
| 1024             |     +        |                  |
