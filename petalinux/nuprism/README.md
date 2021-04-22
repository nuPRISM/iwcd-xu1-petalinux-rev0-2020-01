# NuPRISM Developemnt Xilinx Firmware Components

This file contains the commands needed to build and run the petalinux image on the NuPRISM rev 1a mainboard.

To build, package and export the project, run the following commands. 
    1. (if the vivado project was updated) 
        `petalinux-config --get-hw-description=<path-to>/iwcd-xu1-petalinux-rev0-2020-01/Vivado_NuPRISM/NuPRISM`
    2. petalinux-build
    3. 