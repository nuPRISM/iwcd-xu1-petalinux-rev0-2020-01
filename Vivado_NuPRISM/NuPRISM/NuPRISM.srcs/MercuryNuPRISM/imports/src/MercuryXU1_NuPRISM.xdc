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


# -------------------------------------------------------------------------------------------------
# bank 64
# -------------------------------------------------------------------------------------------------

set_property PACKAGE_PIN AH12 [get_ports ADC_DATA4_DC0_p]
set_property PACKAGE_PIN AJ12 [get_ports ADC_DATA4_DC0_n]
set_property PACKAGE_PIN AK13 [get_ports ADC_DATA4_DD0_p]
set_property PACKAGE_PIN AK12 [get_ports ADC_DATA4_DD0_n]
set_property PACKAGE_PIN AJ11 [get_ports ADC_DATA4_DC1_p]
set_property PACKAGE_PIN AK11 [get_ports ADC_DATA4_DC1_n]
set_property PACKAGE_PIN AJ10 [get_ports ADC_DATA4_FCLK_p]
set_property PACKAGE_PIN AK10 [get_ports ADC_DATA4_FCLK_n]
set_property PACKAGE_PIN AH11 [get_ports B64_AH11_PMT_RX]
set_property PACKAGE_PIN AF8 [get_ports ADC_DATA4_DA1_p]
set_property PACKAGE_PIN AF7 [get_ports ADC_DATA4_DA1_n]
set_property PACKAGE_PIN AF10 [get_ports ADC_DATA4_DA0_p]
set_property PACKAGE_PIN AG10 [get_ports ADC_DATA4_DA0_n]
set_property PACKAGE_PIN AH9 [get_ports ADC_DATA4_DB0_p]
set_property PACKAGE_PIN AJ9 [get_ports ADC_DATA4_DB0_n]
set_property PACKAGE_PIN AK9 [get_ports ADC_DATA4_DB1_p]
set_property PACKAGE_PIN AK8 [get_ports ADC_DATA4_DB1_n]
set_property PACKAGE_PIN AH7 [get_ports ADC_DATA4_DD1_p]
set_property PACKAGE_PIN AJ7 [get_ports ADC_DATA4_DD1_n]
set_property PACKAGE_PIN AG8 [get_ports ADC_DATA4_DCLK_p]
set_property PACKAGE_PIN AH8 [get_ports ADC_DATA4_DCLK_n]
set_property PACKAGE_PIN AG9 [get_ports B64_AG9_PMT_TXRX]
set_property PACKAGE_PIN AG6 [get_ports ADC_DATA3_DCLK_p]
set_property PACKAGE_PIN AG5 [get_ports ADC_DATA3_DCLK_n]
set_property PACKAGE_PIN AH6 [get_ports ADC_DATA3_DD0_p]
set_property PACKAGE_PIN AJ6 [get_ports ADC_DATA3_DD0_n]
set_property PACKAGE_PIN AK7 [get_ports RJ45_LVDS_TRIG_p]
set_property PACKAGE_PIN AK6 [get_ports RJ45_LVDS_TRIG_n]
set_property PACKAGE_PIN AF6 [get_ports POE_LVDS_TRIG_n]
set_property PACKAGE_PIN AF5 [get_ports POE_LVDS_TRIG_p]
set_property PACKAGE_PIN AJ5 [get_ports ADC_DATA3_DD1_p]
set_property PACKAGE_PIN AK5 [get_ports ADC_DATA3_DD1_n]
set_property PACKAGE_PIN AH4 [get_ports ADC_DATA3_DC1_p]
set_property PACKAGE_PIN AJ4 [get_ports ADC_DATA3_DC1_n]
set_property PACKAGE_PIN AG4 [get_ports PMT_BOOT]
set_property PACKAGE_PIN AK4 [get_ports ADC_DATA3_DC0_p]
set_property PACKAGE_PIN AK3 [get_ports ADC_DATA3_DC0_n]
set_property PACKAGE_PIN AH3 [get_ports ADC_DATA3_FCLK_p]
set_property PACKAGE_PIN AH2 [get_ports ADC_DATA3_FCLK_n]
set_property PACKAGE_PIN AJ2 [get_ports ADC_DATA3_DB1_p]
set_property PACKAGE_PIN AK2 [get_ports ADC_DATA3_DB1_n]
set_property PACKAGE_PIN AG1 [get_ports ADC_DATA3_DB0_p]
set_property PACKAGE_PIN AH1 [get_ports ADC_DATA3_DB0_n]
set_property PACKAGE_PIN AF3 [get_ports ADC_DATA3_DA1_p]
set_property PACKAGE_PIN AG3 [get_ports ADC_DATA3_DA1_n]
set_property PACKAGE_PIN AF2 [get_ports ADC_DATA3_DA0_p]
set_property PACKAGE_PIN AF1 [get_ports ADC_DATA3_DA0_n]

