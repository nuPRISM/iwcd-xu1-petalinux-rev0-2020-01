/*********************************************************************
 * 2017 Aggios, Inc.
 *
 * Written by Filip Drazic <filip.drazic@aggios.com>
 *
 * CONTENT
 * Operating characteristics code used for testing
 * the power management framework
 *********************************************************************/

#include <pm_api_sys.h>
#include "test_op_char.h"
#include "test_aux.h"

#define PM_OPCHAR_NAME(type)				\
	(type == PM_OPCHAR_TYPE_LATENCY ? "latency" :	\
	(type == PM_OPCHAR_TYPE_POWER   ? "power" : "temperature"))

/* Dummy power consumptions for the APU for specific states */
#define DEFAULT_APU_POWER_ACTIVE	200
#define DEFAULT_APU_POWER_SUSPENDING	100
#define DEFAULT_APU_POWER_SLEEP		0
#define DEFAULT_APU_POWER_OFF		DEFAULT_APU_POWER_SLEEP

/* Dummy power consumptions for the RPU for specific states */
#define DEFAULT_RPU_POWER_ACTIVE	200
#define DEFAULT_RPU_POWER_SUSPENDING	100
#define DEFAULT_RPU_POWER_SLEEP		0
#define DEFAULT_RPU_POWER_OFF		DEFAULT_RPU_POWER_SLEEP

/* Dummy power consumptions for rest of the components */
#define DEFAULT_POWER_ON		100
#define DEFAULT_POWER_RETENTION		50
#define DEFAULT_POWER_OFF		0

/**
 * struct TestOpCharPowerNode - Structure used for connecting power
 *                              domains/islands to their children
 * @nodeId      PM node ID of power domain/island
 * @children    Array od child node IDs
 * @childCount  Number of child nodes
 */
struct TestOpCharPowerNode {
	enum XPmNodeId nodeId;
	enum XPmNodeId *children;
	u32 childCount;
};

static u32 powerTableAPU_X[] = {
	DEFAULT_APU_POWER_OFF,
	DEFAULT_APU_POWER_ACTIVE,
	DEFAULT_APU_POWER_SLEEP,
	DEFAULT_APU_POWER_SUSPENDING,
};

static u32 powerTableRPU_X[] = {
	DEFAULT_RPU_POWER_OFF,
	DEFAULT_RPU_POWER_ACTIVE,
	DEFAULT_RPU_POWER_SLEEP,
	DEFAULT_RPU_POWER_SUSPENDING,
};

static u32 powerTableSRAM[] = {
	DEFAULT_POWER_OFF,
	DEFAULT_POWER_RETENTION,
	DEFAULT_POWER_ON,
};

static u32 powerTableDDR[] = {
	DEFAULT_POWER_OFF,
	DEFAULT_POWER_RETENTION,
	DEFAULT_POWER_ON,
};

static u32 powerTableGenericSlave[] = {
	DEFAULT_POWER_OFF,
	DEFAULT_POWER_ON,
};

static u32 powerTableGppSlave[] = {
	DEFAULT_POWER_OFF,
	DEFAULT_POWER_ON,
};

static u32 powerTableUsbSlave[] = {
	DEFAULT_POWER_OFF,
	DEFAULT_POWER_OFF,
	DEFAULT_POWER_ON,
};

static u32 powerTablePll[] = {
	DEFAULT_POWER_OFF,
	DEFAULT_POWER_ON,
};

static u32 powerTableAON[] = {
	DEFAULT_POWER_ON,
};

static u32 powerTableZERO[] = {
	DEFAULT_POWER_OFF,
	DEFAULT_POWER_OFF,
};

/* Domain and island power consumption */
static u32 powerTablePowerNode[] = {
	DEFAULT_POWER_OFF,
	DEFAULT_POWER_ON,
};

static enum XPmNodeId apuNodes[] = {
	NODE_APU_0,
	NODE_APU_1,
	NODE_APU_2,
	NODE_APU_3,
};

static enum XPmNodeId zeroPowerNodes[] = {
	NODE_APU,
};

static enum XPmNodeId rpuNodes[] = {
	NODE_RPU_0,
	NODE_RPU_1,
};

/* Power island and domains */
static enum XPmNodeId islDomNodes[] = {
	NODE_FPD,
	NODE_RPU,
	NODE_PL,
};

static enum XPmNodeId sramNodes[] = {
	NODE_OCM_BANK_0,
	NODE_OCM_BANK_1,
	NODE_OCM_BANK_2,
	NODE_OCM_BANK_3,
	NODE_TCM_0_A,
	NODE_TCM_0_B,
	NODE_TCM_1_A,
	NODE_TCM_1_B,
	NODE_L2,
};

static enum XPmNodeId gppNodes[] = {
	NODE_GPU_PP_0,
	NODE_GPU_PP_1,
};

