# -------------------------------------------------------------------------------------------------
# -- Project          : Mercury+ XU1 Reference Design
# -- File description : Pin assignment and timing constraints file for Mercury PE1
# -- File name        : MercuryXU1_PE1.xdc
# -- Author           : Diana Ungureanu
# -------------------------------------------------------------------------------------------------
# -- Copyright (c) 2018 by Enclustra GmbH, Switzerland. All rights are reserved.
# -- Unauthorized duplication of this document, in whole or in part, by any means is prohibited
# -- without the prior written permission of Enclustra GmbH, Switzerland.
# --
# -- Although Enclustra GmbH believes that the information included in this publication is correct
# -- as of the date of publication, Enclustra GmbH reserves the right to make changes at any time
# -- without notice.
# --
# -- All information in this document may only be published by Enclustra GmbH, Switzerland.
# -------------------------------------------------------------------------------------------------
# -- Notes:
# -- The IO standards might need to be adapted to your design
# -------------------------------------------------------------------------------------------------
# -- File history:
# --
# -- Version | Date       | Author             | Remarks
# -- ----------------------------------------------------------------------------------------------
# -- 1.0     | 22.12.2016 | D. Ungureanu       | First released version
# -- 2.0     | 20.10.2017 | D. Ungureanu       | Consistency checks
# -- 3.0     | 11.06.2018 | D. Ungureanu       | Consistency checks
# --
# -------------------------------------------------------------------------------------------------

set_property BITSTREAM.CONFIG.OVERTEMPSHUTDOWN ENABLE [current_design]

# ----------------------------------------------------------------------------------
# Important! Do not remove this constraint!
# This property ensures that all unused pins are set to high impedance.
# If the constraint is removed, all unused pins have to be set to HiZ in the top level file.
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]
# ----------------------------------------------------------------------------------

# -------------------------------------------------------------------------------------------------
# LEDs
# -------------------------------------------------------------------------------------------------

set_property PACKAGE_PIN AE8 [get_ports Led2_N]
set_property IOSTANDARD LVCMOS18 [get_ports Led2_N]

# -------------------------------------------------------------------------------------------------
# I2C on PL side
# -------------------------------------------------------------------------------------------------

set_property PACKAGE_PIN V3 [get_ports I2c_Scl]
set_property IOSTANDARD LVCMOS18 [get_ports I2c_Scl]

set_property PACKAGE_PIN Y7 [get_ports I2c_Sda]
set_property IOSTANDARD LVCMOS18 [get_ports I2c_Sda]

set_property IOSTANDARD LVDS [get_ports ADC*_D*]
set_property IOSTANDARD LVDS [get_ports ADC*_F*]
set_property IOSTANDARD LVDS [get_ports RJ45*]
set_property IOSTANDARD LVDS [get_ports LVDS*]
set_property IOSTANDARD LVDS [get_ports POE*]
set_property IOSTANDARD LVDS [get_ports trigger_external*]

set_property IOSTANDARD LVCMOS18 [get_ports ADC_*]
set_property IOSTANDARD LVCMOS18 [get_ports *_SEN]
set_property IOSTANDARD LVCMOS18 [get_ports B6*]
set_property IOSTANDARD LVCMOS18 [get_ports PMT*]

set_property IOSTANDARD LVCMOS25 [get_ports B4*]
set_property IOSTANDARD LVCMOS25 [get_ports SFP_*]
set_property IOSTANDARD LVCMOS25 [get_ports FPGA*]
set_property IOSTANDARD LVCMOS25 [get_ports MEZZ*]
set_property IOSTANDARD LVCMOS25 [get_ports IO_B*]
set_property IOSTANDARD LVCMOS25 [get_ports CLNR*]


# -------------------------------------------------------------------------------------------------
# bank 64
# -------------------------------------------------------------------------------------------------

# ------ ADC3 ---------
set_property PACKAGE_PIN AF2 [get_ports ADC3_DA0_p]
set_property PACKAGE_PIN AF1 [get_ports ADC3_DA0_n]
set_property PACKAGE_PIN AF3 [get_ports ADC3_DA1_p]
set_property PACKAGE_PIN AG3 [get_ports ADC3_DA1_n]
set_property PACKAGE_PIN AG1 [get_ports ADC3_DB0_p]
set_property PACKAGE_PIN AH1 [get_ports ADC3_DB0_n]
set_property PACKAGE_PIN AJ2 [get_ports ADC3_DB1_p]
set_property PACKAGE_PIN AK2 [get_ports ADC3_DB1_n]

