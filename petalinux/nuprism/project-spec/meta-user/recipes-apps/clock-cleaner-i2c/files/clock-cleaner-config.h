/**
 * @file clock-cleaner-config.h
 * @author Jake Cronin (jcronin@triumf.ca)
 * @brief Register configuration data for the clock cleaner module, 
 * stored in a seperate file for readability 
 * @version 0.1
 * @date 2021-02-23
 * 
 */

#ifndef _CLOCK_CLEANER_CONFIG_H_
#define _CLOCK_CLEANER_CONFIG_H_

#include <stdint.h>

/**
 * @brief Init sequence for the clock cleaner 
 * 
 * Data is presented as <data> /*<register>*'/
 */
uint8_t idt8T49n241_init_program[] = {
    0x09, /*0x000*/ 0x50, /*0x001*/ 0x00, /*0x002*/ 0x60, /*0x003*/
    0x60, /*0x004*/ 0x01, /*0x005*/ 0x7c, /*0x006*/ 0x01, /*0x007*/
    0x03, /*0x008*/ 0x00, /*0x009*/ 0x00, /*0x00A*/ 0x00, /*0x00B*/
    0x01, /*0x00C*/ 0xe9, /*0x00D*/ 0x00, /*0x00E*/ 0x01, /*0x00F*/

    0xe9, /*0x010*/ 0x00, /*0x011*/ 0x5b, /*0x012*/ 0xb0, /*0x013*/
    0x00, /*0x014*/ 0x5b, /*0x015*/ 0xb0, /*0x016*/ 0x7d, /*0x017*/
    0x6d, /*0x018*/ 0x00, /*0x019*/ 0x00, /*0x01A*/ 0x00, /*0x01B*/
    0x00, /*0x01C*/ 0x00, /*0x01D*/ 0x00, /*0x01E*/ 0xff, /*0x01F*/

    0xff, /*0x020*/ 0xff, /*0x021*/ 0xff, /*0x022*/ 0x0b, /*0x023*/
    0x3f, /*0x024*/ 0x00, /*0x025*/ 0x18, /*0x026*/ 0x00, /*0x027*/
    0x00, /*0x028*/ 0x00, /*0x029*/ 0x00, /*0x02A*/ 0x00, /*0x02B*/
    0x01, /*0x02C*/ 0x00, /*0x02D*/ 0x00, /*0x02E*/ 0xd0, /*0x02F*/

    0x0f, /*0x030*/ 0x00, /*0x031*/ 0x00, /*0x032*/ 0x00, /*0x033*/
    0x00, /*0x034*/ 0x00, /*0x035*/ 0x0f, /*0x036*/ 0x00, /*0x037*/
    0x00, /*0x038*/ 0x00, /*0x039*/ 0x00, /*0x03A*/ 0x00, /*0x03B*/
    0x00, /*0x03C*/ 0x44, /*0x03D*/ 0x44, /*0x03E*/ 0x01, /*0x03F*/

    0x00, /*0x040*/ 0x02, /*0x041*/ 0x00, /*0x042*/ 0x00, /*0x043*/
    0x0c, /*0x044*/ 0x00, /*0x045*/ 0x00, /*0x046*/ 0x0c, /*0x047*/
    0x00, /*0x048*/ 0x00, /*0x049*/ 0x0c, /*0x04A*/ 0x00, /*0x04B*/
    0x00, /*0x04C*/ 0x00, /*0x04D*/ 0x00, /*0x04E*/ 0x00, /*0x04F*/

    0x00, /*0x050*/ 0x00, /*0x051*/ 0x00, /*0x052*/ 0x00, /*0x053*/
    0x00, /*0x054*/ 0x00, /*0x055*/ 0x00, /*0x056*/ 0x00, /*0x057*/
    0x00, /*0x058*/ 0x00, /*0x059*/ 0x00, /*0x05A*/ 0x00, /*0x05B*/
    0x00, /*0x05C*/ 0x00, /*0x05D*/ 0x00, /*0x05E*/ 0x00, /*0x05F*/

    0x00, /*0x060*/ 0x00, /*0x061*/ 0x00, /*0x062*/ 0x00, /*0x063*/
    0x00, /*0x064*/ 0x00, /*0x065*/ 0x00, /*0x066*/ 0xA0, /*0x067*/
    0xe0, /*0x068*/ 0x02, /*0x069*/ 0x2b, /*0x06A*/ 0x20, /*0x06B*/
    0x00, /*0x06C*/ 0x00, /*0x06D*/ 0x00, /*0x06E*/ 0x00, /*0x06F*/

    0x00, /*0x070*/ 0x00, /*0x071*/ 0x00, /*0x072*/ 0x13, /*0x073*/
    0x00, /*0x074*/ 0x00, /*0x075*/ 0x13, /*0x076*/ 0x00, /*0x077*/
    0x00, /*0x078*/ 0x53, /*0x079*/ 0x27, /*0x07A*/ 0x14, /*0x07B*/
    0x00, /*0x07C*/ 0x00, /*0x07D*/ 0x00, /*0x07E*/ 0x00, /*0x07F*/

    0x00, /*0x080*/ 0x00, /*0x081*/ 0x00, /*0x082*/ 0x00, /*0x083*/
    0x00, /*0x084*/ 0x00, /*0x085*/ 0x00, /*0x086*/ 0x00, /*0x087*/
    0x00, /*0x088*/ 0x00, /*0x089*/ 0x00, /*0x08A*/ 0x00, /*0x08B*/
    0x00, /*0x08C*/ 0x00, /*0x08D*/ 0x00, /*0x08E*/ 0x00, /*0x08F*/

    0x00, /*0x090*/ 0x00, /*0x091*/ 0x00, /*0x092*/ 0x00, /*0x093*/
    0x00, /*0x094*/ 0x00, /*0x095*/ 0x00, /*0x096*/ 0x00, /*0x097*/
    0x00, /*0x098*/ 0x00, /*0x099*/ 0x00, /*0x09A*/ 0x00, /*0x09B*/
    0x00, /*0x09C*/ 0x00, /*0x09D*/ 0x00, /*0x09E*/ 0x00, /*0x09F*/

    0x00, /*0x0A0*/ 0x00, /*0x0A1*/ 0x00, /*0x0A2*/ 0x00, /*0x0A3*/
    0x00, /*0x0A4*/ 0x00, /*0x0A5*/ 0x00, /*0x0A6*/ 0x00, /*0x0A7*/
    0x00, /*0x0A8*/ 0x00, /*0x0A9*/ 0x00, /*0x0AA*/ 0x00, /*0x0AB*/
    0x00, /*0x0AC*/ 0x00, /*0x0AD*/ 0x00, /*0x0AE*/ 0x00, /*0x0AF*/

    0x00, /*0x0B0*/ 0x00, /*0x0B1*/ 0x00, /*0x0B2*/ 0x00, /*0x0B3*/
    0x00, /*0x0B4*/ 0x00, /*0x0B5*/ 0x00, /*0x0B6*/ 0x00, /*0x0B7*/
    0x00, /*0x0B8*/ 0x00, /*0x0B9*/ 0x00, /*0x0BA*/ 0x00, /*0x0BB*/
    0x00, /*0x0BC*/ 0x00, /*0x0BD*/ 0x00, /*0x0BE*/ 0x00, /*0x0BF*/

    0x00, /*0x0C0*/ 0x00, /*0x0C1*/ 0x00, /*0x0C2*/ 0x00, /*0x0C3*/
    0x00, /*0x0C4*/ 0x00, /*0x0C5*/ 0x00, /*0x0C6*/ 0x00, /*0x0C7*/
    0x00, /*0x0C8*/ 0x00, /*0x0C9*/ 0x00, /*0x0CA*/ 0x00, /*0x0CB*/
    0x00, /*0x0CC*/ 0x00, /*0x0CD*/ 0x00, /*0x0CE*/ 0x00, /*0x0CF*/

    0x00, /*0x0D0*/ 0x00, /*0x0D1*/ 0x00, /*0x0D2*/ 0x00, /*0x0D3*/
    0x00, /*0x0D4*/ 0x00, /*0x0D5*/ 0x00, /*0x0D6*/ 0x00, /*0x0D7*/
    0x00, /*0x0D8*/ 0x00, /*0x0D9*/ 0x00, /*0x0DA*/ 0x00, /*0x0DB*/
    0x00, /*0x0DC*/ 0x00, /*0x0DD*/ 0x00, /*0x0DE*/ 0x00, /*0x0DF*/

    0x00, /*0x0E0*/ 0x00, /*0x0E1*/ 0x00, /*0x0E2*/ 0x00, /*0x0E3*/
    0x00, /*0x0E4*/ 0x00, /*0x0E5*/ 0x00, /*0x0E6*/ 0x00, /*0x0E7*/
    0x00, /*0x0E8*/ 0x00, /*0x0E9*/ 0x00, /*0x0EA*/ 0x00, /*0x0EB*/
    0x00, /*0x0EC*/ 0x00, /*0x0ED*/ 0x00, /*0x0EE*/ 0x00, /*0x0EF*/

    0x00, /*0x0F0*/ 0x00, /*0x0F1*/ 0x00, /*0x0F2*/ 0x00, /*0x0F3*/
    0x00, /*0x0F4*/ 0x00, /*0x0F5*/ 0x00, /*0x0F6*/ 0x00, /*0x0F7*/
    0x00, /*0x0F8*/ 0x00, /*0x0F9*/ 0x00, /*0x0FA*/ 0x00, /*0x0FB*/
    0x00, /*0x0FC*/ 0x00, /*0x0FD*/ 0x00, /*0x0FE*/ 0x00, /*0x0FF*/

    0x00, /*0x100*/ 0x00, /*0x101*/ 0x00, /*0x102*/ 0x00, /*0x103*/
    0x00, /*0x104*/ 0x00, /*0x105*/ 0x00, /*0x106*/ 0x00, /*0x107*/
    0x00, /*0x108*/ 0x00, /*0x109*/ 0x00, /*0x10A*/ 0x00, /*0x10B*/
    0x00, /*0x10C*/ 0x00, /*0x10D*/ 0x00, /*0x10E*/ 0x00, /*0x10F*/

    0x00, /*0x110*/ 0x00, /*0x111*/ 0x00, /*0x112*/ 0x00, /*0x113*/
    0x00, /*0x114*/ 0x00, /*0x115*/ 0x00, /*0x116*/ 0x00, /*0x117*/
    0x00, /*0x118*/ 0x00, /*0x119*/ 0x00, /*0x11A*/ 0x00, /*0x11B*/
    0x00, /*0x11C*/ 0x00, /*0x11D*/ 0x00, /*0x11E*/ 0x00, /*0x11F*/

    0x00, /*0x120*/ 0x00, /*0x121*/ 0x00, /*0x122*/ 0x00, /*0x123*/
    0x00, /*0x124*/ 0x00, /*0x125*/ 0x00, /*0x126*/ 0x00, /*0x127*/
    0x00, /*0x128*/ 0x00, /*0x129*/ 0x00, /*0x12A*/ 0x00, /*0x12B*/
    0x00, /*0x12C*/ 0x00, /*0x12D*/ 0x00, /*0x12E*/ 0x00, /*0x12F*/

    0x00, /*0x130*/ 0x00, /*0x131*/ 0x00, /*0x132*/ 0x00, /*0x133*/
    0x00, /*0x134*/ 0x00, /*0x135*/ 0x00, /*0x136*/ 0x00, /*0x137*/
    0x00, /*0x138*/ 0x00, /*0x139*/ 0x00, /*0x13A*/ 0x00, /*0x13B*/
    0x00, /*0x13C*/ 0x00, /*0x13D*/ 0x00, /*0x13E*/ 0x00, /*0x13F*/

    0x00, /*0x140*/ 0x00, /*0x141*/ 0x00, /*0x142*/ 0x00, /*0x143*/
    0x00, /*0x144*/ 0x00, /*0x145*/ 0x00, /*0x146*/ 0x00, /*0x147*/
    0x00, /*0x148*/ 0x00, /*0x149*/ 0x00, /*0x14A*/ 0x00, /*0x14B*/
    0x00, /*0x14C*/ 0x00, /*0x14D*/ 0x00, /*0x14E*/ 0x00, /*0x14F*/

    0x00, /*0x150*/ 0x00, /*0x151*/ 0x00, /*0x152*/ 0x00, /*0x153*/
    0x00, /*0x154*/ 0x00, /*0x155*/ 0x00, /*0x156*/ 0x00, /*0x157*/
    0x00, /*0x158*/ 0x00, /*0x159*/ 0x00, /*0x15A*/ 0x00, /*0x15B*/
    0x00, /*0x15C*/ 0x00, /*0x15D*/ 0x00, /*0x15E*/ 0x00, /*0x15F*/

    0x00, /*0x160*/ 0x00, /*0x161*/ 0x00, /*0x162*/ 0x00, /*0x163*/
    0x00, /*0x164*/ 0x00, /*0x165*/ 0x00, /*0x166*/ 0x00, /*0x167*/
    0x00, /*0x168*/ 0x00, /*0x169*/ 0x00, /*0x16A*/ 0x00, /*0x16B*/
    0x00, /*0x16C*/ 0x00, /*0x16D*/ 0x00, /*0x16E*/ 0x00, /*0x16F*/

    0x00, /*0x170*/ 0x00, /*0x171*/ 0x00, /*0x172*/ 0x00, /*0x173*/
    0x00, /*0x174*/ 0x00, /*0x175*/ 0x00, /*0x176*/ 0x00, /*0x177*/
    0x00, /*0x178*/ 0x00, /*0x179*/ 0x00, /*0x17A*/ 0x00, /*0x17B*/
    0x00, /*0x17C*/ 0x00, /*0x17D*/ 0x00, /*0x17E*/ 0x00, /*0x17F*/

    0x00, /*0x180*/ 0x00, /*0x181*/ 0x00, /*0x182*/ 0x00, /*0x183*/
    0x00, /*0x184*/ 0x00, /*0x185*/ 0x00, /*0x186*/ 0x00, /*0x187*/
    0x00, /*0x188*/ 0x00, /*0x189*/ 0x00, /*0x18A*/ 0x00, /*0x18B*/
    0x00, /*0x18C*/ 0x00, /*0x18D*/ 0x00, /*0x18E*/ 0x00, /*0x18F*/

    0x00, /*0x190*/ 0x00, /*0x191*/ 0x00, /*0x192*/ 0x00, /*0x193*/
    0x00, /*0x194*/ 0x00, /*0x195*/ 0x00, /*0x196*/ 0x00, /*0x197*/
    0x00, /*0x198*/ 0x00, /*0x199*/ 0x00, /*0x19A*/ 0x00, /*0x19B*/
    0x00, /*0x19C*/ 0x00, /*0x19D*/ 0x00, /*0x19E*/ 0x00, /*0x19F*/

    0x00, /*0x1A0*/ 0x00, /*0x1A1*/ 0x00, /*0x1A2*/ 0x00, /*0x1A3*/
    0x00, /*0x1A4*/ 0x00, /*0x1A5*/ 0x00, /*0x1A6*/ 0x00, /*0x1A7*/
    0x00, /*0x1A8*/ 0x00, /*0x1A9*/ 0x00, /*0x1AA*/ 0x00, /*0x1AB*/
    0x00, /*0x1AC*/ 0x00, /*0x1AD*/ 0x00, /*0x1AE*/ 0x00, /*0x1AF*/

    0x00, /*0x1B0*/ 0x00, /*0x1B1*/ 0x00, /*0x1B2*/ 0x00, /*0x1B3*/
    0x00, /*0x1B4*/ 0x00, /*0x1B5*/ 0x00, /*0x1B6*/ 0x00, /*0x1B7*/
    0x00, /*0x1B8*/ 0x00, /*0x1B9*/ 0x00, /*0x1BA*/ 0x00, /*0x1BB*/
    0x00, /*0x1BC*/ 0x00, /*0x1BD*/ 0x00, /*0x1BE*/ 0x00, /*0x1BF*/

    0x00, /*0x1C0*/ 0x00, /*0x1C1*/ 0x00, /*0x1C2*/ 0x00, /*0x1C3*/
    0x00, /*0x1C4*/ 0x00, /*0x1C5*/ 0x00, /*0x1C6*/ 0x00, /*0x1C7*/
    0x00, /*0x1C8*/ 0x00, /*0x1C9*/ 0x00, /*0x1CA*/ 0x00, /*0x1CB*/
    0x00, /*0x1CC*/ 0x00, /*0x1CD*/ 0x00, /*0x1CE*/ 0x00, /*0x1CF*/

    0x00, /*0x1D0*/ 0x00, /*0x1D1*/ 0x00, /*0x1D2*/ 0x00, /*0x1D3*/
    0x00, /*0x1D4*/ 0x00, /*0x1D5*/ 0x00, /*0x1D6*/ 0x00, /*0x1D7*/
    0x00, /*0x1D8*/ 0x00, /*0x1D9*/ 0x00, /*0x1DA*/ 0x00, /*0x1DB*/
    0x00, /*0x1DC*/ 0x00, /*0x1DD*/ 0x00, /*0x1DE*/ 0x00, /*0x1DF*/

    0x00, /*0x1E0*/ 0x00, /*0x1E1*/ 0x00, /*0x1E2*/ 0x00, /*0x1E3*/
    0x00, /*0x1E4*/ 0x00, /*0x1E5*/ 0x00, /*0x1E6*/ 0x00, /*0x1E7*/
    0x00, /*0x1E8*/ 0x00, /*0x1E9*/ 0x00, /*0x1EA*/ 0x00, /*0x1EB*/
    0x00, /*0x1EC*/ 0x00, /*0x1ED*/ 0x00, /*0x1EE*/ 0x00, /*0x1EF*/

    0x00, /*0x1F0*/ 0x00, /*0x1F1*/ 0x00, /*0x1F2*/ 0x00, /*0x1F3*/
    0x00, /*0x1F4*/ 0x00, /*0x1F5*/ 0x00, /*0x1F6*/ 0x00, /*0x1F7*/
    0x00, /*0x1F8*/ 0x00, /*0x1F9*/ 0x00, /*0x1FA*/ 0x00, /*0x1FB*/
    0x00, /*0x1FC*/ 0x00, /*0x1FD*/ 0x00, /*0x1FE*/ 0x00, /*0x1FF*/
    
    0x53, /*0x200*/ 0x00, /*0x201*/
    // Removed addresses 0x202+ from program as they are read-only or not listed
};

#endif // _CLOCK_CLEANER_CONFIG_H_