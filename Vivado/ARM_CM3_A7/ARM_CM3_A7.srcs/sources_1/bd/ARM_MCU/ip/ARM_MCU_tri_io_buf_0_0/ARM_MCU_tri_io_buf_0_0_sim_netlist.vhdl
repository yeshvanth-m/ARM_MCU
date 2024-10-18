-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Sun Mar 24 20:04:55 2024
-- Host        : Yeshvanth-Workstation running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/SW/Vivado_Projetcs/ARM_CM3_A7/ARM_CM3_A7.srcs/sources_1/bd/ARM_MCU/ip/ARM_MCU_tri_io_buf_0_0/ARM_MCU_tri_io_buf_0_0_sim_netlist.vhdl
-- Design      : ARM_MCU_tri_io_buf_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ARM_MCU_tri_io_buf_0_0_tri_io_buf is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 );
    io_pad : inout STD_LOGIC_VECTOR ( 0 to 0 );
    din : in STD_LOGIC_VECTOR ( 0 to 0 );
    oen_N : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ARM_MCU_tri_io_buf_0_0_tri_io_buf : entity is "tri_io_buf";
end ARM_MCU_tri_io_buf_0_0_tri_io_buf;

architecture STRUCTURE of ARM_MCU_tri_io_buf_0_0_tri_io_buf is
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \genblk1[0].IOBUF_inst\ : label is "PRIMITIVE";
begin
\genblk1[0].IOBUF_inst\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => din(0),
      IO => io_pad(0),
      O => dout(0),
      T => oen_N
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ARM_MCU_tri_io_buf_0_0 is
  port (
    din : in STD_LOGIC_VECTOR ( 0 to 0 );
    oen_N : in STD_LOGIC;
    io_pad : inout STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ARM_MCU_tri_io_buf_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ARM_MCU_tri_io_buf_0_0 : entity is "ARM_MCU_tri_io_buf_0_0,tri_io_buf,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ARM_MCU_tri_io_buf_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of ARM_MCU_tri_io_buf_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ARM_MCU_tri_io_buf_0_0 : entity is "tri_io_buf,Vivado 2018.2";
end ARM_MCU_tri_io_buf_0_0;

architecture STRUCTURE of ARM_MCU_tri_io_buf_0_0 is
begin
inst: entity work.ARM_MCU_tri_io_buf_0_0_tri_io_buf
     port map (
      din(0) => din(0),
      dout(0) => dout(0),
      io_pad(0) => io_pad(0),
      oen_N => oen_N
    );
end STRUCTURE;
