#ifndef XPARAMETERS_H   /* prevent circular inclusions */
#define XPARAMETERS_H   /* by using protection macros */

/* Definition for CPU ID */
#define XPAR_CPU_ID 0U

/* Definitions for peripheral PSU_CORTEXR5_0 */
#define XPAR_PSU_CORTEXR5_0_CPU_CLK_FREQ_HZ 499994995


/******************************************************************/

/* Canonical definitions for peripheral PSU_CORTEXR5_0 */
#define XPAR_CPU_CORTEXR5_0_CPU_CLK_FREQ_HZ 499994995


/******************************************************************/

 /* Definition for PSS REF CLK FREQUENCY */
#define XPAR_PSU_PSS_REF_CLK_FREQ_HZ 33333000U

#include "xparameters_ps.h"


/* Number of Fabric Resets */
#define XPAR_NUM_FABRIC_RESETS 1

#define STDIN_BASEADDRESS 0xFF000000
#define STDOUT_BASEADDRESS 0xFF000000

/******************************************************************/

/* Platform specific definitions */
#define PLATFORM_ZYNQMP
 
/* Definitions for debug logic configuration in lockstep mode */
#define LOCKSTEP_MODE_DEBUG 0U
 
/* Definitions for sleep timer configuration */
#define XSLEEP_TTC_INSTANCE 2
#define SLEEP_TIMER_BASEADDR XPAR_PSU_TTC_8_BASEADDR 
#define SLEEP_TIMER_FREQUENCY XPAR_PSU_TTC_8_TTC_CLK_FREQ_HZ 
 
 
/******************************************************************/
/* Definitions for driver AXIPMON */
#define XPAR_XAXIPMON_NUM_INSTANCES 2U

/* Definitions for peripheral PSU_APM_0 */
#define XPAR_PSU_APM_0_DEVICE_ID 0U
#define XPAR_PSU_APM_0_BASEADDR 0xFD0B0000U
#define XPAR_PSU_APM_0_HIGHADDR 0xFD0BFFFFU
#define XPAR_PSU_APM_0_GLOBAL_COUNT_WIDTH 32U
#define XPAR_PSU_APM_0_METRICS_SAMPLE_COUNT_WIDTH 32U
#define XPAR_PSU_APM_0_ENABLE_EVENT_COUNT 1U
#define XPAR_PSU_APM_0_NUM_MONITOR_SLOTS 6U
#define XPAR_PSU_APM_0_NUM_OF_COUNTERS 10U
#define XPAR_PSU_APM_0_HAVE_SAMPLED_METRIC_CNT 1U
#define XPAR_PSU_APM_0_ENABLE_EVENT_LOG 0U
#define XPAR_PSU_APM_0_FIFO_AXIS_DEPTH 32U
#define XPAR_PSU_APM_0_FIFO_AXIS_TDATA_WIDTH 56U
#define XPAR_PSU_APM_0_FIFO_AXIS_TID_WIDTH 1U
#define XPAR_PSU_APM_0_METRIC_COUNT_SCALE 1U
#define XPAR_PSU_APM_0_ENABLE_ADVANCED 1U
#define XPAR_PSU_APM_0_ENABLE_PROFILE 0U
#define XPAR_PSU_APM_0_ENABLE_TRACE 0U
#define XPAR_PSU_APM_0_S_AXI4_BASEADDR 0x00000000U
#define XPAR_PSU_APM_0_S_AXI4_HIGHADDR 0x00000000U
#define XPAR_PSU_APM_0_ENABLE_32BIT_FILTER_ID 1U


/* Definitions for peripheral PSU_APM_5 */
#define XPAR_PSU_APM_5_DEVICE_ID 1U
#define XPAR_PSU_APM_5_BASEADDR 0xFD490000U
#define XPAR_PSU_APM_5_HIGHADDR 0xFD49FFFFU
#define XPAR_PSU_APM_5_GLOBAL_COUNT_WIDTH 32U
#define XPAR_PSU_APM_5_METRICS_SAMPLE_COUNT_WIDTH 32U
#define XPAR_PSU_APM_5_ENABLE_EVENT_COUNT 1U
#define XPAR_PSU_APM_5_NUM_MONITOR_SLOTS 1U
#define XPAR_PSU_APM_5_NUM_OF_COUNTERS 3U
#define XPAR_PSU_APM_5_HAVE_SAMPLED_METRIC_CNT 1U
#define XPAR_PSU_APM_5_ENABLE_EVENT_LOG 0U
#define XPAR_PSU_APM_5_FIFO_AXIS_DEPTH 32U
#define XPAR_PSU_APM_5_FIFO_AXIS_TDATA_WIDTH 56U
#define XPAR_PSU_APM_5_FIFO_AXIS_TID_WIDTH 1U
#define XPAR_PSU_APM_5_METRIC_COUNT_SCALE 1U
#define XPAR_PSU_APM_5_ENABLE_ADVANCED 1U
#define XPAR_PSU_APM_5_ENABLE_PROFILE 0U
#define XPAR_PSU_APM_5_ENABLE_TRACE 0U
#define XPAR_PSU_APM_5_S_AXI4_BASEADDR 0x00000000U
#define XPAR_PSU_APM_5_S_AXI4_HIGHADDR 0x00000000U
#define XPAR_PSU_APM_5_ENABLE_32BIT_FILTER_ID 1U


/******************************************************************/

