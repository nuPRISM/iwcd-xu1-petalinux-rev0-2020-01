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
    inout logic IO_B64_AG4,
    inout logic IO_B64_AG9,
    inout logic IO_B64_AH11,
    inout logic IO_B64_AJ1,
    inout logic FPGA_SDATA,
    inout logic SEL0,
    inout logic SMA_TRIG,
    inout logic IO_B64_L11_GC_AJ7_N,
    inout logic SEL4,
    inout logic SEL3,
    inout logic ADC3_DB1_n,
    inout logic ADC3_DB1_p,
    inout logic ADC4_DC1_p,
    inout logic ADC4_DC1_n,
    inout logic ADC3_DA0_n,
    inout logic ADC3_DA0_p,
    inout logic ADC4_DD1_n,
    inout logic ADC4_DD1_p,
    inout logic ADC4_DD0_p,
    inout logic ADC4_DD0_n,
    inout logic ADC4_DC0_p,
    inout logic ADC4_DC0_n,
    inout logic ADC3_DA1_n,
    inout logic ADC3_DA1_p,
    inout logic RJ45_LVDS_TRIG_p,
    inout logic RJ45_LVDS_TRIG_n,
    inout logic ADC3_DB0_n,
    inout logic ADC3_DB0_p,
    inout logic ADC4_FCLK_p,
    inout logic ADC4_FCLK_n,
    inout logic ADC4_DB1_p,
    inout logic ADC4_DB1_n,
    inout logic ADC3_FCLK_p,
    inout logic ADC3_FCLK_n,
    inout logic ADC4_DB0_n,
    inout logic ADC4_DB0_p,
    inout logic IO_B64_L2_AG13_P,
    inout logic IO_B64_L2_AH13_N,
    inout logic UART_SEL_0,
    inout logic UART_SEL_1,
    inout logic SMA_CLK,
    inout logic UART_SEL_4,
    inout logic UART_SEL_2,
    inout logic UART_SEL_3,
    inout logic FPGA_SCLK ,
    inout logic FPGA_SDOUT,
    inout logic SEL5,
    inout logic SEL6,
    inout logic MAX10_SPARE1,
    inout logic MAX10_SPARE0,
    inout logic SEL2,
    inout logic SEL1,

    // Bank 65
    inout logic ADC3_DD1_p,
    inout logic ADC3_DD1_n,
    inout logic ADC1_DC1_n,
    inout logic ADC1_DC1_p,
    inout logic ADC4_DCLK_p,
    inout logic ADC4_DCLK_n,
    inout logic ADC1_DCLK_p,
    inout logic ADC1_DCLK_n,
    inout logic ADC0_DC1_n,
    inout logic ADC0_DC1_p,
    inout logic ADC0_DB0_p,
    inout logic ADC0_DB0_n,
    inout logic ADC0_DD1_n,
    inout logic ADC0_DD1_p,
    inout logic ADC1_DA1_p,
    inout logic ADC1_DA1_n,
    inout logic ADC1_DB0_p,
    inout logic ADC1_DB0_n,
    inout logic ADC1_DA0_p,
    inout logic ADC1_DA0_n,
    inout logic ADC0_DB1_p,
    inout logic ADC0_DB1_n,
    inout logic ADC3_DC0_p,
    inout logic ADC3_DC0_n,
    inout logic ADC0_DD0_n,
    inout logic ADC0_DD0_p,
    inout logic ADC0_DC0_p,
    inout logic ADC0_DC0_n,
    inout logic ADC0_FCLK_p,
    inout logic ADC0_FCLK_n,
    inout logic ADC0_DA0_n,
    inout logic ADC0_DA0_p,
    inout logic ADC0_DA1_n,
    inout logic ADC0_DA1_p,
    inout logic ADC3_DC1_p,
    inout logic ADC3_DC1_n,
    inout logic ADC3_DD0_p,
    inout logic ADC3_DD0_n,
    inout logic ADC4_DA1_p,
    inout logic ADC4_DA1_n,
    inout logic ADC4_DA0_n,
    inout logic ADC4_DA0_p,
    inout logic ADC1_DD0_n,
    inout logic ADC1_DD0_p,
    inout logic ADC1_DC0_p,
    inout logic ADC1_DC0_n,
    inout logic ADC1_DB1_p,
    inout logic ADC1_DB1_n,
    inout logic ADC1_FCLK_p,
    inout logic ADC1_FCLK_n,

    // Bank 66
    (* mark_debug = "true" *) inout logic ADC_SDATA,
    (* mark_debug = "true" *) inout logic ADC_SDOUT,
    (* mark_debug = "true" *) inout logic ADC_SCLK,
    (* mark_debug = "true" *) inout logic ADC_PDN,
    (* mark_debug = "true" *) inout logic ADC_RST, 
    (* mark_debug = "true" *) inout logic ADC0_SEN,
    (* mark_debug = "true" *) inout logic ADC1_SEN,
    (* mark_debug = "true" *) inout logic ADC2_SEN,
    (* mark_debug = "true" *) inout logic ADC3_SEN,
    (* mark_debug = "true" *) inout logic ADC4_SEN,
    inout logic MAX10_SPARE6,
    inout logic MAX10_SPARE7,
    inout logic ADC1_DD1_n,
    inout logic ADC1_DD1_p,
    inout logic IO_B66_L13_GC_U8_P,
    inout logic IO_B66_L13_GC_V8_N,
    inout logic IO_B66_L14_GC_Y8_N,
    inout logic IO_B66_L14_GC_Y9_P,
    inout logic IO_B66_L15_AD11_U11_P,
    inout logic IO_B66_L15_AD11_V11_N,
    inout logic IO_B66_L16_AD3_W10_N,
    inout logic IO_B66_L16_AD3_W11_P,
    inout logic IO_B66_L17_AD10_U9_P,
    inout logic IO_B66_L17_AD10_V9_N,
    inout logic IO_B66_L18_AD2_T11_P,
    inout logic IO_B66_L18_AD2_U10_N,
    inout logic IO_B66_L19_AD9_T10_N,
    inout logic IO_B66_L19_AD9_R10_P,
    inout logic MAX10_SPARE2,
    inout logic MAX10_SPARE4,
    inout logic IO_B66_L20_AD1_P10_N,
    inout logic IO_B66_L20_AD1_P11_P,
    inout logic IO_B66_L21_AD8_M12_N,
    inout logic IO_B66_L21_AD8_N12_P,
    inout logic IO_B66_L22_AD0_M10_N,
    inout logic IO_B66_L22_AD0_N10_P,
    inout logic IO_B66_L23_L11_N,
    inout logic IO_B66_L23_L12_P,
    inout logic IO_B66_L24_K10_N,
    inout logic IO_B66_L24_L10_P,
    inout logic MAX10_SPARE3,
    inout logic MAX10_SPARE5,
    inout logic MAX10_SPARE8,
    inout logic MAX10_SPARE9,
    inout logic MAX10_SPARE10,
    inout logic IO_B66_L4_AD7_V2_P,
    inout logic MAX10_SPARE13,
    inout logic MAX10_SPARE12,
    inout logic IO_B66_N11,
    inout logic IO_B66_Y10,

    // Bank 48
    inout logic ADC2_DD1_n,
    inout logic ADC2_DD1_p,
    inout logic ADC2_DD0_n,
    inout logic ADC2_DD0_p,
    inout logic ADC2_DC1_n,
    inout logic ADC2_DC1_p,
    inout logic IO_B48_L1_AD15_B11_N,
    inout logic IO_B48_L1_AD15_C12_P,
    inout logic IO_B48_L2_AD14_A11_N,
    inout logic IO_B48_L2_AD14_A12_P,
    inout logic IO_B48_L3_AD13_A10_N,
    inout logic IO_B48_L3_AD13_B10_P,
    inout logic IO_B48_L4_AD12_C11_N,
    inout logic IO_B48_L4_AD12_D11_P,
    inout logic IO_B48_L5_HDGC_D12_N,
    inout logic IO_B48_L5_HDGC_E12_P,
    inout logic IO_B48_L6_HDGC_D10_N,
    inout logic IO_B48_L6_HDGC_E10_P,
    inout logic ADC2_FCLK_n,
    inout logic ADC2_FCLK_p,
    inout logic PEO_LVDS_TRIG_n,
    inout logic PEO_LVDS_TRIG_p,
    inout logic ADC2_DC0_n,
    inout logic ADC2_DC0_p,

    // Bank 47
    inout logic ADC2_DB0_n,
    inout logic ADC2_DB0_p,
    inout logic LVDS_SMA_RJ45_CLK1_N,
    inout logic LVDS_SMA_RJ45_CLK1_P,
    inout logic IO_B47_L12_AD0_H13_N,
    inout logic IO_B47_L12_AD0_H14_P,
    inout logic IO_B47_L1_AD11_A15_N,
    inout logic IO_B47_L1_AD11_B15_P,
    inout logic IO_B47_L2_AD10_A14_N,
    inout logic IO_B47_L2_AD10_B14_P,
    inout logic IO_B47_L3_AD9_A13_N,
    inout logic IO_B47_L3_AD9_B13_P,
    inout logic IO_B47_L4_AD8_C13_N,
    inout logic IO_B47_L4_AD8_C14_P,
    inout logic ADC2_DCLK_n,
    inout logic ADC2_DCLK_p,
    inout logic IO_B47_L6_HDGC_AD6_E13_N,
    inout logic IO_B47_L6_HDGC_AD6_E14_P,
    inout logic ADC2_DA0_n,
    inout logic ADC2_DA0_p,
    inout logic ADC2_DB1_n,
    inout logic ADC2_DB1_p,
    inout logic ADC2_DA1_n,
    inout logic ADC2_DA1_p
    
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

    // b65 SERDES
    parameter B65_SERDES_WIDTH = 18; // ADC0 (All) {8}, ADC1 (!DD) {6}, ADC3 (DC) {2}, ADC4 (DA) {2}
    (* mark_debug = "true" *) logic adc_b65_serdes_locked;
    logic [8 : 0] adc_b65_serdes_setDelay [B65_SERDES_WIDTH : 0];
    logic [B65_SERDES_WIDTH-1 : 0] adc_b65_serdata_diff_p;
    logic [B65_SERDES_WIDTH-1 : 0] adc_b65_serdata_diff_n;
    (* mark_debug = "true" *) logic [ADC_DATA_WIDTH-1 : 0] adc_b65_par_data [B65_SERDES_WIDTH-1 : 0];
    logic adc_b65_sample_clock;
    logic adc_b65_mmcm_dclk_p;
    logic adc_b65_mmcm_dclk_n;
    logic adc_b65_b64_mmcm_dclk;
    logic adc_b65_b66_mmcm_dclk;

    // b64 SERDES
    parameter B64_SERDES_WIDTH = 10; // ADC3 (DA,DB) {4}, ADC4 (!DA) {6}
    (* mark_debug = "true" *) logic adc_b64_sample_clock;
    logic adc_b64_pll_dclk_p;
    logic adc_b64_pll_dclk_n;
    logic adc_b64_serdes_locked;
    logic [8 : 0] adc_b64_serdes_setDelay [B64_SERDES_WIDTH : 0];
    logic [B64_SERDES_WIDTH-1 : 0] adc_b64_serdata_diff_p; 
    logic [B64_SERDES_WIDTH-1 : 0] adc_b64_serdata_diff_n; 
    (* mark_debug = "true" *) logic [ADC_DATA_WIDTH-1 : 0] adc_b64_par_data [B64_SERDES_WIDTH-1 : 0];
    logic adc_b64_mmcm_dclk_p;
    logic adc_b64_mmcm_dclk_n;


    // SERDES parllel data
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc0_da_pardata_j4;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc0_db_pardata_j3;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc0_dc_pardata_j2;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc0_dd_pardata_j1;

    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc1_da_pardata_j8;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc1_db_pardata_j7;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc1_dc_pardata_j6;
    // signal adc1_dd_pardata    : slv12array(1 : 0);
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc3_da_pardata_j16;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc3_db_pardata_j15;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc3_dc_pardata_j14;
    // signal adc3_dd_pardata    : slv12array(1 : 0);
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc4_da_pardata_j20;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc4_db_pardata_j19;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc4_dc_pardata_j18;
    (* mark_debug = "true" *) logic [1 : 0][ADC_DATA_WIDTH-1 : 0] adc4_dd_pardata_j17;

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
        .emio_spi0_ss_out(adc_ss_in),

        // SPI 1 bus
        .ps_spi_1_io0_io(FPGA_SDATA),
        .ps_spi_1_io1_io(FPGA_SDOUT),
        .ps_spi_1_sck_io(FPGA_SCLK),
        .ps_spi_1_ss_io(SEL0)
    );
    
    ///////////////////////////////////////////////////////////////////////////////////////////
    // serial
    ///////////////////////////////////////////////////////////////////////////////////////////

    // spi (must correctly set in ps)
    assign ADC_PDN  = Gpio[6];
    assign ADC_RST  = Gpio[5];
    assign ADC4_SEN = Gpio[4] || adc_ss_in;
    assign ADC3_SEN = Gpio[3] || adc_ss_in;
    assign ADC2_SEN = Gpio[2] || adc_ss_in;
    assign ADC1_SEN = Gpio[1] || adc_ss_in;
    assign ADC0_SEN = Gpio[0] || adc_ss_in;

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

    clk_wiz_0_b65_mmcm serdes_clock_b65 (
        // Clock out ports
        .clk_out1_b65_mmcm_b64_375p0(adc_b65_b64_mmcm_dclk),
        .clk_out2_b65_mmcm_b65_375p0(adc_b65_mmcm_dclk_p),
        .clk_out3_b65_mmcm_b66_375p0(adc_b65_b66_mmcm_dclk),
        .clk_out4_b65_62p5(adc_b65_sample_clock),

        // Status and control signals
        .reset(1'b0),
        .locked(),

        // Clock in ports
        .clk_in1_p(ADC1_DCLK_p),
        .clk_in1_n(ADC1_DCLK_n)
    );

    assign adc_b65_mmcm_dclk_n = ~adc_b65_mmcm_dclk_p;

    clk_wiz_1_b64_b66_pll serdes_clock_b64 (
        // Clock out ports
        .clk_out1_pll_375p0(adc_b64_pll_dclk_p),
        .clk_out2_pll_62p5(adc_b64_sample_clock),

        // Status and control signals
        .reset(1'b0),
        .locked(),

        // Clock in ports
        .clk_in1(adc_b65_b64_mmcm_dclk)
    );

    assign adc_b64_pll_dclk_n = ~adc_b64_pll_dclk_p;

    ///////////////////////////////////////////////////////////////////////////////////////////
    // b65 Serdes inst
    ///////////////////////////////////////////////////////////////////////////////////////////

    // ADC0 (All) {8}, ADC1 (!DD) {6}, ADC3 (DC) {2}, ADC4 (DA) {2}
    always_comb
    begin
        for (integer i = 0; i <= B65_SERDES_WIDTH; i++)
        begin 
            adc_b65_serdes_setDelay[i] = 9'h000;
        end
    end

    assign adc_b65_serdata_diff_p = {
        ADC0_DA1_p, ADC0_DA0_p, ADC0_DB1_p, ADC0_DB0_p, ADC0_DC1_p, ADC0_DC0_p, ADC0_DD1_p, ADC0_DD0_p,
        ADC1_DA1_p, ADC1_DA0_p, ADC1_DB1_p, ADC1_DB0_p, ADC1_DC1_p, ADC1_DC0_p,
        ADC3_DC1_p, ADC3_DC0_p,
        ADC4_DA1_p, ADC4_DA0_p
    };

    assign adc_b65_serdata_diff_n = {
        ADC0_DA1_n, ADC0_DA0_n, ADC0_DB1_n, ADC0_DB0_n, ADC0_DC1_n, ADC0_DC0_n, ADC0_DD1_n, ADC0_DD0_n,
        ADC1_DA1_n, ADC1_DA0_n, ADC1_DB1_n, ADC1_DB0_n, ADC1_DC1_n, ADC1_DC0_n,
        ADC3_DC1_n, ADC3_DC0_n,
        ADC4_DA1_n, ADC4_DA0_n
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
        .fadcFrameClkP_i(ADC0_FCLK_p),          // ADC Frame Clock, frame pattern is internal
        .fadcFrameClkN_i(ADC0_FCLK_n),          // ADC Frame Clock
        .fadcDataClkP_i(adc_b65_mmcm_dclk_p),   // ADC DCLK, from MMCM
        .fadcDataClkN_i(adc_b65_mmcm_dclk_n),   // ADC DCLK, from MMCM
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

    assign adc0_da_pardata_j4[1] = {adc_b65_par_data[17][11 : 6], adc_b65_par_data[16][11 : 6]};
    assign adc0_da_pardata_j4[0] = {adc_b65_par_data[17][5  : 0], adc_b65_par_data[16][5  : 0]};

    assign adc0_db_pardata_j3[1] = {adc_b65_par_data[15][11 : 6], adc_b65_par_data[14][11 : 6]};
    assign adc0_db_pardata_j3[0] = {adc_b65_par_data[15][5  : 0], adc_b65_par_data[14][5  : 0]};

    assign adc0_dc_pardata_j2[1] = {adc_b65_par_data[13][11 : 6], adc_b65_par_data[12][11 : 6]};
    assign adc0_dc_pardata_j2[0] = {adc_b65_par_data[13][5  : 0], adc_b65_par_data[12][5  : 0]};

    assign adc0_dd_pardata_j1[1] = {adc_b65_par_data[11][11 : 6], adc_b65_par_data[10][11 : 6]};
    assign adc0_dd_pardata_j1[0] = {adc_b65_par_data[11][5  : 0], adc_b65_par_data[10][5  : 0]};

    assign adc1_da_pardata_j8[1] = {adc_b65_par_data[9][11 : 6], adc_b65_par_data[8][11 : 6]};
    assign adc1_da_pardata_j8[0] = {adc_b65_par_data[9][5  : 0], adc_b65_par_data[8][5  : 0]};

    assign adc1_db_pardata_j7[1] = {adc_b65_par_data[7][11 : 6], adc_b65_par_data[6][11 : 6]};
    assign adc1_db_pardata_j7[0] = {adc_b65_par_data[7][5  : 0], adc_b65_par_data[6][5  : 0]};

    assign adc1_dc_pardata_j6[1] = {adc_b65_par_data[5][11 : 6], adc_b65_par_data[4][11 : 6]};
    assign adc1_dc_pardata_j6[0] = {adc_b65_par_data[5][5  : 0], adc_b65_par_data[4][5  : 0]};

    assign adc3_dc_pardata_j14[1] = {adc_b65_par_data[3][11 : 6], adc_b65_par_data[2][11 : 6]};
    assign adc3_dc_pardata_j14[0] = {adc_b65_par_data[3][5  : 0], adc_b65_par_data[2][5  : 0]};

    assign adc4_da_pardata_j20[1] = {adc_b65_par_data[1][11 : 6], adc_b65_par_data[0][11 : 6]};
    assign adc4_da_pardata_j20[0] = {adc_b65_par_data[1][5  : 0], adc_b65_par_data[0][5  : 0]};

    ///////////////////////////////////////////////////////////////////////////////////////////
    // b64 Serdes inst
    ///////////////////////////////////////////////////////////////////////////////////////////

    // ADC3 (DA,DB) {4}, ADC4 (!DA) {6}
    always_comb
    begin
        for (integer i = 0; i <= B64_SERDES_WIDTH; i++)
        begin 
            adc_b64_serdes_setDelay[i] = 9'h000;
        end
    end

    assign adc_b64_serdata_diff_p = {
        ADC3_DA1_p, ADC3_DA0_p, ADC3_DB1_p, ADC3_DB0_p,
        ADC4_DB1_p, ADC4_DB0_p, ADC4_DC1_p, ADC4_DC0_p, ADC4_DD1_p, ADC4_DD0_p
    };

    assign adc_b64_serdata_diff_n = {
        ADC3_DA1_n, ADC3_DA0_n, ADC3_DB1_n, ADC3_DB0_n,
        ADC4_DB1_n, ADC4_DB0_n, ADC4_DC1_n, ADC4_DC0_n, ADC4_DD1_n, ADC4_DD0_n
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
        .fadcFrameClkP_i(ADC4_FCLK_p),          // ADC Frame Clock, frame pattern is internal
        .fadcFrameClkN_i(ADC4_FCLK_n),          // ADC Frame Clock
        .fadcDataClkP_i(adc_b64_pll_dclk_p),    // ADC DCLK, from MMCM
        .fadcDataClkN_i(adc_b64_pll_dclk_n),    // ADC DCLK, from MMCM
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
   
    assign adc3_da_pardata_j16[1] = {adc_b64_par_data[9][11 : 6], adc_b64_par_data[8][11 : 6]};
    assign adc3_da_pardata_j16[0] = {adc_b64_par_data[9][5  : 0], adc_b64_par_data[8][5  : 0]};

    assign adc3_db_pardata_j15[1] = {adc_b64_par_data[7][11 : 6], adc_b64_par_data[6][11 : 6]};
    assign adc3_db_pardata_j15[0] = {adc_b64_par_data[7][5  : 0], adc_b64_par_data[6][5  : 0]};

    assign adc4_db_pardata_j19[1] = {adc_b64_par_data[5][11 : 6], adc_b64_par_data[4][11 : 6]};
    assign adc4_db_pardata_j19[0] = {adc_b64_par_data[5][5  : 0], adc_b64_par_data[4][5  : 0]};

    assign adc4_dc_pardata_j18[1] = {adc_b64_par_data[3][11 : 6], adc_b64_par_data[2][11 : 6]};
    assign adc4_dc_pardata_j18[0] = {adc_b64_par_data[3][5  : 0], adc_b64_par_data[2][5  : 0]};

    assign adc4_dd_pardata_j17[1] = {adc_b64_par_data[1][11 : 6], adc_b64_par_data[0][11 : 6]};
    assign adc4_dd_pardata_j17[0] = {adc_b64_par_data[1][5  : 0], adc_b64_par_data[0][5  : 0]};

    
endmodule

///////////////////////////////////////////////////////////////////////////////////////////////
// eof
///////////////////////////////////////////////////////////////////////////////////////////////
