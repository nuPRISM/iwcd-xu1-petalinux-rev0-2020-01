///////////////////////////////////////////////////////////////////////////////////////////////////
// Project          : Mercury+ XU1 Reference Design
// File description : Top Level
// File name        : system_top_PE1.vhd
// Author           : Diana Ungureanu
///////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2018 by Enclustra GmbH, Switzerland. All rights are reserved.
// Unauthorized duplication of this document, in whole or in part, by any means is prohibited
// without the prior written permission of Enclustra GmbH, Switzerland.
//
// Although Enclustra GmbH believes that the information included in this publication is correct
// as of the date of publication, Enclustra GmbH reserves the right to make changes at any time
// without notice.
//
// All information in this document may only be published by Enclustra GmbH, Switzerland.
///////////////////////////////////////////////////////////////////////////////////////////////////
// Description:
// This is a top/level file for Mercury+ XU1 Reference Design
// 
///////////////////////////////////////////////////////////////////////////////////////////////////
// File history:
// 
// Version | Date       | Author           | Remarks
// ////////////////////////////////////////////////////////////////////////////////////////////////
// 1.0     | 24.04.2016 | D. Ungureanu     | First released version
// 2.0     | 20.10.2017 | D. Ungureanu     | Consistency checks
// 3.0     | 11.06.2018 | D. Ungureanu     | Consistency checks
// 
///////////////////////////////////////////////////////////////////////////////////////////////////