/* Canonical definitions for peripheral PSU_APM_0 */
#define XPAR_AXIPMON_0_DEVICE_ID XPAR_PSU_APM_0_DEVICE_ID
#define XPAR_AXIPMON_0_BASEADDR 0xFD0B0000U
#define XPAR_AXIPMON_0_HIGHADDR 0xFD0BFFFFU
#define XPAR_AXIPMON_0_GLOBAL_COUNT_WIDTH 32U
#define XPAR_AXIPMON_0_METRICS_SAMPLE_COUNT_WIDTH 32U
#define XPAR_AXIPMON_0_ENABLE_EVENT_COUNT 1U
#define XPAR_AXIPMON_0_NUM_MONITOR_SLOTS 6U
#define XPAR_AXIPMON_0_NUM_OF_COUNTERS 10U
#define XPAR_AXIPMON_0_HAVE_SAMPLED_METRIC_CNT 1U
#define XPAR_AXIPMON_0_ENABLE_EVENT_LOG 0U
#define XPAR_AXIPMON_0_FIFO_AXIS_DEPTH 32U
#define XPAR_AXIPMON_0_FIFO_AXIS_TDATA_WIDTH 56U
#define XPAR_AXIPMON_0_FIFO_AXIS_TID_WIDTH 1U
#define XPAR_AXIPMON_0_METRIC_COUNT_SCALE 1U
#define XPAR_AXIPMON_0_ENABLE_ADVANCED 1U
#define XPAR_AXIPMON_0_ENABLE_PROFILE 0U
#define XPAR_AXIPMON_0_ENABLE_TRACE 0U
#define XPAR_AXIPMON_0_S_AXI4_BASEADDR 0x00000000U
#define XPAR_AXIPMON_0_S_AXI4_HIGHADDR 0x00000000U
#define XPAR_AXIPMON_0_ENABLE_32BIT_FILTER_ID 1U

/* Canonical definitions for peripheral PSU_APM_5 */
#define XPAR_AXIPMON_1_DEVICE_ID XPAR_PSU_APM_5_DEVICE_ID
#define XPAR_AXIPMON_1_BASEADDR 0xFD490000U
#define XPAR_AXIPMON_1_HIGHADDR 0xFD49FFFFU
#define XPAR_AXIPMON_1_GLOBAL_COUNT_WIDTH 32U
#define XPAR_AXIPMON_1_METRICS_SAMPLE_COUNT_WIDTH 32U
#define XPAR_AXIPMON_1_ENABLE_EVENT_COUNT 1U
#define XPAR_AXIPMON_1_NUM_MONITOR_SLOTS 1U
#define XPAR_AXIPMON_1_NUM_OF_COUNTERS 3U
#define XPAR_AXIPMON_1_HAVE_SAMPLED_METRIC_CNT 1U
#define XPAR_AXIPMON_1_ENABLE_EVENT_LOG 0U
#define XPAR_AXIPMON_1_FIFO_AXIS_DEPTH 32U
#define XPAR_AXIPMON_1_FIFO_AXIS_TDATA_WIDTH 56U
#define XPAR_AXIPMON_1_FIFO_AXIS_TID_WIDTH 1U
#define XPAR_AXIPMON_1_METRIC_COUNT_SCALE 1U
#define XPAR_AXIPMON_1_ENABLE_ADVANCED 1U
#define XPAR_AXIPMON_1_ENABLE_PROFILE 0U
#define XPAR_AXIPMON_1_ENABLE_TRACE 0U
#define XPAR_AXIPMON_1_S_AXI4_BASEADDR 0x00000000U
#define XPAR_AXIPMON_1_S_AXI4_HIGHADDR 0x00000000U
#define XPAR_AXIPMON_1_ENABLE_32BIT_FILTER_ID 1U


/******************************************************************/

/* Definitions for driver CSUDMA */
#define XPAR_XCSUDMA_NUM_INSTANCES 1

/* Definitions for peripheral PSU_CSUDMA */
#define XPAR_PSU_CSUDMA_DEVICE_ID 0
#define XPAR_PSU_CSUDMA_BASEADDR 0xFFC80000
#define XPAR_PSU_CSUDMA_HIGHADDR 0xFFC9FFFF
#define XPAR_PSU_CSUDMA_CSUDMA_CLK_FREQ_HZ 0


/******************************************************************/

/* Canonical definitions for peripheral PSU_CSUDMA */
#define XPAR_XCSUDMA_0_DEVICE_ID XPAR_PSU_CSUDMA_DEVICE_ID
#define XPAR_XCSUDMA_0_BASEADDR 0xFFC80000
#define XPAR_XCSUDMA_0_HIGHADDR 0xFFC9FFFF
#define XPAR_XCSUDMA_0_CSUDMA_CLK_FREQ_HZ 0


/******************************************************************/

/* Definitions for driver DDRCPSU */
#define XPAR_XDDRCPSU_NUM_INSTANCES 1

/* Definitions for peripheral PSU_DDRC_0 */
#define XPAR_PSU_DDRC_0_DEVICE_ID 0
#define XPAR_PSU_DDRC_0_BASEADDR 0xFD070000
#define XPAR_PSU_DDRC_0_HIGHADDR 0xFD070FFF
#define XPAR_PSU_DDRC_0_HAS_ECC 1
#define XPAR_PSU_DDRC_0_DDRC_CLK_FREQ_HZ 599994019


/******************************************************************/

#define XPAR_PSU_DDRC_0_DDR4_ADDR_MAPPING 1
#define XPAR_PSU_DDRC_0_DDR_FREQ_MHZ 1199.988037
#define XPAR_PSU_DDRC_0_VIDEO_BUFFER_SIZE 0
#define XPAR_PSU_DDRC_0_BRC_MAPPING 0
/* Canonical definitions for peripheral PSU_DDRC_0 */
#define XPAR_DDRCPSU_0_DEVICE_ID XPAR_PSU_DDRC_0_DEVICE_ID
#define XPAR_DDRCPSU_0_BASEADDR 0xFD070000
#define XPAR_DDRCPSU_0_HIGHADDR 0xFD070FFF
#define XPAR_DDRCPSU_0_DDRC_CLK_FREQ_HZ 599994019


