/*
################################################################################
#
#  NetFPGA-10G http://www.netfpga.org
#
#  File:
#        sram_process_table.v 
#
#  Author:
#        root
#
#  Description:
#        sram_process_table's Verilog Top Module File
#
#  Copyright notice:
#        Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
#                                 Junior University
#
#  Licence:
#        This file is part of the NetFPGA 10G development base package.
#
#        This file is free code: you can redistribute it and/or modify it under
#        the terms of the GNU Lesser General Public License version 2.1 as
#        published by the Free Software Foundation.
#
#        This package is distributed in the hope that it will be useful, but
#        WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#        Lesser General Public License for more details.
#
#        You should have received a copy of the GNU Lesser General Public
#        License along with the NetFPGA source package.  If not, see
#        http://www.gnu.org/licenses/.
#
#
*/
//`define SIM
//`define SIM_QDR
module sram_process_table
#(
    // Master AXI Stream Data Width
    parameter C_M_AXIS_DATA_WIDTH=256,
    parameter C_S_AXIS_DATA_WIDTH=256,
    parameter C_M_AXIS_TUSER_WIDTH=128,
    parameter C_S_AXIS_TUSER_WIDTH=128,
    parameter C_S_AXI_DATA_WIDTH=32,
    parameter C_S_AXI_ADDR_WIDTH=32,
    parameter C_USE_WSTRB=0,
    parameter C_DPHASE_TIMEOUT=0,
    parameter C_BASEADDR=32'hFFFFFFFF,
    parameter C_HIGHADDR=32'h00000000,
    parameter C_S_AXI_ACLK_FREQ_HZ=100,
	parameter integer MASTERBANK_PIN_WIDTH = 3,
	// Width of AXI data bus in bytes
	parameter integer TDATA_WIDTH        = C_M_AXIS_DATA_WIDTH/8,
	parameter integer CROPPED_TDATA_WIDTH        = (((C_M_AXIS_DATA_WIDTH/8) > 24) ? 24 : (C_M_AXIS_DATA_WIDTH/8)),
	// Width of TUSER in bits
	parameter integer TUSER_WIDTH        = C_M_AXIS_TUSER_WIDTH,
	parameter integer NUM_QUEUES         = 4,
	parameter integer QUEUE_ID_WIDTH     = 2,
	parameter integer NUM_MEM_CHIPS      = 3,
	parameter integer NUM_MEM_INPUTS     = 6,
	parameter integer MEM_WIDTH          = 36,
	parameter integer MEM_ADDR_WIDTH     = 19,
	parameter integer MEM_CQ_WIDTH       = 1,
	parameter integer MEM_CLK_WIDTH      = 1,
	parameter integer MEM_BW_WIDTH       = 4,
	parameter integer TID_WIDTH          = 4, 
	parameter integer TDEST_WIDTH        = 4,
	parameter integer NUM_MEMORY_CHIPS   = 3
)
(
	input                           memclk,
    input                           memclk_270,
    input                           memclk_200,
	
    // Master Stream Ports (interface to data path downstream)
    output [C_M_AXIS_DATA_WIDTH - 1:0]         m_axis_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tstrb,
    output [C_M_AXIS_TUSER_WIDTH-1:0]          m_axis_tuser,
    output                                     m_axis_tvalid,
    input                                      m_axis_tready,
    output                                     m_axis_tlast,

    // Slave Stream Ports (interface to data path upstream)
    input [C_S_AXIS_DATA_WIDTH - 1:0]          s_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0]  s_axis_tstrb,
    input [C_S_AXIS_TUSER_WIDTH-1:0]           s_axis_tuser,
    input                                      s_axis_tvalid,
    output                                     s_axis_tready,
    input                                      s_axis_tlast,

    // AXI Lite control/status interface
    input                                      s_axi_aclk,
    input                                      s_axi_aresetn,
    input  [C_S_AXI_ADDR_WIDTH-1:0]            s_axi_awaddr,
    input                                      s_axi_awvalid,
    output                                     s_axi_awready,
    input  [C_S_AXI_DATA_WIDTH-1:0]            s_axi_wdata,
    input  [((C_S_AXI_DATA_WIDTH / 8)) - 1:0]  s_axi_wstrb,
    input                                      s_axi_wvalid,
    output                                     s_axi_wready,
    output [1:0]                               s_axi_bresp,
    output                                     s_axi_bvalid,
    input                                      s_axi_bready,
    input  [C_S_AXI_ADDR_WIDTH-1:0]            s_axi_araddr,
    input                                      s_axi_arvalid,
    output                                     s_axi_arready,
    output [C_S_AXI_DATA_WIDTH-1:0]            s_axi_rdata,
    output [1:0]                               s_axi_rresp,
    output                                     s_axi_rvalid,
    input                                      s_axi_rready,
	
	 // memory interface
    input [(MEM_WIDTH)-1:0]  qdr_q_0,
    input [MEM_CQ_WIDTH-1:0]    qdr_cq_0,
    input [MEM_CQ_WIDTH-1:0]    qdr_cq_n_0,
    output [MEM_CLK_WIDTH-1:0]  qdr_c_0,
    output [MEM_CLK_WIDTH-1:0]  qdr_c_n_0,
    output             qdr_dll_off_n_0,
    output [MEM_CLK_WIDTH-1:0]  qdr_k_0,
    output [MEM_CLK_WIDTH-1:0]  qdr_k_n_0,
    output [MEM_ADDR_WIDTH-1:0] qdr_sa_0,
    output [(MEM_BW_WIDTH)-1:0]   qdr_bw_n_0,
    output             qdr_w_n_0,
    output [(MEM_WIDTH)-1:0]  qdr_d_0,
    output             qdr_r_n_0,

    input [(MEM_WIDTH)-1:0]  qdr_q_1,
    input [MEM_CQ_WIDTH-1:0]    qdr_cq_1,
    input [MEM_CQ_WIDTH-1:0]    qdr_cq_n_1,
    output [MEM_CLK_WIDTH-1:0]  qdr_c_1,
    output [MEM_CLK_WIDTH-1:0]  qdr_c_n_1,
    output             qdr_dll_off_n_1,
    output [MEM_CLK_WIDTH-1:0]  qdr_k_1,
    output [MEM_CLK_WIDTH-1:0]  qdr_k_n_1,
    output [MEM_ADDR_WIDTH-1:0] qdr_sa_1,
    output [(MEM_BW_WIDTH)-1:0]   qdr_bw_n_1,
    output             qdr_w_n_1,
    output [(MEM_WIDTH)-1:0]  qdr_d_1,
    output             qdr_r_n_1,

    input [(MEM_WIDTH)-1:0]  qdr_q_2,
    input [MEM_CQ_WIDTH-1:0]    qdr_cq_2,
    input [MEM_CQ_WIDTH-1:0]    qdr_cq_n_2,
    output [MEM_CLK_WIDTH-1:0]  qdr_c_2,
    output [MEM_CLK_WIDTH-1:0]  qdr_c_n_2,
    output             qdr_dll_off_n_2,
    output [MEM_CLK_WIDTH-1:0]  qdr_k_2,
    output [MEM_CLK_WIDTH-1:0]  qdr_k_n_2,
    output [MEM_ADDR_WIDTH-1:0] qdr_sa_2,
    output [(MEM_BW_WIDTH)-1:0]   qdr_bw_n_2,
    output             qdr_w_n_2,
    output [(MEM_WIDTH)-1:0]  qdr_d_2,
    output             qdr_r_n_2,

    /*synthesis syn_keep = 1 */(* S = "TRUE" *)
    input  [MASTERBANK_PIN_WIDTH-1:0]  masterbank_sel_pin,

    input		locked,

    output [(MEM_WIDTH*NUM_MEM_INPUTS-1):0] debug_mem_controller_dout,
    output [(MEM_ADDR_WIDTH-1):0]  debug_mem_controller_dout_addr,
    output debug_mem_controller_dout_ready,
    output [NUM_MEM_CHIPS-1:0] debug_calibration,
    output [63:0] mem_dbg,
    output [63:0] fifo_dbg
);

