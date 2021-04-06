'''

To create formatted SD media, follow Appendix H of the Petalinux 2020.1 user guide: 
https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_1/ug1144-petalinux-tools-reference-guide.pdf

To rename the mount point for the SD partitions,
first unmount both using 
    sudo umount < mount-point >

for the first partition (/dev/sdx1 where x should be a-c)
    sudo dosfslabel /dev/sdx1 MYLABEL

for the second
    sudo e2label /dev/sdx2 MYLABEL

unplug and reinsert the SD and the names should be changed

'''

import os
import sys
import argparse


def main():
    # Parse locations to move files to/from
    parser = argparse.ArgumentParser(description='Copy petalinux image to a formatted SD card')
    parser.add_argument('-p', '--pl_proj',  
                        dest='petalinux_proj', 
                        type=str, 
                        default='/home/edev/Source/iwcd-xu1-petalinux-rev0-2020-01/petalinux/nuprism',
                        help='Path to petalinux prject')
    parser.add_argument('-m', '--media_path',  
                        dest='media_path', 
                        type=str, 
                        default='/media/edev',
                        help='Path to SD media')
    args = parser.parse_args()

    run_dir = os.getcwd()

    petalinux_proj = args.petalinux_proj
    media_path = args.media_path

    image_path = os.path.join(petalinux_proj, 'images', 'linux')

    # check if image path exists
    if (not os.path.exists(image_path)):
        print('Petalinux image has not been packaged.')
        return 1
    
    # check if media is connected
    
    boot = os.path.join(media_path, 'boot')
    root = os.path.join(media_path, 'root')
    # For now, assume empty directory implies media is not conencted
    if (not os.path.exists(boot) or not os.path.exists(root)):
        print('SD media not detected.')
        return 1

    copy_boot_bin = [
        'cp', 
        'BOOT.BIN',
        boot
    ]
    copy_image_ub = [
        'cp', 
        'image.ub',
        boot
    ]
    copy_boot_scr = [
        'cp', 
        'boot.scr',
        boot
    ]
    extract_root = [
        'sudo',
        'tar',
        '-C',
        root, 
        '-zxvf',
        'rootfs.tar.gz'
    ]

    os.chdir(image_path)

    print('Run command: \'%s\'' % ' '.join(copy_boot_bin))
    if (os.system(' '.join(copy_boot_bin)) != 0):
        print('error copying boot files, exiting.')
        return 1

    print('Run command: \'%s\'' % ' '.join(copy_image_ub))
    if (os.system(' '.join(copy_image_ub))):
        print('error copying boot files, exiting.')
        return 1

    print('Run command: \'%s\'' % ' '.join(copy_boot_scr))
    if (os.system(' '.join(copy_boot_scr))):
        print('error copying boot files, exiting.')
        return 1

    print('Run command: \'%s\'' % ' '.join(extract_root))
    if (os.system(' '.join(extract_root))):
        print('error copying boot files, exiting.')
        return 1

    os.chdir(run_dir)

    return 0


if __name__ == '__main__':
    sys.exit(main())