set_property PACKAGE_PIN AK4 [get_ports ADC3_DC0_p]
set_property PACKAGE_PIN AK3 [get_ports ADC3_DC0_n]
set_property PACKAGE_PIN AH4 [get_ports ADC3_DC1_p]
set_property PACKAGE_PIN AJ4 [get_ports ADC3_DC1_n]
set_property PACKAGE_PIN AH6 [get_ports ADC3_DD0_p]
set_property PACKAGE_PIN AJ6 [get_ports ADC3_DD0_n]
set_property PACKAGE_PIN AJ5 [get_ports ADC3_DD1_p]
set_property PACKAGE_PIN AK5 [get_ports ADC3_DD1_n]
set_property PACKAGE_PIN AH3 [get_ports ADC3_FCLK_p]
set_property PACKAGE_PIN AH2 [get_ports ADC3_FCLK_n]
set_property PACKAGE_PIN AG6 [get_ports ADC3_DCLK_p]
set_property PACKAGE_PIN AG5 [get_ports ADC3_DCLK_n]

# ------ ADC4 ---------
set_property PACKAGE_PIN AF10 [get_ports ADC4_DA0_p]
set_property PACKAGE_PIN AG10 [get_ports ADC4_DA0_n]
set_property PACKAGE_PIN AF8 [get_ports ADC4_DA1_p]
set_property PACKAGE_PIN AF7 [get_ports ADC4_DA1_n]

set_property PACKAGE_PIN AH9 [get_ports ADC4_DB0_p]
set_property PACKAGE_PIN AJ9 [get_ports ADC4_DB0_n]
set_property PACKAGE_PIN AK9 [get_ports ADC4_DB1_p]
set_property PACKAGE_PIN AK8 [get_ports ADC4_DB1_n]
set_property PACKAGE_PIN AH12 [get_ports ADC4_DC0_p]
set_property PACKAGE_PIN AJ12 [get_ports ADC4_DC0_n]
set_property PACKAGE_PIN AJ11 [get_ports ADC4_DC1_p]
set_property PACKAGE_PIN AK11 [get_ports ADC4_DC1_n]
set_property PACKAGE_PIN AK13 [get_ports ADC4_DD0_p]
set_property PACKAGE_PIN AK12 [get_ports ADC4_DD0_n]
set_property PACKAGE_PIN AH7 [get_ports ADC4_DD1_p]
set_property PACKAGE_PIN AJ7 [get_ports ADC4_DD1_n]
set_property PACKAGE_PIN AJ10 [get_ports ADC4_FCLK_p]
set_property PACKAGE_PIN AK10 [get_ports ADC4_FCLK_n]
set_property PACKAGE_PIN AG8 [get_ports ADC4_DCLK_p]
set_property PACKAGE_PIN AH8 [get_ports ADC4_DCLK_n]

set_property PACKAGE_PIN AG13 [get_ports B64_AG13AH13_p]
set_property PACKAGE_PIN AH13 [get_ports B64_AG13AH13_n]
set_property PACKAGE_PIN AF11 [get_ports B64_AF11AG11_p]
set_property PACKAGE_PIN AG11 [get_ports B64_AF11AG11_n]
set_property PACKAGE_PIN AG9 [get_ports B64_AG9_PMT_TXRX]
set_property PACKAGE_PIN AH11 [get_ports B64_AH11_PMT_RX]
set_property PACKAGE_PIN AG4 [get_ports PMT_BOOT]

set_property PACKAGE_PIN AK7 [get_ports RJ45_LVDS_TRIG_p]
set_property PACKAGE_PIN AK6 [get_ports RJ45_LVDS_TRIG_n]
set_property PACKAGE_PIN AF6 [get_ports POE_LVDS_TRIG_p]
set_property PACKAGE_PIN AF5 [get_ports POE_LVDS_TRIG_n]

# -------------------------------------------------------------------------------------------------
# bank 65
# -------------------------------------------------------------------------------------------------