static enum XPmNodeId usbNodes[] = {
	NODE_USB_0,
	NODE_USB_1,
};

static enum XPmNodeId genNodes[] = {
	NODE_TTC_0,
	NODE_TTC_1,
	NODE_TTC_2,
	NODE_TTC_3,
	NODE_SATA,
	NODE_ETH_0,
	NODE_ETH_1,
	NODE_ETH_2,
	NODE_ETH_3,
	NODE_UART_0,
	NODE_UART_1,
	NODE_SPI_0,
	NODE_SPI_1,
	NODE_I2C_0,
	NODE_I2C_1,
	NODE_SD_0,
	NODE_SD_1,
	NODE_DP,
	NODE_GDMA,
	NODE_ADMA,
	NODE_NAND,
	NODE_QSPI,
	NODE_GPIO,
	NODE_CAN_0,
	NODE_CAN_1,
	NODE_GPU,
	NODE_PCIE,
};

static enum XPmNodeId pllNodes[] = {
	NODE_APLL,
	NODE_VPLL,
	NODE_DPLL,
	NODE_RPLL,
	NODE_IOPLL,
};

static enum XPmNodeId ddrNodes[] = {
	NODE_DDR,
};

static enum XPmNodeId aonNodes[] = {
	NODE_RTC,
};

typedef struct PowerTableEntry {
	u32* const power;
	const u32 powerCnt;
	enum XPmNodeId* const nodes;
	const u32 nodesCnt;
} PowerTableEntry;

#ifndef ARRAY_SIZE
#define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
#endif

#define DEFINE_PM_NODES(n)	.nodes = n, \
				.nodesCnt = ARRAY_SIZE(n)

#define DEFINE_POWER_INFO(n)	.power = n, \
				.powerCnt = ARRAY_SIZE(n)

static PowerTableEntry powerTable[] = {
	{
		DEFINE_POWER_INFO(powerTableAPU_X),
		DEFINE_PM_NODES(apuNodes),
	}, {
		DEFINE_POWER_INFO(powerTableZERO),
		DEFINE_PM_NODES(zeroPowerNodes),
	}, {
		DEFINE_POWER_INFO(powerTableRPU_X),
		DEFINE_PM_NODES(rpuNodes),
	}, {
		DEFINE_POWER_INFO(powerTablePowerNode),
		DEFINE_PM_NODES(islDomNodes),
	}, {
		DEFINE_POWER_INFO(powerTableSRAM),
		DEFINE_PM_NODES(sramNodes),
	}, {
		DEFINE_POWER_INFO(powerTableGppSlave),
		DEFINE_PM_NODES(gppNodes),
	}, {
		DEFINE_POWER_INFO(powerTableUsbSlave),
		DEFINE_PM_NODES(usbNodes),
	}, {
		DEFINE_POWER_INFO(powerTableGenericSlave),
		DEFINE_PM_NODES(genNodes),
	}, {
		DEFINE_POWER_INFO(powerTablePll),
		DEFINE_PM_NODES(pllNodes),
	}, {
		DEFINE_POWER_INFO(powerTableDDR),
		DEFINE_PM_NODES(ddrNodes),
	}, {
		DEFINE_POWER_INFO(powerTableAON),
		DEFINE_PM_NODES(aonNodes),
	},
};

static enum XPmNodeId fpdChildren[] = {
	NODE_APU,
	NODE_L2,
	NODE_SATA,
	NODE_APLL,
	NODE_VPLL,
	NODE_DPLL,
	NODE_GPU,
	NODE_GPU_PP_0,
	NODE_GPU_PP_1,
	NODE_GDMA,
	NODE_DP,
	NODE_DDR,
	NODE_PCIE,
};

static enum XPmNodeId apuChildren[] = {
	NODE_APU_0,
	NODE_APU_1,
	NODE_APU_2,
	NODE_APU_3,
};

static enum XPmNodeId rpuChildren[] = {
	NODE_RPU_0,
	NODE_RPU_1,
};

/* Array of power domains/islands */
static const struct TestOpCharPowerNode powerNodes[] = {
	{
		.nodeId = NODE_FPD,
		.children = fpdChildren,
		.childCount = PM_ARRAY_SIZE(fpdChildren),
	}, {
		.nodeId = NODE_APU,
		.children = apuChildren,
		.childCount = PM_ARRAY_SIZE(apuChildren),
	}, {
		.nodeId = NODE_RPU,
		.children = rpuChildren,
		.childCount = PM_ARRAY_SIZE(rpuChildren),
	},
};

/*
 * NodeToPowerNode() - Convert PM node ID to pointer to TestOpCharPowerNode
 * @node	PM node ID
 *
 * @return	Pointer to the corresponding TestOpCharPowerNode structure if
 *		node ID corresponds to a power domain or island, NULL otherwise
 */