/*`ifdef SIM_QDR
    assign  qdr_c_2 = 1'b0;
    assign  qdr_c_n_2 = 1'b0;
    assign  qdr_dll_off_n_2 = 1'b0;
    assign  qdr_k_2 = 1'b0;
    assign  qdr_k_n_2 = 1'b0;
    assign  qdr_sa_2 = 19'd0;
    assign  qdr_bw_n_2 = 4'd0;
    assign  qdr_w_n_2 = 1'b0;
    assign  qdr_d_2 = 36'd0;
    assign  qdr_r_n_2 = 1'b0;
`endif*/

    wire clk = s_axi_aclk;
    wire reset = ~s_axi_aresetn;
    /****************************************************************************************************************************/
    wire [(TID_WIDTH-1):0]         	tid_in;
    wire [(TDEST_WIDTH-1):0]       	tdest_in;
    wire [(TID_WIDTH-1):0]         	tid_out;
    wire [(TDEST_WIDTH-1):0]       	tdest_out;
    /****************************************************************************************************************************/
    //memory controll signals
    wire [NUM_MEM_CHIPS*(MEM_WIDTH)-1:0]  qdr_q = {qdr_q_2,qdr_q_1,qdr_q_0};
    wire [NUM_MEM_CHIPS*MEM_CQ_WIDTH-1:0]    qdr_cq = {qdr_cq_2,qdr_cq_1,qdr_cq_0};
`ifdef SIM_QDR
    wire [NUM_MEM_CHIPS*MEM_CQ_WIDTH-1:0]    qdr_cq_n = {qdr_cq_n_1,qdr_cq_n_1,qdr_cq_n_0};//for simulation --> qdr_cq_n = {qdr_cq_n_1,qdr_cq_n_1,qdr_cq_n_0}
`else
    wire [NUM_MEM_CHIPS*MEM_CQ_WIDTH-1:0]    qdr_cq_n = {qdr_cq_n_2,qdr_cq_n_1,qdr_cq_n_0};//for simulation --> qdr_cq_n = {qdr_cq_n_1,qdr_cq_n_1,qdr_cq_n_0}