set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DC0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DC0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DD0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DD0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DC1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DC1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_FCLK_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_FCLK_n]
set_property IOSTANDARD LVCMOS18 [get_ports B64_AH11_PMT_RX]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DA1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DA1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DA0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DA0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DB0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DB0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DB1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DB1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DD1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DD1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DCLK_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA4_DCLK_n]
set_property IOSTANDARD LVCMOS18 [get_ports B64_AG9_PMT_TXRX]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DCLK_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DCLK_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DD0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DD0_n]
set_property IOSTANDARD LVDS [get_ports RJ45_LVDS_TRIG_p]
set_property IOSTANDARD LVDS [get_ports RJ45_LVDS_TRIG_n]
set_property IOSTANDARD LVDS [get_ports POE_LVDS_TRIG_n]
set_property IOSTANDARD LVDS [get_ports POE_LVDS_TRIG_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DD1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DD1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DC1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DC1_n]
set_property IOSTANDARD LVCMOS18 [get_ports PMT_BOOT]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DC0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DC0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_FCLK_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_FCLK_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DB1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DB1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DB0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DB0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DA1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DA1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DA0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA3_DA0_n]

# -------------------------------------------------------------------------------------------------
# bank 65
# -------------------------------------------------------------------------------------------------

set_property PACKAGE_PIN AB13 [get_ports LVDS_MEZZ_RJ45_CLK1_p]
set_property PACKAGE_PIN AC13 [get_ports LVDS_MEZZ_RJ45_CLK1_n]
set_property PACKAGE_PIN AA12 [get_ports ADC_DATA1_DD1_p]
set_property PACKAGE_PIN AA11 [get_ports ADC_DATA1_DD1_n]
set_property PACKAGE_PIN AB11 [get_ports ADC_DATA1_DD0_p]
set_property PACKAGE_PIN AB10 [get_ports ADC_DATA1_DD0_n]
set_property PACKAGE_PIN AB9 [get_ports ADC_DATA1_DC0_p]
set_property PACKAGE_PIN AC9 [get_ports ADC_DATA1_DC0_n]
set_property PACKAGE_PIN AD10 [get_ports ADC_DATA1_DB1_p]
set_property PACKAGE_PIN AE10 [get_ports ADC_DATA1_DB1_n]
set_property PACKAGE_PIN AD9 [get_ports ADC_DATA1_FCLK_p]
set_property PACKAGE_PIN AE9 [get_ports ADC_DATA1_FCLK_n]
set_property PACKAGE_PIN AA8 [get_ports ADC_DATA1_DC1_p]
set_property PACKAGE_PIN AA7 [get_ports ADC_DATA1_DC1_n]
set_property PACKAGE_PIN AC7 [get_ports ADC_DATA0_DCLK_p]
set_property PACKAGE_PIN AD7 [get_ports ADC_DATA0_DCLK_n]
set_property PACKAGE_PIN AB8 [get_ports ADC_DATA1_DCLK_p]
set_property PACKAGE_PIN AC8 [get_ports ADC_DATA1_DCLK_n]
set_property PACKAGE_PIN AB6 [get_ports ADC_DATA0_DC1_p]
set_property PACKAGE_PIN AB5 [get_ports ADC_DATA0_DC1_n]
set_property PACKAGE_PIN AC6 [get_ports ADC_DATA0_DB0_p]
set_property PACKAGE_PIN AD6 [get_ports ADC_DATA0_DB0_n]
set_property PACKAGE_PIN AA6 [get_ports ADC_DATA0_DD1_p]
set_property PACKAGE_PIN AA5 [get_ports ADC_DATA0_DD1_n]
set_property PACKAGE_PIN AD5 [get_ports ADC_DATA1_DA1_p]
set_property PACKAGE_PIN AE5 [get_ports ADC_DATA1_DA1_n]
set_property PACKAGE_PIN AD4 [get_ports ADC_DATA1_DB0_p]
set_property PACKAGE_PIN AE4 [get_ports ADC_DATA1_DB0_n]
set_property PACKAGE_PIN AB4 [get_ports ADC_DATA1_DA0_p]
set_property PACKAGE_PIN AC4 [get_ports ADC_DATA1_DA0_n]
set_property PACKAGE_PIN AB3 [get_ports ADC_DATA0_DB1_p]
set_property PACKAGE_PIN AC3 [get_ports ADC_DATA0_DB1_n]
set_property PACKAGE_PIN AE3 [get_ports ADC_DATA0_DD0_p]
set_property PACKAGE_PIN AE2 [get_ports ADC_DATA0_DD0_n]
set_property PACKAGE_PIN AC2 [get_ports ADC_DATA0_DC0_p]
set_property PACKAGE_PIN AD2 [get_ports ADC_DATA0_DC0_n]
set_property PACKAGE_PIN AC1 [get_ports ADC_DATA0_FCLK_p]
set_property PACKAGE_PIN AD1 [get_ports ADC_DATA0_FCLK_n]
set_property PACKAGE_PIN AA3 [get_ports ADC_DATA0_DA0_p]
set_property PACKAGE_PIN AA2 [get_ports ADC_DATA0_DA0_n]
set_property PACKAGE_PIN AA1 [get_ports ADC_DATA0_DA1_p]
set_property PACKAGE_PIN AB1 [get_ports ADC_DATA0_DA1_n]

