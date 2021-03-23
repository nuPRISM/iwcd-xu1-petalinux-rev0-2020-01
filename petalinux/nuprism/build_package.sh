cd ~/Source/iwcd-xu1-petalinux-rev0-2020-01/petalinux/nuprism

echo "Vivado export: $1"

# Would like to have a boolean argument to get hw description
if $1; then
    petalinux-config --get-hw-description=~/Source/iwcd-xu1-petalinux-rev0-2020-01/Vivado_NuPRISM/NuPRISM/ --silentconfig
fi

# Build petalinux image
petalinux-build

# Generate binaries, rootfs
petalinux-package --boot --u-boot --fpga images/linux/system.bit --format BIN --force