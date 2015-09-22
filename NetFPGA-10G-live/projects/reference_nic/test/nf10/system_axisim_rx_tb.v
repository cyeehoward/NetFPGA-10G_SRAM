/*******************************************************************************
*
*  NetFPGA-10G http://www.netfpga.org
*
*  File:
*        system_axisim_rx_tb.v
*
*  Project:
*        reference_nic
*
*  Module:
*        system_axisim_rx_tb
*
*  Author:
*        Jong HAN
*
*  Description:
*        System testbench for reference_nic rx path
*
*  Copyright notice:
*        Copyright (C) 2013 University of Cambridge
*
*  Licence:
*        This file is part of the NetFPGA 10G development base package.
*
*        This file is free code: you can redistribute it and/or modify it under
*        the terms of the GNU Lesser General Public License version 2.1 as
*        published by the Free Software Foundation.
*
*        This package is distributed in the hope that it will be useful, but
*        WITHOUT ANY WARRANTY; without even the implied warranty of
*        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
*        Lesser General Public License for more details.
*
*        You should have received a copy of the GNU Lesser General Public
*        License along with the NetFPGA source package.  If not, see
*        http://www.gnu.org/licenses/.
*
*/


`timescale 1 ns / 1ps

`uselib lib=unisims_ver

`include "./CY7C1515JV18.v"

// START USER CODE (Do not remove this line)

// User: Put your directives here. Code in this
//       section will not be overwritten.

// END USER CODE (Do not remove this line)

module system_axisim_tb
  (
  );
	
  // START USER CODE (Do not remove this line)
  parameter integer C_S_AXIS_DATA_WIDTH = 256,
  parameter integer C_M_AXIS_DATA_WIDTH = 256,
  parameter integer C_S_AXIS_TUSER_WIDTH = 128,
  parameter integer C_M_AXIS_TUSER_WIDTH = 128,
  parameter integer MASTERBANK_PIN_WIDTH = 3,
  // Width of AXI data bus in bytes
  parameter integer TDATA_WIDTH        = C_M_AXIS_DATA_WIDTH/8,
  parameter integer CROPPED_TDATA_WIDTH        = (((C_M_AXIS_DATA_WIDTH/8) > 24) ? 24 : (C_M_AXIS_DATA_WIDTH/8)),
  // Width of TUSER in bits
  parameter integer TUSER_WIDTH        = C_M_AXIS_TUSER_WIDTH,
  parameter integer NUM_QUEUES         = 4,
  parameter integer QUEUE_ID_WIDTH     = 2,
  parameter integer NUM_MEM_CHIPS      = 3,
  parameter integer NUM_MEM_regS     = 6,
  parameter integer MEM_WIDTH          = 36,
  parameter integer MEM_ADDR_WIDTH     = 19,
  parameter integer MEM_CQ_WIDTH       = 1,
  parameter integer MEM_CLK_WIDTH      = 1,
  parameter integer MEM_BW_WIDTH       = 4,
  parameter integer TID_WIDTH          = 4, 
  parameter integer TDEST_WIDTH        = 4,
  parameter integer NUM_MEMORY_CHIPS   = 3
  // User: Put your signals here. Code in this
  //       section will not be overwritten.
  integer             i;

  // END USER CODE (Do not remove this line)

  reg RESET;
  wire RS232_Uart_1_sout;
  reg RS232_Uart_1_sin;
  reg CLK;
  reg refclk_A_p;
  reg refclk_A_n;
  reg refclk_B_p;
  reg refclk_B_n;
  reg refclk_C_p;
  reg refclk_C_n;
  reg refclk_D_p;
  reg refclk_D_n;
  wire MDC;
  wire MDIO;
  wire PHY_RST_N;
  
	reg [(MEM_WIDTH)-1:0]  qdr_q_0,
    reg [MEM_CQ_WIDTH-1:0]    qdr_cq_0,
    reg [MEM_CQ_WIDTH-1:0]    qdr_cq_n_0,
    wire [MEM_CLK_WIDTH-1:0]  qdr_c_0,
    wire [MEM_CLK_WIDTH-1:0]  qdr_c_n_0,
    wire             qdr_dll_off_n_0,
    wire [MEM_CLK_WIDTH-1:0]  qdr_k_0,
    wire [MEM_CLK_WIDTH-1:0]  qdr_k_n_0,
    wire [MEM_ADDR_WIDTH-1:0] qdr_sa_0,
    wire [(MEM_BW_WIDTH)-1:0]   qdr_bw_n_0,
    wire             qdr_w_n_0,
    wire [(MEM_WIDTH)-1:0]  qdr_d_0,
    wire             qdr_r_n_0,

    reg [(MEM_WIDTH)-1:0]  qdr_q_1,
    reg [MEM_CQ_WIDTH-1:0]    qdr_cq_1,
    reg [MEM_CQ_WIDTH-1:0]    qdr_cq_n_1,
    wire [MEM_CLK_WIDTH-1:0]  qdr_c_1,
    wire [MEM_CLK_WIDTH-1:0]  qdr_c_n_1,
    wire             qdr_dll_off_n_1,
    wire [MEM_CLK_WIDTH-1:0]  qdr_k_1,
    wire [MEM_CLK_WIDTH-1:0]  qdr_k_n_1,
    wire [MEM_ADDR_WIDTH-1:0] qdr_sa_1,
    wire [(MEM_BW_WIDTH)-1:0]   qdr_bw_n_1,
    wire             qdr_w_n_1,
    wire [(MEM_WIDTH)-1:0]  qdr_d_1,
    wire             qdr_r_n_1,

    reg [(MEM_WIDTH)-1:0]  qdr_q_2,
    reg [MEM_CQ_WIDTH-1:0]    qdr_cq_2,
    reg [MEM_CQ_WIDTH-1:0]    qdr_cq_n_2,
    wire [MEM_CLK_WIDTH-1:0]  qdr_c_2,
    wire [MEM_CLK_WIDTH-1:0]  qdr_c_n_2,
    wire             qdr_dll_off_n_2,
    wire [MEM_CLK_WIDTH-1:0]  qdr_k_2,
    wire [MEM_CLK_WIDTH-1:0]  qdr_k_n_2,
    wire [MEM_ADDR_WIDTH-1:0] qdr_sa_2,
    wire [(MEM_BW_WIDTH)-1:0]   qdr_bw_n_2,
    wire             qdr_w_n_2,
    wire [(MEM_WIDTH)-1:0]  qdr_d_2,
    wire             qdr_r_n_2,
	
	assign masterbank_sel_pin = {MASTERBANK_PIN_WIDTH{1'b0}};

  system_axisim
    dut (
      .RESET ( RESET ),
      .RS232_Uart_1_sout ( RS232_Uart_1_sout ),
      .RS232_Uart_1_sin ( RS232_Uart_1_sin ),
      .CLK ( CLK ),
      .refclk_A_p ( refclk_A_p ),
      .refclk_A_n ( refclk_A_n ),
      .refclk_B_p ( refclk_B_p ),
      .refclk_B_n ( refclk_B_n ),
      .refclk_C_p ( refclk_C_p ),
      .refclk_C_n ( refclk_C_n ),
      .refclk_D_p ( refclk_D_p ),
      .refclk_D_n ( refclk_D_n ),
      .MDC ( MDC ),
      .MDIO ( MDIO ),
      .PHY_RST_N (PHY_RST_N ),
	  .qdr_d_0 (qdr_d_0 ),
      .qdr_q_0 (qdr_q_0 ),
      .qdr_sa_0 (qdr_sa_0 ),
      .qdr_w_n_0 ( qdr_w_n_0 ),
      .qdr_r_n_0 ( qdr_r_n_0 ),
      .qdr_bw_n_0 ( qdr_bw_n_0 ),
      .qdr_dll_off_n_0 ( qdr_dll_off_n_0 ),
      .qdr_cq_0 (qdr_cq_0[0:0] ),
      .qdr_cq_n_0 (qdr_cq_n_0[0:0] ),
      .qdr_c_n_0 ( qdr_c_n_0[0:0] ),
      .qdr_k_n_0 ( qdr_k_n_0[0:0] ),
      .qdr_c_0 ( qdr_c_0[0:0] ),
      .qdr_k_0 ( qdr_k_0[0:0] ),
      .qdr_d_1 ( qdr_d_1 ),
      .qdr_q_1 ( qdr_q_1 ),
      .qdr_sa_1 ( qdr_sa_1 ),
      .qdr_w_n_1 ( qdr_w_n_1 ),
      .qdr_r_n_1 ( qdr_r_n_1 ),
      .qdr_bw_n_1 ( qdr_bw_n_1 ),
      .qdr_dll_off_n_1 ( qdr_dll_off_n_1 ),
      .qdr_cq_1 ( qdr_cq_1[0:0] ),
      .qdr_cq_n_1 ( qdr_cq_n_1[0:0] ),
      .qdr_c_n_1 ( qdr_c_n_1[0:0] ),
      .qdr_k_n_1 ( qdr_k_n_1[0:0] ),
      .qdr_c_1 ( qdr_c_1[0:0] ),
      .qdr_k_1 ( qdr_k_1[0:0] ),
      .qdr_d_2 ( qdr_d_2 ),
      .qdr_q_2 ( qdr_q_2 ),
      .qdr_sa_2 ( qdr_sa_2 ),
      .qdr_w_n_2 ( qdr_w_n_2 ),
      .qdr_r_n_2 ( qdr_r_n_2 ),
      .qdr_bw_n_2 ( qdr_bw_n_2 ),
      .qdr_dll_off_n_2 ( qdr_dll_off_n_2 ),
      .qdr_cq_2 ( qdr_cq_2[0:0] ),
      .qdr_cq_n_2 ( qdr_cq_n_2[0:0] ),
      .qdr_c_n_2 ( qdr_c_n_2[0:0] ),
      .qdr_k_n_2 ( qdr_k_n_2[0:0] ),
      .qdr_c_2 ( qdr_c_2[0:0] ),
      .qdr_k_2 ( qdr_k_2[0:0] ),
      .masterbank_sel_pin ( masterbank_sel_pin ),
    );


  // START USER CODE (Do not remove this line)

  // User: Put your stimulus here. Code in this
  //       section will not be overwritten.

  // Part 1: Wire connection

  // Part 2: Reset
  initial begin
      RS232_Uart_1_sin = 1'b0;
      CLK   = 1'b0;

      refclk_A_p = 1'b0;
      refclk_A_n = 1'b1;
      refclk_B_p = 1'b0;
      refclk_B_n = 1'b1;
      refclk_C_p = 1'b0;
      refclk_C_n = 1'b1;
      refclk_D_p = 1'b0;
      refclk_D_n = 1'b1;

      $display("[%t] : System Reset Asserted...", $realtime);
      RESET = 1'b0;
      for (i = 0; i < 50; i = i + 1) begin
                 @(posedge CLK);
      end
      $display("[%t] : System Reset De-asserted...", $realtime);
      RESET = 1'b1;
  end

  // Part 3: Clock
  always #5  CLK = ~CLK;      // 100MHz
  always #3.2 refclk_A_p = ~refclk_A_p; // 156.25MHz
  always #3.2 refclk_A_n = ~refclk_A_n; // 156.25MHz
  always #3.2 refclk_B_p = ~refclk_B_p; // 156.25MHz
  always #3.2 refclk_B_n = ~refclk_B_n; // 156.25MHz
  always #3.2 refclk_C_p = ~refclk_C_p; // 156.25MHz
  always #3.2 refclk_C_n = ~refclk_C_n; // 156.25MHz
  always #3.2 refclk_D_p = ~refclk_D_p; // 156.25MHz
  always #3.2 refclk_D_n = ~refclk_D_n; // 156.25MHz

  // END USER CODE (Do not remove this line)
  
  cyqdr2_b4 U0(	
				.TCK(1'b0),
				.TMS(1'b0),
				.TDI(1'b0),
				.TDO( ),
				.D(qdr_d_0), 
				.Q(qdr_q_0), 
				.A(qdr_sa_0), 
				.K(qdr_k_0), 
				.Kb(qdr_k_n_0), 
				.C(qdr_c_0), 
				.Cb(qdr_c_n_0), 
				.RPSb(qdr_r_n_0), 
				.WPSb(qdr_w_n_0), 
				.BWS0b(qdr_bw_n_0[0]), 
				.BWS1b(qdr_bw_n_0[1]),
				.BWS2b(qdr_bw_n_0[2]),
				.BWS3b(qdr_bw_n_0[3]),
				.CQ(qdr_cq_0), 
				.CQb(qdr_cq_n_0),
				.ZQ(1'b0),
				.DOFF(1'b0)
				);
  cyqdr2_b4 U1(	
				.TCK(1'b0),
				.TMS(1'b0),
				.TDI(1'b0),
				.TDO( ),
				.D(qdr_d_1), 
				.Q(qdr_q_1), 
				.A(qdr_sa_1), 
				.K(qdr_k_1), 
				.Kb(qdr_k_n_1), 
				.C(qdr_c_1), 
				.Cb(qdr_c_n_1), 
				.RPSb(qdr_r_n_1), 
				.WPSb(qdr_w_n_1), 
				.BWS0b(qdr_bw_n_1[0]), 
				.BWS1b(qdr_bw_n_1[1]),
				.BWS2b(qdr_bw_n_1[2]),
				.BWS3b(qdr_bw_n_1[3]),
				.CQ(qdr_cq_1), 
				.CQb(qdr_cq_n_1),
				.ZQ(1'b0),
				.DOFF(1'b0)
				);
  cyqdr2_b4 U1(	
				.TCK(1'b0),
				.TMS(1'b0),
				.TDI(1'b0),
				.TDO( ),
				.D(qdr_d_2), 
				.Q(qdr_q_2), 
				.A(qdr_sa_2), 
				.K(qdr_k_2), 
				.Kb(qdr_k_n_2), 
				.C(qdr_c_2), 
				.Cb(qdr_c_n_2), 
				.RPSb(qdr_r_n_2), 
				.WPSb(qdr_w_n_2), 
				.BWS0b(qdr_bw_n_2[0]), 
				.BWS1b(qdr_bw_n_2[1]),
				.BWS2b(qdr_bw_n_2[2]),
				.BWS3b(qdr_bw_n_2[3]),
				.CQ(qdr_cq_2), 
				.CQb(qdr_cq_n_2),
				.ZQ(1'b0),
				.DOFF(1'b0)
				);

endmodule