/******************************************************************/

#define XPAR_DDRCPSU_0_DDR4_ADDR_MAPPING 1
#define XPAR_DDRCPSU_0_DDR_FREQ_MHZ 1199.988037
#define XPAR_DDRCPSU_0_VIDEO_BUFFER_SIZE 0
#define XPAR_DDRCPSU_0_BRC_MAPPING 0

/* Definitions for peripheral PSU_AFI_0 */
#define XPAR_PSU_AFI_0_S_AXI_BASEADDR 0xFD360000
#define XPAR_PSU_AFI_0_S_AXI_HIGHADDR 0xFD36FFFF


/* Definitions for peripheral PSU_AFI_1 */
#define XPAR_PSU_AFI_1_S_AXI_BASEADDR 0xFD370000
#define XPAR_PSU_AFI_1_S_AXI_HIGHADDR 0xFD37FFFF


/* Definitions for peripheral PSU_AFI_2 */
#define XPAR_PSU_AFI_2_S_AXI_BASEADDR 0xFD380000
#define XPAR_PSU_AFI_2_S_AXI_HIGHADDR 0xFD38FFFF


/* Definitions for peripheral PSU_AFI_3 */
#define XPAR_PSU_AFI_3_S_AXI_BASEADDR 0xFD390000
#define XPAR_PSU_AFI_3_S_AXI_HIGHADDR 0xFD39FFFF


/* Definitions for peripheral PSU_AFI_4 */
#define XPAR_PSU_AFI_4_S_AXI_BASEADDR 0xFD3A0000
#define XPAR_PSU_AFI_4_S_AXI_HIGHADDR 0xFD3AFFFF


/* Definitions for peripheral PSU_AFI_5 */
#define XPAR_PSU_AFI_5_S_AXI_BASEADDR 0xFD3B0000
#define XPAR_PSU_AFI_5_S_AXI_HIGHADDR 0xFD3BFFFF


/* Definitions for peripheral PSU_APU */
#define XPAR_PSU_APU_S_AXI_BASEADDR 0xFD5C0000
#define XPAR_PSU_APU_S_AXI_HIGHADDR 0xFD5CFFFF


/* Definitions for peripheral PSU_CCI_GPV */
#define XPAR_PSU_CCI_GPV_S_AXI_BASEADDR 0xFD6E0000
#define XPAR_PSU_CCI_GPV_S_AXI_HIGHADDR 0xFD6EFFFF


/* Definitions for peripheral PSU_CCI_REG */
#define XPAR_PSU_CCI_REG_S_AXI_BASEADDR 0xFD5E0000
#define XPAR_PSU_CCI_REG_S_AXI_HIGHADDR 0xFD5EFFFF


/* Definitions for peripheral PSU_DDR_PHY */
#define XPAR_PSU_DDR_PHY_S_AXI_BASEADDR 0xFD080000
#define XPAR_PSU_DDR_PHY_S_AXI_HIGHADDR 0xFD08FFFF


/* Definitions for peripheral PSU_DDR_QOS_CTRL */
#define XPAR_PSU_DDR_QOS_CTRL_S_AXI_BASEADDR 0xFD090000
#define XPAR_PSU_DDR_QOS_CTRL_S_AXI_HIGHADDR 0xFD09FFFF


/* Definitions for peripheral PSU_FPD_GPV */
#define XPAR_PSU_FPD_GPV_S_AXI_BASEADDR 0xFD700000
#define XPAR_PSU_FPD_GPV_S_AXI_HIGHADDR 0xFD7FFFFF


/* Definitions for peripheral PSU_FPD_SLCR_SECURE */
#define XPAR_PSU_FPD_SLCR_SECURE_S_AXI_BASEADDR 0xFD690000
#define XPAR_PSU_FPD_SLCR_SECURE_S_AXI_HIGHADDR 0xFD6CFFFF


/* Definitions for peripheral PSU_FPD_XMPU_SINK */
#define XPAR_PSU_FPD_XMPU_SINK_S_AXI_BASEADDR 0xFD4F0000
#define XPAR_PSU_FPD_XMPU_SINK_S_AXI_HIGHADDR 0xFD4FFFFF


/* Definitions for peripheral PSU_GPU */
#define XPAR_PSU_GPU_S_AXI_BASEADDR 0xFD4B0000
#define XPAR_PSU_GPU_S_AXI_HIGHADDR 0xFD4BFFFF


/* Definitions for peripheral PSU_IOU_SCNTR */
#define XPAR_PSU_IOU_SCNTR_S_AXI_BASEADDR 0xFF250000
#define XPAR_PSU_IOU_SCNTR_S_AXI_HIGHADDR 0xFF25FFFF


/* Definitions for peripheral PSU_IOU_SCNTRS */
#define XPAR_PSU_IOU_SCNTRS_S_AXI_BASEADDR 0xFF260000
#define XPAR_PSU_IOU_SCNTRS_S_AXI_HIGHADDR 0xFF26FFFF


/* Definitions for peripheral PSU_IOUSECURE_SLCR */
#define XPAR_PSU_IOUSECURE_SLCR_S_AXI_BASEADDR 0xFF240000
#define XPAR_PSU_IOUSECURE_SLCR_S_AXI_HIGHADDR 0xFF24FFFF


/* Definitions for peripheral PSU_LPD_SLCR_SECURE */
#define XPAR_PSU_LPD_SLCR_SECURE_S_AXI_BASEADDR 0xFF4B0000
#define XPAR_PSU_LPD_SLCR_SECURE_S_AXI_HIGHADDR 0xFF4DFFFF


