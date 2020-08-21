/* $Id: xil_testlib.h,v 1.00 2009/2/19  */
/******************************************************************************
*
*       XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"
*       AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND
*       SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,
*       OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
*       APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION
*       THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,
*       AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE
*       FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY
*       WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE
*       IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
*       REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF
*       INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*       FOR A PARTICULAR PURPOSE.
*
*       (c) Copyright 2002-2008 Xilinx Inc.
*       All rights reserved.
*
******************************************************************************/
/*****************************************************************************/

/***************************** Include Files *********************************/
#include <xil_printf.h>
#include <xil_io.h>
#include "csu.h"

/**
*
* @file xil_testlib.h
*
* This file contains Xilinx software exit messages. These messages are set to be
* matched with the scan strings for board test such that board test would know
* the result of a standalone test program
*
******************************************************************************/

#ifndef XIL_TESTLIB_H			/* prevent circular inclusions */
#define XIL_TESTLIB_H			/* by using protection macros */

#ifdef __cplusplus
extern "C" {
#endif

/*
 *
 * Defines to replace print functions with xil_noprintf when there is no uart
 * We do this to speed up simulation
 *
 */
#ifdef NO_UART

#define xil_printf(charptr, ...) xil_noprintf()
#define printf(charptr, ...)	 xil_noprintf()
#define print(charptr) 		 xil_noprintf()

static void xil_noprintf()
{
	return;
}

#endif

/***************** Macros (Inline Functions) Definitions *********************/
/*
 * XIL_PASS puts out a message to signal board test that a program has pass
 * the testing program without errors
 *
 * @param	None.
 *
 * @return	None.
 *
 * @note	None.
 */
#define XIL_PASS() xil_printf("\r\nREGRESSION TEST PASS.\r\n")
//                        Xil_Out32(0xFFFFFF00, 0xFAABFAAB)

/* XIL_FAIL puts out a message to signal board test that a program has not pass
 * the testing program
 *
 * @param	number of errors.
 *
 * @return	None.
 *
 * @note	None.
 */
#define XIL_FAIL(numErrors) xil_printf("\r\nREGRESSION TEST FAIL WITH %d ERRORS.\r\n", numErrors)
//                        Xil_Out32(0xFFFFFF00, 0xBAADBAAD)

#define IF_QEMU		    if( (Xil_In32( CSU_VERSION ) & CSU_VERSION_PLATFORM_MASK) == (0x3 << CSU_VERSION_PLATFORM_LSB_OFFSET))

#define IF_NOT_QEMU	    if( (Xil_In32( CSU_VERSION ) & CSU_VERSION_PLATFORM_MASK) != (0x3 << CSU_VERSION_PLATFORM_LSB_OFFSET))

#define IF_VELOCE	    if( (Xil_In32( CSU_VERSION ) & CSU_VERSION_PLATFORM_MASK) == (0x2 << CSU_VERSION_PLATFORM_LSB_OFFSET))

#define IF_NOT_VELOCE   if( (Xil_In32( CSU_VERSION ) & CSU_VERSION_PLATFORM_MASK) != (0x2 << CSU_VERSION_PLATFORM_LSB_OFFSET))

#define IF_REMUS        if( (Xil_In32( CSU_VERSION ) & CSU_VERSION_PLATFORM_MASK) == (0x1 << CSU_VERSION_PLATFORM_LSB_OFFSET))

#define IF_NOT_REMUS    if( (Xil_In32( CSU_VERSION ) & CSU_VERSION_PLATFORM_MASK) != (0x1 << CSU_VERSION_PLATFORM_LSB_OFFSET))

#define IF_SILICON	    if( (Xil_In32( CSU_VERSION ) & CSU_VERSION_PLATFORM_MASK) == (0x0 << CSU_VERSION_PLATFORM_LSB_OFFSET))

#define IF_NOT_SILICON  if( (Xil_In32( CSU_VERSION ) & CSU_VERSION_PLATFORM_MASK) != (0x0 << CSU_VERSION_PLATFORM_LSB_OFFSET))


#ifdef __cplusplus
}
#endif

#endif /* end of protection macro */