# ------ ADC0 ---------
set_property PACKAGE_PIN AA3 [get_ports ADC0_DA0_p]
set_property PACKAGE_PIN AA2 [get_ports ADC0_DA0_n]
set_property PACKAGE_PIN AA1 [get_ports ADC0_DA1_p]
set_property PACKAGE_PIN AB1 [get_ports ADC0_DA1_n]
set_property PACKAGE_PIN AC6 [get_ports ADC0_DB0_p]
set_property PACKAGE_PIN AD6 [get_ports ADC0_DB0_n]
set_property PACKAGE_PIN AB3 [get_ports ADC0_DB1_p]
set_property PACKAGE_PIN AC3 [get_ports ADC0_DB1_n]
set_property PACKAGE_PIN AC2 [get_ports ADC0_DC0_p]
set_property PACKAGE_PIN AD2 [get_ports ADC0_DC0_n]
set_property PACKAGE_PIN AB6 [get_ports ADC0_DC1_p]
set_property PACKAGE_PIN AB5 [get_ports ADC0_DC1_n]
set_property PACKAGE_PIN AE3 [get_ports ADC0_DD0_p]
set_property PACKAGE_PIN AE2 [get_ports ADC0_DD0_n]
set_property PACKAGE_PIN AA6 [get_ports ADC0_DD1_p]
set_property PACKAGE_PIN AA5 [get_ports ADC0_DD1_n]
set_property PACKAGE_PIN AC1 [get_ports ADC0_FCLK_p]
set_property PACKAGE_PIN AD1 [get_ports ADC0_FCLK_n]
set_property PACKAGE_PIN AC7 [get_ports ADC0_DCLK_p]
set_property PACKAGE_PIN AD7 [get_ports ADC0_DCLK_n]

# ------ ADC1 ---------
set_property PACKAGE_PIN AB4 [get_ports ADC1_DA0_p]
set_property PACKAGE_PIN AC4 [get_ports ADC1_DA0_n]
set_property PACKAGE_PIN AD5 [get_ports ADC1_DA1_p]
set_property PACKAGE_PIN AE5 [get_ports ADC1_DA1_n]
set_property PACKAGE_PIN AD4 [get_ports ADC1_DB0_p]
set_property PACKAGE_PIN AE4 [get_ports ADC1_DB0_n]
set_property PACKAGE_PIN AD10 [get_ports ADC1_DB1_p]
set_property PACKAGE_PIN AE10 [get_ports ADC1_DB1_n]
set_property PACKAGE_PIN AB9 [get_ports ADC1_DC0_p]
set_property PACKAGE_PIN AC9 [get_ports ADC1_DC0_n]
set_property PACKAGE_PIN AA8 [get_ports ADC1_DC1_p]
set_property PACKAGE_PIN AA7 [get_ports ADC1_DC1_n]
set_property PACKAGE_PIN AB11 [get_ports ADC1_DD0_p]
set_property PACKAGE_PIN AB10 [get_ports ADC1_DD0_n]
set_property PACKAGE_PIN AA12 [get_ports ADC1_DD1_p]
set_property PACKAGE_PIN AA11 [get_ports ADC1_DD1_n]
# AA12 AA11
set_property PACKAGE_PIN AD9 [get_ports ADC1_FCLK_p]
set_property PACKAGE_PIN AE9 [get_ports ADC1_FCLK_n]
set_property PACKAGE_PIN AB8 [get_ports ADC1_DCLK_p]
set_property PACKAGE_PIN AC8 [get_ports ADC1_DCLK_n]

set_property PACKAGE_PIN AB13 [get_ports LVDS_MEZZ_RJ45_CLK1_p]
set_property PACKAGE_PIN AC13 [get_ports LVDS_MEZZ_RJ45_CLK1_n]

# -------------------------------------------------------------------------------------------------
# bank 66
# -------------------------------------------------------------------------------------------------

