/*********************************************************************
 * 2017 Aggios, Inc.
 *
 * Written by Filip Drazic <filip.drazic@aggios.com>
 *
 * CONTENT
 * Operating characteristics code used for testing
 * the power management framework
 *********************************************************************/

#ifndef LIBESWPM_TEST_OP_CHAR_H_
#define LIBESWPM_TEST_OP_CHAR_H_

#include <pm_defs.h>

#define PM_POWER_ISLAND_LATENCY		2000
#define PM_POWER_DOMAIN_LATENCY		10000

XStatus CheckPowerMatch(const enum XPmNodeId node);

XStatus CheckLatencyMatch(const enum XPmNodeId node,
			  const u32 latency,
			  const u32 exp_latency);

#endif
