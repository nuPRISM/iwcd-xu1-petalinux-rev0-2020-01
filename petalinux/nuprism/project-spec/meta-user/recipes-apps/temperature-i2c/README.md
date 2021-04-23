# MAX30205 Temperature Sensor I2C Test

### Usage
Temperature Sensor Test App - available commands:
`show_temp` - Read temperature registers for all units.
`show_addr` - Display the I2C address of the selected sensor.
`get_config` - Show the current configuration.
`set_config` - Set a new configuration for a selected sensor.
`auto` - Test all functions sequentially.

### Arguments
`-d` Data to write
`-n` Sensor number

### Examples 
- Show temperature reading for each sensor
`temperature-i2c show_temp`
- Test all functions sequentially
`temperature-i2c auto`
- Set config
`temperature-i2c -n 0 -d 10 set_config`
