
def flip_bits(data, bits):
    flipped = 0

    for i in range(0, bits):
        flipped <<= 1
        flipped |= (data & 1)
        data >>= 1

    return flipped


def decode_channel_A(data):
    low6 = data & 0x03F
    high6 = (data >> 6) & 0x03F
    
    return (flip_bits(high6, 6) << 6) | flip_bits(low6, 6)

def decode_channel_B(data):
    return decode_channel_A(data)

def decode_channel_C(data):
    return decode_channel_A(data)

def print_decode(decode_func, title, data):
    print(title)
    for val in data:
        print(hex(val), "\t", hex(decode_func(val)))
    print("")

def decode_channel_A_sv(data):
    low2 = data & 0x3
    mid4 = (data & 0x03C) >> 2
    high6 = (data & 0xFC0) >> 6

    return (flip_bits(high6, 6) << 6) | (flip_bits(mid4, 4) << 2) | (flip_bits(low2, 2))

def main():
    recorded_vals = [0xa85, 0x000, 0x57a, 0x0ed, 0xf12]
    ramp_vals = [0x9d8, 0x9f8, 0x9c4, 0x9e4, 0x9d4]
    ramp_vals_chc = [0xf71, 0xf79, 0xf75, 0xf7d, 0x9d4]

    print_decode(decode_channel_A, "Sine function, channel A:", recorded_vals)

    print_decode(decode_channel_A, "Ramp function, channel A:", ramp_vals)
    
    print_decode(decode_channel_C, "Ramp function, channel C:", ramp_vals_chc)

    recorded_vals = [0xA95, 0xF08, 0x002, 0x56A, 0x0F7, 0x001, 0x0F4]
    print_decode(decode_channel_A_sv, "Sine function, channel A:", recorded_vals)


if __name__ == '__main__':
    main()
