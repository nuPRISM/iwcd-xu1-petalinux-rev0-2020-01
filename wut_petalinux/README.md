# NuPRISM Firmware

## Project structure

<pre>  
.
├── documents
├── enclustra_scripts
├── lib
├── petalinux_midas
├── pmufw
├── SDK_NuPRISM
├── Software_files
├── src
├── triumf_scripts
├── Vitis_NUPRISM
├── Vivado_NuPRISM
├── Vivado_NuPRISM_AddingDMA
└── wut_petalinux
</pre>  

## petalinux


### hardware configuration

Export hardware from the Vivado project in `Vivado_NuPRISM`. Verify if the above forlder contains the `system_top.xsa` file. Configure petalinux project:
<pre>  
petalinux-config --get-hw-description ../Vivado_NuPRISM

### rootfs configuration

### kernel configuration

### device tree customization

<pre>  
dtc -I dtb -O dts -o system.dts images/linux/system.dtb
</pre>  

### Project build

<pre>  
petalinux-build -v
<pre>  

### SD card boot

The SD card used to boot the petalinux distrubution should be formatted as follows:
<pre>  
  1 GB vfat partition
  xx GB ext4 partition
<pre>  

<pre>  
petalinux-package 
</pre>  

### TFTP boot

## MIDAS

Build configure MIDAS on both host/PC and petalinux/NuPRISM accroding to [1].

### Host/PC

Run the following commands (in separate terminals):
<pre>  
odbedit
mhttp
mlogger
mserver
<pre>  

### petalinux/NuPRISM

<pre>  
mfe -h 192.168.1.55:1175 -e e777
Frontend name          :     Sample Frontend
Event buffer size      :     1000000
User max event size    :     10000
User max frag. size    :     5242880
# of events per buffer :     100

Connect to experiment e777 on host 192.168.1.55:1175...
[Sample Frontend,ERROR] [mfe.cxx:2670:mainFE,ERROR] Cannot connect to experiment 'e777' on host '192.168.1.55:1175', status 503
</pre>  


## GPIO

<pre>  
root@nuprism:~# ls /sys/class/gpio
export       gpiochip310  gpiochip484  gpiochip504  unexport
</pre>  

## I2C

<pre>  
root@nuprism:~# i2cdetect -l    
i2c-0   i2c             Cadence I2C at ff020000                 I2C adapter
</pre>  


## SPI

<pre>  
         spi@ff040000 {
			compatible = "cdns,spi-r1p6";
			status = "okay";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x13 0x4>;
			reg = <0x0 0xff040000 0x0 0x1000>;
			clock-names = "ref_clk", "pclk";
			#address-cells = <0x1>  ;
			#size-cells = <0x0>  ;
			power-domains = <0xc 0x23>  ;
			clocks = <0x3 0x3a 0x3 0x1f>  ;
			phandle = <0x61>  ;
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
			phandle = <0x62>;
		};
</pre>  

<pre>  
root@nuprism:~# dmesg | grep spi
[    3.324043] xilinx_spi 80040000.axi_quad_spi: IRQ index 0 not found
[    4.083423] cdns-spi ff040000.spi: failed to add to PM domain domain4: -13
[    4.090299] cdns-spi: probe of ff040000.spi failed with error -13
[    4.103577] cdns-spi ff050000.spi: failed to add to PM domain domain5: -13
[    4.110452] cdns-spi: probe of ff050000.spi failed with error -13
[    4.116801] zynqmp-qspi ff0f0000.spi: rx bus width not found
[    4.122456] zynqmp-qspi ff0f0000.spi: tx bus width not found
[    4.135502] spi_master spi0: cannot find modalias for /amba/spi@ff0f0000/flash@0
[    4.142891] spi_master spi0: Failed to create SPI device for /amba/spi@ff0f0000/flash@0
</pre>  


## References

1. R.Payne, *Rev0-2020.1-Petalinux Project Setup Guide*, Triumf, 21/08/2020
