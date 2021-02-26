/**
 * @file clock-cleaner-config.h
 * @author Jake Cronin (jcronin@triumf.ca)
 * @brief Register configuration data for the clock cleaner module, 
 * stored in a seperate file for readability 
 * @version 0.1
 * @date 2021-02-23
 * 
 * @copyright Copyright (c) 2021
 * 
 */

#ifndef _CLOCK_CLEANER_CONFIG_H_
#define _CLOCK_CLEANER_CONFIG_H_

#include <stdint.h>

struct boot_sequence {
    uint16_t reg;
    uint8_t data;
};

struct boot_sequence clc_boot_program[] = {
    {0x000, 0x09}, {0x001, 0x50}, {0x002, 0x00}, {0x003, 0x60},
    {0x004, 0x60}, {0x005, 0x01}, {0x006, 0x7c}, {0x007, 0x01},
    {0x008, 0x03}, {0x009, 0x00}, {0x00A, 0x00}, {0x00B, 0x00},
    {0x00C, 0x01}, {0x00D, 0xe9}, {0x00E, 0x00}, {0x00F, 0x01},
    {0x010, 0xe9}, {0x011, 0x00}, {0x012, 0x5b}, {0x013, 0xb0},
    {0x014, 0x00}, {0x015, 0x5b}, {0x016, 0xb0}, {0x017, 0x7d},
    {0x018, 0x6d}, {0x019, 0x00}, {0x01A, 0x00}, {0x01B, 0x00},
    {0x01C, 0x00}, {0x01D, 0x00}, {0x01E, 0x00}, {0x01F, 0xff},
    {0x020, 0xff}, {0x021, 0xff}, {0x022, 0xff}, {0x023, 0x0b},
    {0x024, 0x3f}, {0x025, 0x00}, {0x026, 0x18}, {0x027, 0x00},
    {0x028, 0x00}, {0x029, 0x00}, {0x02A, 0x00}, {0x02B, 0x00},
    {0x02C, 0x01}, {0x02D, 0x00}, {0x02E, 0x00}, {0x02F, 0xd0},
    {0x030, 0x0f}, {0x031, 0x00}, {0x032, 0x00}, {0x033, 0x00},
    {0x034, 0x00}, {0x035, 0x00}, {0x036, 0x0f}, {0x037, 0x00},
    {0x038, 0x00}, {0x039, 0x00}, {0x03A, 0x00}, {0x03B, 0x00},
    {0x03C, 0x00}, {0x03D, 0x44}, {0x03E, 0x44}, {0x03F, 0x01},
    {0x040, 0x00}, {0x041, 0x02}, {0x042, 0x00}, {0x043, 0x00},
    {0x044, 0x0c}, {0x045, 0x00}, {0x046, 0x00}, {0x047, 0x0c},
    {0x048, 0x00}, {0x049, 0x00}, {0x04A, 0x0c}, {0x04B, 0x00},
    {0x04C, 0x00}, {0x04D, 0x00}, {0x04E, 0x00}, {0x04F, 0x00},
    {0x050, 0x00}, {0x051, 0x00}, {0x052, 0x00}, {0x053, 0x00},
    {0x054, 0x00}, {0x055, 0x00}, {0x056, 0x00}, {0x057, 0x00},
    {0x058, 0x00}, {0x059, 0x00}, {0x05A, 0x00}, {0x05B, 0x00},
    {0x05C, 0x00}, {0x05D, 0x00}, {0x05E, 0x00}, {0x05F, 0x00},
    {0x060, 0x00}, {0x061, 0x00}, {0x062, 0x00}, {0x063, 0x00},
    {0x064, 0x00}, {0x065, 0x00}, {0x066, 0x00}, {0x067, 0x00},
    {0x068, 0xe0}, {0x069, 0x02}, {0x06A, 0x2b}, {0x06B, 0x20},
    {0x06C, 0x00}, {0x06D, 0x00}, {0x06E, 0x00}, {0x06F, 0x00},
    {0x070, 0x00}, {0x071, 0x00}, {0x072, 0x00}, {0x073, 0x13},
    {0x074, 0x00}, {0x075, 0x00}, {0x076, 0x13}, {0x077, 0x00},
    {0x078, 0x00}, {0x079, 0x53}, {0x07A, 0x27}, {0x07B, 0xcc}, // 0x78: should be 0x14??
    {0x07C, 0x00}, {0x07D, 0x00}, {0x07E, 0x00}, {0x07F, 0x00},
    {0x080, 0x00}, {0x081, 0x00}, {0x082, 0x00}, {0x083, 0x00},
    {0x084, 0x00}, {0x085, 0x00}, {0x086, 0x00}, {0x087, 0x00},
    {0x088, 0x00}, {0x089, 0x00}, {0x08A, 0x00}, {0x08B, 0x00},
    {0x08C, 0x00}, {0x08D, 0x00}, {0x08E, 0x00}, {0x08F, 0x00},
    {0x090, 0x00}, {0x091, 0x00}, {0x092, 0x00}, {0x093, 0x00},
    {0x094, 0x00}, {0x095, 0x00}, {0x096, 0x00}, {0x097, 0x00},
    {0x098, 0x00}, {0x099, 0x00}, {0x09A, 0x00}, {0x09B, 0x00},
    {0x09C, 0x00}, {0x09D, 0x00}, {0x09E, 0x00}, {0x09F, 0x00},
    {0x0A0, 0x00}, {0x0A1, 0x00}, {0x0A2, 0x00}, {0x0A3, 0x00},
    {0x0A4, 0x00}, {0x0A5, 0x00}, {0x0A6, 0x00}, {0x0A7, 0x00},
    {0x0A8, 0x00}, {0x0A9, 0x00}, {0x0AA, 0x00}, {0x0AB, 0x00},
    {0x0AC, 0x00}, {0x0AD, 0x00}, {0x0AE, 0x00}, {0x0AF, 0x00},
    {0x0B0, 0x00}, {0x0B1, 0x00}, {0x0B2, 0x00}, {0x0B3, 0x00},
    {0x0B4, 0x00}, {0x0B5, 0x00}, {0x0B6, 0x00}, {0x0B7, 0x00},
    {0x0B8, 0x00}, {0x0B9, 0x00}, {0x0BA, 0x00}, {0x0BB, 0x00},
    {0x0BC, 0x00}, {0x0BD, 0x00}, {0x0BE, 0x00}, {0x0BF, 0x00},
    {0x0C0, 0x00}, {0x0C1, 0x00}, {0x0C2, 0x00}, {0x0C3, 0x00},
    {0x0C4, 0x00}, {0x0C5, 0x00}, {0x0C6, 0x00}, {0x0C7, 0x00},
    {0x0C8, 0x00}, {0x0C9, 0x00}, {0x0CA, 0x00}, {0x0CB, 0x00},
    {0x0CC, 0x00}, {0x0CD, 0x00}, {0x0CE, 0x00}, {0x0CF, 0x00},
    {0x0D0, 0x00}, {0x0D1, 0x00}, {0x0D2, 0x00}, {0x0D3, 0x00},
    {0x0D4, 0x00}, {0x0D5, 0x00}, {0x0D6, 0x00}, {0x0D7, 0x00},
    {0x0D8, 0x00}, {0x0D9, 0x00}, {0x0DA, 0x00}, {0x0DB, 0x00},
    {0x0DC, 0x00}, {0x0DD, 0x00}, {0x0DE, 0x00}, {0x0DF, 0x00},
    {0x0E0, 0x00}, {0x0E1, 0x00}, {0x0E2, 0x00}, {0x0E3, 0x00},
    {0x0E4, 0x00}, {0x0E5, 0x00}, {0x0E6, 0x00}, {0x0E7, 0x00},
    {0x0E8, 0x00}, {0x0E9, 0x00}, {0x0EA, 0x00}, {0x0EB, 0x00},
    {0x0EC, 0x00}, {0x0ED, 0x00}, {0x0EE, 0x00}, {0x0EF, 0x00},
    {0x0F0, 0x00}, {0x0F1, 0x00}, {0x0F2, 0x00}, {0x0F3, 0x00},
    {0x0F4, 0x00}, {0x0F5, 0x00}, {0x0F6, 0x00}, {0x0F7, 0x00},
    {0x0F8, 0x00}, {0x0F9, 0x00}, {0x0FA, 0x00}, {0x0FB, 0x00},
    {0x0FC, 0x00}, {0x0FD, 0x00}, {0x0FE, 0x00}, {0x0FF, 0x00},
    {0x100, 0x00}, {0x101, 0x00}, {0x102, 0x00}, {0x103, 0x00},
    {0x104, 0x00}, {0x105, 0x00}, {0x106, 0x00}, {0x107, 0x00},
    {0x108, 0x00}, {0x109, 0x00}, {0x10A, 0x00}, {0x10B, 0x00},
    {0x10C, 0x00}, {0x10D, 0x00}, {0x10E, 0x00}, {0x10F, 0x00},
    {0x110, 0x00}, {0x111, 0x00}, {0x112, 0x00}, {0x113, 0x00},
    {0x114, 0x00}, {0x115, 0x00}, {0x116, 0x00}, {0x117, 0x00},
    {0x118, 0x00}, {0x119, 0x00}, {0x11A, 0x00}, {0x11B, 0x00},
    {0x11C, 0x00}, {0x11D, 0x00}, {0x11E, 0x00}, {0x11F, 0x00},
    {0x120, 0x00}, {0x121, 0x00}, {0x122, 0x00}, {0x123, 0x00},
    {0x124, 0x00}, {0x125, 0x00}, {0x126, 0x00}, {0x127, 0x00},
    {0x128, 0x00}, {0x129, 0x00}, {0x12A, 0x00}, {0x12B, 0x00},
    {0x12C, 0x00}, {0x12D, 0x00}, {0x12E, 0x00}, {0x12F, 0x00},
    {0x130, 0x00}, {0x131, 0x00}, {0x132, 0x00}, {0x133, 0x00},
    {0x134, 0x00}, {0x135, 0x00}, {0x136, 0x00}, {0x137, 0x00},
    {0x138, 0x00}, {0x139, 0x00}, {0x13A, 0x00}, {0x13B, 0x00},
    {0x13C, 0x00}, {0x13D, 0x00}, {0x13E, 0x00}, {0x13F, 0x00},
    {0x140, 0x00}, {0x141, 0x00}, {0x142, 0x00}, {0x143, 0x00},
    {0x144, 0x00}, {0x145, 0x00}, {0x146, 0x00}, {0x147, 0x00},
    {0x148, 0x00}, {0x149, 0x00}, {0x14A, 0x00}, {0x14B, 0x00},
    {0x14C, 0x00}, {0x14D, 0x00}, {0x14E, 0x00}, {0x14F, 0x00},
    {0x150, 0x00}, {0x151, 0x00}, {0x152, 0x00}, {0x153, 0x00},
    {0x154, 0x00}, {0x155, 0x00}, {0x156, 0x00}, {0x157, 0x00},
    {0x158, 0x00}, {0x159, 0x00}, {0x15A, 0x00}, {0x15B, 0x00},
    {0x15C, 0x00}, {0x15D, 0x00}, {0x15E, 0x00}, {0x15F, 0x00},
    {0x160, 0x00}, {0x161, 0x00}, {0x162, 0x00}, {0x163, 0x00},
    {0x164, 0x00}, {0x165, 0x00}, {0x166, 0x00}, {0x167, 0x00},
    {0x168, 0x00}, {0x169, 0x00}, {0x16A, 0x00}, {0x16B, 0x00},
    {0x16C, 0x00}, {0x16D, 0x00}, {0x16E, 0x00}, {0x16F, 0x00},
    {0x170, 0x00}, {0x171, 0x00}, {0x172, 0x00}, {0x173, 0x00},
    {0x174, 0x00}, {0x175, 0x00}, {0x176, 0x00}, {0x177, 0x00},
    {0x178, 0x00}, {0x179, 0x00}, {0x17A, 0x00}, {0x17B, 0x00},
    {0x17C, 0x00}, {0x17D, 0x00}, {0x17E, 0x00}, {0x17F, 0x00},
    {0x180, 0x00}, {0x181, 0x00}, {0x182, 0x00}, {0x183, 0x00},
    {0x184, 0x00}, {0x185, 0x00}, {0x186, 0x00}, {0x187, 0x00},
    {0x188, 0x00}, {0x189, 0x00}, {0x18A, 0x00}, {0x18B, 0x00},
    {0x18C, 0x00}, {0x18D, 0x00}, {0x18E, 0x00}, {0x18F, 0x00},
    {0x190, 0x00}, {0x191, 0x00}, {0x192, 0x00}, {0x193, 0x00},
    {0x194, 0x00}, {0x195, 0x00}, {0x196, 0x00}, {0x197, 0x00},
    {0x198, 0x00}, {0x199, 0x00}, {0x19A, 0x00}, {0x19B, 0x00},
    {0x19C, 0x00}, {0x19D, 0x00}, {0x19E, 0x00}, {0x19F, 0x00},
    {0x1A0, 0x00}, {0x1A1, 0x00}, {0x1A2, 0x00}, {0x1A3, 0x00},
    {0x1A4, 0x00}, {0x1A5, 0x00}, {0x1A6, 0x00}, {0x1A7, 0x00},
    {0x1A8, 0x00}, {0x1A9, 0x00}, {0x1AA, 0x00}, {0x1AB, 0x00},
    {0x1AC, 0x00}, {0x1AD, 0x00}, {0x1AE, 0x00}, {0x1AF, 0x00},
    {0x1B0, 0x00}, {0x1B1, 0x00}, {0x1B2, 0x00}, {0x1B3, 0x00},
    {0x1B4, 0x00}, {0x1B5, 0x00}, {0x1B6, 0x00}, {0x1B7, 0x00},
    {0x1B8, 0x00}, {0x1B9, 0x00}, {0x1BA, 0x00}, {0x1BB, 0x00},
    {0x1BC, 0x00}, {0x1BD, 0x00}, {0x1BE, 0x00}, {0x1BF, 0x00},
    {0x1C0, 0x00}, {0x1C1, 0x00}, {0x1C2, 0x00}, {0x1C3, 0x00},
    {0x1C4, 0x00}, {0x1C5, 0x00}, {0x1C6, 0x00}, {0x1C7, 0x00},
    {0x1C8, 0x00}, {0x1C9, 0x00}, {0x1CA, 0x00}, {0x1CB, 0x00},
    {0x1CC, 0x00}, {0x1CD, 0x00}, {0x1CE, 0x00}, {0x1CF, 0x00},
    {0x1D0, 0x00}, {0x1D1, 0x00}, {0x1D2, 0x00}, {0x1D3, 0x00},
    {0x1D4, 0x00}, {0x1D5, 0x00}, {0x1D6, 0x00}, {0x1D7, 0x00},
    {0x1D8, 0x00}, {0x1D9, 0x00}, {0x1DA, 0x00}, {0x1DB, 0x00},
    {0x1E0, 0x00}, {0x1E1, 0x00}, {0x1E2, 0x00}, {0x1E3, 0x00},
    {0x1E4, 0x00}, {0x1E5, 0x00}, {0x1E6, 0x00}, {0x1E7, 0x00},
    {0x1E8, 0x00}, {0x1E9, 0x00}, {0x1EA, 0x00}, {0x1EB, 0x00},
    {0x1EC, 0x00}, {0x1ED, 0x00}, {0x1EE, 0x00}, {0x1EF, 0x00},
    {0x1F0, 0x00}, {0x1F1, 0x00}, {0x1F2, 0x00}, {0x1F3, 0x00},
    {0x1F4, 0x00}, {0x1F5, 0x00}, {0x1F6, 0x00}, {0x1F7, 0x00},
    {0x1F8, 0x00}, {0x1F9, 0x00}, {0x1FA, 0x00}, {0x1FB, 0x00},
    {0x1FC, 0x00}, {0x1FD, 0x00}, {0x1FE, 0x00}, {0x1FF, 0x00},
    {0x200, 0x53}, {0x201, 0x00}, {0x202, 0x04}, {0x203, 0x12}, // 0x202 - 0x20B Not listed on Datasheet
    {0x204, 0x01}, {0x205, 0x9d}, {0x206, 0x51}, {0x207, 0x01},
    {0x208, 0x9d}, {0x209, 0x51}, {0x20A, 0x3f}, {0x20B, 0xff},
    {0x20C, 0x00}, {0x20D, 0x21}, {0x20E, 0x0f}, {0x20F, 0x07}, // 0x20D - 0x212 Status/reserved bits 
    {0x210, 0x01}, {0x211, 0x0b}, {0x212, 0xde}, {0x213, 0x00}, // 0x213+ Not listed on datasheet
    {0x214, 0x00}, {0x215, 0x00}, {0x216, 0x00}, {0x217, 0x00},
    {0x218, 0x00}, {0x219, 0x00}, {0x21A, 0x00}, {0x21B, 0x00},
    {0x21C, 0x00}, {0x21D, 0x00}, {0x21E, 0x00}, {0x21F, 0x00},
    {0x220, 0x00}, {0x221, 0x00}, {0x222, 0x00}, {0x223, 0x00},
    {0x224, 0x00}, {0x225, 0x00}, {0x226, 0x00}, {0x227, 0x00},
    {0x228, 0x00}, {0x229, 0x00}, {0x22A, 0x00}, {0x22B, 0x00},
    {0x22C, 0x00}, {0x22D, 0x00}, {0x22E, 0x00}, {0x22F, 0x00},
    {0x230, 0x00}, {0x231, 0x00}, {0x232, 0x00}, {0x233, 0x00},
    {0x234, 0x00}, {0x235, 0x00}, {0x236, 0x00}, {0x237, 0x00},
    {0x238, 0x00}, {0x239, 0x00}, {0x23A, 0x00}, {0x23B, 0x00},
    {0x23C, 0x00}, {0x23D, 0x00}, {0x23E, 0x00}, {0x23F, 0x00},
    {0x240, 0x00}, {0x241, 0x00}, {0x242, 0x00}, {0x243, 0x00},
    {0x244, 0x00}, {0x245, 0x00}, {0x246, 0x00}, {0x247, 0x00},
    {0x248, 0x00}, {0x249, 0x00}, {0x24A, 0x00}, {0x24B, 0x00},
    {0x24C, 0x00}, {0x24D, 0x00}, {0x24E, 0x00}, {0x24F, 0x00},
    {0x250, 0x00}, {0x251, 0x00}, {0x252, 0x00}, {0x253, 0x00},
    {0x254, 0x00}, {0x255, 0x00}, {0x256, 0x00}, {0x257, 0x00},
    {0x258, 0x00}, {0x259, 0x00}, {0x25A, 0x00}, {0x25B, 0x00},
    {0x25C, 0x00}, {0x25D, 0x00}, {0x25E, 0x00}, {0x25F, 0x00},
    {0x260, 0x00}, {0x261, 0x00}, {0x262, 0x00}, {0x263, 0x00},
    {0x264, 0x00}, {0x265, 0x00}, {0x266, 0x00}, {0x267, 0x00},
    {0x268, 0x00}, {0x269, 0x00}, {0x26A, 0x00}, {0x26B, 0x00},
    {0x26C, 0x00}, {0x26D, 0x00}, {0x26E, 0x00}, {0x26F, 0x00},
    {0x270, 0x00}, {0x271, 0x00}, {0x272, 0x00}, {0x273, 0x00},
    {0x274, 0x00}, {0x275, 0x00}, {0x276, 0x00}, {0x277, 0x00},
    {0x278, 0x00}, {0x279, 0x00}, {0x27A, 0x00}, {0x27B, 0x00},
    {0x27C, 0x00}, {0x27D, 0x00}, {0x27E, 0x00}, {0x27F, 0x00},
    {0x280, 0x00}, {0x281, 0x00}, {0x282, 0x00}, {0x283, 0x00},
    {0x284, 0x00}, {0x285, 0x00}, {0x286, 0x00}, {0x287, 0x00},
    {0x288, 0x00}, {0x289, 0x00}, {0x28A, 0x00}, {0x28B, 0x00},
    {0x28C, 0x00}, {0x28D, 0x00}, {0x28E, 0x00}, {0x28F, 0x00},
    {0x290, 0x00}, {0x291, 0x00}, {0x292, 0x00}, {0x293, 0x00},
    {0x294, 0x00}, {0x295, 0x00}, {0x296, 0x00}, {0x297, 0x00},
    {0x298, 0x00}, {0x299, 0x00}, {0x29A, 0x00}, {0x29B, 0x00},
    {0x29C, 0x00}, {0x29D, 0x00}, {0x29E, 0x00}, {0x29F, 0x00},
    {0x2A0, 0x00}, {0x2A1, 0x00}, {0x2A2, 0x00}, {0x2A3, 0x00},
    {0x2A4, 0x00}, {0x2A5, 0x00}, {0x2A6, 0x00}, {0x2A7, 0x00},
    {0x2A8, 0x00}, {0x2A9, 0x00}, {0x2AA, 0x00}, {0x2AB, 0x00},
    {0x2AC, 0x00}, {0x2AD, 0x00}, {0x2AE, 0x00}, {0x2AF, 0x00},
    {0x2B0, 0x00}, {0x2B1, 0x00}, {0x2B2, 0x00}, {0x2B3, 0x00},
    {0x2B4, 0x00}, {0x2B5, 0x00}, {0x2B6, 0x00}, {0x2B7, 0x00},
    {0x2B8, 0x00}, {0x2B9, 0x00}, {0x2BA, 0x00}, {0x2BB, 0x00},
    {0x2BC, 0x00}, {0x2BD, 0x00}, {0x2BE, 0x00}, {0x2BF, 0x00},
    {0x2C0, 0x00}, {0x2C1, 0x00}, {0x2C2, 0x00}, {0x2C3, 0x00},
    {0x2C4, 0x00}, {0x2C5, 0x00}, {0x2C6, 0x00}, {0x2C7, 0x00},
    {0x2C8, 0x00}, {0x2C9, 0x00}, {0x2CA, 0x00}, {0x2CB, 0x00},
    {0x2CC, 0x00}, {0x2CD, 0x00}, {0x2CE, 0x00}, {0x2CF, 0x00},
    {0x2D0, 0x00}, {0x2D1, 0x00}, {0x2D2, 0x00}, {0x2D3, 0x00},
    {0x2D4, 0x00}, {0x2D5, 0x00}, {0x2D6, 0x00}, {0x2D7, 0x00},
    {0x2D8, 0x00}, {0x2D9, 0x00}, {0x2DA, 0x00}, {0x2DB, 0x00},
    {0x2DC, 0x00}, {0x2DD, 0x00}, {0x2DE, 0x00}, {0x2DF, 0x00},
    {0x2E0, 0x00}, {0x2E1, 0x00}, {0x2E2, 0x00}, {0x2E3, 0x00},
    {0x2E4, 0x00}, {0x2E5, 0x00}, {0x2E6, 0x00}, {0x2E7, 0x00},
    {0x2E8, 0x00}, {0x2E9, 0x00}, {0x2EA, 0x00}, {0x2EB, 0x00},
    {0x2EC, 0x00}, {0x2ED, 0x00}, {0x2EE, 0x00}, {0x2EF, 0x00},
    {0x2F0, 0x00}, {0x2F1, 0x00}, {0x2F2, 0x00}, {0x2F3, 0x00},
    {0x2F4, 0x00}, {0x2F5, 0x00}, {0x2F6, 0x00}, {0x2F7, 0x00},
    {0x2F8, 0x00}, {0x2F9, 0x00}, {0x2FA, 0x00}, {0x2FB, 0x00},
    {0x2FC, 0x00}, {0x2FD, 0x00}, {0x2FE, 0x00}, {0x2FF, 0x00},
    {0x300, 0x00}, {0x301, 0x00}, {0x302, 0x00}, {0x303, 0x00},
    {0x304, 0x85}, {0x305, 0x00}, {0x306, 0x00}, {0x307, 0x9c},
    {0x308, 0x01}, {0x309, 0xd4}, {0x30A, 0x02}, {0x30B, 0x71},
    {0x30C, 0x00}, {0x30D, 0x00}, {0x30E, 0x00}, {0x30F, 0x00},
    {0x310, 0x00}, {0x311, 0x83}, {0x312, 0x00}, {0x313, 0x10},
    {0x314, 0x02}, {0x315, 0x08}, {0x316, 0x8c}, {0x039, 0x0f},
};

#endif // _CLOCK_CLEANER_CONFIG_H_