set_property IOSTANDARD LVDS [get_ports LVDS_MEZZ_RJ45_CLK1_p]
set_property IOSTANDARD LVDS [get_ports LVDS_MEZZ_RJ45_CLK1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DD1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DD1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DD0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DD0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DC0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DC0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DB1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DB1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_FCLK_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_FCLK_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DC1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DC1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DCLK_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DCLK_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DCLK_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DCLK_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DC1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DC1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DB0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DB0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DD1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DD1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DA1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DA1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DB0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DB0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DA0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA1_DA0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DB1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DB1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DD0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DD0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DC0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DC0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_FCLK_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_FCLK_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DA0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DA0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DA1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA0_DA1_n]

# -------------------------------------------------------------------------------------------------
# bank 66
# -------------------------------------------------------------------------------------------------

set_property PACKAGE_PIN T1 [get_ports ADC_SEN3]
set_property PACKAGE_PIN U1 [get_ports ADC_SEN4]
set_property PACKAGE_PIN W5 [get_ports ADC_PDn]
set_property PACKAGE_PIN Y5 [get_ports ADC_RESET]
set_property PACKAGE_PIN V4 [get_ports ADC_SDOUT]
set_property PACKAGE_PIN W4 [get_ports ADC_SEN2]
set_property PACKAGE_PIN U5 [get_ports ADC_SCLK]
set_property PACKAGE_PIN U4 [get_ports ADC_SDATA]
set_property PACKAGE_PIN U7 [get_ports ADC_SEN0]
set_property PACKAGE_PIN U6 [get_ports ADC_SEN1]
set_property PACKAGE_PIN U8 [get_ports ADC_DATA2_DC1_p]
set_property PACKAGE_PIN V8 [get_ports ADC_DATA2_DC1_n]
set_property PACKAGE_PIN Y9 [get_ports ADC_DATA2_DCLK_p]
set_property PACKAGE_PIN Y8 [get_ports ADC_DATA2_DCLK_n]
set_property PACKAGE_PIN U11 [get_ports ADC_DATA2_DD1_p]
set_property PACKAGE_PIN V11 [get_ports ADC_DATA2_DD1_n]
set_property PACKAGE_PIN W11 [get_ports ADC_DATA2_DD0_p]
set_property PACKAGE_PIN W10 [get_ports ADC_DATA2_DD0_n]
set_property PACKAGE_PIN R10 [get_ports ADC_DATA2_DC0_p]
set_property PACKAGE_PIN T10 [get_ports ADC_DATA2_DC0_n]
set_property PACKAGE_PIN P11 [get_ports ADC_DATA2_FCLK_p]
set_property PACKAGE_PIN P10 [get_ports ADC_DATA2_FCLK_n]
set_property PACKAGE_PIN N12 [get_ports ADC_DATA2_DB0_p]
set_property PACKAGE_PIN M12 [get_ports ADC_DATA2_DB0_n]
set_property PACKAGE_PIN N10 [get_ports ADC_DATA2_DB1_p]
set_property PACKAGE_PIN M10 [get_ports ADC_DATA2_DB1_n]
set_property PACKAGE_PIN L12 [get_ports ADC_DATA2_DA1_p]
set_property PACKAGE_PIN L11 [get_ports ADC_DATA2_DA1_n]
set_property PACKAGE_PIN L10 [get_ports ADC_DATA2_DA0_p]
set_property PACKAGE_PIN K10 [get_ports ADC_DATA2_DA0_n]

