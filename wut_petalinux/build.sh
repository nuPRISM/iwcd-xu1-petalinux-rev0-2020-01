#! /bin/sh

petalinux-build

if [ $? -ne 0 ]; then
    echo "ERROR"
else
    petalinux-package --boot --u-boot --fpga images/linux/system.bit --format BIN --force
fi