/* Definitions for peripheral PSU_LPD_XPPU_SINK */
#define XPAR_PSU_LPD_XPPU_SINK_S_AXI_BASEADDR 0xFF9C0000
#define XPAR_PSU_LPD_XPPU_SINK_S_AXI_HIGHADDR 0xFF9CFFFF


/* Definitions for peripheral PSU_MBISTJTAG */
#define XPAR_PSU_MBISTJTAG_S_AXI_BASEADDR 0xFFCF0000
#define XPAR_PSU_MBISTJTAG_S_AXI_HIGHADDR 0xFFCFFFFF


/* Definitions for peripheral PSU_MESSAGE_BUFFERS */
#define XPAR_PSU_MESSAGE_BUFFERS_S_AXI_BASEADDR 0xFF990000
#define XPAR_PSU_MESSAGE_BUFFERS_S_AXI_HIGHADDR 0xFF99FFFF


/* Definitions for peripheral PSU_OCM */
#define XPAR_PSU_OCM_S_AXI_BASEADDR 0xFF960000
#define XPAR_PSU_OCM_S_AXI_HIGHADDR 0xFF96FFFF


/* Definitions for peripheral PSU_PMU_GLOBAL_0 */
#define XPAR_PSU_PMU_GLOBAL_0_S_AXI_BASEADDR 0xFFD80000
#define XPAR_PSU_PMU_GLOBAL_0_S_AXI_HIGHADDR 0xFFDBFFFF


/* Definitions for peripheral PSU_QSPI_LINEAR_0 */
#define XPAR_PSU_QSPI_LINEAR_0_S_AXI_BASEADDR 0xC0000000
#define XPAR_PSU_QSPI_LINEAR_0_S_AXI_HIGHADDR 0xDFFFFFFF


/* Definitions for peripheral PSU_R5_0_ATCM */
#define XPAR_PSU_R5_0_ATCM_S_AXI_BASEADDR 0x00000000
#define XPAR_PSU_R5_0_ATCM_S_AXI_HIGHADDR 0x0000FFFF


/* Definitions for peripheral PSU_R5_0_BTCM */
#define XPAR_PSU_R5_0_BTCM_S_AXI_BASEADDR 0x00020000
#define XPAR_PSU_R5_0_BTCM_S_AXI_HIGHADDR 0x0002FFFF


/* Definitions for peripheral PSU_R5_DDR_0 */
#define XPAR_PSU_R5_DDR_0_S_AXI_BASEADDR 0x00100000
#define XPAR_PSU_R5_DDR_0_S_AXI_HIGHADDR 0x7FFFFFFF


/* Definitions for peripheral PSU_R5_TCM_RAM_0 */
#define XPAR_PSU_R5_TCM_RAM_0_S_AXI_BASEADDR 0x00000000
#define XPAR_PSU_R5_TCM_RAM_0_S_AXI_HIGHADDR 0x0003FFFF


/* Definitions for peripheral PSU_RSA */
#define XPAR_PSU_RSA_S_AXI_BASEADDR 0xFFCE0000
#define XPAR_PSU_RSA_S_AXI_HIGHADDR 0xFFCEFFFF


/* Definitions for peripheral PSU_SERDES */
#define XPAR_PSU_SERDES_S_AXI_BASEADDR 0xFD400000
#define XPAR_PSU_SERDES_S_AXI_HIGHADDR 0xFD47FFFF


/* Definitions for peripheral PSU_SIOU */
#define XPAR_PSU_SIOU_S_AXI_BASEADDR 0xFD3D0000
#define XPAR_PSU_SIOU_S_AXI_HIGHADDR 0xFD3DFFFF


/* Definitions for peripheral PSU_SMMU_GPV */
#define XPAR_PSU_SMMU_GPV_S_AXI_BASEADDR 0xFD800000
#define XPAR_PSU_SMMU_GPV_S_AXI_HIGHADDR 0xFDFFFFFF


/* Definitions for peripheral PSU_SMMU_REG */
#define XPAR_PSU_SMMU_REG_S_AXI_BASEADDR 0xFD5F0000
#define XPAR_PSU_SMMU_REG_S_AXI_HIGHADDR 0xFD5FFFFF


/******************************************************************/

/* Definitions for driver GPIO */
#define XPAR_XGPIO_NUM_INSTANCES 1

/* Definitions for peripheral AXI_GPIO_0 */
#define XPAR_AXI_GPIO_0_BASEADDR 0x80000000
#define XPAR_AXI_GPIO_0_HIGHADDR 0x8000FFFF
#define XPAR_AXI_GPIO_0_DEVICE_ID 0
#define XPAR_AXI_GPIO_0_INTERRUPT_PRESENT 0
#define XPAR_AXI_GPIO_0_IS_DUAL 0


/******************************************************************/

/* Canonical definitions for peripheral AXI_GPIO_0 */
#define XPAR_GPIO_0_BASEADDR 0x80000000
#define XPAR_GPIO_0_HIGHADDR 0x8000FFFF
#define XPAR_GPIO_0_DEVICE_ID XPAR_AXI_GPIO_0_DEVICE_ID
#define XPAR_GPIO_0_INTERRUPT_PRESENT 0
#define XPAR_GPIO_0_IS_DUAL 0


/******************************************************************/

#define  XPAR_XIPIPSU_NUM_INSTANCES  1U

/* Parameter definitions for peripheral psu_ipi_1 */
#define  XPAR_PSU_IPI_1_DEVICE_ID  0U
#define  XPAR_PSU_IPI_1_BASE_ADDRESS  0xFF310000U
#define  XPAR_PSU_IPI_1_BIT_MASK  0x00000100U
#define  XPAR_PSU_IPI_1_BUFFER_INDEX  0U
#define  XPAR_PSU_IPI_1_INT_ID  65U