`endif
    wire [NUM_MEM_CHIPS*MEM_CLK_WIDTH-1:0]  qdr_c;
    assign qdr_c_2 = qdr_c[3*MEM_CLK_WIDTH-1:2*MEM_CLK_WIDTH];
    assign qdr_c_1 = qdr_c[2*MEM_CLK_WIDTH-1:1*MEM_CLK_WIDTH];
    assign qdr_c_0 = qdr_c[1*MEM_CLK_WIDTH-1:0];
    wire [NUM_MEM_CHIPS*MEM_CLK_WIDTH-1:0]  qdr_c_n;
    assign qdr_c_n_2 = qdr_c_n[3*MEM_CLK_WIDTH-1:2*MEM_CLK_WIDTH];
    assign qdr_c_n_1 = qdr_c_n[2*MEM_CLK_WIDTH-1:1*MEM_CLK_WIDTH];
    assign qdr_c_n_0 = qdr_c_n[1*MEM_CLK_WIDTH-1:0];
    wire [NUM_MEM_CHIPS-1:0]            qdr_dll_off_n;
    assign qdr_dll_off_n_2 = qdr_dll_off_n[2];
    assign qdr_dll_off_n_1 = qdr_dll_off_n[1];
    assign qdr_dll_off_n_0 = qdr_dll_off_n[0];
    //assign {qdr_dl_off_n_2, qdr_dl_off_n_1, qdr_dl_off_n_0} = qdr_dll_off_n;
    wire [NUM_MEM_CHIPS*MEM_CLK_WIDTH-1:0]  qdr_k;
    assign qdr_k_2 = qdr_k[3*MEM_CLK_WIDTH-1:2*MEM_CLK_WIDTH];
    assign qdr_k_1 = qdr_k[2*MEM_CLK_WIDTH-1:1*MEM_CLK_WIDTH];
    assign qdr_k_0 = qdr_k[1*MEM_CLK_WIDTH-1:0];
    wire [NUM_MEM_CHIPS*MEM_CLK_WIDTH-1:0]  qdr_k_n;
    assign qdr_k_n_2 = qdr_k_n[3*MEM_CLK_WIDTH-1:2*MEM_CLK_WIDTH];
    assign qdr_k_n_1 = qdr_k_n[2*MEM_CLK_WIDTH-1:1*MEM_CLK_WIDTH];
    assign qdr_k_n_0 = qdr_k_n[1*MEM_CLK_WIDTH-1:0];
    wire [NUM_MEM_CHIPS*MEM_ADDR_WIDTH-1:0] qdr_sa;

    assign qdr_sa_2 = qdr_sa[3*MEM_ADDR_WIDTH-1:2*MEM_ADDR_WIDTH]; 
    assign qdr_sa_1 = qdr_sa[2*MEM_ADDR_WIDTH-1:1*MEM_ADDR_WIDTH]; 
    assign qdr_sa_0 = qdr_sa[1*MEM_ADDR_WIDTH-1:0*MEM_ADDR_WIDTH];
   
    wire [NUM_MEM_CHIPS*(MEM_BW_WIDTH)-1:0]   qdr_bw_n;
    assign qdr_bw_n_2 = qdr_bw_n[3*MEM_BW_WIDTH-1:2*MEM_BW_WIDTH];
    assign qdr_bw_n_1 = qdr_bw_n[2*MEM_BW_WIDTH-1:1*MEM_BW_WIDTH];
    assign qdr_bw_n_0 = qdr_bw_n[1*MEM_BW_WIDTH-1:0];
    wire [NUM_MEM_CHIPS-1:0]            qdr_w_n;
    assign qdr_w_n_2 = qdr_w_n[2];
    assign qdr_w_n_1 = qdr_w_n[1];
    assign qdr_w_n_0 = qdr_w_n[0];

    wire [NUM_MEM_CHIPS*(MEM_WIDTH)-1:0]  qdr_d;
    assign qdr_d_2 = qdr_d[3*MEM_WIDTH-1:2*MEM_WIDTH];
    assign qdr_d_1 = qdr_d[2*MEM_WIDTH-1:1*MEM_WIDTH];
    assign qdr_d_0 = qdr_d[1*MEM_WIDTH-1:0*MEM_WIDTH];

    wire [NUM_MEM_CHIPS-1:0]            qdr_r_n;
    assign qdr_r_n_2 = qdr_r_n[2];
    assign qdr_r_n_1 = qdr_r_n[1];
    assign qdr_r_n_0 = qdr_r_n[0];
    /***************************************************************/
    // Local wires to connect modules together
    wire 					rinc_in  , tuser_rinc_in;
    wire  					rempty_in;
    wire  					r_almost_empty_in;
    wire  					dout_valid_in;
    wire [((CROPPED_TDATA_WIDTH*8+9)-1):0] 	dout_in;
    
    wire  					tuser_rempty_in , din_inc;
    wire  					tuser_r_almost_empty_in;
    wire  					tuser_dout_valid_in;
    wire [(TUSER_WIDTH-1):0] 			tuser_dout_in;

    wire	[((CROPPED_TDATA_WIDTH*8+9)-1):0]	sum_data;
    wire	[(TUSER_WIDTH-1):0]			sum_user;
    wire						sum_data_valid , sum_user_valid;
    /***************************************************************/
    wire 		 							din_valid_out;
    wire [((CROPPED_TDATA_WIDTH*8+9)-1):0] 	din_out;
    wire 									w_almost_full_out;
    wire 	 								wfull_out;
    wire 	 								winc_out;

    wire [((CROPPED_TDATA_WIDTH*8+9)-1):0] 	mem_din;
    wire [((CROPPED_TDATA_WIDTH*8+9)-1):0] 	mem_dout;

    wire mem_dout_valid;
    wire mem_din_valid;
    wire 					 				mem_rempty;
    wire 									mem_rfull;
    wire 									mem_wfull;
    wire [(QUEUE_ID_WIDTH-1):0] mem_queue_id_read;
    wire [(QUEUE_ID_WIDTH-1):0] mem_queue_id_write;
    wire [(QUEUE_ID_WIDTH-1):0] mem_din_queue_id;
    wire [(MEM_WIDTH*NUM_MEM_INPUTS-1):0] mem_controller_din;
    wire [(MEM_ADDR_WIDTH-1):0]  mem_controller_din_addr;
    wire mem_controller_din_ready;
    wire [(MEM_WIDTH*NUM_MEM_INPUTS-1):0] mem_controller_dout;
    wire [(MEM_ADDR_WIDTH-1):0]  mem_controller_dout_addr;
    wire mem_controller_dout_ready;
    wire [NUM_MEM_CHIPS-1:0] mem_controller_din_valid , mem_controller_pre_din_valid;
    
    wire memclk_180;
    wire memreset, memreset_180, memreset_270, memreset_200;
    wire [NUM_MEM_CHIPS-1:0] next_cal_done;
    reg [NUM_MEM_CHIPS-1:0] cal_done_interm;
    reg [NUM_MEM_CHIPS-1:0] cal_done;

    wire read_burst, write_burst;

    wire [2:0] mem_controller_read_ready;
    wire [2:0] mem_controller_write_ready;

    wire [127:0] input_fifo_cnt;
    wire [127:0] output_fifo_cnt;
    wire 						output_inc;
    assign mem_dbg = 0;
    assign fifo_dbg = 0;//{output_fifo_cnt[31:0], input_fifo_cnt[31:0]};
    assign debug_calibration = cal_done;
    /*********************************************************************************************/
    wire 	[(TDATA_WIDTH-1):0] 		universal_data; 		//memory address
    wire 	[103:0] 			five_tuple_data;		//src_IP , dst_IP , src_port , dst_port , eth_protocol 
    wire					hash_read_valid , fifo_en;
    wire 	[((TDATA_WIDTH / 2)-1):0] 	data_ID; 			//2-universal hash value --> for identify the data in SRAM
    wire	[((TDATA_WIDTH/2) - 1) : 0]	packet_byte;
    wire					packet_byte_vaild;
    wire	[(NUM_MEMORY_CHIPS-1) : 0]	qdr_cal_done;
    wire	[2:0]				fifo_cal_done , fifo_rd_en;
    wire					hash_reg_sel , reg_read_start;
    wire	[18:0]				reg_read_addr;
    wire	[3:0]				r_w_ctrl_state;
    /*********************************************************************************************/

	function integer log2;
		input integer number;
		begin
			log2=0;
			while(2**log2<number) 
			begin
				log2=log2+1;
			end
		end
	endfunction // log2

	// --------- Internal Parameters ------
	localparam NUM_RW_REGS = 2;
	localparam NUM_WO_REGS = 1;
	localparam NUM_RO_REGS = 25;
	
	// ------------- Regs/ wires -----------

	wire [NUM_WO_REGS*C_S_AXI_DATA_WIDTH-1:0] wo_regs;
	wire [NUM_RW_REGS*C_S_AXI_DATA_WIDTH-1:0] rw_regs;
	wire [NUM_RO_REGS*C_S_AXI_DATA_WIDTH-1:0] ro_regs;

	wire                                            Bus2IP_Clk;
	wire                                            Bus2IP_Resetn;
	wire     [C_S_AXI_ADDR_WIDTH-1 : 0]             Bus2IP_Addr;
	wire                                            Bus2IP_CS;
	wire                                            Bus2IP_RNW;
	wire     [C_S_AXI_DATA_WIDTH-1 : 0]             Bus2IP_Data;
	wire     [C_S_AXI_DATA_WIDTH/8-1 : 0]           Bus2IP_BE;
	wire     [C_S_AXI_DATA_WIDTH-1 : 0]             IP2Bus_Data;
	wire                                            IP2Bus_RdAck;
	wire                                            IP2Bus_WrAck;
	wire                                            IP2Bus_Error;
	wire	 [1:0]					sketch_state;

	// ------------ Modules -------------

	// -- AXILITE IPIF
	axi_lite_ipif_1bar #
	(
		.C_S_AXI_DATA_WIDTH (C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH (C_S_AXI_ADDR_WIDTH),
		.C_USE_WSTRB        (C_USE_WSTRB),
		.C_DPHASE_TIMEOUT   (C_DPHASE_TIMEOUT),
		.C_BAR0_BASEADDR    (C_BASEADDR),
		.C_BAR0_HIGHADDR    (C_HIGHADDR)
	) axi_lite_ipif
	(
		.S_AXI_ACLK          ( s_axi_aclk     ),
		.S_AXI_ARESETN       ( s_axi_aresetn  ),
		.S_AXI_AWADDR        ( s_axi_awaddr   ),
		.S_AXI_AWVALID       ( s_axi_awvalid  ),
		.S_AXI_WDATA         ( s_axi_wdata    ),
		.S_AXI_WSTRB         ( s_axi_wstrb    ),
		.S_AXI_WVALID        ( s_axi_wvalid   ),
		.S_AXI_BREADY        ( s_axi_bready   ),
		.S_AXI_ARADDR        ( s_axi_araddr   ),
		.S_AXI_ARVALID       ( s_axi_arvalid  ),
		.S_AXI_RREADY        ( s_axi_rready   ),
		.S_AXI_ARREADY       ( s_axi_arready  ),
		.S_AXI_RDATA         ( s_axi_rdata    ),
		.S_AXI_RRESP         ( s_axi_rresp    ),
		.S_AXI_RVALID        ( s_axi_rvalid   ),
		.S_AXI_WREADY        ( s_axi_wready   ),
		.S_AXI_BRESP         ( s_axi_bresp    ),
		.S_AXI_BVALID        ( s_axi_bvalid   ),
		.S_AXI_AWREADY       ( s_axi_awready  ),

		// Controls to the IP/IPIF modules
		.Bus2IP_Clk          ( Bus2IP_Clk     ),
		.Bus2IP_Resetn       ( Bus2IP_Resetn  ),
		.Bus2IP_Addr         ( Bus2IP_Addr    ),
		.Bus2IP_RNW          ( Bus2IP_RNW     ),
		.Bus2IP_BE           ( Bus2IP_BE      ),
		.Bus2IP_CS           ( Bus2IP_CS      ),
		.Bus2IP_Data         ( Bus2IP_Data    ),
		.IP2Bus_Data         ( IP2Bus_Data    ),
		.IP2Bus_WrAck        ( IP2Bus_WrAck   ),
		.IP2Bus_RdAck        ( IP2Bus_RdAck   ),
		.IP2Bus_Error        ( IP2Bus_Error   )
	);

	// -- IPIF REGS
	ipif_regs #
	(
		.C_S_AXI_DATA_WIDTH (C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH (C_S_AXI_ADDR_WIDTH),
		.NUM_WO_REGS        (NUM_WO_REGS),
		.NUM_RW_REGS        (NUM_RW_REGS),
		.NUM_RO_REGS        (NUM_RO_REGS)
	) ipif_regs
	(
		.Bus2IP_Clk     ( Bus2IP_Clk     ),
		.Bus2IP_Resetn  ( Bus2IP_Resetn  ),
		.Bus2IP_Addr    ( Bus2IP_Addr    ),
		.Bus2IP_CS      ( Bus2IP_CS      ),
		.Bus2IP_RNW     ( Bus2IP_RNW     ),
		.Bus2IP_Data    ( Bus2IP_Data    ),
		.Bus2IP_BE      ( Bus2IP_BE      ),
		.IP2Bus_Data    ( IP2Bus_Data    ),
		.IP2Bus_RdAck   ( IP2Bus_RdAck   ),
		.IP2Bus_WrAck   ( IP2Bus_WrAck   ),
		.IP2Bus_Error   ( IP2Bus_Error   ),
		
		.wo_regs        ( wo_regs ),
		.rw_regs        ( rw_regs ),
		.ro_regs        ( ro_regs )
	);

	// update_reg_rw_arbiter (user_logic)
	update_reg_rw_arbiter #
	(
		.C_M_AXIS_DATA_WIDTH  (C_M_AXIS_DATA_WIDTH),
		.C_S_AXIS_DATA_WIDTH  (C_S_AXIS_DATA_WIDTH),
		.C_M_AXIS_TUSER_WIDTH (C_M_AXIS_TUSER_WIDTH),
		.C_S_AXIS_TUSER_WIDTH (C_S_AXIS_TUSER_WIDTH),

		.NUM_WO_REGS          (NUM_WO_REGS),
		.NUM_RW_REGS          (NUM_RW_REGS),
		.NUM_RO_REGS          (NUM_RO_REGS),
		.MEM_ADDR_WIDTH(MEM_ADDR_WIDTH)
	)	update_reg_rw_arbiter
	(
		// Global Ports
		.axi_aclk      (s_axi_aclk),
		.axi_aresetn   (s_axi_aresetn),
		.memclk(memclk),
		.memreset(memreset),

		// Master Stream Ports (interface to data path)
		.m_axis_tdata  (m_axis_tdata),
		.m_axis_tstrb  (m_axis_tstrb),
		.m_axis_tuser  (m_axis_tuser),
		.m_axis_tvalid (m_axis_tvalid),
		.m_axis_tready (m_axis_tready),
		.m_axis_tlast  (m_axis_tlast),

		// Slave Stream Ports (interface to RX queues)
		.s_axis_tdata  (s_axis_tdata),
		.s_axis_tstrb  (s_axis_tstrb),
		.s_axis_tuser  (s_axis_tuser),
		.s_axis_tvalid (s_axis_tvalid),
		.s_axis_tready (s_axis_tready),
		.s_axis_tlast  (s_axis_tlast),

		// Registers
		.wo_regs       (wo_regs),
		.rw_regs       (rw_regs),
		.ro_regs       (ro_regs),

		//Registers control signal
		.write_valid       ( s_axi_awvalid  ),

		//test signal
		.reg_read_data(mem_din),
		.reg_read_data_valid(mem_din_valid),
		.five_tuple_data(universal_data),
		.universal_data_valid(hash_read_valid),	
		.reg_read_addr(reg_read_addr),
		.hash_reg_sel(hash_reg_sel),
		.dout_burst_ready(mem_controller_dout_ready),
		.r_w_ctrl_state(r_w_ctrl_state),
		.reg_read_start(reg_read_start),
		.cal_done(qdr_cal_done[0] | qdr_cal_done[1] | qdr_cal_done[2]),
		.sketch_state(sketch_state),
		.din_addr(mem_controller_din_addr),
		.din_ready(mem_controller_din_ready),
		.qdr_sa(qdr_sa[(MEM_ADDR_WIDTH-1):0]),
		.qdr_r_n(qdr_r_n[1:0])
	);
	AxiToFifo #
	(
		.TDATA_WIDTH(TDATA_WIDTH),
		.CROPPED_TDATA_WIDTH(CROPPED_TDATA_WIDTH),
		.TUSER_WIDTH(TUSER_WIDTH),
		.TID_WIDTH(TID_WIDTH), 
		.TDEST_WIDTH(TDEST_WIDTH), 
		.NUM_QUEUES(NUM_QUEUES), 
		.QUEUE_ID_WIDTH(QUEUE_ID_WIDTH)
	) 
	axififo(
		.clk(clk),
		.reset(reset),
		.tvalid(s_axis_tvalid),
		.tdata(s_axis_tdata),
		.tstrb(s_axis_tstrb),
		.tlast(s_axis_tlast),
		.tid(tid_in[(TID_WIDTH-1):0]),
		.tdest(tdest_in[(TDEST_WIDTH-1):0]),
		.tuser(s_axis_tuser),
		.memclk(memclk),
		.memreset(memreset),
		//////////////////////////////////////////////////////////////////////////////////
		.tuser_rempty(tuser_rempty_in),
		.tuser_r_almost_empty(tuser_r_almost_empty_in),
		.tuser_dout_valid(tuser_dout_valid_in),
		.tuser_dout(tuser_dout_in[(TUSER_WIDTH-1):0]), 
		//////////////////////////////////////////////////////////////////////////////////
		.rinc(rinc_in),
		.rempty(rempty_in),
		.r_almost_empty(r_almost_empty_in),
		.dout_valid(dout_valid_in),
		.dout(dout_in[((8*CROPPED_TDATA_WIDTH+9)-1):0]),
		.cal_done(&cal_done),
		.output_inc(output_inc),
		.input_fifo_cnt(input_fifo_cnt[31:0])
	);
	/*********************************************************************************************/
	/*packet_collector packet_collect(
	   	.inc(rinc_in) , 
		.inc_tuser(rinc_in_tuser) , 
		.sum_tdata(sum_data) , 
		.sum_tuser(sum_user) , 
		.sum_tdata_valid(sum_data_valid) , 
		.sum_tuser_valid(sum_user_valid) , 
		.memclk(memclk) , 
		.reset(~memreset) , 
		.tuser(tuser_dout_in[(TUSER_WIDTH-1):0]) , 
		.dout_valid_tuser(tuser_dout_valid_in) , 
		.axififo_din(dout_in[((8*CROPPED_TDATA_WIDTH+9)-1):0]) , 
		.axififo_din_valid(dout_valid_in) , 
		.axififo_empty(rempty_in) , 
		.rempty_tuser(rempty_in_tuser) , 
		.axififo_mem_queue_full(0));*/
    	/*********************************************************************************************/
	test_sketch_calculate #(
		.TDATA_WIDTH(TDATA_WIDTH),
		.CROPPED_TDATA_WIDTH(CROPPED_TDATA_WIDTH),
		.TUSER_WIDTH(TUSER_WIDTH),
		.NUM_QUEUES(NUM_QUEUES), 
		.QUEUE_ID_WIDTH(QUEUE_ID_WIDTH)
	)
	test_sketch_calculate(
		.reset(memreset),
		.memclk(memclk),
		.tuser(tuser_dout_in[(TUSER_WIDTH-1):0]),//sum_user			
		.dout_valid_tuser(tuser_dout_valid_in),//sum_user_valid
		.rempty_tuser(rempty_in_tuser),
		.axififo_empty(rempty_in),	
		.axififo_din_valid(dout_valid_in),//sum_data_valid
		.axififo_din(dout_in[((8*CROPPED_TDATA_WIDTH+9)-1):0]),//sum_data
		.reg_read_addr(reg_read_addr),	
		//.axififo_mem_queue_full(mem_wfull),
		.inc(rinc_in),						//async valid
		.inc_tuser(rinc_in_tuser),				//tuser_async valid
		.universal_data_valid(hash_read_valid),				//SRAM address valid
		.packet_byte(packet_byte),				//packet length		--> 16bits
		.packet_byte_vaild(packet_byte_vaild),			//packet length vaild
		.universal_data(universal_data),			//SRAM address		--> 32bits
		.SRAM_ID(data_ID),					//2-universal hash ID  	--> 16bits
		.hash_reg_sel(hash_reg_sel),
		.five_tuple_data(five_tuple_data),			//5 tuple data for test using in reg R/W
		.reg_read_start(reg_read_start),
		.state(sketch_state)
	);
    /*********************************************************************************************/
	test_r_w_ctrl#(
		.TDATA_WIDTH(CROPPED_TDATA_WIDTH),
		.TUSER_WIDTH(TUSER_WIDTH),
		.NUM_QUEUES(NUM_QUEUES), 
		.QUEUE_ID_WIDTH(QUEUE_ID_WIDTH),
		.NUM_MEM_INPUTS(NUM_MEM_INPUTS),
		.NUM_MEM_CHIPS(NUM_MEM_CHIPS),
		.MEM_WIDTH(MEM_WIDTH),
		.MEM_ADDR_WIDTH(MEM_ADDR_WIDTH)
	) 
	test_r_w_ctrl(
		.clk(memclk),
		.reset(~memreset),
		//.read_queue_id(mem_queue_id_read),
		.read_data_queue_id(mem_din_queue_id),
		//.read_data_ready(winc_out),
		.read_data(mem_din),
		.read_data_valid(mem_din_valid),
		.read_empty(mem_rempty),
		.read_burst_state(read_burst), 
		//.write_queue_id(0), 
		.write_data({137'd15 , packet_byte , data_ID , universal_data}),
		.write_data_addr(universal_data),
		.write_data_valid(hash_read_valid & packet_byte_vaild),
		.reg_read_start(reg_read_start),
		.write_full(mem_wfull), 
		.next_write_burst_state(write_burst),
		// TODO: use standard naming scheme
		.dout(mem_controller_dout), //
		.dout_addr(mem_controller_dout_addr),//
		.dout_burst_ready(mem_controller_dout_ready),//
		`ifdef SIM
			.din(mem_controller_din), //{72'd0 , mem_controller_din[143:0]}
			.din_valid(mem_controller_din_valid),//{1'b1 , mem_controller_din_valid[1:0]}//
			.pre_din_valid(mem_controller_pre_din_valid),//{1'b1 , mem_controller_pre_din_valid[1:0]}//
			.cal_done(qdr_cal_done[0] & qdr_cal_done[1] & qdr_cal_done[2]),
		`else
			.din({72'd0 , mem_controller_din[143:0]}),
			.din_valid({1'b1 , mem_controller_din_valid[1:0]}),
			.pre_din_valid({1'b1 , mem_controller_pre_din_valid[1:0]}),
			.cal_done(qdr_cal_done[0] & qdr_cal_done[1]),
		`endif
		.din_addr(mem_controller_din_addr),
		.din_ready(mem_controller_din_ready),
		.sram_write_full(|mem_controller_write_ready),
		.sram_read_full(|mem_controller_read_ready),
		.state_init(r_w_ctrl_state),
		.nextstate_init()
	);

    localparam IODELAY_GRP = "IODELAY_MIG";
    wire idelay_ctrl_rdy;

	`ifdef SIM_QDR
		parameter sim_only = 1; 
	`else
		parameter sim_only = 0; 
	`endif
	qdrii_top 
	#(
		.ADDR_WIDTH(MEM_ADDR_WIDTH),
		.BURST_LENGTH(4),
		.BW_WIDTH(MEM_BW_WIDTH),
		.CLK_PERIOD(4000),
		//.CLK_FREQ(160),
		.CLK_WIDTH(MEM_CLK_WIDTH),
		.CQ_WIDTH(MEM_CQ_WIDTH),
		.DATA_WIDTH(MEM_WIDTH),
		.DEBUG_EN(0),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IODELAY_GRP(IODELAY_GRP),
		.MEMORY_WIDTH(36),
		.SIM_ONLY(sim_only)
	) 
	qdrii_controller_0
	(
		.clk0(memclk),
		.clk180(memclk_180),
		.clk270(memclk_270),
		.user_rst_0(memreset),
		.user_rst_180(memreset_180),
		.user_rst_270(memreset_270),
		.user_ad_w_n(~mem_controller_dout_ready),
		.user_d_w_n(~mem_controller_dout_ready),
		.user_ad_wr(mem_controller_dout_addr),
		.user_bwh_n(4'b0),//{(MEM_BW_WIDTH){~mem_controller_dout_ready}}
		.user_bwl_n(4'b0),//{(MEM_BW_WIDTH){~mem_controller_dout_ready}}
		.user_dwl(mem_controller_dout[(MEM_WIDTH-1):0]),
		.user_dwh(mem_controller_dout[((MEM_WIDTH*2)-1):MEM_WIDTH]),
		.user_r_n(~mem_controller_din_ready),
		.user_ad_rd(mem_controller_din_addr),         
		.user_wr_full(mem_controller_write_ready[0]),
		.user_rd_full(mem_controller_read_ready[0]),
		.user_qrl(mem_controller_din[(MEM_WIDTH-1):0]),
		.user_qrh(mem_controller_din[((MEM_WIDTH*2)-1):MEM_WIDTH]),
		.delay_user_qr_valid(mem_controller_din_valid[0]),
		.user_qr_valid(mem_controller_pre_din_valid[0]),
		.idelay_ctrl_rdy(idelay_ctrl_rdy),
		.qdr_q(qdr_q[((MEM_WIDTH)-1):0]), 
		.qdr_cq(qdr_cq[(MEM_CQ_WIDTH-1):0]), 
		.qdr_cq_n(qdr_cq_n[(MEM_CQ_WIDTH-1):0]), 
		.qdr_c(qdr_c[(MEM_CLK_WIDTH-1):0]),
		.qdr_c_n(qdr_c_n[(MEM_CLK_WIDTH-1):0]),
		.qdr_dll_off_n(qdr_dll_off_n[0]),
		.qdr_k(qdr_k[(MEM_CLK_WIDTH-1):0]),
		.qdr_k_n(qdr_k_n[(MEM_CLK_WIDTH-1):0]),
		.qdr_sa(qdr_sa[(MEM_ADDR_WIDTH-1):0]),
		.qdr_bw_n(qdr_bw_n[((MEM_BW_WIDTH)-1):0]),
		.qdr_w_n(qdr_w_n[0]),
		.qdr_d(qdr_d[((MEM_WIDTH)-1):0]),
		.qdr_r_n(qdr_r_n[0]),
		.cal_done(qdr_cal_done[0]),//next_cal_done[0]),
		.dbg_idel_up_all        (1'b0),
		.dbg_idel_down_all      (1'b0),
		.dbg_idel_up_q_cq       (1'b0),
		.dbg_idel_down_q_cq     (1'b0),
		.dbg_idel_up_q_cq_n     (1'b0),
		.dbg_idel_down_q_cq_n   (1'b0),
		.dbg_idel_up_cq         (1'b0),
		.dbg_idel_down_cq       (1'b0),
		.dbg_idel_up_cq_n       (1'b0),
		.dbg_idel_down_cq_n     (1'b0),
		.dbg_sel_idel_q_cq      ({MEM_CQ_WIDTH{1'b0}}),
		.dbg_sel_all_idel_q_cq  (1'b0),
		.dbg_sel_idel_q_cq_n    ({MEM_CQ_WIDTH{1'b0}}),
		.dbg_sel_all_idel_q_cq_n  (1'b0),
		.dbg_sel_idel_cq        ({MEM_CQ_WIDTH{1'b0}}),
		.dbg_sel_all_idel_cq    (1'b0),
		.dbg_sel_idel_cq_n      ({MEM_CQ_WIDTH{1'b0}}),
		.dbg_sel_all_idel_cq_n  (1'b0)
	);	
	qdrii_top 
	#(
		.ADDR_WIDTH(MEM_ADDR_WIDTH),
		.BURST_LENGTH(4),
		.BW_WIDTH(MEM_BW_WIDTH),
		.CLK_PERIOD(4000),
		//.CLK_FREQ(160),
		.CLK_WIDTH(MEM_CLK_WIDTH),
		.CQ_WIDTH(MEM_CQ_WIDTH),
		.DATA_WIDTH(MEM_WIDTH),
		.DEBUG_EN(0),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IODELAY_GRP(IODELAY_GRP),
		.MEMORY_WIDTH(36),
		.SIM_ONLY(sim_only)
	) 
	qdrii_controller_1
	(
		.clk0(memclk),
		.clk180(memclk_180),
		.clk270(memclk_270),
		.user_rst_0(memreset),
		.user_rst_180(memreset_180),
		.user_rst_270(memreset_270),
		.user_ad_w_n(~mem_controller_dout_ready),
		.user_d_w_n(~mem_controller_dout_ready),
		.user_ad_wr(mem_controller_dout_addr),
		.user_bwh_n(4'b0),//{(MEM_BW_WIDTH){~mem_controller_dout_ready}}
		.user_bwl_n(4'b0),//{(MEM_BW_WIDTH){~mem_controller_dout_ready}}
		.user_dwl(mem_controller_dout[(MEM_WIDTH*3)-1:(MEM_WIDTH*2)]),
		.user_dwh(mem_controller_dout[((MEM_WIDTH*4)-1):(MEM_WIDTH*3)]),
		.user_r_n(~mem_controller_din_ready),
		.user_ad_rd(mem_controller_din_addr),         
		.user_wr_full(mem_controller_write_ready[1]),
		.user_rd_full(mem_controller_read_ready[1]),
		.user_qrl(mem_controller_din[((MEM_WIDTH*2*1)+MEM_WIDTH-1):((MEM_WIDTH*2*1))]),
		.user_qrh(mem_controller_din[((MEM_WIDTH*2)*(1+1)-1):((MEM_WIDTH*2*1)+MEM_WIDTH)]),
		.delay_user_qr_valid(mem_controller_din_valid[1]),
		.user_qr_valid(mem_controller_pre_din_valid[1]),
		.idelay_ctrl_rdy(idelay_ctrl_rdy),
		.qdr_q(qdr_q[((MEM_WIDTH)*(1+1)-1):((MEM_WIDTH)*1)]), 
		.qdr_cq(qdr_cq[(MEM_CQ_WIDTH*(1+1)-1):(MEM_CQ_WIDTH*1)]), 
		.qdr_cq_n(qdr_cq_n[(MEM_CQ_WIDTH*(1+1)-1):(MEM_CQ_WIDTH*1)]), 
		.qdr_c(qdr_c[(MEM_CLK_WIDTH*(1+1)-1):(MEM_CLK_WIDTH*1)]),
		.qdr_c_n(qdr_c_n[(MEM_CLK_WIDTH*(1+1)-1):(MEM_CLK_WIDTH*1)]),
		.qdr_dll_off_n(qdr_dll_off_n[1]),
		.qdr_k(qdr_k[(MEM_CLK_WIDTH*(1+1)-1):(MEM_CLK_WIDTH*1)]),
		.qdr_k_n(qdr_k_n[(MEM_CLK_WIDTH*(1+1)-1):(MEM_CLK_WIDTH*1)]),
		.qdr_sa(qdr_sa[(MEM_ADDR_WIDTH*(1+1)-1):(MEM_ADDR_WIDTH*1)]),
		.qdr_bw_n(qdr_bw_n[((MEM_BW_WIDTH)*(1+1)-1):((MEM_BW_WIDTH)*1)]),
		.qdr_w_n(qdr_w_n[1]),
		.qdr_d(qdr_d[((MEM_WIDTH)*(1+1)-1):((MEM_WIDTH)*1)]),
		.qdr_r_n(qdr_r_n[1]),
		.cal_done(qdr_cal_done[1]),//next_cal_done[1]),
		.dbg_idel_up_all        (1'b0),
		.dbg_idel_down_all      (1'b0),
		.dbg_idel_up_q_cq       (1'b0),
		.dbg_idel_down_q_cq     (1'b0),
		.dbg_idel_up_q_cq_n     (1'b0),
		.dbg_idel_down_q_cq_n   (1'b0),
		.dbg_idel_up_cq         (1'b0),
		.dbg_idel_down_cq       (1'b0),
		.dbg_idel_up_cq_n       (1'b0),
		.dbg_idel_down_cq_n     (1'b0),
		.dbg_sel_idel_q_cq      ({MEM_CQ_WIDTH{1'b0}}),
		.dbg_sel_all_idel_q_cq  (1'b0),
		.dbg_sel_idel_q_cq_n    ({MEM_CQ_WIDTH{1'b0}}),
		.dbg_sel_all_idel_q_cq_n  (1'b0),
		.dbg_sel_idel_cq        ({MEM_CQ_WIDTH{1'b0}}),
		.dbg_sel_all_idel_cq    (1'b0),
		.dbg_sel_idel_cq_n      ({MEM_CQ_WIDTH{1'b0}}),
		.dbg_sel_all_idel_cq_n  (1'b0)
	);	
	/*`ifdef SIM_QDR	
	qdrii_top 
	#(
		.ADDR_WIDTH(MEM_ADDR_WIDTH),
		.BURST_LENGTH(4),
		.BW_WIDTH(MEM_BW_WIDTH),
		.CLK_PERIOD(4000),
		//.CLK_FREQ(160),
		.CLK_WIDTH(MEM_CLK_WIDTH),
		.CQ_WIDTH(MEM_CQ_WIDTH),
		.DATA_WIDTH(MEM_WIDTH),
		.DEBUG_EN(0),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IODELAY_GRP(IODELAY_GRP),
		.MEMORY_WIDTH(36),
		.SIM_ONLY(sim_only)
	) 
	qdrii_controller_2
	(
		.clk0(memclk),
		.clk180(memclk_180),
		.clk270(memclk_270),
		.user_rst_0(memreset),
		.user_rst_180(memreset_180),
		.user_rst_270(memreset_270),
		.user_ad_w_n(~mem_controller_dout_ready),
		.user_d_w_n(~mem_controller_dout_ready),
		.user_ad_wr(mem_controller_dout_addr),
		.user_bwh_n(4'b0),//{(MEM_BW_WIDTH){~mem_controller_dout_ready}}
		.user_bwl_n(4'b0),//{(MEM_BW_WIDTH){~mem_controller_dout_ready}}
		.user_dwl(mem_controller_dout[((MEM_WIDTH*5)-1):(MEM_WIDTH*4)]),
		.user_dwh(mem_controller_dout[((MEM_WIDTH*6)-1):(MEM_WIDTH*5)]),
		.user_r_n(~mem_controller_din_ready),
		.user_ad_rd(mem_controller_din_addr),         
		.user_wr_full(mem_controller_write_ready[2]),
		.user_rd_full(mem_controller_read_ready[2]),
		.user_qrl(mem_controller_din[((MEM_WIDTH*2*2)+MEM_WIDTH-1):((MEM_WIDTH*2*2))]),//mem_controller_din[179:144]
		.user_qrh(mem_controller_din[((MEM_WIDTH*2)*(2+1)-1):((MEM_WIDTH*2*2)+MEM_WIDTH)]),//mem_controller_din[215:180]
		.delay_user_qr_valid(mem_controller_din_valid[2]),
		.user_qr_valid(mem_controller_pre_din_valid[2]),
		.idelay_ctrl_rdy(idelay_ctrl_rdy),
		.qdr_q(qdr_q[((MEM_WIDTH)*(2+1)-1):((MEM_WIDTH)*2)]), 
		.qdr_cq(qdr_cq[(MEM_CQ_WIDTH*(2+1)-1):(MEM_CQ_WIDTH*2)]), 
		.qdr_cq_n(qdr_cq_n[(MEM_CQ_WIDTH*(2+1)-1):(MEM_CQ_WIDTH*2)]), 
		.qdr_c(qdr_c[(MEM_CLK_WIDTH*(2+1)-1):(MEM_CLK_WIDTH*2)]),
		.qdr_c_n(qdr_c_n[(MEM_CLK_WIDTH*(2+1)-1):(MEM_CLK_WIDTH*2)]),
		.qdr_dll_off_n(qdr_dll_off_n[2]),
		.qdr_k(qdr_k[(MEM_CLK_WIDTH*(2+1)-1):(MEM_CLK_WIDTH*2)]),
		.qdr_k_n(qdr_k_n[(MEM_CLK_WIDTH*(2+1)-1):(MEM_CLK_WIDTH*2)]),
		.qdr_sa(qdr_sa[(MEM_ADDR_WIDTH*(2+1)-1):(MEM_ADDR_WIDTH*2)]),
		.qdr_bw_n(qdr_bw_n[((MEM_BW_WIDTH)*(2+1)-1):((MEM_BW_WIDTH)*2)]),
		.qdr_w_n(qdr_w_n[2]),
		.qdr_d(qdr_d[((MEM_WIDTH)*(2+1)-1):((MEM_WIDTH)*2)]),
		.qdr_r_n(qdr_r_n[2]),
		.cal_done(qdr_cal_done[2]),//next_cal_done[2]),
		.dbg_idel_up_all        (1'b0),
		.dbg_idel_down_all      (1'b0),
		.dbg_idel_up_q_cq       (1'b0),
		.dbg_idel_down_q_cq     (1'b0),
		.dbg_idel_up_q_cq_n     (1'b0),
		.dbg_idel_down_q_cq_n   (1'b0),
		.dbg_idel_up_cq         (1'b0),
		.dbg_idel_down_cq       (1'b0),
		.dbg_idel_up_cq_n       (1'b0),
		.dbg_idel_down_cq_n     (1'b0),
		.dbg_sel_idel_q_cq      ({MEM_CQ_WIDTH{1'b0}}),
		.dbg_sel_all_idel_q_cq  (1'b0),
		.dbg_sel_idel_q_cq_n    ({MEM_CQ_WIDTH{1'b0}}),
		.dbg_sel_all_idel_q_cq_n  (1'b0),
		.dbg_sel_idel_cq        ({MEM_CQ_WIDTH{1'b0}}),
		.dbg_sel_all_idel_cq    (1'b0),
		.dbg_sel_idel_cq_n      ({MEM_CQ_WIDTH{1'b0}}),
		.dbg_sel_all_idel_cq_n  (1'b0)
	);
	`endif*/

    // TODO: re-add cal done - don't overuse with fanout - only use to get out
    // of an initial state
    always @(posedge memclk)
    begin
        if(memreset)
        begin
            cal_done_interm <= 3'b0;
        end
        else
        begin
            cal_done_interm <= 3'b111;//next_cal_done;
        end
    end

    always @(posedge clk)
    begin
        if(reset)
        begin
            cal_done <= 3'b0;
        end
        else
        begin
            cal_done <= 3'b111;//cal_done_interm;
        end
    end

	(* KEEP = "TRUE" *) wire [MASTERBANK_PIN_WIDTH-1:0] masterbank_sel_pin_out;//synthesis syn_keep = 1

	genvar dpw_i;
	generate
		for(dpw_i = 0; dpw_i < MASTERBANK_PIN_WIDTH; dpw_i=dpw_i+1)
		begin : DUMMY_INST1
			MUXCY DUMMY_INST2
			(
				.O  (masterbank_sel_pin_out[dpw_i]),
				.CI (masterbank_sel_pin[dpw_i]),
				.DI (1'b0),
				.S  (1'b1)
			);// synthesis syn_noprune = 1
		end
	endgenerate

    qdrii_infrastructure 
    u_qdrii_infrastructure
    (
		.sys_rst_n              (!reset),
		.locked                 (locked),
		.user_rst_0             (memreset),
		.user_rst_180           (memreset_180),
		.user_rst_270           (memreset_270),
		.user_rst_200           (memreset_200),
		.idelay_ctrl_rdy        (idelay_ctrl_rdy),
		.clk0                   (memclk),
		.clk180                 (memclk_180),
		.clk270                 (memclk_270),
		.clk200                 (memclk_200)
    );

    qdrii_idelay_ctrl #(.IODELAY_GRP(IODELAY_GRP)) u_qdrii_idelay_ctrl
    (
		.user_rst_200(memreset_200),
		.idelay_ctrl_rdy(idelay_ctrl_rdy),
		.clk200(memclk_200)
    );
	
endmodule
