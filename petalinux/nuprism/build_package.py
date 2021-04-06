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
    parser.add_argument('-g', '--get_hw', dest='get_hw', default=False, action='store_true')
    parser.add_argument('-v', '--vivado_proj_path',  
                        dest='vivado_proj_path', 
                        type=str, 
                        default='/home/edev/Source/iwcd-xu1-petalinux-rev0-2020-01/Vivado_NuPRISM/NuPRISM',
                        help='Path to vivado project export')
    args = parser.parse_args()

    run_dir = os.getcwd()
    os.chdir(args.petalinux_proj)

    get_hw_cmd = [
        'petalinux-config',
        '--get-hw-description=%s' % args.vivado_proj_path,
        '--silentconfig'
    ]
    package_cmd = [
        'petalinux-package', 
        '--boot',
        '--u-boot',
        '--fpga',
        'images/linux/system.bit',
        '--format',
        'BIN',
        '--force'
    ]
    if (args.get_hw):
        os.system(' '.join(get_hw_cmd))

    # Build petalinux image
    os.system('petalinux-build')

    # Generate binaries, rootfs
    os.system(' '.join(package_cmd))

    os.chdir(run_dir)

    return 0

if __name__ == '__main__':
    sys.exit(main())