/* Canonical definitions for peripheral psu_ipi_1 */
#define  XPAR_XIPIPSU_0_DEVICE_ID	XPAR_PSU_IPI_1_DEVICE_ID
#define  XPAR_XIPIPSU_0_BASE_ADDRESS	XPAR_PSU_IPI_1_BASE_ADDRESS
#define  XPAR_XIPIPSU_0_BIT_MASK	XPAR_PSU_IPI_1_BIT_MASK
#define  XPAR_XIPIPSU_0_BUFFER_INDEX	XPAR_PSU_IPI_1_BUFFER_INDEX
#define  XPAR_XIPIPSU_0_INT_ID	XPAR_PSU_IPI_1_INT_ID

#define  XPAR_XIPIPSU_NUM_TARGETS  7U

#define  XPAR_PSU_IPI_0_BIT_MASK  0x00000001U
#define  XPAR_PSU_IPI_0_BUFFER_INDEX  2U
#define  XPAR_PSU_IPI_1_BIT_MASK  0x00000100U
#define  XPAR_PSU_IPI_1_BUFFER_INDEX  0U
#define  XPAR_PSU_IPI_2_BIT_MASK  0x00000200U
#define  XPAR_PSU_IPI_2_BUFFER_INDEX  1U
#define  XPAR_PSU_IPI_3_BIT_MASK  0x00010000U
#define  XPAR_PSU_IPI_3_BUFFER_INDEX  7U
#define  XPAR_PSU_IPI_4_BIT_MASK  0x00020000U
#define  XPAR_PSU_IPI_4_BUFFER_INDEX  7U
#define  XPAR_PSU_IPI_5_BIT_MASK  0x00040000U
#define  XPAR_PSU_IPI_5_BUFFER_INDEX  7U
#define  XPAR_PSU_IPI_6_BIT_MASK  0x00080000U
#define  XPAR_PSU_IPI_6_BUFFER_INDEX  7U
/* Target List for referring to processor IPI Targets */

#define  XPAR_XIPIPS_TARGET_PSU_CORTEXA53_0_CH0_MASK  XPAR_PSU_IPI_0_BIT_MASK
#define  XPAR_XIPIPS_TARGET_PSU_CORTEXA53_0_CH0_INDEX  0U

#define  XPAR_XIPIPS_TARGET_PSU_CORTEXA53_1_CH0_MASK  XPAR_PSU_IPI_0_BIT_MASK
#define  XPAR_XIPIPS_TARGET_PSU_CORTEXA53_1_CH0_INDEX  0U

#define  XPAR_XIPIPS_TARGET_PSU_CORTEXA53_2_CH0_MASK  XPAR_PSU_IPI_0_BIT_MASK
#define  XPAR_XIPIPS_TARGET_PSU_CORTEXA53_2_CH0_INDEX  0U

#define  XPAR_XIPIPS_TARGET_PSU_CORTEXA53_3_CH0_MASK  XPAR_PSU_IPI_0_BIT_MASK
#define  XPAR_XIPIPS_TARGET_PSU_CORTEXA53_3_CH0_INDEX  0U

#define  XPAR_XIPIPS_TARGET_PSU_CORTEXR5_0_CH0_MASK  XPAR_PSU_IPI_1_BIT_MASK
#define  XPAR_XIPIPS_TARGET_PSU_CORTEXR5_0_CH0_INDEX  1U

#define  XPAR_XIPIPS_TARGET_PSU_CORTEXR5_1_CH0_MASK  XPAR_PSU_IPI_2_BIT_MASK
#define  XPAR_XIPIPS_TARGET_PSU_CORTEXR5_1_CH0_INDEX  2U

#define  XPAR_XIPIPS_TARGET_PSU_PMU_0_CH0_MASK  XPAR_PSU_IPI_3_BIT_MASK
#define  XPAR_XIPIPS_TARGET_PSU_PMU_0_CH0_INDEX  3U
#define  XPAR_XIPIPS_TARGET_PSU_PMU_0_CH1_MASK  XPAR_PSU_IPI_4_BIT_MASK
#define  XPAR_XIPIPS_TARGET_PSU_PMU_0_CH1_INDEX  4U
#define  XPAR_XIPIPS_TARGET_PSU_PMU_0_CH2_MASK  XPAR_PSU_IPI_5_BIT_MASK
#define  XPAR_XIPIPS_TARGET_PSU_PMU_0_CH2_INDEX  5U
#define  XPAR_XIPIPS_TARGET_PSU_PMU_0_CH3_MASK  XPAR_PSU_IPI_6_BIT_MASK
#define  XPAR_XIPIPS_TARGET_PSU_PMU_0_CH3_INDEX  6U

/* Definitions for driver QSPIPSU */
#define XPAR_XQSPIPSU_NUM_INSTANCES 1

/* Definitions for peripheral PSU_QSPI_0 */
#define XPAR_PSU_QSPI_0_DEVICE_ID 0
#define XPAR_PSU_QSPI_0_BASEADDR 0xFF0F0000
#define XPAR_PSU_QSPI_0_HIGHADDR 0xFF0FFFFF
#define XPAR_PSU_QSPI_0_QSPI_CLK_FREQ_HZ 49999500
#define XPAR_PSU_QSPI_0_QSPI_MODE 0
#define XPAR_PSU_QSPI_0_QSPI_BUS_WIDTH 2


/******************************************************************/

