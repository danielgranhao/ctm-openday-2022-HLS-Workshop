-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2.2 (lin64) Build 3118627 Tue Feb  9 05:13:49 MST 2021
-- Date        : Fri Mar 18 22:27:52 2022
-- Host        : diff.fe.up.pt running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/daniel/Documents/ctm_openday/Vivado/matrix_mult/matrix_mult.gen/sources_1/bd/design_1/ip/design_1_mmult_wrapper_0_0/design_1_mmult_wrapper_0_0_stub.vhdl
-- Design      : design_1_mmult_wrapper_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sbva484-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_mmult_wrapper_0_0 is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    input_stream_TVALID : in STD_LOGIC;
    input_stream_TREADY : out STD_LOGIC;
    input_stream_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    input_stream_TDEST : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_stream_TKEEP : in STD_LOGIC_VECTOR ( 3 downto 0 );
    input_stream_TSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    input_stream_TUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_stream_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_stream_TID : in STD_LOGIC_VECTOR ( 0 to 0 );
    output_stream_TVALID : out STD_LOGIC;
    output_stream_TREADY : in STD_LOGIC;
    output_stream_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    output_stream_TDEST : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_stream_TKEEP : out STD_LOGIC_VECTOR ( 3 downto 0 );
    output_stream_TSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    output_stream_TUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_stream_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_stream_TID : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end design_1_mmult_wrapper_0_0;

architecture stub of design_1_mmult_wrapper_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,input_stream_TVALID,input_stream_TREADY,input_stream_TDATA[31:0],input_stream_TDEST[0:0],input_stream_TKEEP[3:0],input_stream_TSTRB[3:0],input_stream_TUSER[0:0],input_stream_TLAST[0:0],input_stream_TID[0:0],output_stream_TVALID,output_stream_TREADY,output_stream_TDATA[31:0],output_stream_TDEST[0:0],output_stream_TKEEP[3:0],output_stream_TSTRB[3:0],output_stream_TUSER[0:0],output_stream_TLAST[0:0],output_stream_TID[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "mmult_wrapper,Vivado 2020.2.2";
begin
end;