# ------ ADC2 ---------
set_property PACKAGE_PIN L10 [get_ports ADC2_DA0_p]
set_property PACKAGE_PIN K10 [get_ports ADC2_DA0_n]
set_property PACKAGE_PIN L12 [get_ports ADC2_DA1_p]
set_property PACKAGE_PIN L11 [get_ports ADC2_DA1_n]
set_property PACKAGE_PIN N12 [get_ports ADC2_DB0_p]
set_property PACKAGE_PIN M12 [get_ports ADC2_DB0_n]
set_property PACKAGE_PIN N10 [get_ports ADC2_DB1_p]
set_property PACKAGE_PIN M10 [get_ports ADC2_DB1_n]
set_property PACKAGE_PIN R10 [get_ports ADC2_DC0_p]
set_property PACKAGE_PIN T10 [get_ports ADC2_DC0_n]
set_property PACKAGE_PIN U8 [get_ports ADC2_DC1_p]
set_property PACKAGE_PIN V8 [get_ports ADC2_DC1_n]
set_property PACKAGE_PIN W11 [get_ports ADC2_DD0_p]
set_property PACKAGE_PIN W10 [get_ports ADC2_DD0_n]
set_property PACKAGE_PIN U11 [get_ports ADC2_DD1_p]
set_property PACKAGE_PIN V11 [get_ports ADC2_DD1_n]
set_property PACKAGE_PIN P11 [get_ports ADC2_FCLK_p]
set_property PACKAGE_PIN P10 [get_ports ADC2_FCLK_n]
set_property PACKAGE_PIN Y9 [get_ports ADC2_DCLK_p]
set_property PACKAGE_PIN Y8 [get_ports ADC2_DCLK_n]

set_property PACKAGE_PIN U7 [get_ports ADC0_SEN]
set_property PACKAGE_PIN U6 [get_ports ADC1_SEN]
set_property PACKAGE_PIN W4 [get_ports ADC2_SEN]
set_property PACKAGE_PIN T1 [get_ports ADC3_SEN]
set_property PACKAGE_PIN U1 [get_ports ADC4_SEN]

set_property PACKAGE_PIN W5 [get_ports ADC_PDN]
set_property PACKAGE_PIN Y5 [get_ports ADC_RST]
set_property PACKAGE_PIN V4 [get_ports ADC_SDOUT]
set_property PACKAGE_PIN U4 [get_ports ADC_SDATA]
set_property PACKAGE_PIN U5 [get_ports ADC_SCLK]

# Mezzani
#set_property PACKAGE_PIN Y10 [get_ports B66_Y10N11_p]
#set_property PACKAGE_PIN N11 [get_ports B66_Y10N11_n]
#set_property PACKAGE_PIN Y3 [get_ports B66_Y4Y3_n]
#set_property PACKAGE_PIN Y4 [get_ports B66_Y4Y3_p]
#set_property PACKAGE_PIN Y1 [get_ports B66_Y2Y1_n]
#set_property PACKAGE_PIN Y2 [get_ports B66_Y2Y1_p]
#set_property PACKAGE_PIN V6 [get_ports B66_V7V6_n]
#set_property PACKAGE_PIN V7 [get_ports B66_V7V6_p]
#set_property PACKAGE_PIN W1 [get_ports B66_W2W1_n]
#set_property PACKAGE_PIN W2 [get_ports B66_W2W1_p]
#set_property PACKAGE_PIN V1 [get_ports B66_V1V2_n]
#set_property PACKAGE_PIN V2 [get_ports B66_V1V2_p]
#set_property PACKAGE_PIN U3 [get_ports B66_U2U3_n]
#set_property PACKAGE_PIN U2 [get_ports B66_U2U3_p]


# -------------------------------------------------------------------------------------------------
# bank 48
# -------------------------------------------------------------------------------------------------

set_property PACKAGE_PIN B11 [get_ports IO_B48_L1_AD15_B11_N]
set_property PACKAGE_PIN C12 [get_ports IO_B48_L1_AD15_C12_P]
set_property PACKAGE_PIN A11 [get_ports IO_B48_L2_AD14_A11_N]
set_property PACKAGE_PIN A12 [get_ports IO_B48_L2_AD14_A12_P]
set_property PACKAGE_PIN A10 [get_ports IO_B48_L3_AD13_A10_N]
set_property PACKAGE_PIN B10 [get_ports IO_B48_L3_AD13_B10_P]
set_property PACKAGE_PIN C11 [get_ports IO_B48_L4_AD12_C11_N]
set_property PACKAGE_PIN D11 [get_ports IO_B48_L4_AD12_D11_P]
set_property PACKAGE_PIN D12 [get_ports IO_B48_L5_HDGC_D12_N]
set_property PACKAGE_PIN E12 [get_ports IO_B48_L5_HDGC_E12_P]
set_property PACKAGE_PIN D10 [get_ports IO_B48_L6_HDGC_D10_N]
set_property PACKAGE_PIN E10 [get_ports IO_B48_L6_HDGC_E10_P]


