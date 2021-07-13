/******************************************************************************
*
* Copyright (C) 2015 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* XILINX CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*********************************************************************
 * CONTENT
 * Timer peripheral driver. Code is mostly reused from
 * hello_ttc0_interrupt application.
 *********************************************************************/

#include <xil_exception.h>
#include <xttcps.h>
#include "timer.h"
#include "pm_client.h"
#include "pm_api_sys.h"

volatile u32 TickCount = 0;
static XTtcPs timer0_inst;
static u32 verbose = 1;

/**
 * TickHandler() - interrupt handler for timer 0
 * @timer_inst:	pointer to the timer instance
 */
static void TickHandler(XTtcPs *timer_inst)
{
	u32 int_status = XTtcPs_GetInterruptStatus(timer_inst);

	int_status &= XTtcPs_ReadReg(timer_inst->Config.BaseAddress, XTTCPS_IER_OFFSET);
	XTtcPs_ClearInterruptStatus(timer_inst, int_status);
	TickCount++;
	if (verbose) {
		pm_dbg("Timer0 interrupt handler, tick_count = %d\n", TickCount);
	}
}

/**
 * TimerSetIntervalMode() - This fuction sets TTC into interval mode
 * @timer_inst	pointer to the timer instance
 * @sec		interval timeout in seconds
 */
static void TimerSetIntervalMode(XTtcPs *TimerInstPtr, u32 PeriodInSec)
{
	/* Stop the timer */
	XTtcPs_Stop(TimerInstPtr);
	/* Set Interval mode */
	XTtcPs_SetOptions(TimerInstPtr, XTTCPS_OPTION_INTERVAL_MODE);
	XTtcPs_SetInterval(TimerInstPtr, (PeriodInSec * COUNT_PER_SEC));
	XTtcPs_ResetCounterValue(TimerInstPtr);
	XTtcPs_SetPrescaler(TimerInstPtr, 15);
	/* Enable interrupt */
	XTtcPs_EnableInterrupts(TimerInstPtr, XTTCPS_IXR_INTERVAL_MASK);
}

/**
 * TimerInit() - initializes timer0 device
 * @timeout	period for the interval timer interrupt generation
 */
static s32 TimerInit(XScuGic *GicInst, u32 PeriodInSec)
{
	s32 status;
	XTtcPs_Config *timer_config;

	/* Look up the configuration based on the device identifier */
	timer_config = XTtcPs_LookupConfig(TTC0_0_DEVICE_ID);
	if (NULL == timer_config) {
		return XST_FAILURE;
	}

	/* Initialize the device */
	status = XTtcPs_CfgInitialize(&timer0_inst, timer_config, timer_config->BaseAddress);
	if (XST_SUCCESS != status) {
		return status;
	}

	status = XScuGic_Connect(GicInst, TTC_INT_ID0,
				 (Xil_ExceptionHandler)TickHandler,
				 &timer0_inst);
	if(XST_SUCCESS != status)
		return status;

	XScuGic_Enable(GicInst, TTC_INT_ID0);

	TimerSetIntervalMode(&timer0_inst, PeriodInSec);
	XTtcPs_Start(&timer0_inst);

	return status;
}

/**
 * TimerEnableInterrupt() - Enable timer interrupt
 */
void TimerEnableInterrupt(void)
{
	XTtcPs_EnableInterrupts(&timer0_inst, XTTCPS_IXR_INTERVAL_MASK);
}

/**
 * TimerConfigure() - configure timer to generate periodic interrupts
 * timer_period		Time between two timer ticks
 *
 * @return		Status of configuration success
 */
s32 TimerConfigure(XScuGic *GicInst, u32 Period)
{
	s32 ret_status = XPm_RequestNode(NODE_TTC_0, PM_CAP_ACCESS,
					MAX_QOS, REQUEST_ACK_BLOCKING);

	if (XST_SUCCESS != ret_status) {
		pm_dbg("ERROR: Failure in requesting TTC_0\n");
		return ret_status;
	}

	ret_status = TimerInit(GicInst, Period);

	switch (ret_status) {
	case XST_SUCCESS:
		pm_dbg("OK, configured timer\n");
		break;
	case XST_DEVICE_IS_STARTED:
		pm_dbg("WARNING, timer is already counting\n");
		break;
	case XST_FAILURE:
		pm_dbg("ERROR, failed to configure timer\n");
		break;
	default:
		pm_dbg("??? unhandled status %d\n", ret_status);
		break;
	}

	return ret_status;
}

/**
 * Timeout() - introduce a timeout wait for given number of timer ticks
 *
 * @note	Before calling this function timer must be configured to
 *		generate interrupts and interrupts must be enabled.
 */
void Timeout(const u32 ticks)
{
	u32 i;

	pm_dbg("Waiting for %d ticks...", ticks);
	for (i = 0U; i < ticks; i++) {
		u32 currTicks = TickCount;
		while (currTicks == TickCount)
			__asm__ volatile("wfi\n");
	}
}

/**
 * SetVerbose() - Configure timer to show or suppress debug prints
 * @verboseFlag - flag stating if debug prints should be shown (0 - suppress)
 */
void TimerSetVerbose(const u32 verboseFlag)
{
	verbose = verboseFlag;
}