#define XPAR_PSU_QSPI_0_IS_CACHE_COHERENT 0
/* Canonical definitions for peripheral PSU_QSPI_0 */
#define XPAR_XQSPIPSU_0_DEVICE_ID XPAR_PSU_QSPI_0_DEVICE_ID
#define XPAR_XQSPIPSU_0_BASEADDR 0xFF0F0000
#define XPAR_XQSPIPSU_0_HIGHADDR 0xFF0FFFFF
#define XPAR_XQSPIPSU_0_QSPI_CLK_FREQ_HZ 49999500
#define XPAR_XQSPIPSU_0_QSPI_MODE 0
#define XPAR_XQSPIPSU_0_QSPI_BUS_WIDTH 2
#define XPAR_XQSPIPSU_0_IS_CACHE_COHERENT 0


/******************************************************************/

/* Definitions for driver RTCPSU */
#define XPAR_XRTCPSU_NUM_INSTANCES 1

/* Definitions for peripheral PSU_RTC */
#define XPAR_PSU_RTC_DEVICE_ID 0
#define XPAR_PSU_RTC_BASEADDR 0xFFA60000
#define XPAR_PSU_RTC_HIGHADDR 0xFFA6FFFF


/******************************************************************/

/* Canonical definitions for peripheral PSU_RTC */
#define XPAR_XRTCPSU_0_DEVICE_ID XPAR_PSU_RTC_DEVICE_ID
#define XPAR_XRTCPSU_0_BASEADDR 0xFFA60000
#define XPAR_XRTCPSU_0_HIGHADDR 0xFFA6FFFF


/******************************************************************/

/* Definitions for driver SCUGIC */
#define XPAR_XSCUGIC_NUM_INSTANCES 1U

/* Definitions for peripheral PSU_RCPU_GIC */
#define XPAR_PSU_RCPU_GIC_DEVICE_ID 0U
#define XPAR_PSU_RCPU_GIC_BASEADDR 0xF9001000U
#define XPAR_PSU_RCPU_GIC_HIGHADDR 0xF9001FFFU
#define XPAR_PSU_RCPU_GIC_DIST_BASEADDR 0xF9000000U


/******************************************************************/

/* Canonical definitions for peripheral PSU_RCPU_GIC */
#define XPAR_SCUGIC_0_DEVICE_ID 0U
#define XPAR_SCUGIC_0_CPU_BASEADDR 0xF9001000U
#define XPAR_SCUGIC_0_CPU_HIGHADDR 0xF9001FFFU
#define XPAR_SCUGIC_0_DIST_BASEADDR 0xF9000000U


/******************************************************************/

/* Definitions for driver SYSMON */
#define XPAR_XSYSMON_NUM_INSTANCES 1U

/* Definitions for peripheral SYSTEM_MANAGEMENT_WIZ_0 */
#define XPAR_SYSTEM_MANAGEMENT_WIZ_0_IP_TYPE 1U
#define XPAR_SYSTEM_MANAGEMENT_WIZ_0_DEVICE_ID 0U
#define XPAR_SYSTEM_MANAGEMENT_WIZ_0_BASEADDR 0x80010000U
#define XPAR_SYSTEM_MANAGEMENT_WIZ_0_HIGHADDR 0x8001FFFFU
#define XPAR_SYSTEM_MANAGEMENT_WIZ_0_INCLUDE_INTR 1U


/******************************************************************/

/* Canonical definitions for peripheral SYSTEM_MANAGEMENT_WIZ_0 */
#define XPAR_SYSMON_0_IP_TYPE 1U
#define XPAR_SYSMON_0_DEVICE_ID XPAR_SYSTEM_MANAGEMENT_WIZ_0_DEVICE_ID
#define XPAR_SYSMON_0_BASEADDR 0x80010000U
#define XPAR_SYSMON_0_HIGHADDR 0x8001FFFFU
#define XPAR_SYSMON_0_INCLUDE_INTR 1U


/******************************************************************/

/* Definitions for driver TTCPS */
#define XPAR_XTTCPS_NUM_INSTANCES 3U

/* Definitions for peripheral PSU_TTC_2 */
#define XPAR_PSU_TTC_6_DEVICE_ID 6U
#define XPAR_PSU_TTC_6_BASEADDR 0XFF130000U
#define XPAR_PSU_TTC_6_TTC_CLK_FREQ_HZ 100000000U
#define XPAR_PSU_TTC_6_TTC_CLK_CLKSRC 0U
#define XPAR_PSU_TTC_7_DEVICE_ID 7U
#define XPAR_PSU_TTC_7_BASEADDR 0XFF130004U
#define XPAR_PSU_TTC_7_TTC_CLK_FREQ_HZ 100000000U
#define XPAR_PSU_TTC_7_TTC_CLK_CLKSRC 0U
#define XPAR_PSU_TTC_8_DEVICE_ID 8U
#define XPAR_PSU_TTC_8_BASEADDR 0XFF130008U
#define XPAR_PSU_TTC_8_TTC_CLK_FREQ_HZ 100000000U
#define XPAR_PSU_TTC_8_TTC_CLK_CLKSRC 0U


/******************************************************************/

/* Canonical definitions for peripheral PSU_TTC_2 */
#define XPAR_XTTCPS_0_DEVICE_ID XPAR_PSU_TTC_6_DEVICE_ID
#define XPAR_XTTCPS_0_BASEADDR 0xFF130000U
#define XPAR_XTTCPS_0_TTC_CLK_FREQ_HZ 100000000U
#define XPAR_XTTCPS_0_TTC_CLK_CLKSRC 0U

#define XPAR_XTTCPS_1_DEVICE_ID XPAR_PSU_TTC_7_DEVICE_ID
#define XPAR_XTTCPS_1_BASEADDR 0xFF130004U
#define XPAR_XTTCPS_1_TTC_CLK_FREQ_HZ 100000000U
#define XPAR_XTTCPS_1_TTC_CLK_CLKSRC 0U

