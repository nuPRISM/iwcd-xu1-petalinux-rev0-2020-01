# LPS25HB Pressure Sensor I2C Test

## Usage

Pressure Sensor Test App - available commands:
`write` - Write a byte of data (-d) to a register (-r)
`read` - Read a byte of data from a register (-r)
`get_temp` - Read temperature registers
`get_pres` - Read pressure registers
`auto` - Test all functions

## Arguments

`-d` Data to write
`-r` Register to write to

## Examples

- Show temperature reading
`pressure-i2c get_temp`
- Show pressure reading
`pressure-i2c get_pres`
- Write to a register
`pressure-i2c -r 10 -d 10 wirte`