module system_top (

    // LEDs
    output logic Led2_N,

    // I2C on PL side
    inout logic I2c_Scl,
    inout logic I2c_Sda,

    // Bank 64
    inout logic ADC_DATA3_DA0_p,
    inout logic ADC_DATA3_DA0_n,
    inout logic ADC_DATA3_DA1_p,
    inout logic ADC_DATA3_DA1_n,
    inout logic ADC_DATA3_DB0_p,
    inout logic ADC_DATA3_DB0_n,
    inout logic ADC_DATA3_DB1_p,
    inout logic ADC_DATA3_DB1_n,
    inout logic ADC_DATA3_DC0_p,
    inout logic ADC_DATA3_DC0_n,
    inout logic ADC_DATA3_DC1_p,
    inout logic ADC_DATA3_DC1_n,
    inout logic ADC_DATA3_DD0_p,
    inout logic ADC_DATA3_DD0_n,
    inout logic ADC_DATA3_DD1_p,
    inout logic ADC_DATA3_DD1_n,
    inout logic ADC_DATA3_DCLK_p,
    inout logic ADC_DATA3_DCLK_n,
    inout logic ADC_DATA3_FCLK_p,
    inout logic ADC_DATA3_FCLK_n,
    inout logic ADC_DATA4_DA0_p,
    inout logic ADC_DATA4_DA0_n,
    inout logic ADC_DATA4_DA1_p,
    inout logic ADC_DATA4_DA1_n,
    inout logic ADC_DATA4_DB0_p,
    inout logic ADC_DATA4_DB0_n,
    inout logic ADC_DATA4_DB1_p,
    inout logic ADC_DATA4_DB1_n,
    inout logic ADC_DATA4_DC0_p,
    inout logic ADC_DATA4_DC0_n,
    inout logic ADC_DATA4_DC1_p,
    inout logic ADC_DATA4_DC1_n,
    inout logic ADC_DATA4_DD0_p,
    inout logic ADC_DATA4_DD0_n,
    inout logic ADC_DATA4_DD1_p,
    inout logic ADC_DATA4_DD1_n,
    inout logic ADC_DATA4_DCLK_p,
    inout logic ADC_DATA4_DCLK_n,
    inout logic ADC_DATA4_FCLK_p,
    inout logic ADC_DATA4_FCLK_n,
    inout logic RJ45_LVDS_TRIG_p,
    inout logic RJ45_LVDS_TRIG_n,
    inout logic POE_LVDS_TRIG_p,
    inout logic POE_LVDS_TRIG_n,
    inout logic PMT_BOOT,
    inout logic B64_AH11_PMT_RX,
    inout logic B64_AG9_PMT_TXRX,

    // Bank 65
    inout logic ADC_DATA0_DA0_p,
    inout logic ADC_DATA0_DA0_n,
    inout logic ADC_DATA0_DA1_p,
    inout logic ADC_DATA0_DA1_n,
    inout logic ADC_DATA0_DB0_p,
    inout logic ADC_DATA0_DB0_n,
    inout logic ADC_DATA0_DB1_p,
    inout logic ADC_DATA0_DB1_n,
    inout logic ADC_DATA0_DC0_p,
    inout logic ADC_DATA0_DC0_n,
    inout logic ADC_DATA0_DC1_p,
    inout logic ADC_DATA0_DC1_n,
    inout logic ADC_DATA0_DD0_p,
    inout logic ADC_DATA0_DD0_n,
    inout logic ADC_DATA0_DD1_p,
    inout logic ADC_DATA0_DD1_n,
    inout logic ADC_DATA0_DCLK_p,
    inout logic ADC_DATA0_DCLK_n,
    inout logic ADC_DATA0_FCLK_p,
    inout logic ADC_DATA0_FCLK_n,
    inout logic ADC_DATA1_DA0_p,
    inout logic ADC_DATA1_DA0_n,
    inout logic ADC_DATA1_DA1_p,
    inout logic ADC_DATA1_DA1_n,
    inout logic ADC_DATA1_DB0_p,
    inout logic ADC_DATA1_DB0_n,
    inout logic ADC_DATA1_DB1_p,
    inout logic ADC_DATA1_DB1_n,
    inout logic ADC_DATA1_DC0_p,
    inout logic ADC_DATA1_DC0_n,
    inout logic ADC_DATA1_DC1_p,
    inout logic ADC_DATA1_DC1_n,
    inout logic ADC_DATA1_DD0_p,
    inout logic ADC_DATA1_DD0_n,
    inout logic ADC_DATA1_DD1_p,
    inout logic ADC_DATA1_DD1_n,
    inout logic ADC_DATA1_DCLK_p,
    inout logic ADC_DATA1_DCLK_n,
    inout logic ADC_DATA1_FCLK_p,
    inout logic ADC_DATA1_FCLK_n,
    inout logic LVDS_MEZZ_RJ45_CLK1_p,
    inout logic LVDS_MEZZ_RJ45_CLK1_n,

    // Bank 66
    (* mark_debug = "true" *) inout logic ADC_PDn,
    (* mark_debug = "true" *) inout logic ADC_RESET, 
    (* mark_debug = "true" *) inout logic ADC_SEN0,
    (* mark_debug = "true" *) inout logic ADC_SEN1,
    (* mark_debug = "true" *) inout logic ADC_SEN2,
    (* mark_debug = "true" *) inout logic ADC_SEN3,
    (* mark_debug = "true" *) inout logic ADC_SEN4,
    inout logic ADC_SDATA,
    inout logic ADC_SDOUT,
    inout logic ADC_SCLK,
    inout logic ADC_DATA2_DA0_p,
    inout logic ADC_DATA2_DA0_n,
    inout logic ADC_DATA2_DA1_p,
    inout logic ADC_DATA2_DA1_n,
    inout logic ADC_DATA2_DB0_p,
    inout logic ADC_DATA2_DB0_n,
    inout logic ADC_DATA2_DB1_p,
    inout logic ADC_DATA2_DB1_n,
    inout logic ADC_DATA2_DC0_p,
    inout logic ADC_DATA2_DC0_n,
    inout logic ADC_DATA2_DC1_p,
    inout logic ADC_DATA2_DC1_n,
    inout logic ADC_DATA2_DD0_p,
    inout logic ADC_DATA2_DD0_n,
    inout logic ADC_DATA2_DD1_p,
    inout logic ADC_DATA2_DD1_n,
    inout logic ADC_DATA2_DCLK_p,
    inout logic ADC_DATA2_DCLK_n,
    inout logic ADC_DATA2_FCLK_p,
    inout logic ADC_DATA2_FCLK_n,

    // Bank 48
    inout logic SPI_Switch_RDBK,

    // Bank 47
    inout logic SFP_TX_Fault,
    inout logic FPGA_UART_TX,
    inout logic FPGA_UART_RX,
    inout logic PMT_Switch_SDn,
    inout logic SPI_Switch_CSn,
    inout logic SPI_Switch_Clock,
    inout logic SPI_Switch_DIN,
    inout logic MEZZ_RJ45_CLK_SEL,
    inout logic CLNR_GPIO0,
    inout logic CLNR_GPIO1,
    inout logic CLNR_GPIO2,
    inout logic CLNR_GPIO3,
    inout logic CLNR_nRST,
    inout logic CLNR_nINT,
    inout logic SFP_ModDet,
    inout logic SFP_LOS

);

    ///////////////////////////////////////////////////////////////////////////////////////////
    // signals
    ///////////////////////////////////////////////////////////////////////////////////////////

    // XU1 signals
    logic Rst_N; initial Rst_N = 1'b1;
    logic Rst; initial Rst = 1'b0;
    logic Clk;
    logic [15 : 0] RstCnt; initial RstCnt = 16'h0000;
    logic [23 : 0] LedCount;

    // ps
    (* mark_debug = "true" *) logic [19:0] Gpio;

    // LVDS output signals
    logic RJ45_LVDS_TRIG;

    parameter ADC_DATA_WIDTH = 12;

    // b66 SERDES
    parameter B66_SERDES_WIDTH = 8;
    (* mark_debug = "true" *) logic adc_b66_sample_clock;
    logic adc_b66_serdes_locked;
    logic [8 : 0] adc_b66_serdes_setDelay [B66_SERDES_WIDTH : 0];
    logic [B66_SERDES_WIDTH-1 : 0] adc_b66_serdata_diff_p; 
    logic [B66_SERDES_WIDTH-1 : 0] adc_b66_serdata_diff_n; 
    (* mark_debug = "true" *) logic [ADC_DATA_WIDTH-1 : 0] adc_b66_par_data [B66_SERDES_WIDTH-1 : 0];

    // b65 SERDES
    parameter B65_SERDES_WIDTH = 16;
    (* mark_debug = "true" *) logic adc_b65_serdes_locked;
    logic [8 : 0] adc_b65_serdes_setDelay [B65_SERDES_WIDTH : 0];
    logic [B65_SERDES_WIDTH-1 : 0] adc_b65_serdata_diff_p;
    logic [B65_SERDES_WIDTH-1 : 0] adc_b65_serdata_diff_n;
    (* mark_debug = "true" *) logic [ADC_DATA_WIDTH-1 : 0] adc_b65_par_data [B65_SERDES_WIDTH-1 : 0];
    logic adc_b65_sample_clock;

    // b64 SERDES
    parameter B64_SERDES_WIDTH = 16; // ADC3 (DA,DB) {4}, ADC4 (!DA) {6}
    (* mark_debug = "true" *) logic adc_b64_sample_clock;
    logic adc_b64_serdes_locked;
    logic [8 : 0] adc_b64_serdes_setDelay [B64_SERDES_WIDTH : 0];
    logic [B64_SERDES_WIDTH-1 : 0] adc_b64_serdata_diff_p; 
    logic [B64_SERDES_WIDTH-1 : 0] adc_b64_serdata_diff_n; 
    (* mark_debug = "true" *) logic [ADC_DATA_WIDTH-1 : 0] adc_b64_par_data [B64_SERDES_WIDTH-1 : 0];

    // SERDES parllel data
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc0_da_pardata_j3;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc0_db_pardata_j2;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc0_dc_pardata_j1;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc0_dd_pardata_j0;

    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc1_da_pardata_j7;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc1_db_pardata_j6;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc1_dc_pardata_j5;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc1_dd_pardata_j4;

    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc2_da_pardata_j11;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc2_db_pardata_j10;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc2_dc_pardata_j9;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc2_dd_pardata_j8;

    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc3_da_pardata_j15;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc3_db_pardata_j14;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc3_dc_pardata_j13;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc3_dd_pardata_j12;

    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc4_da_pardata_j19;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc4_db_pardata_j18;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc4_dc_pardata_j17;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc4_dd_pardata_j16;

    // serial
    logic adc_ss_in;
    logic adc_ss_tri;
    logic adc_ss_out;

    ///////////////////////////////////////////////////////////////////////////////////////////
    // processor system
    ///////////////////////////////////////////////////////////////////////////////////////////

    MercuryXU1_wrapper MercuryXU1_i (
        // GPIO
        .GPIO_tri_o(Gpio),
        .pl_clk1(Clk),
        .pl_resetn0(Rst_N),

        // I2C bus
        .ps_master_i2c_scl_io(I2c_Scl),
        .ps_master_i2c_sda_io(I2c_Sda),

        // SPI 0 bus
        .ps_spi_0_io0_io(ADC_SDATA),
        .ps_spi_0_io1_io(ADC_SDOUT),
        .ps_spi_0_sck_io(ADC_SCLK),
        .emio_spi0_ss_in(1'b0),
        .emio_spi0_ss_tri(),
        .emio_spi0_ss_out(adc_ss_in)
    );
    
    ///////////////////////////////////////////////////////////////////////////////////////////
    // serial
    ///////////////////////////////////////////////////////////////////////////////////////////

    // spi (must correctly set in ps)
    assign ADC_PDn = Gpio[6];
    assign ADC_RESET = Gpio[5];
    assign ADC_SEN4 = Gpio[4] && adc_ss_in;
    assign ADC_SEN3 = Gpio[3] && adc_ss_in;
    assign ADC_SEN2 = Gpio[2] && adc_ss_in;
    assign ADC_SEN1 = Gpio[1] && adc_ss_in;
    assign ADC_SEN0 = Gpio[0] && adc_ss_in;

    ///////////////////////////////////////////////////////////////////////////////////////////
    // RJ45 Trigger
    ///////////////////////////////////////////////////////////////////////////////////////////

    IBUFDS RJ45_LVDS_TRIG_i (
  	    .O(RJ45_LVDS_TRIG),
  	    .I(RJ45_LVDS_TRIG_p),
  	    .IB(RJ45_LVDS_TRIG_n)
    );

    ///////////////////////////////////////////////////////////////////////////////////////////
    // Clock and Reset
    ///////////////////////////////////////////////////////////////////////////////////////////

    always_ff @(posedge Clk)
    begin
        if (~RstCnt == 16'h0000) 
            Rst <= 1'b0;
        else
        begin
            Rst <= 1'b1;
            RstCnt += 16'h0001;
        end
    end

    ///////////////////////////////////////////////////////////////////////////////////////////
    // Blinking LED counter & LED assignment
    ///////////////////////////////////////////////////////////////////////////////////////////

    always_ff @(posedge Clk)
    begin
        if (Rst)
            LedCount <= 24'h000000;
        else
        begin
            LedCount += 24'b1;
        end
    end

    assign Led2_N = LedCount[23] ^ Gpio[2];

    ///////////////////////////////////////////////////////////////////////////////////////////
    // Clock Management & PLLs
    ///////////////////////////////////////////////////////////////////////////////////////////

    adc_sample_clk_gen serdes_clock_b65 (
        // Clock out ports
        .clk_out1_62p5(adc_b65_sample_clock),
        .clk_out2_62p5(),

        // Status and control signals
        .reset(1'b0),
        .locked(),

        // Clock in ports
        .clk_in1_p(ADC_DATA1_DCLK_p),
        .clk_in1_n(ADC_DATA1_DCLK_n)
    );

    adc_sample_clk_gen serdes_clock_b64_b66 (
        // Clock out ports
        .clk_out1_62p5(adc_b64_sample_clock),
        .clk_out2_62p5(adc_b66_sample_clock),

        // Status and control signals
        .reset(1'b0),
        .locked(),

        // Clock in ports
        .clk_in1_p(ADC_DATA4_DCLK_p),
        .clk_in1_n(ADC_DATA4_DCLK_n)
    );

    ///////////////////////////////////////////////////////////////////////////////////////////
    // b64 Serdes inst
    ///////////////////////////////////////////////////////////////////////////////////////////

    always_comb
    begin
        for (integer i = 0; i <= B64_SERDES_WIDTH; i++)
        begin 
            adc_b64_serdes_setDelay[i] = 9'h000;
        end
    end

    assign adc_b64_serdata_diff_p = {
        ADC_DATA3_DA1_p, ADC_DATA3_DA0_p,
        ADC_DATA3_DB1_p, ADC_DATA3_DB0_p,
        ADC_DATA3_DC1_p, ADC_DATA3_DC0_p,
        ADC_DATA3_DD1_p, ADC_DATA3_DD0_p,
        ADC_DATA4_DA1_p, ADC_DATA4_DA0_p,
        ADC_DATA4_DB1_p, ADC_DATA4_DB0_p,
        ADC_DATA4_DC1_p, ADC_DATA4_DC0_p,
        ADC_DATA4_DD1_p, ADC_DATA4_DD0_p
    };

    assign adc_b64_serdata_diff_n = {
        ADC_DATA3_DA1_n, ADC_DATA3_DA0_n,
        ADC_DATA3_DB1_n, ADC_DATA3_DB0_n,
        ADC_DATA3_DC1_n, ADC_DATA3_DC0_n,
        ADC_DATA3_DD1_n, ADC_DATA3_DD0_n,
        ADC_DATA4_DA1_n, ADC_DATA4_DA0_n,
        ADC_DATA4_DB1_n, ADC_DATA4_DB0_n,
        ADC_DATA4_DC1_n, ADC_DATA4_DC0_n,
        ADC_DATA4_DD1_n, ADC_DATA4_DD0_n
    };

    Ad9229Core #(
        .N_CHANNELS_G(B64_SERDES_WIDTH)
    )
    Ad9229Core_b64 (
        // Desired sample clock
        .sampleClk(adc_b64_sample_clock),       // MMCM 62.5MHz clock, derived from DCLK
        .sampleRst(1'b0),                       // Reset, internally sync'd

        // Direct To the Chip Interface IO
        .fadcClkP_o(),
        .fadcClkN_o(),
        .fadcFrameClkP_i(ADC_DATA3_FCLK_p),     // ADC Frame Clock, frame pattern is internal
        .fadcFrameClkN_i(ADC_DATA3_FCLK_n),     // ADC Frame Clock
        .fadcDataClkP_i(ADC_DATA3_DCLK_p),      // ADC DCLK, from MMCM
        .fadcDataClkN_i(ADC_DATA3_DCLK_n),      // ADC DCLK, from MMCM
        .serDataP_i(adc_b64_serdata_diff_p),    // ADC serial data array
        .serDataN_i(adc_b64_serdata_diff_n),    // ADC serial data array

        // Parallel data out
        .parData_o(adc_b64_par_data),           // ADC parallel data vector array
        .locked_o (adc_b64_serdes_locked),      // ADC parallel data vector array

        // IDelay control
        .curDelay_o(),
        .setDelay_i(adc_b64_serdes_setDelay),   // Delay update vector array
        .setValid_i(1'b0)                       // Set delay signal
    );

    assign adc3_da_pardata_j15[1] = {adc_b64_par_data[15][11 : 6], adc_b64_par_data[14][11 : 6]};
    assign adc3_da_pardata_j15[0] = {adc_b64_par_data[15][5  : 0], adc_b64_par_data[14][5  : 0]};

    assign adc3_db_pardata_j14[1] = {adc_b64_par_data[13][11 : 6], adc_b64_par_data[12][11 : 6]};
    assign adc3_db_pardata_j14[0] = {adc_b64_par_data[13][5  : 0], adc_b64_par_data[12][5  : 0]};

    assign adc3_dc_pardata_j13[1] = {adc_b64_par_data[11][11 : 6], adc_b64_par_data[10][11 : 6]};
    assign adc3_dc_pardata_j13[0] = {adc_b64_par_data[11][5  : 0], adc_b64_par_data[10][5  : 0]};

    assign adc3_dd_pardata_j12[1] = {adc_b64_par_data[9][11 : 6], adc_b64_par_data[8][11 : 6]};
    assign adc3_dd_pardata_j12[0] = {adc_b64_par_data[9][5  : 0], adc_b64_par_data[8][5  : 0]};

    assign adc4_da_pardata_j19[1] = {adc_b64_par_data[7][11 : 6], adc_b64_par_data[6][11 : 6]};
    assign adc4_da_pardata_j19[0] = {adc_b64_par_data[7][5  : 0], adc_b64_par_data[6][5  : 0]};

    assign adc4_db_pardata_j18[1] = {adc_b64_par_data[5][11 : 6], adc_b64_par_data[4][11 : 6]};
    assign adc4_db_pardata_j18[0] = {adc_b64_par_data[5][5  : 0], adc_b64_par_data[4][5  : 0]};

    assign adc4_dc_pardata_j17[1] = {adc_b64_par_data[3][11 : 6], adc_b64_par_data[2][11 : 6]};
    assign adc4_dc_pardata_j17[0] = {adc_b64_par_data[3][5  : 0], adc_b64_par_data[2][5  : 0]};

    assign adc4_dd_pardata_j16[1] = {adc_b64_par_data[1][11 : 6], adc_b64_par_data[0][11 : 6]};
    assign adc4_dd_pardata_j16[0] = {adc_b64_par_data[1][5  : 0], adc_b64_par_data[0][5  : 0]};

    ///////////////////////////////////////////////////////////////////////////////////////////
    // b65 Serdes inst
    ///////////////////////////////////////////////////////////////////////////////////////////

    always_comb
    begin
        for (integer i = 0; i <= B65_SERDES_WIDTH; i++)
        begin 
            adc_b65_serdes_setDelay[i] = 9'h000;
        end
    end

    assign adc_b65_serdata_diff_p = {
        ADC_DATA0_DA1_p, ADC_DATA0_DA0_p,
        ADC_DATA0_DB1_p, ADC_DATA0_DB0_p,
        ADC_DATA0_DC1_p, ADC_DATA0_DC0_p,
        ADC_DATA0_DD1_p, ADC_DATA0_DD0_p,
        ADC_DATA1_DA1_p, ADC_DATA1_DA0_p,
        ADC_DATA1_DB1_p, ADC_DATA1_DB0_p,
        ADC_DATA1_DC1_p, ADC_DATA1_DC0_p,
        ADC_DATA1_DD1_p, ADC_DATA1_DD0_p
    };

    assign adc_b65_serdata_diff_n = {
        ADC_DATA0_DA1_n, ADC_DATA0_DA0_n,
        ADC_DATA0_DB1_n, ADC_DATA0_DB0_n,
        ADC_DATA0_DC1_n, ADC_DATA0_DC0_n,
        ADC_DATA0_DD1_n, ADC_DATA0_DD0_n,
        ADC_DATA1_DA1_n, ADC_DATA1_DA0_n,
        ADC_DATA1_DB1_n, ADC_DATA1_DB0_n,
        ADC_DATA1_DC1_n, ADC_DATA1_DC0_n,
        ADC_DATA1_DD1_n, ADC_DATA1_DD0_n
    };

    Ad9229Core #(
        .N_CHANNELS_G(B65_SERDES_WIDTH)
    )
    Ad9229Core_b65 (
        // Desired sample clock
        .sampleClk(adc_b65_sample_clock),       // MMCM 62.5MHz clock, derived from DCLK
        .sampleRst(1'b0),                       // Reset, internally sync'd

        // Direct To the Chip Interface IO
        .fadcClkP_o(),
        .fadcClkN_o(),
        .fadcFrameClkP_i(ADC_DATA0_FCLK_p),     // ADC Frame Clock, frame pattern is internal
        .fadcFrameClkN_i(ADC_DATA0_FCLK_n),     // ADC Frame Clock
        .fadcDataClkP_i(ADC_DATA0_DCLK_p),      // ADC DCLK, from MMCM
        .fadcDataClkN_i(ADC_DATA0_DCLK_n),      // ADC DCLK, from MMCM
        .serDataP_i(adc_b65_serdata_diff_p),    // ADC serial data array
        .serDataN_i(adc_b65_serdata_diff_n),    // ADC serial data array

        // Parallel data out
        .parData_o(adc_b65_par_data),           // ADC parallel data vector array
        .locked_o(adc_b65_serdes_locked),       // ADC parallel data vector array

        // IDelay control
        .curDelay_o(),
        .setDelay_i(adc_b65_serdes_setDelay),   // Delay update vector array
        .setValid_i(1'b0)                       // Set delay signal
    );

    assign adc0_da_pardata_j3[1] = {adc_b65_par_data[15][11 : 6], adc_b65_par_data[14][11 : 6]};
    assign adc0_da_pardata_j3[0] = {adc_b65_par_data[15][5  : 0], adc_b65_par_data[14][5  : 0]};

    assign adc0_db_pardata_j2[1] = {adc_b65_par_data[13][11 : 6], adc_b65_par_data[12][11 : 6]};
    assign adc0_db_pardata_j2[0] = {adc_b65_par_data[13][5  : 0], adc_b65_par_data[12][5  : 0]};

    assign adc0_dc_pardata_j1[1] = {adc_b65_par_data[11][11 : 6], adc_b65_par_data[10][11 : 6]};
    assign adc0_dc_pardata_j1[0] = {adc_b65_par_data[11][5  : 0], adc_b65_par_data[10][5  : 0]};

    assign adc0_dd_pardata_j0[1] = {adc_b65_par_data[9][11 : 6], adc_b65_par_data[8][11 : 6]};
    assign adc0_dd_pardata_j0[0] = {adc_b65_par_data[9][5  : 0], adc_b65_par_data[8][5  : 0]};

    assign adc1_da_pardata_j7[1] = {adc_b65_par_data[7][11 : 6], adc_b65_par_data[6][11 : 6]};
    assign adc1_da_pardata_j7[0] = {adc_b65_par_data[7][5  : 0], adc_b65_par_data[6][5  : 0]};

    assign adc1_db_pardata_j6[1] = {adc_b65_par_data[5][11 : 6], adc_b65_par_data[4][11 : 6]};
    assign adc1_db_pardata_j6[0] = {adc_b65_par_data[5][5  : 0], adc_b65_par_data[4][5  : 0]};

    assign adc1_dc_pardata_j5[1] = {adc_b65_par_data[3][11 : 6], adc_b65_par_data[2][11 : 6]};
    assign adc1_dc_pardata_j5[0] = {adc_b65_par_data[3][5  : 0], adc_b65_par_data[2][5  : 0]};

    assign adc1_dd_pardata_j4[1] = {adc_b65_par_data[1][11 : 6], adc_b65_par_data[0][11 : 6]};
    assign adc1_dd_pardata_j4[0] = {adc_b65_par_data[1][5  : 0], adc_b65_par_data[0][5  : 0]};

    ///////////////////////////////////////////////////////////////////////////////////////////
    // b66 Serdes inst
    ///////////////////////////////////////////////////////////////////////////////////////////

    always_comb
    begin
        for (integer i = 0; i <= B66_SERDES_WIDTH; i++)
        begin 
            adc_b66_serdes_setDelay[i] = 9'h000;
        end
    end

    assign adc_b66_serdata_diff_p = {
        ADC_DATA2_DA1_p, ADC_DATA2_DA0_p,
        ADC_DATA2_DB1_p, ADC_DATA2_DB0_p,
        ADC_DATA2_DC1_p, ADC_DATA2_DC0_p,
        ADC_DATA2_DD1_p, ADC_DATA2_DD0_p
    };

    assign adc_b66_serdata_diff_n = {
        ADC_DATA2_DA1_n, ADC_DATA2_DA0_n,
        ADC_DATA2_DB1_n, ADC_DATA2_DB0_n,
        ADC_DATA2_DC1_n, ADC_DATA2_DC0_n,
        ADC_DATA2_DD1_n, ADC_DATA2_DD0_n
    };

    Ad9229Core #(
        .N_CHANNELS_G(B66_SERDES_WIDTH)
    )
    Ad9229Core_b66 (
        // Desired sample clock
        .sampleClk(adc_b66_sample_clock),       // MMCM 62.5MHz clock, derived from DCLK
        .sampleRst(1'b0),                       // Reset, internally sync'd

        // Direct To the Chip Interface IO
        .fadcClkP_o(),
        .fadcClkN_o(),
        .fadcFrameClkP_i(ADC_DATA2_FCLK_p),     // ADC Frame Clock, frame pattern is internal
        .fadcFrameClkN_i(ADC_DATA2_FCLK_n),     // ADC Frame Clock
        .fadcDataClkP_i(ADC_DATA2_DCLK_p),      // ADC DCLK, from MMCM
        .fadcDataClkN_i(ADC_DATA2_DCLK_n),      // ADC DCLK, from MMCM
        .serDataP_i(adc_b66_serdata_diff_p),    // ADC serial data array
        .serDataN_i(adc_b66_serdata_diff_n),    // ADC serial data array

        // Parallel data out
        .parData_o(adc_b66_par_data),           // ADC parallel data vector array
        .locked_o(adc_b66_serdes_locked),       // ADC parallel data vector array

        // IDelay control
        .curDelay_o(),
        .setDelay_i(adc_b66_serdes_setDelay),   // Delay update vector array
        .setValid_i(1'b0)                       // Set delay signal
    );

    assign adc2_da_pardata_j11[1] = {adc_b66_par_data[7][11 : 6], adc_b66_par_data[6][11 : 6]};
    assign adc2_da_pardata_j11[0] = {adc_b66_par_data[7][5  : 0], adc_b66_par_data[6][5  : 0]};

    assign adc2_db_pardata_j10[1] = {adc_b66_par_data[5][11 : 6], adc_b66_par_data[4][11 : 6]};
    assign adc2_db_pardata_j10[0] = {adc_b66_par_data[5][5  : 0], adc_b66_par_data[4][5  : 0]};

    assign adc2_dc_pardata_j9[1] = {adc_b66_par_data[3][11 : 6], adc_b66_par_data[2][11 : 6]};
    assign adc2_dc_pardata_j9[0] = {adc_b66_par_data[3][5  : 0], adc_b66_par_data[2][5  : 0]};

    assign adc2_dd_pardata_j8[1] = {adc_b66_par_data[1][11 : 6], adc_b66_par_data[0][11 : 6]};
    assign adc2_dd_pardata_j8[0] = {adc_b66_par_data[1][5  : 0], adc_b66_par_data[0][5  : 0]};

endmodule

///////////////////////////////////////////////////////////////////////////////////////////////
// eof
///////////////////////////////////////////////////////////////////////////////////////////////