#define XPAR_XTTCPS_2_DEVICE_ID XPAR_PSU_TTC_8_DEVICE_ID
#define XPAR_XTTCPS_2_BASEADDR 0xFF130008U
#define XPAR_XTTCPS_2_TTC_CLK_FREQ_HZ 100000000U
#define XPAR_XTTCPS_2_TTC_CLK_CLKSRC 0U


/******************************************************************/

/* Definitions for driver UARTPS */
#define XPAR_XUARTPS_NUM_INSTANCES 1

/* Definitions for peripheral PSU_UART_0 */
#define XPAR_PSU_UART_0_DEVICE_ID 0
#define XPAR_PSU_UART_0_BASEADDR 0xFF000000
#define XPAR_PSU_UART_0_HIGHADDR 0xFF00FFFF
#define XPAR_PSU_UART_0_UART_CLK_FREQ_HZ 99999001
#define XPAR_PSU_UART_0_HAS_MODEM 0


/******************************************************************/

/* Canonical definitions for peripheral PSU_UART_0 */
#define XPAR_XUARTPS_0_DEVICE_ID XPAR_PSU_UART_0_DEVICE_ID
#define XPAR_XUARTPS_0_BASEADDR 0xFF000000
#define XPAR_XUARTPS_0_HIGHADDR 0xFF00FFFF
#define XPAR_XUARTPS_0_UART_CLK_FREQ_HZ 99999001
#define XPAR_XUARTPS_0_HAS_MODEM 0


/******************************************************************/

/* Definitions for driver WDTPS */
#define XPAR_XWDTPS_NUM_INSTANCES 1

/* Definitions for peripheral PSU_CSU_WDT */
#define XPAR_PSU_CSU_WDT_DEVICE_ID 0
#define XPAR_PSU_CSU_WDT_BASEADDR 0xFFCB0000
#define XPAR_PSU_CSU_WDT_HIGHADDR 0xFFCBFFFF
#define XPAR_PSU_CSU_WDT_WDT_CLK_FREQ_HZ 100000000


/******************************************************************/

/* Canonical definitions for peripheral PSU_CSU_WDT */
#define XPAR_XWDTPS_0_DEVICE_ID XPAR_PSU_CSU_WDT_DEVICE_ID
#define XPAR_XWDTPS_0_BASEADDR 0xFFCB0000
#define XPAR_XWDTPS_0_HIGHADDR 0xFFCBFFFF
#define XPAR_XWDTPS_0_WDT_CLK_FREQ_HZ 100000000


/******************************************************************/

/* Definitions for driver ZDMA */
#define XPAR_XZDMA_NUM_INSTANCES 8

/* Definitions for peripheral PSU_GDMA_0 */
#define XPAR_PSU_GDMA_0_DEVICE_ID 0
#define XPAR_PSU_GDMA_0_BASEADDR 0xFD500000
#define XPAR_PSU_GDMA_0_DMA_MODE 0
#define XPAR_PSU_GDMA_0_HIGHADDR 0xFD50FFFF
#define XPAR_PSU_GDMA_0_ZDMA_CLK_FREQ_HZ 0


/* Definitions for peripheral PSU_GDMA_1 */
#define XPAR_PSU_GDMA_1_DEVICE_ID 1
#define XPAR_PSU_GDMA_1_BASEADDR 0xFD510000
#define XPAR_PSU_GDMA_1_DMA_MODE 0
#define XPAR_PSU_GDMA_1_HIGHADDR 0xFD51FFFF
#define XPAR_PSU_GDMA_1_ZDMA_CLK_FREQ_HZ 0


/* Definitions for peripheral PSU_GDMA_2 */
#define XPAR_PSU_GDMA_2_DEVICE_ID 2
#define XPAR_PSU_GDMA_2_BASEADDR 0xFD520000
#define XPAR_PSU_GDMA_2_DMA_MODE 0
#define XPAR_PSU_GDMA_2_HIGHADDR 0xFD52FFFF
#define XPAR_PSU_GDMA_2_ZDMA_CLK_FREQ_HZ 0


/* Definitions for peripheral PSU_GDMA_3 */
#define XPAR_PSU_GDMA_3_DEVICE_ID 3
#define XPAR_PSU_GDMA_3_BASEADDR 0xFD530000
#define XPAR_PSU_GDMA_3_DMA_MODE 0
#define XPAR_PSU_GDMA_3_HIGHADDR 0xFD53FFFF
#define XPAR_PSU_GDMA_3_ZDMA_CLK_FREQ_HZ 0


/* Definitions for peripheral PSU_GDMA_4 */
#define XPAR_PSU_GDMA_4_DEVICE_ID 4
#define XPAR_PSU_GDMA_4_BASEADDR 0xFD540000
#define XPAR_PSU_GDMA_4_DMA_MODE 0
#define XPAR_PSU_GDMA_4_HIGHADDR 0xFD54FFFF
#define XPAR_PSU_GDMA_4_ZDMA_CLK_FREQ_HZ 0


/* Definitions for peripheral PSU_GDMA_5 */
#define XPAR_PSU_GDMA_5_DEVICE_ID 5
#define XPAR_PSU_GDMA_5_BASEADDR 0xFD550000
#define XPAR_PSU_GDMA_5_DMA_MODE 0
#define XPAR_PSU_GDMA_5_HIGHADDR 0xFD55FFFF
#define XPAR_PSU_GDMA_5_ZDMA_CLK_FREQ_HZ 0


/* Definitions for peripheral PSU_GDMA_6 */
#define XPAR_PSU_GDMA_6_DEVICE_ID 6
#define XPAR_PSU_GDMA_6_BASEADDR 0xFD560000
#define XPAR_PSU_GDMA_6_DMA_MODE 0
#define XPAR_PSU_GDMA_6_HIGHADDR 0xFD56FFFF
#define XPAR_PSU_GDMA_6_ZDMA_CLK_FREQ_HZ 0


