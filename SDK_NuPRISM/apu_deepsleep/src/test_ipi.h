/*********************************************************************
 * 2016 Aggios, Inc.
 *
 * Written by Mirela Simonovic <mirela.simonovic@aggios.com>
 *
 * CONTENT
 * For testing the power management framework an IPI is used as a
 * wake-up source. This file contains the IPI related interface
 * to be used by the test applications.
 *********************************************************************/

#ifndef LIBESWPM_TEST_IPI_H_
#define LIBESWPM_TEST_IPI_H_

#include <xstatus.h>
#include <xscugic.h>
#include <xipipsu.h>
#include <xparameters.h>

#define TEST_IPI_MASK	0x01000000

XStatus TestIpiInit(XScuGic *const GicInst, XIpiPsu *const InstancePtr);

void TestIpiPollIrqStatus(XIpiPsu *const InstancePtr, const u32 Mask);
void TestIpiWaitForIrq(const u32 waitCount);
u32 TestIpiGetWakeIrqCount(void);

#endif
