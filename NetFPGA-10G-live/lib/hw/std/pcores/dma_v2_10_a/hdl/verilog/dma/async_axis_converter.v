/*******************************************************************************
 *
 *  NetFPGA-10G http://www.netfpga.org
 *
 *  File:
 *        async_axis_converter.v
 *
 *  Library:
 *        hw/std/pcores/dma_v2_00_a
 *
 *  Module:
 *        async_axis_converter
 *
 *  Author:
 *        Gianni Antichi
 *
 *  Description:
 *        Convert AXI4-Stream Data Width from 256 to 192 
 *        and vice-versa for full bandwidth SRAM access
 *
 *  Copyright notice:
 *        Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
 *                                 Junior University
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

module async_axis_converter
#(
    // Master AXI Stream Data Width
    parameter C_M_AXIS_DATA_WIDTH=64,
    parameter C_S_AXIS_DATA_WIDTH=256,

    parameter C_M_AXIS_TUSER_WIDTH=128,
    parameter C_S_AXIS_TUSER_WIDTH=128
)
(
    // Part 1: System side signals
    // Global Ports
    input axi_aclk_160,
    input axi_aclk_250,
    input axi_resetn,

    // Master Stream Ports
    output  [C_M_AXIS_DATA_WIDTH-1:0] 		m_axis_tdata,
    output  [((C_M_AXIS_DATA_WIDTH/8))-1:0] 	m_axis_tstrb,
    output  [C_M_AXIS_TUSER_WIDTH-1:0]		m_axis_tuser,
    output reg  				m_axis_tvalid,
    input  					m_axis_tready,
    output 					m_axis_tlast,


    // Slave Stream Ports
    input [C_S_AXIS_DATA_WIDTH-1:0] 		s_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH/8))-1:0] 	s_axis_tstrb,
    input [C_S_AXIS_TUSER_WIDTH-1:0] 		s_axis_tuser,
    input  					s_axis_tvalid,
    output 					s_axis_tready,
    input  					s_axis_tlast
);

   function integer log2;
      input integer number;
      begin
         log2=0;
         while(2**log2<number) begin
            log2=log2+1;
         end
      end
   endfunction // log2


   localparam MAX_PKT_SIZE 	= 1600;
   localparam NUM_STATES 	= 2;
   localparam WAIT_PKT		= 1;
   localparam SEND_PKT		= 2;

   wire async_fifo_almost_full;
   reg 	async_fifo_rd_en;
   wire async_fifo_empty;

   reg [NUM_STATES-1:0]			state, state_next;
   
   ///////////////////////////////////////////////////////////////////////////////////////
   // Manage Rx (from card to host) and Tx side (from host to card)
   // There are 2 cases
   // 1. SLAVE_WIDER	: this is from card to host. Need Async fifo from 160Mhz to 250Mhz
   // 2. MASTER_WIDER 	: this is from host to card. Need Async fifo from 250Mhz to 160Mhz
   ///////////////////////////////////////////////////////////////////////////////////////

   generate
   
   if(C_S_AXIS_DATA_WIDTH > C_M_AXIS_DATA_WIDTH) begin: SLAVE_WIDER

   	wire [C_S_AXIS_DATA_WIDTH-1:0]       	tdata_fifo;
   	wire [(C_S_AXIS_DATA_WIDTH/8)-1:0]   	tstrb_fifo;
   	wire                                 	tlast_fifo;
   	wire [C_S_AXIS_TUSER_WIDTH-1:0]		tuser_fifo;
	wire					tvalid_wire;

   	reg  converter_tvalid;
   	wire converter_tready;


   	async_data_fifo_fwft
		async_data_fifo_fwft
	(
        	.rst(~axi_resetn),
                .wr_clk(axi_aclk_160),
                .rd_clk(axi_aclk_250),
                .din({s_axis_tdata,s_axis_tstrb,s_axis_tuser,s_axis_tlast}),
                .wr_en(s_axis_tvalid & ~async_fifo_almost_full),
                .rd_en(async_fifo_rd_en),
                .dout({tdata_fifo,tstrb_fifo,tuser_fifo,tlast_fifo}),
                .full(),
		.almost_full(async_fifo_almost_full),
                .empty(async_fifo_empty)
        );

	nf10_axis_converter #(
		.C_M_AXIS_DATA_WIDTH(C_M_AXIS_DATA_WIDTH),
      		.C_S_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH)
     	) converter
    	(
    		// Global Ports
    		.axi_aclk(axi_aclk_250),
    		.axi_resetn(axi_resetn),

    		// Master Stream Ports
    		.m_axis_tdata(m_axis_tdata),
    		.m_axis_tstrb(m_axis_tstrb),
    		.m_axis_tvalid(tvalid_wire),
    		.m_axis_tready(m_axis_tready),
    		.m_axis_tlast(m_axis_tlast),
         	.m_axis_tuser(m_axis_tuser),

    		// Slave Stream Ports
    		.s_axis_tdata(tdata_fifo),
    		.s_axis_tstrb(tstrb_fifo),
    		.s_axis_tvalid(converter_tvalid),
   		.s_axis_tready(converter_tready),
    		.s_axis_tlast(tlast_fifo),
        	.s_axis_tuser(tuser_fifo)
   	);

   	assign s_axis_tready = ~async_fifo_almost_full;

	always@(*) begin
		state_next = state;
		converter_tvalid = 0;
		async_fifo_rd_en = 0;
                m_axis_tvalid = tvalid_wire;		

		case(state)

		WAIT_PKT: begin
			if(!async_fifo_empty) begin
				converter_tvalid = 1;
				if(converter_tready) begin
					async_fifo_rd_en = 1;
					state_next = SEND_PKT;
				end
			end
		end

		SEND_PKT: begin
			if(!async_fifo_empty) begin
				converter_tvalid = 1;
				if(converter_tready) begin
					async_fifo_rd_en = 1;
					if(tlast_fifo)
						state_next = WAIT_PKT;
				end
			end
		end
		endcase
	end

	always@(posedge axi_aclk_250) begin
		if(~axi_resetn)
			state <= WAIT_PKT;
		else
			state <= state_next;
	end
   end 	
   else begin: MASTER_WIDER

        wire [C_M_AXIS_DATA_WIDTH-1:0]          tdata_fifo;
        wire [(C_M_AXIS_DATA_WIDTH/8)-1:0]      tstrb_fifo;
        wire                                    tlast_fifo;
        wire [C_M_AXIS_TUSER_WIDTH-1:0]         tuser_fifo;
        wire                                    tvalid_fifo;


        async_data_fifo_fwft
                async_data_fifo_fwft
        (
                .rst(~axi_resetn),
                .wr_clk(axi_aclk_250),
                .rd_clk(axi_aclk_160),
                .din({tdata_fifo,tstrb_fifo,tuser_fifo,tlast_fifo}),
                .wr_en(tvalid_fifo & ~async_fifo_almost_full),
                .rd_en(async_fifo_rd_en),
                .dout({m_axis_tdata,m_axis_tstrb,m_axis_tuser,m_axis_tlast}),
                .full(),
                .almost_full(async_fifo_almost_full),
                .empty(async_fifo_empty)
        );

        nf10_axis_converter #(
                .C_M_AXIS_DATA_WIDTH(C_M_AXIS_DATA_WIDTH),
                .C_S_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH)
        ) converter
        (
                // Global Ports
                .axi_aclk(axi_aclk_250),
                .axi_resetn(axi_resetn),

                // Master Stream Ports
                .m_axis_tdata(tdata_fifo),
                .m_axis_tstrb(tstrb_fifo),
                .m_axis_tvalid(tvalid_fifo),
                .m_axis_tready(~async_fifo_almost_full),
                .m_axis_tlast(tlast_fifo),
                .m_axis_tuser(tuser_fifo),

                // Slave Stream Ports
                .s_axis_tdata(s_axis_tdata),
                .s_axis_tstrb(s_axis_tstrb),
                .s_axis_tvalid(s_axis_tvalid),
                .s_axis_tready(s_axis_tready),
                .s_axis_tlast(s_axis_tlast),
                .s_axis_tuser(s_axis_tuser)
        );

        always@(*) begin
                state_next = state;
                m_axis_tvalid = 0;
                async_fifo_rd_en = 0;

                case(state)

                WAIT_PKT: begin
                        if(!async_fifo_empty) begin
                                m_axis_tvalid = 1;
                                if(m_axis_tready) begin
                                        async_fifo_rd_en = 1;
                                        state_next = SEND_PKT;
                                end
                        end
                end

                SEND_PKT: begin
                        if(!async_fifo_empty) begin
                                m_axis_tvalid = 1;
                                if(m_axis_tready) begin
                                        async_fifo_rd_en = 1;
                                        if(m_axis_tlast)
                                                state_next = WAIT_PKT;
                                end
                        end
                end
                endcase
        end

        always@(posedge axi_aclk_160) begin
                if(~axi_resetn)
                        state <= WAIT_PKT;
                else
                        state <= state_next;
        end

   end
   endgenerate

endmodule