/* Definitions for peripheral PSU_GDMA_7 */
#define XPAR_PSU_GDMA_7_DEVICE_ID 7
#define XPAR_PSU_GDMA_7_BASEADDR 0xFD570000
#define XPAR_PSU_GDMA_7_DMA_MODE 0
#define XPAR_PSU_GDMA_7_HIGHADDR 0xFD57FFFF
#define XPAR_PSU_GDMA_7_ZDMA_CLK_FREQ_HZ 0


/******************************************************************/

#define XPAR_PSU_GDMA_0_IS_CACHE_COHERENT 0
#define XPAR_PSU_GDMA_1_IS_CACHE_COHERENT 0
#define XPAR_PSU_GDMA_2_IS_CACHE_COHERENT 0
#define XPAR_PSU_GDMA_3_IS_CACHE_COHERENT 0
#define XPAR_PSU_GDMA_4_IS_CACHE_COHERENT 0
#define XPAR_PSU_GDMA_5_IS_CACHE_COHERENT 0
#define XPAR_PSU_GDMA_6_IS_CACHE_COHERENT 0
#define XPAR_PSU_GDMA_7_IS_CACHE_COHERENT 0
/* Canonical definitions for peripheral PSU_GDMA_0 */
#define XPAR_XZDMA_0_DEVICE_ID XPAR_PSU_GDMA_0_DEVICE_ID
#define XPAR_XZDMA_0_BASEADDR 0xFD500000
#define XPAR_XZDMA_0_DMA_MODE 0
#define XPAR_XZDMA_0_HIGHADDR 0xFD50FFFF
#define XPAR_XZDMA_0_ZDMA_CLK_FREQ_HZ 0

/* Canonical definitions for peripheral PSU_GDMA_1 */
#define XPAR_XZDMA_1_DEVICE_ID XPAR_PSU_GDMA_1_DEVICE_ID
#define XPAR_XZDMA_1_BASEADDR 0xFD510000
#define XPAR_XZDMA_1_DMA_MODE 0
#define XPAR_XZDMA_1_HIGHADDR 0xFD51FFFF
#define XPAR_XZDMA_1_ZDMA_CLK_FREQ_HZ 0

/* Canonical definitions for peripheral PSU_GDMA_2 */
#define XPAR_XZDMA_2_DEVICE_ID XPAR_PSU_GDMA_2_DEVICE_ID
#define XPAR_XZDMA_2_BASEADDR 0xFD520000
#define XPAR_XZDMA_2_DMA_MODE 0
#define XPAR_XZDMA_2_HIGHADDR 0xFD52FFFF
#define XPAR_XZDMA_2_ZDMA_CLK_FREQ_HZ 0

/* Canonical definitions for peripheral PSU_GDMA_3 */
#define XPAR_XZDMA_3_DEVICE_ID XPAR_PSU_GDMA_3_DEVICE_ID
#define XPAR_XZDMA_3_BASEADDR 0xFD530000
#define XPAR_XZDMA_3_DMA_MODE 0
#define XPAR_XZDMA_3_HIGHADDR 0xFD53FFFF
#define XPAR_XZDMA_3_ZDMA_CLK_FREQ_HZ 0

/* Canonical definitions for peripheral PSU_GDMA_4 */
#define XPAR_XZDMA_4_DEVICE_ID XPAR_PSU_GDMA_4_DEVICE_ID
#define XPAR_XZDMA_4_BASEADDR 0xFD540000
#define XPAR_XZDMA_4_DMA_MODE 0
#define XPAR_XZDMA_4_HIGHADDR 0xFD54FFFF
#define XPAR_XZDMA_4_ZDMA_CLK_FREQ_HZ 0

/* Canonical definitions for peripheral PSU_GDMA_5 */
#define XPAR_XZDMA_5_DEVICE_ID XPAR_PSU_GDMA_5_DEVICE_ID
#define XPAR_XZDMA_5_BASEADDR 0xFD550000
#define XPAR_XZDMA_5_DMA_MODE 0
#define XPAR_XZDMA_5_HIGHADDR 0xFD55FFFF
#define XPAR_XZDMA_5_ZDMA_CLK_FREQ_HZ 0

/* Canonical definitions for peripheral PSU_GDMA_6 */
#define XPAR_XZDMA_6_DEVICE_ID XPAR_PSU_GDMA_6_DEVICE_ID
#define XPAR_XZDMA_6_BASEADDR 0xFD560000
#define XPAR_XZDMA_6_DMA_MODE 0
#define XPAR_XZDMA_6_HIGHADDR 0xFD56FFFF
#define XPAR_XZDMA_6_ZDMA_CLK_FREQ_HZ 0

/* Canonical definitions for peripheral PSU_GDMA_7 */
#define XPAR_XZDMA_7_DEVICE_ID XPAR_PSU_GDMA_7_DEVICE_ID
#define XPAR_XZDMA_7_BASEADDR 0xFD570000
#define XPAR_XZDMA_7_DMA_MODE 0
#define XPAR_XZDMA_7_HIGHADDR 0xFD57FFFF
#define XPAR_XZDMA_7_ZDMA_CLK_FREQ_HZ 0


/******************************************************************/

#define XPAR_XILPM_ENABLED
/* Xilinx FAT File System Library (XilFFs) User Settings */
#define FILE_SYSTEM_USE_MKFS
#define FILE_SYSTEM_NUM_LOGIC_VOL 2
#define FILE_SYSTEM_USE_STRFUNC 0
#define FILE_SYSTEM_SET_FS_RPATH 0
#define FILE_SYSTEM_WORD_ACCESS
#endif  /* end of protection macro */