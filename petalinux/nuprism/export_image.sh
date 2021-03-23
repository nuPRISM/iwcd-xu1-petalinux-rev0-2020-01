cd ~/Source/iwcd-xu1-petalinux-rev0-2020-01/petalinux/nuprism/images/linux

cp {BOOT.BIN,image.ub,boot.scr} /media/edev/boot
sudo tar -C /media/edev/root/ -zxvf rootfs.tar.gz

cd ../..