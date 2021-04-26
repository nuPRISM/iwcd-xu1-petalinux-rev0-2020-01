# NuPRISM Developemnt Xilinx Firmware Components

This file contains the commands needed to build and run the petalinux image on the NuPRISM rev 1a mainboard.

## To Build, Package and Export the Project

Petalinux commands:

Update Hardware configuration

- `petalinux-config --get-hw-description=<path-to>/iwcd-xu1-petalinux-rev0-2020-01/Vivado_NuPRISM/NuPRISM`

Build Petalinux image

- `petalinux-build`

Pakage binaries

- `petalinux-package --boot --u-boot --fpga images/linux/system.bit --format BIN --force`

Python script:

- `python3 build_package.py -g` (-g argument is passed when Vivado project was updated)

## To Prepare a Formatted SD Card

Copy boot binary (inside images/linux directory)

- `cp {BOOT.BIN,image.ub,boot.scr} /<destination/directory>`

Extract root filesystem

- `sudo tar -C /<destination/directory> -zxvf rootfs.tar.gz`

Python script:

- `python3 export_image.py` (Need an SD card with partitions named boot and root, mounted at /media)
