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
</pre>

### rootfs configuration

### kernel configuration

### device tree customization

<pre>  
dtc -I dtb -O dts -o system.dts images/linux/system.dtb
</pre>  

### Project build

Use the following command to build the entire project:
<pre>  
petalinux-build -v
</pre>
**Warning** All temporary files, apps etc. will be removed from the `build` folder

The system image/rootf for booting from SD card should created with the following command:
<pre>
petalinux-package --boot --u-boot --fpga images/linux/system.bit --format BIN --force
</pre>

Use the following command to compile selected application and **do not remove** it from the `build\...\app\...` subdirectory:
<pre>
petalinux-build -c adc -x compile
</pre>


### SD card boot

The SD card used to boot the petalinux distrubution should be formatted as follows:
<pre>  
  1 GB vfat partition
  xx GB ext4 partition
</pre>  
Copy `boot.scr`, `BOOT.BIN`, `image.ub` from `image/linux` subdirectory to the vfat partition
Unpack `image/linux/rootfs.tar.gz` to the ext4 partition

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
</pre>

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

<pre>
root@nuprism:~# i2cdetect -y 0
Warning: Can't use SMBus Quick Write command, will skip some addresses
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                                                 
10:                                                 
20:                                                 
30: -- -- -- -- -- -- -- --                         
40:                                                 
50: -- -- -- -- -- -- -- -- -- -- -- -- 5c -- -- -- 
60:                                                 
70:                 
</pre>

<pre>
root@nuprism:~# i2cdump -y 0 0x5c                                                                                                                                                                   
No size specified (using byte-data access)
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 c0 bd    ..............??
10: 0f 1c 00 00 22 06 80 13 d5 95 70 20 75 25 03 28    ??.."?????p u%?(
20: 00 00 00 00 00 00 00 00 00 38 2f 00 00 00 00 20    .........8/.... 
30: 00 00 a3 f2 f6 87 ed 4e 40 48 00 00 00 00 c0 10    ..?????N@H....??
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 c0 bd    ..............??
90: 0f 1c 00 00 22 06 80 13 d5 95 70 20 75 25 03 28    ??.."?????p u%?(
a0: 00 00 00 00 00 00 00 00 00 38 2f 00 00 00 00 20    .........8/.... 
b0: 00 00 a3 f2 f6 87 ed 4e 40 48 00 00 00 00 c0 10    ..?????N@H....??
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
</pre>

<pre>
root@nuprism:~# i2cdump -y -a 0 0x7c                                                                                                                                                                
No size specified (using byte-data access)
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 0a 00 08 00 00 00 00 00 00 00 00 00 00 00 00 00    ?.?.............
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
</pre>


## SPI

`$PROJECT_HOME/project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi`
<pre>
/include/ "system-conf.dtsi"
/ {
};

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
</pre>

<pre>
root@nuprism:~# ls /dev/spidev*
/dev/spidev1.0  /dev/spidev2.0
root@nuprism:~# dmesg | grep spi
[    5.545311] /amba/spi@ff040000/spidev@0x00: buggy DT: spidev listed directly in DT
[    5.552954] WARNING: CPU: 2 PID: 32 at drivers/spi/spidev.c:723 spidev_probe+0xf8/0x1c8
[    5.585474] pc : spidev_probe+0xf8/0x1c8
[    5.589389] lr : spidev_probe+0xf8/0x1c8
[    5.678595]  spidev_probe+0xf8/0x1c8
[    5.682163]  spi_drv_probe+0x7c/0xd8
[    5.716874]  spi_add_device+0xac/0x170
[    5.720616]  of_register_spi_device+0x204/0x388
[    5.725136]  spi_register_controller+0x4b4/0x718
[    5.729746]  cdns_spi_probe+0x28c/0x368
[    5.801940] /amba/spi@ff050000/spidev@0x00: buggy DT: spidev listed directly in DT
[    5.809572] WARNING: CPU: 2 PID: 32 at drivers/spi/spidev.c:723 spidev_probe+0xf8/0x1c8
[    5.843482] pc : spidev_probe+0xf8/0x1c8
[    5.847396] lr : spidev_probe+0xf8/0x1c8
[    5.936593]  spidev_probe+0xf8/0x1c8
[    5.940161]  spi_drv_probe+0x7c/0xd8
[    5.974872]  spi_add_device+0xac/0x170
[    5.978614]  of_register_spi_device+0x204/0x388
[    5.983135]  spi_register_controller+0x4b4/0x718
[    5.987744]  cdns_spi_probe+0x28c/0x368
[    6.047504] zynqmp-qspi ff0f0000.spi: rx bus width not found
[    6.053177] zynqmp-qspi ff0f0000.spi: tx bus width not found
[    6.059101] spi_master spi0: cannot find modalias for /amba/spi@ff0f0000/flash@0
[    6.066513] spi_master spi0: Failed to create SPI device for /amba/spi@ff0f0000/flash@0
root@nuprism:~# spidev-test -v -D /dev/spidev1.0 
spi mode: 0x0
bits per word: 8
max speed: 500000 Hz (500 KHz)
[   49.928881] spidev spi1.0: SPI transfer timed out
[   49.933614] spi_master spi1: failed to transfer one message from queue
can't send spi message: Connection timed out
Aborted
root@nuprism:~# spidev-test -v -D /dev/spidev2.0 
spi mode: 0x0
bits per word: 8
max speed: 500000 Hz (500 KHz)
TX | FF FF FF FF FF FF 40 00 00 00 00 95 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF F0 0D  |......@.........................|
RX | FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  |................................|
root@nuprism:~#
</pre>


## References

1. R.Payne, *Rev0-2020.1-Petalinux Project Setup Guide*, Triumf, 21/08/2020
