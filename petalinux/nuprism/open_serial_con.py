import os
import sys
import argparse
import subprocess


def detect_device_file():
    print('Please power off NuPRISM and press any key.')
    input()
    search_cmd = 'ls /dev/ | grep \"tty\"'
    no_sd = subprocess.check_output(search_cmd, shell=True).decode('utf-8').splitlines()
    
    print('Power on the NuPRISM and press any key.')
    input()
    sd = subprocess.check_output(search_cmd, shell=True).decode('utf-8').splitlines()
    
    sd_card_device = list(set(sd) - set(no_sd))
    
    if len(sd_card_device) == 1:
        print('The SD card device dev path is: ' + sd_card_device[0])
        return sd_card_device[0]
    else:
        raise Exception('Did not properly detect dev path.')


def main():
    parser = argparse.ArgumentParser(description='Open a serial connection to the NuPRISM mainboard.')
    parser.add_argument('-d', '--device',  
                        dest='device', 
                        type=str, 
                        default='ttyACM0',
                        help='The device dev path for the NuPRISM serial connection.')
    parser.add_argument('-a', '--auto_detect', 
                        dest='auto_detect', 
                        default=False, 
                        action='store_true',
                        help='Run autodetect instructions.')
    args = parser.parse_args()

    if args.auto_detect:
        dev_path = detect_device_file()
    else:
        dev_path = args.device

    open_connection = 'sudo putty /dev/%s -serial -sercfg 115200,8,n,1,N' % dev_path

    os.system(open_connection)

    return 0

if __name__ == '__main__':
    sys.exit(main())