// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:mmult_wrapper:1.0
// IP Revision: 2103181905

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_mmult_wrapper_0_0 (
  ap_clk,
  ap_rst_n,
  input_stream_TVALID,
  input_stream_TREADY,
  input_stream_TDATA,
  input_stream_TDEST,
  input_stream_TKEEP,
  input_stream_TSTRB,
  input_stream_TUSER,
  input_stream_TLAST,
  input_stream_TID,
  output_stream_TVALID,
  output_stream_TREADY,
  output_stream_TDATA,
  output_stream_TDEST,
  output_stream_TKEEP,
  output_stream_TSTRB,
  output_stream_TUSER,
  output_stream_TLAST,
  output_stream_TID
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF input_stream:output_stream, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_1_pl_clk0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 input_stream TVALID" *)
input wire input_stream_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 input_stream TREADY" *)
output wire input_stream_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 input_stream TDATA" *)
input wire [31 : 0] input_stream_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 input_stream TDEST" *)
input wire [0 : 0] input_stream_TDEST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 input_stream TKEEP" *)
input wire [3 : 0] input_stream_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 input_stream TSTRB" *)
input wire [3 : 0] input_stream_TSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 input_stream TUSER" *)
input wire [0 : 0] input_stream_TUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 input_stream TLAST" *)
input wire [0 : 0] input_stream_TLAST;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME input_stream, TDATA_NUM_BYTES 4, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1, LAYERED_METADATA undef, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_1_pl_clk0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 input_stream TID" *)
input wire [0 : 0] input_stream_TID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 output_stream TVALID" *)
output wire output_stream_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 output_stream TREADY" *)
input wire output_stream_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 output_stream TDATA" *)
output wire [31 : 0] output_stream_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 output_stream TDEST" *)
output wire [0 : 0] output_stream_TDEST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 output_stream TKEEP" *)
output wire [3 : 0] output_stream_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 output_stream TSTRB" *)
output wire [3 : 0] output_stream_TSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 output_stream TUSER" *)
output wire [0 : 0] output_stream_TUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 output_stream TLAST" *)
output wire [0 : 0] output_stream_TLAST;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME output_stream, TDATA_NUM_BYTES 4, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_1_pl_clk0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 output_stream TID" *)
output wire [0 : 0] output_stream_TID;

(* SDX_KERNEL = "true" *)
(* SDX_KERNEL_TYPE = "hls" *)
(* SDX_KERNEL_SIM_INST = "" *)
  mmult_wrapper inst (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .input_stream_TVALID(input_stream_TVALID),
    .input_stream_TREADY(input_stream_TREADY),
    .input_stream_TDATA(input_stream_TDATA),
    .input_stream_TDEST(input_stream_TDEST),
    .input_stream_TKEEP(input_stream_TKEEP),
    .input_stream_TSTRB(input_stream_TSTRB),
    .input_stream_TUSER(input_stream_TUSER),
    .input_stream_TLAST(input_stream_TLAST),
    .input_stream_TID(input_stream_TID),
    .output_stream_TVALID(output_stream_TVALID),
    .output_stream_TREADY(output_stream_TREADY),
    .output_stream_TDATA(output_stream_TDATA),
    .output_stream_TDEST(output_stream_TDEST),
    .output_stream_TKEEP(output_stream_TKEEP),
    .output_stream_TSTRB(output_stream_TSTRB),
    .output_stream_TUSER(output_stream_TUSER),
    .output_stream_TLAST(output_stream_TLAST),
    .output_stream_TID(output_stream_TID)
  );
endmodule
