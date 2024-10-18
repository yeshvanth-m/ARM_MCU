// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sun Mar 24 20:04:53 2024
// Host        : Yeshvanth-Workstation running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/SW/Vivado_Projetcs/ARM_CM3_A7/ARM_CM3_A7.srcs/sources_1/bd/ARM_MCU/ip/ARM_MCU_xlconstant_1_0/ARM_MCU_xlconstant_1_0_stub.v
// Design      : ARM_MCU_xlconstant_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xlconstant_v1_1_5_xlconstant,Vivado 2018.2" *)
module ARM_MCU_xlconstant_1_0(dout)
/* synthesis syn_black_box black_box_pad_pin="dout[1:0]" */;
  output [1:0]dout;
endmodule
