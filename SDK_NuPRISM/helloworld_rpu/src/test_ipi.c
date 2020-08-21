/*********************************************************************
 * 2016 Aggios, Inc.
 *
 * Written by Mirela Simonovic <mirela.simonovic@aggios.com>
 *
 * CONTENT
 * IPI related code used for testing the power management framework
 *********************************************************************/

#include "test_ipi.h"
#include "ipi.h"
#include <pm_client.h>
#include <xpseudo_asm_gcc.h>

/* Variable for counting test IPI interrupts (IPI used as wake source) */
static volatile u32 irqCount;

/**
 * @TestIpiCallback() - Test IPI handler, to be called from IPI irq handler
 * @IpiInst	Pointer to the IPI data structure
 */
static void TestIpiCallback(XIpiPsu *const InstancePtr)
{
	irqCount++;
	pm_print("%s IPI #%d\n", __func__, irqCount);
}

/**
 * TestIpiInit() - Initialize IPI for testing
 * @IpiInst	Ipi Data structure to initialize
 * @GicInst	GIC in which the reception of the interrupt should be enabled
 * @return	Status of the init procedure (XST_SUCCESS or XST_FAILURE)
 */
XStatus TestIpiInit(XScuGic *const GicInst, XIpiPsu *const InstancePtr)
{
	XStatus Status;

	Status = IpiConfigure(GicInst, InstancePtr);
	if (XST_SUCCESS != Status)
		return Status;

	Status = IpiRegisterCallback(InstancePtr, TEST_IPI_MASK, TestIpiCallback);

	return Status;
}

/**
 * TestIpiPollIrqStatus() - Poll until IPI interrupt does not get triggered
 * @InstancePtr	Pointer to the IPI peripheral instance
 * @Mask	Mask to poll for, encodes interrupts whose statuses are polled
 */
void TestIpiPollIrqStatus(XIpiPsu *const InstancePtr, const u32 Mask)
{
	volatile u32 reg;

	pm_print("Polling for IPI interrupts (0x%x)...\n", Mask);
	do {
		reg = XIpiPsu_GetInterruptStatus(InstancePtr);
	} while (Mask != (reg & Mask));
	pm_print("Polling done.\n", Mask);
}

/**
 * TestIpiWaitForIrq() - Wait for few IPI interrupts to be handled
 * @waitCount	Number of interrupts to wait for
 * @note	When this function is called interrupts must be enabled
 *
 * The function shall be used exclusively for testing purposes, e. g. when we
 * want to handle few interrupts before testing any power management, or after
 * resuming to prove that interrupts are still functional. Therefore, when this
 * function is called the app/test is waiting for the testing environment to
 * trigger an interrupt. That is why the interrupts must be enabled when this
 * function is called (otherwise the function would never return). The
 * signalling to the test environment that the interrupt is being waited is
 * currently done by printing the "Waiting for" message.
 */
void TestIpiWaitForIrq(const u32 waitCount)
{
	u32 i;

	for (i = 0U; i < waitCount; i++) {
		u32 currIrq = irqCount;
		dsb();
		pm_print("Waiting for %d IPI interrupts...\n", waitCount - i);
		while (currIrq == irqCount)
			dmb();
	}
}

/**
 * TestIpiGetWakeIrqCount() - Returns total number of IPI wake interrupts
 * @return	The value of irqCount variable
 */
inline u32 TestIpiGetWakeIrqCount(void)
{
	return irqCount;
}
