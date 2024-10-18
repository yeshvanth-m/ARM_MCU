-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Sun Mar 24 20:04:54 2024
-- Host        : Yeshvanth-Workstation running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top ARM_MCU_util_vector_logic_5_0 -prefix
--               ARM_MCU_util_vector_logic_5_0_ ARM_MCU_util_vector_logic_4_0_sim_netlist.vhdl
-- Design      : ARM_MCU_util_vector_logic_4_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ARM_MCU_util_vector_logic_5_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ARM_MCU_util_vector_logic_5_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ARM_MCU_util_vector_logic_5_0 : entity is "ARM_MCU_util_vector_logic_4_0,util_vector_logic_v2_0_1_util_vector_logic,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ARM_MCU_util_vector_logic_5_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ARM_MCU_util_vector_logic_5_0 : entity is "util_vector_logic_v2_0_1_util_vector_logic,Vivado 2018.2";
end ARM_MCU_util_vector_logic_5_0;

architecture STRUCTURE of ARM_MCU_util_vector_logic_5_0 is
begin
\Res[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Op1(0),
      I1 => Op2(0),
      O => Res(0)
    );
end STRUCTURE;