static const struct TestOpCharPowerNode *NodeToPowerNode(enum XPmNodeId node)
{
	u32 i;

	for (i = 0; i < PM_ARRAY_SIZE(powerNodes); i++) {
		if (powerNodes[i].nodeId == node)
			return &powerNodes[i];
	}

	return NULL;
}

/**
 * GetPowerOfNodeFromTable() - Get power consumption of the node
 * @node	PM node ID
 * @state	State of the node
 *
 * @return	Power consumption of the node
 */
static u32 GetPowerOfNodeFromTable(enum XPmNodeId node, u32 state)
{
	u32 i, j, power = ~0;

	for (i = 0; i < ARRAY_SIZE(powerTable); i++) {
		for (j = 0; j < powerTable[i].nodesCnt; j++) {
			if (node == powerTable[i].nodes[j]) {
				if (state >= powerTable[i].powerCnt) {
					break;
				}
				power = powerTable[i].power[state];
				break;
			}
		}
	}

	return power;
}

/*
 * GetNodePower() - Get current power of a node
 * @node	PM node ID
 *
 * @return	Power of a node
 */
u32 GetNodePower(enum XPmNodeId node)
{
	u32 power;
	XStatus status;
	XPm_NodeStatus nodeStatus;

	/* Get current state of a node */
	status = XPm_GetNodeStatus(node, &nodeStatus);
	HALT_IF_ERR(status, "GetNodeStatus Node ID: %u\n", node);

	power = GetPowerOfNodeFromTable(node, nodeStatus.status);

	/* Check if node is a power island or a power domain */
	const struct TestOpCharPowerNode *powerNode = NodeToPowerNode(node);
	if ((NULL != powerNode) && (nodeStatus.status != 0)) {
		int i;

		/* Add power of every child */
		for (i = 0; i < powerNode->childCount; i++) {
			power += GetNodePower(powerNode->children[i]);
		}
	}
	return power;
}

/*
 * CheckOpCharMatch() - Compare two operating characteristics of the same type
 * @node	Node id for which operating characteristics are compared
 * @type	Operating characteristic type (temperature, power or latency)
 * @op_char	Operating characteristic value returned with
 * 		XPm_GetOpCharacteristics
 * @op_char	Expected value of operating characteristic
 *
 * @return	XST_SUCCESS is expected operating characteristic and the one
 * 		returned by PMU are the same, XST_FAILURE otherwise
 */
static XStatus CheckOpCharMatch(const enum XPmNodeId node,
				const enum XPmOpCharType type,
				const u32 op_char,
				const u32 exp_opchar)
{
	XStatus status = op_char == exp_opchar ? XST_SUCCESS : XST_FAILURE;

	if (status == XST_SUCCESS)
		pm_print("%s match - nodeId = %u, %s: %u\n",
			  PM_OPCHAR_NAME(type), node,
			  PM_OPCHAR_NAME(type), op_char);
	else
		pm_print("%s mismatch - nodeId = %u, %s: %u, expected %s: %u\n",
			 PM_OPCHAR_NAME(type), node, PM_OPCHAR_NAME(type),
			 op_char, PM_OPCHAR_NAME(type), exp_opchar);
	return status;
}

/**
 * CheckPowerMatch() - Check if PMU-FW returns correct power values
 * @node	Node id for which power consumption is checked
 *
 * @return	XST_SUCCESS is expected power consumption of the node and
 * 		the one returned by PMU are the same, XST_FAILURE otherwise
 */
XStatus CheckPowerMatch(const enum XPmNodeId node)
{
	u32 pfwPower, power;

	/* Get power value from the PMU-FW */
	XStatus status = XPm_GetOpCharacteristic(node, PM_OPCHAR_TYPE_POWER, &pfwPower);
	HALT_IF_ERR(status, "OpCharacteristic Node ID: %u\n", node);

	power = GetNodePower(node);

	return CheckOpCharMatch(node, PM_OPCHAR_TYPE_POWER, pfwPower, power);
}

/**
 * CheckLatencyMatch() - Compare two wakeup latency values
 * @node	Node id for which latencies are compared
 * @latency	Wakeup latency of the node returned with
 * 		XPm_GetOpCharacteristics
 * @exp_latency	Expected wakeup latency of the node
 *
 * @return	XST_SUCCESS if expected wakeup latency of the node and
 * 		the latency returned by PMU are the same, XST_FAILURE otherwise
 */
XStatus CheckLatencyMatch(const enum XPmNodeId node,
			      const u32 latency,
			      const u32 exp_latency)
{
	return CheckOpCharMatch(node, PM_OPCHAR_TYPE_LATENCY,
				 latency, exp_latency);
}
