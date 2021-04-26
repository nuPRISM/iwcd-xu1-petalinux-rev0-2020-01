# ADC SPI Test

## Usage

ADC controller - available commands:
`pdn` - power down
`pup` - power up
`rst` - reset
`init` - initialization
`read` - Perform single read
`wr` - Perform single write
`nom` - nominal mode(?)
`tst` - toggle test pattern
`tst0` - all zeros test pattern
`tst1` - all ones test pattern

## Arguments

`-n` - The ADC to communicate with
`-s` - SPI transfer speed
`-d` - Device file name
`-r` - Register to read/write
`-A` - Channel A test pattern
`-B` - Channel B test pattern
`-C` - Channel C test pattern
`-D` - Channel D test pattern
`-p` - Custom test pattern
`-v` - value to write to a register

## Examples

- Write 0xFF to register 0x01 of ADC 0
`adc-spi-test -n 0 -r 1 -v 255 write`
- Power on the ADCs
`adc-spi-test pup`
- Set all channels to output custom pattern and set custom pattern for ADC 0
`adc-spi-test -A 5 -B 5 -C 5 -D 5 -p 0x10 tst`
