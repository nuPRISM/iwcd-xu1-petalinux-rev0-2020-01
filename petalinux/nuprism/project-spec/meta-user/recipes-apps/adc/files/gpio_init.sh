#! /bin/bash

echo "GPIO initialization"

echo 492 > /sys/class/gpio/export       # GPIO 0: SEL0
echo 493 > /sys/class/gpio/export       # GPIO 1: SEL1
echo 494 > /sys/class/gpio/export       # GPIO 2: SEL2
echo 495 > /sys/class/gpio/export       # GPIO 3: SEL3
echo 496 > /sys/class/gpio/export       # GPIO 4: SEL4
echo 497 > /sys/class/gpio/export       # GPIO 5: RESET - active high, pulldown resistor
echo 498 > /sys/class/gpio/export       # GPIO 6: POWER DOWN - configured via SPI (?), pulldown resistor

echo out > /sys/class/gpio/gpio492/direction
echo out > /sys/class/gpio/gpio493/direction 
echo out > /sys/class/gpio/gpio494/direction
echo out > /sys/class/gpio/gpio495/direction 
echo out > /sys/class/gpio/gpio496/direction
echo out > /sys/class/gpio/gpio497/direction 
echo out > /sys/class/gpio/gpio498/direction

# power-up all ADC, deselect all, set rst low
echo 1 > /sys/class/gpio/gpio492/value
echo 1 > /sys/class/gpio/gpio493/value
echo 1 > /sys/class/gpio/gpio494/value
echo 1 > /sys/class/gpio/gpio495/value
echo 1 > /sys/class/gpio/gpio496/value
echo 0 > /sys/class/gpio/gpio498/value

echo 0 > /sys/class/gpio/gpio497/value
sleep 0.1s
echo 1 > /sys/class/gpio/gpio497/value
sleep 0.1s
echo 0 > /sys/class/gpio/gpio497/value