set_property IOSTANDARD LVCMOS18 [get_ports ADC_SEN3]
set_property IOSTANDARD LVCMOS18 [get_ports ADC_SEN4]
set_property IOSTANDARD LVCMOS18 [get_ports ADC_PDn]
set_property IOSTANDARD LVCMOS18 [get_ports ADC_RESET]
set_property IOSTANDARD LVCMOS18 [get_ports ADC_SDOUT]
set_property IOSTANDARD LVCMOS18 [get_ports ADC_SEN2]
set_property IOSTANDARD LVCMOS18 [get_ports ADC_SCLK]
set_property IOSTANDARD LVCMOS18 [get_ports ADC_SDATA]
set_property IOSTANDARD LVCMOS18 [get_ports ADC_SEN0]
set_property IOSTANDARD LVCMOS18 [get_ports ADC_SEN1]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DC1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DC1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DCLK_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DCLK_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DD1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DD1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DD0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DD0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DC0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DC0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_FCLK_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_FCLK_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DB0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DB0_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DB1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DB1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DA1_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DA1_n]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DA0_p]
set_property IOSTANDARD LVDS [get_ports ADC_DATA2_DA0_n]

# -------------------------------------------------------------------------------------------------
# bank 48
# -------------------------------------------------------------------------------------------------

set_property PACKAGE_PIN G10 [get_ports SPI_Switch_RDBK]

set_property IOSTANDARD LVCMOS18 [get_ports SPI_Switch_RDBK]

# -------------------------------------------------------------------------------------------------
# bank 47
# -------------------------------------------------------------------------------------------------

