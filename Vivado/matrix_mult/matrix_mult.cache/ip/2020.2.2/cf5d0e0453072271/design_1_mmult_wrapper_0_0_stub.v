// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2.2 (lin64) Build 3118627 Tue Feb  9 05:13:49 MST 2021
// Date        : Fri Mar 18 22:27:23 2022
// Host        : diff.fe.up.pt running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_mmult_wrapper_0_0_stub.v
// Design      : design_1_mmult_wrapper_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sbva484-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "mmult_wrapper,Vivado 2020.2.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ap_clk, ap_rst_n, input_stream_TVALID, 
  input_stream_TREADY, input_stream_TDATA, input_stream_TDEST, input_stream_TKEEP, 
  input_stream_TSTRB, input_stream_TUSER, input_stream_TLAST, input_stream_TID, 
  output_stream_TVALID, output_stream_TREADY, output_stream_TDATA, output_stream_TDEST, 
  output_stream_TKEEP, output_stream_TSTRB, output_stream_TUSER, output_stream_TLAST, 
  output_stream_TID)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,input_stream_TVALID,input_stream_TREADY,input_stream_TDATA[31:0],input_stream_TDEST[0:0],input_stream_TKEEP[3:0],input_stream_TSTRB[3:0],input_stream_TUSER[0:0],input_stream_TLAST[0:0],input_stream_TID[0:0],output_stream_TVALID,output_stream_TREADY,output_stream_TDATA[31:0],output_stream_TDEST[0:0],output_stream_TKEEP[3:0],output_stream_TSTRB[3:0],output_stream_TUSER[0:0],output_stream_TLAST[0:0],output_stream_TID[0:0]" */;
  input ap_clk;
  input ap_rst_n;
  input input_stream_TVALID;
  output input_stream_TREADY;
  input [31:0]input_stream_TDATA;
  input [0:0]input_stream_TDEST;
  input [3:0]input_stream_TKEEP;
  input [3:0]input_stream_TSTRB;
  input [0:0]input_stream_TUSER;
  input [0:0]input_stream_TLAST;
  input [0:0]input_stream_TID;
  output output_stream_TVALID;
  input output_stream_TREADY;
  output [31:0]output_stream_TDATA;
  output [0:0]output_stream_TDEST;
  output [3:0]output_stream_TKEEP;
  output [3:0]output_stream_TSTRB;
  output [0:0]output_stream_TUSER;
  output [0:0]output_stream_TLAST;
  output [0:0]output_stream_TID;
endmodule
