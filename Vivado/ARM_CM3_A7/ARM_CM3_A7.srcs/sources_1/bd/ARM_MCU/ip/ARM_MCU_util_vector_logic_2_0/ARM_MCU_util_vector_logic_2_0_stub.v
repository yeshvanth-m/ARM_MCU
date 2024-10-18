// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sun Mar 24 20:04:55 2024
// Host        : Yeshvanth-Workstation running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/SW/Vivado_Projetcs/ARM_CM3_A7/ARM_CM3_A7.srcs/sources_1/bd/ARM_MCU/ip/ARM_MCU_util_vector_logic_2_0/ARM_MCU_util_vector_logic_2_0_stub.v
// Design      : ARM_MCU_util_vector_logic_2_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "util_vector_logic_v2_0_1_util_vector_logic,Vivado 2018.2" *)
module ARM_MCU_util_vector_logic_2_0(Op1, Op2, Res)
/* synthesis syn_black_box black_box_pad_pin="Op1[0:0],Op2[0:0],Res[0:0]" */;
  input [0:0]Op1;
  input [0:0]Op2;
  output [0:0]Res;
endmodule
