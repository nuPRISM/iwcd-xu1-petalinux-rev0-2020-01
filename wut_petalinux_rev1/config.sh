#!/bin/sh

VIVADO_PROJECT_DIR=//home/ab/Desktop/XU1_petalinux_rev6/Vivado_NuPRISM
TIMESTAMP=`date +"%Y-%m-%d_%H-%M-%S"`

# backup hardware/bitstrem file
cp $VIVADO_PROJECT_DIR/system_top.xsa ../GP_xsa/system_top_rev1_$TIMESTAMP.xsa

# configure hardware in petalinux distro
petalinux-config --get-hw-description $VIVADO_PROJECT_DIR