# -------------------------------------------------------------------------------------------------
# bank 47
# -------------------------------------------------------------------------------------------------

set_property PACKAGE_PIN D15 [get_ports FPGA_UART_RX]
set_property PACKAGE_PIN D14 [get_ports FPGA_UART_TX]
set_property PACKAGE_PIN H13 [get_ports MEZZ_RJ45_CLK_SEL]

set_property PACKAGE_PIN A15 [get_ports {CLNR_GPIO[0]}]
set_property PACKAGE_PIN A14 [get_ports {CLNR_GPIO[1]}]
set_property PACKAGE_PIN H14 [get_ports {CLNR_GPIO[2]}]
set_property PACKAGE_PIN A13 [get_ports {CLNR_GPIO[3]}]
set_property PACKAGE_PIN B14 [get_ports CLNR_nRST]
set_property PACKAGE_PIN B13 [get_ports CLNR_nINT]

set_property PACKAGE_PIN B15 [get_ports SFP_TX_Fault]
set_property PACKAGE_PIN C13 [get_ports SFP_ModDet]
set_property PACKAGE_PIN C14 [get_ports SFP_LOS]
# Mezzani
set_property PACKAGE_PIN E13 [get_ports B47_GC_E14_n]
set_property PACKAGE_PIN E14 [get_ports B47_GC_E14_p]

set_property PACKAGE_PIN AE13 [get_ports trigger_external_p]
set_property PACKAGE_PIN AF13 [get_ports trigger_external_n]

# -------------------------------------------------------------------------------------------------
# Termination Styles
# -------------------------------------------------------------------------------------------------

set_property DIFF_TERM_ADV TERM_100 [get_ports RJ45_LVDS_TRIG_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC*_p]

# -------------------------------------------------------------------------------------------------
# clocking
# -------------------------------------------------------------------------------------------------
create_clock -period 2.667 -name clkin0 [get_ports ADC0_DCLK_p]
create_clock -period 2.667 -name clkin1 [get_ports ADC1_DCLK_p]
create_clock -period 2.667 -name clkin2 [get_ports ADC2_DCLK_p]
create_clock -period 2.667 -name clkin3 [get_ports ADC3_DCLK_p]
create_clock -period 2.667 -name clkin4 [get_ports ADC4_DCLK_p]

set_clock_groups -name clk_group_def -asynchronous -group [get_clocks {clk_pl*}] \
-group [get_clocks -include_generated_clocks clkin0] \
-group [get_clocks -include_generated_clocks clkin1] \
-group [get_clocks -include_generated_clocks clkin2] \
-group [get_clocks -include_generated_clocks clkin3] \
-group [get_clocks -include_generated_clocks clkin4]

set_input_delay 0.55 -min -clock clkin1 [get_ports {ADC1*F* ADC1*0* ADC1*1* ADC0*F* ADC0*0* ADC0*1*}]
set_input_delay 0.8 -max -clock clkin1 [get_ports {ADC1*F* ADC1*0* ADC1*1* ADC0*F* ADC0*0* ADC0*1*}]
set_input_delay 0.55 -min -clock clkin2 [get_ports {ADC2*F* ADC2*0* ADC2*1*}]
set_input_delay 0.8 -max -clock clkin2 [get_ports {ADC2*F* ADC2*0* ADC2*1*}]
set_input_delay 0.55 -min -clock clkin3 [get_ports {ADC3*F* ADC3*0* ADC3*1* ADC4*F* ADC4*0* ADC4*1*}]
set_input_delay 0.8 -max -clock clkin3 [get_ports {ADC3*F* ADC3*0* ADC3*1* ADC4*F* ADC4*0* ADC4*1*}]
