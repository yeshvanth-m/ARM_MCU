//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Sun Mar 24 21:57:44 2024
//Host        : Yeshvanth-Workstation running 64-bit major release  (build 9200)
//Command     : generate_target ARM_MCU_wrapper.bd
//Design      : ARM_MCU_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ARM_MCU_wrapper
   (TCK,
    TDI,
    TDO,
    TMS,
    nTRST,
    reset,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  input TCK;
  input TDI;
  inout [0:0]TDO;
  input TMS;
  input nTRST;
  input reset;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire TCK;
  wire TDI;
  wire [0:0]TDO;
  wire TMS;
  wire nTRST;
  wire reset;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  ARM_MCU ARM_MCU_i
       (.TCK(TCK),
        .TDI(TDI),
        .TDO(TDO),
        .TMS(TMS),
        .nTRST(nTRST),
        .reset(reset),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