set_property PACKAGE_PIN A15 [get_ports CLNR_GPIO0]
set_property PACKAGE_PIN B15 [get_ports SFP_TX_Fault]
set_property PACKAGE_PIN A14 [get_ports CLNR_GPIO1]
set_property PACKAGE_PIN B14 [get_ports CLNR_nRST]
set_property PACKAGE_PIN A13 [get_ports CLNR_GPIO3]
set_property PACKAGE_PIN B13 [get_ports CLNR_nINT]
set_property PACKAGE_PIN C13 [get_ports SFP_ModDet]
set_property PACKAGE_PIN C14 [get_ports SFP_LOS]
set_property PACKAGE_PIN D14 [get_ports FPGA_UART_TX]
set_property PACKAGE_PIN D15 [get_ports FPGA_UART_RX]
set_property PACKAGE_PIN E15 [get_ports PMT_Switch_SDn]
set_property PACKAGE_PIN F15 [get_ports SPI_Switch_CSn]
set_property PACKAGE_PIN G14 [get_ports SPI_Switch_Clock]
set_property PACKAGE_PIN G15 [get_ports SPI_Switch_DIN]
set_property PACKAGE_PIN H13 [get_ports MEZZ_RJ45_CLK_SEL]
set_property PACKAGE_PIN H14 [get_ports CLNR_GPIO2]

set_property IOSTANDARD LVCMOS18 [get_ports CLNR_GPIO0]
set_property IOSTANDARD LVCMOS18 [get_ports SFP_TX_Fault]
set_property IOSTANDARD LVCMOS18 [get_ports CLNR_GPIO1]
set_property IOSTANDARD LVCMOS18 [get_ports CLNR_nRST]
set_property IOSTANDARD LVCMOS18 [get_ports CLNR_GPIO3]
set_property IOSTANDARD LVCMOS18 [get_ports CLNR_nINT]
set_property IOSTANDARD LVCMOS18 [get_ports SFP_ModDet]
set_property IOSTANDARD LVCMOS18 [get_ports SFP_LOS]
set_property IOSTANDARD LVCMOS18 [get_ports FPGA_UART_TX]
set_property IOSTANDARD LVCMOS18 [get_ports FPGA_UART_RX]
set_property IOSTANDARD LVCMOS18 [get_ports PMT_Switch_SDn]
set_property IOSTANDARD LVCMOS18 [get_ports SPI_Switch_CSn]
set_property IOSTANDARD LVCMOS18 [get_ports SPI_Switch_Clock]
set_property IOSTANDARD LVCMOS18 [get_ports SPI_Switch_DIN]
set_property IOSTANDARD LVCMOS18 [get_ports MEZZ_RJ45_CLK_SEL]
set_property IOSTANDARD LVCMOS18 [get_ports CLNR_GPIO2]

# -------------------------------------------------------------------------------------------------
# Termination Styles
# -------------------------------------------------------------------------------------------------

set_property DIFF_TERM_ADV TERM_100 [get_ports RJ45_LVDS_TRIG_p]

set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA1_FCLK_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA1_DD0_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA1_DC1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA1_DC0_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA1_DB1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA1_DB0_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA1_DA1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA1_DA0_p]

set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA1_DCLK_p]

set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA0_FCLK_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA0_DD1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA0_DD0_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA0_DC1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA0_DC0_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA0_DB1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA0_DB0_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA0_DA1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA0_DA0_p]

set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA0_DCLK_p]

set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA3_FCLK_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA3_DD1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA3_DC1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA3_DC0_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA3_DB1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA3_DB0_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA3_DA1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA3_DA0_p]

set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA4_FCLK_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA4_DD1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA4_DD0_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA4_DC1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA4_DC0_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA4_DB1_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA4_DB0_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports ADC_DATA1_DD1_p]

# -------------------------------------------------------------------------------------------------
# clocking
# -------------------------------------------------------------------------------------------------
#create_clock -period 2.667 -name clkin1 -add [get_ports ADC_DATA1_DCLK_p]

# -------------------------------------------------------------------------------------------------
# PS banks defined in the block design
# -------------------------------------------------------------------------------------------------
