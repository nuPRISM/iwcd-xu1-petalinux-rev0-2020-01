# HDC1080 Humidity Sensor I2C Test

## Usage

Humidity Sensor Test App - available commands:
`write` - Write a byte of data (-d) to a register (-r)
`read` - Read a byte of data from a register (-r)
`get_temp` - Read temperature registers, mode must be set correctly
`get_hum` - Read humidity registers, mode must be set correctly
`get_all` - Read both temperature and humidity registers, mode must be set correctly
`set_mode` - Demonstrate multi-byte transfer, writes 4 hard-coded bytes to ctrl regs
`get_mode` - Demonstrate multi-byte transfer, reads from ctrl regs

## Arguments

`-d` Data to write
`-r` Register to write to

## Examples

- Show temperature reading
`humidity-i2c get_temp`
- Show humidity reading
`humidity-i2c get_hum`
- Write to a register
`humidity-i2c -r 10 -d 10 wirte`
