# IDT8T49N241 Clock Cleaner I2C Test

## Usage

Clock cleaner Test App - available commands:
`write` - Write a byte of data (-d) to a register (-r)
`read` - Read a byte of data from a register (-r)
`init` - Program the clock cleaner unit
`start` - Enable the clock cleaner (default)
`stop` - Disable the clock cleaner
`status` - Read status flags
`id` - Read clock cleaner identification

## Arguments

`-d` Data to write
`-r` Register to write to
`-b` Length of byte array for a sequential read

## Examples

- Program the clock cleaner
`clock-cleaner-i2c init`
- Show the clock cleaner id
`clock-cleaner-i2c id`
- Write to a register
`clock-cleaner-i2c -r 10 -d 10 write`
