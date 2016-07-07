/*
################################################################################
#
#  NetFPGA-10G http://www.netfpga.org
#
#  File:
#        update_reg_rw_arbiter.v 
#
#  Author:
#        root
#
#  Description:
#        sram_process_table's Verilog User Logic File
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
//`define TEST
//`define TEST_REG_RW
module update_reg_rw_arbiter
#(
    // Master AXI Stream Data Width
    parameter C_M_AXIS_DATA_WIDTH=256,
    parameter C_S_AXIS_DATA_WIDTH=256,
    parameter C_M_AXIS_TUSER_WIDTH=128,
    parameter C_S_AXIS_TUSER_WIDTH=128,
    parameter C_S_AXI_DATA_WIDTH=32,
    // Register parameters
    parameter NUM_RW_REGS = 0,
    parameter NUM_WO_REGS = 0,
    parameter NUM_RO_REGS = 0,
    parameter integer MEM_ADDR_WIDTH     = 19
)
(
    // Global Ports
    input axi_aclk,
    input axi_aresetn,
    input memclk,
    input memreset,

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

    // Registers
    input  [NUM_WO_REGS*C_S_AXI_DATA_WIDTH-1:0]  wo_regs,
    input  [NUM_RW_REGS*C_S_AXI_DATA_WIDTH-1:0]  rw_regs,
    output reg  [NUM_RO_REGS*C_S_AXI_DATA_WIDTH-1:0]  ro_regs,

    //Registers control signal
    input					write_valid,
	
    //test signal
    input  [200:0]				reg_read_data,
    input					reg_read_data_valid,
    input  [31:0]				five_tuple_data,
    input					universal_data_valid,
    output reg [18:0]				reg_read_addr,
    output reg					hash_reg_sel,
    input					dout_burst_ready,
    input	[3:0]				r_w_ctrl_state,
    input					reg_read_start,
    input					cal_done,
    input	[1:0]				sketch_state,
    input 	[(MEM_ADDR_WIDTH-1):0]  	din_addr,
    input                         		din_ready,
    input 	[(MEM_ADDR_WIDTH-1):0]  	qdr_sa,
    input       [1:0]                  		qdr_r_n		
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

   	// ------------- Regs/ wires -----------

   	wire                             in_fifo_nearly_full;
   	wire                             in_fifo_empty;
   	reg                              in_fifo_rd_en;
   	wire [C_M_AXIS_TUSER_WIDTH-1:0]  fifo_out_tuser;
   	wire [C_M_AXIS_DATA_WIDTH-1:0]   fifo_out_tdata;
   	wire [C_M_AXIS_DATA_WIDTH/8-1:0] fifo_out_tstrb;
   	wire  	                        fifo_out_tlast;
   	wire                             fifo_tvalid;
   	wire                             fifo_tlast;
   	reg	[200:0]			    pre_read_data , read_data;
   	reg	[2:0]	state , nextstate;
   	reg	[2:0]	IDLE = 0 , WRITE = 1 , WAIT_0 = 2 , WAIT_1 = 3 , HOLD_WRITE = 4;	
   	reg		delay_1_write_valid , delay_2_write_valid;
	wire		async_reg_w_empty;
	reg		async_reg_w_en;
	reg	[3:0] 	count;
	wire		async_reg_r_empty;
	reg		async_reg_r_en;
	reg	[3:0]	reg_read_r_count;
	wire	[200:0]	async_reg_reg_data;
	wire		async_reg_reg_data_valid;

   // ------------ Modules -------------

   fallthrough_small_fifo
   #( .WIDTH(C_M_AXIS_DATA_WIDTH+C_M_AXIS_TUSER_WIDTH+C_M_AXIS_DATA_WIDTH/8+1),
      .MAX_DEPTH_BITS(2)
    )
    input_fifo
    ( // Outputs
      .dout                         ({fifo_out_tlast, fifo_out_tuser, fifo_out_tstrb, fifo_out_tdata}),
      .full                         (),
      .nearly_full                  (in_fifo_nearly_full),
	  .prog_full                    (),
      .empty                        (in_fifo_empty),
      // Inputs
      .din                          ({s_axis_tlast, s_axis_tuser, s_axis_tstrb, s_axis_tdata}),
      .wr_en                        (s_axis_tvalid & s_axis_tready),
      .rd_en                        (in_fifo_rd_en),
      .reset                        (~axi_aresetn),
      .clk                          (axi_aclk));

   // ------------- Logic ------------

   assign s_axis_tready = !in_fifo_nearly_full;
   assign m_axis_tuser = fifo_out_tuser;
   assign m_axis_tdata = fifo_out_tdata;
   assign m_axis_tlast = fifo_out_tlast;
   assign m_axis_tstrb = fifo_out_tstrb;
   assign m_axis_tvalid = ~in_fifo_empty;

   always @(*) begin
      in_fifo_rd_en = 0;

      if (m_axis_tready && !in_fifo_empty) begin
        in_fifo_rd_en = 1;
      end
   end

	`ifdef TEST_REG_RW		//test for ro_regs compare to axi_addr & verify host to reg workable
		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				ro_regs <= {(NUM_RO_REGS*C_S_AXI_DATA_WIDTH){1'b0}};
			end
			else if(wo_regs == 32'd0)
			begin
				ro_regs[31:0] <= 32'd1;
				ro_regs[31 + 32 * 1:0 + 32 * 1] <= 32'd2;
				ro_regs[31 + 32 * 2:0 + 32 * 2] <= 32'd3;
				ro_regs[31 + 32 * 3:0 + 32 * 3] <= 32'd4;
				ro_regs[31 + 32 * 4:0 + 32 * 4] <= 32'd5;
				ro_regs[31 + 32 * 5:0 + 32 * 5] <= 32'd6;
				ro_regs[31 + 32 * 6:0 + 32 * 6] <= 32'd7;
				ro_regs[31 + 32 * 7:0 + 32 * 7] <= 32'd8;
				ro_regs[31 + 32 * 8:0 + 32 * 8] <= 32'd9;
				ro_regs[31 + 32 * 9:0 + 32 * 9] <= 32'd10;
				ro_regs[31 + 32 * 10:0 + 32 * 10] <= 32'd11;
				ro_regs[31 + 32 * 11:0 + 32 * 11] <= 32'd12;
				ro_regs[31 + 32 * 12:0 + 32 * 12] <= 32'd13;
				ro_regs[31 + 32 * 13:0 + 32 * 13] <= 32'd14;
				ro_regs[31 + 32 * 14:0 + 32 * 14] <= 32'd15;
				ro_regs[31 + 32 * 15:0 + 32 * 15] <= 32'd16;
			end
			else if(wo_regs == 32'd1)
			begin
				ro_regs[31:0] <= 32'd17;
				ro_regs[31 + 32 * 1:0 + 32 * 1] <= 32'd18;
				ro_regs[31 + 32 * 2:0 + 32 * 2] <= 32'd19;
				ro_regs[31 + 32 * 3:0 + 32 * 3] <= 32'd20;
				ro_regs[31 + 32 * 4:0 + 32 * 4] <= 32'd21;
				ro_regs[31 + 32 * 5:0 + 32 * 5] <= 32'd22;
				ro_regs[31 + 32 * 6:0 + 32 * 6] <= 32'd23;
				ro_regs[31 + 32 * 7:0 + 32 * 7] <= 32'd24;
				ro_regs[31 + 32 * 8:0 + 32 * 8] <= 32'd25;
				ro_regs[31 + 32 * 9:0 + 32 * 9] <= 32'd26;
				ro_regs[31 + 32 * 10:0 + 32 * 10] <= 32'd27;
				ro_regs[31 + 32 * 11:0 + 32 * 11] <= 32'd28;
				ro_regs[31 + 32 * 12:0 + 32 * 12] <= 32'd29;
				ro_regs[31 + 32 * 13:0 + 32 * 13] <= 32'd30;
				ro_regs[31 + 32 * 14:0 + 32 * 14] <= 32'd31;
				ro_regs[31 + 32 * 15:0 + 32 * 15] <= 32'd32;
			end
			else
			begin
				ro_regs[31:0] <= 32'd50;
				ro_regs[31 + 32 * 1:0 + 32 * 1] <= 32'd50;
				ro_regs[31 + 32 * 2:0 + 32 * 2] <= 32'd50;
				ro_regs[31 + 32 * 3:0 + 32 * 3] <= 32'd50;
				ro_regs[31 + 32 * 4:0 + 32 * 4] <= 32'd50;
				ro_regs[31 + 32 * 5:0 + 32 * 5] <= 32'd50;
				ro_regs[31 + 32 * 6:0 + 32 * 6] <= 32'd50;
				ro_regs[31 + 32 * 7:0 + 32 * 7] <= 32'd50;
				ro_regs[31 + 32 * 8:0 + 32 * 8] <= 32'd50;
				ro_regs[31 + 32 * 9:0 + 32 * 9] <= 32'd50;
				ro_regs[31 + 32 * 10:0 + 32 * 10] <= 32'd50;
				ro_regs[31 + 32 * 11:0 + 32 * 11] <= 32'd50;
				ro_regs[31 + 32 * 12:0 + 32 * 12] <= 32'd50;
				ro_regs[31 + 32 * 13:0 + 32 * 13] <= 32'd50;
				ro_regs[31 + 32 * 14:0 + 32 * 14] <= 32'd50;
				ro_regs[31 + 32 * 15:0 + 32 * 15] <= 32'd50;
			end
		end
	`else
		reg	[1:0]	delay_1_sketch_state , delay_2_sketch_state;
		reg	[31:0]	delay_1_five_tuple_data , delay_2_five_tuple_data;
		reg	[18:0]	delay_1_reg_read_addr , delay_2_reg_read_addr;
		reg		delay_1_reg_read_start , delay_1_hash_reg_sel , delay_2_reg_read_start , delay_2_hash_reg_sel;

		always@(posedge memclk)
		begin
			if(memreset)
			begin
				delay_1_sketch_state		<= 2'd0;
				delay_2_sketch_state		<= 2'd0;
				delay_1_five_tuple_data		<= 32'd0;
				delay_2_five_tuple_data		<= 32'd0;
				delay_1_reg_read_addr		<= 19'd0;
				delay_2_reg_read_addr		<= 19'd0;
				delay_1_reg_read_start		<= 1'b0; 
				delay_1_hash_reg_sel		<= 1'b0; 
				delay_2_reg_read_start		<= 1'b0; 
				delay_2_hash_reg_sel		<= 1'b0; 
			end
			else
			begin
				delay_1_sketch_state		<= sketch_state;
				delay_2_sketch_state		<= delay_1_sketch_state;
				delay_1_five_tuple_data		<= five_tuple_data;
				delay_2_five_tuple_data		<= delay_1_five_tuple_data;
				delay_1_reg_read_addr		<= reg_read_addr;
				delay_2_reg_read_addr		<= delay_1_reg_read_addr;
				delay_1_reg_read_start		<= reg_read_start; 				
				delay_2_reg_read_start		<= delay_1_reg_read_start; 
				delay_1_hash_reg_sel		<= hash_reg_sel; 
				delay_2_hash_reg_sel		<= delay_1_hash_reg_sel; 
			end
		end
		//for testing purpose
		reg	[3:0]	delay_reg_read_r_w_ctrl_state , delay_reg_data_r_w_ctrl_state;
		reg	[18:0]	delay_reg_data_read_rw_ctrl , delay_reg_data_read_SRAM;
		reg	[1:0]	delay_qdr_r_n;
		reg		delay_din_ready;
		
		always@(posedge memclk)
		begin
			if(memreset)
			begin
				delay_reg_read_r_w_ctrl_state <= 4'd0;
			end
			else if(r_w_ctrl_state == 4'd8)
			begin
				delay_reg_read_r_w_ctrl_state <= r_w_ctrl_state;
			end
		end
		always@(posedge memclk)
		begin
			if(memreset)
			begin
				delay_reg_data_r_w_ctrl_state <= 4'd0;
			end
			else if((r_w_ctrl_state == 4'd9)||(r_w_ctrl_state == 4'd10))
			begin
				delay_reg_data_r_w_ctrl_state <= r_w_ctrl_state;
			end
		end
		always@(posedge memclk)
		begin
			if(memreset)
			begin
				delay_din_ready <= 1'b0;
				delay_reg_data_read_rw_ctrl <= 19'd0;
			end
			else if(din_ready)
			begin
				delay_din_ready <= din_ready;
				delay_reg_data_read_rw_ctrl <= din_addr;
			end
		end
		always@(posedge memclk)
		begin
			if(memreset)
			begin
				delay_qdr_r_n <= 2'd0;
				delay_reg_data_read_SRAM <= 19'd0;
			end
			else if(qdr_r_n == 2'b00)
			begin
				delay_qdr_r_n <= qdr_r_n;
				delay_reg_data_read_SRAM <= qdr_sa;
			end
		end
		//read only register data assign
		reg	[31:0]	packet_count;
		reg	[15:0]	eth_type , pre_eth_type;

		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				ro_regs[32*16-1:0] <= {(16*C_S_AXI_DATA_WIDTH){1'b0}};
			end
			else if(state == WAIT_1)//received SRAM data
			begin
				ro_regs[32*16-1:0] <= {pre_read_data , read_data , packet_count};//{SRAM_data , packet_count}	//ro_regs[15:0]
			end
		end
		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				ro_regs[32*18-1:32*16] <= {(2*C_S_AXI_DATA_WIDTH){1'b0}};
			end
			else
			begin
				ro_regs[32*17-1:32*16] <= wo_regs;
				ro_regs[32*18-1:32*17] <= r_w_ctrl_state;
			end
		end
		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				ro_regs[32*20-1:32*18] <= {(2*C_S_AXI_DATA_WIDTH){1'b0}};
			end
			else if(reg_read_start||delay_1_reg_read_start||delay_2_reg_read_start)						
			begin
				ro_regs[32*19-1:32*18] <= sketch_state|delay_1_sketch_state|delay_2_sketch_state;			//ro_regs[19]
				ro_regs[32*20-1:32*19] <= five_tuple_data|delay_1_five_tuple_data|delay_2_five_tuple_data;
			end
		end
		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				ro_regs[32*21-1:32*20] <= {(1*C_S_AXI_DATA_WIDTH){1'b0}};
			end
			else if(hash_reg_sel||delay_1_hash_reg_sel||delay_2_hash_reg_sel)		//test sync data valid		
			begin
				ro_regs[32*21-1:32*20] <= reg_read_addr|delay_1_reg_read_addr|delay_2_reg_read_addr;
			end
		end
		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				ro_regs[32*22-1:32*21] <= {(1*C_S_AXI_DATA_WIDTH){1'b0}};
			end
			else if(delay_reg_read_r_w_ctrl_state == 4'd8)
			begin
				ro_regs[32*22-1:32*21] <= 32'd1;
			end
		end
		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				ro_regs[32*23-1:32*22] <= {(1*C_S_AXI_DATA_WIDTH){1'b0}};
			end
			else if((delay_reg_data_r_w_ctrl_state == 4'd9)||(delay_reg_data_r_w_ctrl_state == 4'd10))
			begin
				ro_regs[32*23-1:32*22] <= 32'd1;
			end
		end
		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				ro_regs[32*25-1:32*24] <= {(2*C_S_AXI_DATA_WIDTH){1'b0}};
			end
			else if(delay_din_ready)
			begin
				ro_regs[32*24-1:32*23] <= delay_reg_data_read_rw_ctrl;
				ro_regs[32*25-1:32*24] <= 32'd1;
			end
		end
		
		//count packet
		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				eth_type <= 16'd0;
				packet_count <= 32'd0;	
			end
			else if(eth_type == 16'h0800)
			begin
				packet_count <= packet_count + 1'b1;
				eth_type <= 16'd0;
			end
			/*else if(wo_regs_valid)
			begin
				ro_regs <= {packet_count , wo_regs};
			end*/
			else
			begin
				eth_type[15:8] <= s_axis_tdata[103:96];
				eth_type[7:0] <= s_axis_tdata[111:104];
				packet_count <= packet_count;
			end
		end
	
		//delay reg_write for match wo_regs timing
		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				delay_1_write_valid <= 1'b0;
				delay_2_write_valid <= 1'b0;
			end
			else
			begin
				delay_1_write_valid <= write_valid;
				delay_2_write_valid <= delay_1_write_valid;
			end
		end
		
		//sync SRAM_data save
		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				pre_read_data  <= 201'd0;
				read_data  <= 201'd0;
			end
			else if(async_reg_reg_data_valid)
			begin
				read_data <= async_reg_reg_data;
				pre_read_data <= read_data;
			end
		end

		//FSM for SRAM reg_read
		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				state <= IDLE;
			end
			else
			begin
				state <= nextstate; 
			end
		end
		always@(*)
		begin
			case(state)
				IDLE:
				begin
					if(delay_1_write_valid)
					begin
						`ifdef TEST
							nextstate = HOLD_WRITE;
						`else
							nextstate = WAIT_0;
						`endif
					end
					else
					begin
						nextstate = IDLE;
					end
				end
				HOLD_WRITE://for test only --> to hold reg_write command
				begin
					if(dout_burst_ready&&(r_w_ctrl_state!=1)&&(r_w_ctrl_state!=2))
					begin
						nextstate = WAIT_0;
					end
					else
					begin
						nextstate = HOLD_WRITE;
					end
				end
				WAIT_0://wait for SRAM data_0
				begin
					if(async_reg_reg_data_valid)
					begin
						nextstate = WAIT_1;
					end
					else
					begin
						nextstate = WAIT_0;
					end
				end
				WAIT_1://wait for SRAM data_1
				begin
					nextstate = IDLE;
				end
			endcase
		end
		//for sync reg_write --> read_enable
		always@(posedge memclk)
		begin
			if(memreset)
			begin
				async_reg_w_en <= 1'b0;
			end
			else if(~async_reg_w_empty)
			begin
				async_reg_w_en <= 1'b1;
			end
			else
			begin
				async_reg_w_en <= 1'b0;
			end
		end
		//delay async w valid
		reg		delay_async_reg_w_valid;
		wire		async_reg_w_valid;
		wire	[18:0]	async_reg_w_data;
		always@(posedge memclk)
		begin
			if(memreset)
			begin
				delay_async_reg_w_valid <= 1'b0;
			end
			else
			begin
				delay_async_reg_w_valid <= async_reg_w_valid;
			end
		end
		always@(posedge memclk)
		begin
			if(memreset)
			begin
				hash_reg_sel <= 1'b0;	
				reg_read_addr <= 19'd0;
			end
			else if((~async_reg_w_valid)&delay_async_reg_w_valid)
			begin
				hash_reg_sel <= 1'b1;				
				reg_read_addr <= async_reg_w_data;
			end
			else
			begin
				hash_reg_sel <= 1'b0;	
				reg_read_addr <= 19'd0;				
			end
		end
		async_reg_w async_reg_w	//sync 160MHz to 210MHz	--> reg read to SRAM
		(
		  .rst(~axi_aresetn),
		  .wr_clk(axi_aclk),
		  .rd_clk(memclk),
		  .din({1'b0 , wo_regs[18:0]}),
		  .wr_en(delay_2_write_valid),
		  `ifdef TEST
		  	.rd_en(dout_burst_ready&&(r_w_ctrl_state!=1)&&(r_w_ctrl_state!=2)),
		  `else
			.rd_en(async_reg_w_en),
		  `endif
		  .dout(async_reg_w_data),//reg_read_addr
		  .full(),//wfull
		  //.almost_full(),//w_almost_full
		  .empty(async_reg_w_empty),//rempty
		  //.almost_empty(),//r_almost_empty
		  .valid(async_reg_w_valid)
		  //.prog_full()
		);
		always@(posedge axi_aclk)
		begin
			if(~axi_aresetn)
			begin
				async_reg_r_en <= 1'b0;
			end
			else if(~async_reg_r_empty)
			begin
				async_reg_r_en <= 1'b1;
			end
			else
			begin
				async_reg_r_en <= 1'b0;
			end
		end

		async_reg_r async_reg_r		//sync 210MHz to 160Mhz --> read data from SRAM
		(
		  .rst(memreset),
		  .wr_clk(memclk),
		  .rd_clk(axi_aclk),
		  .din(reg_read_data),
		  .wr_en(reg_read_data_valid),
		  .rd_en(async_reg_r_en&&((state == WAIT_0)||(state == WAIT_1))),
		  .dout(async_reg_reg_data),
		  .full(),
		  .empty(async_reg_r_empty),
		  .valid(async_reg_reg_data_valid)
		);
	`endif

endmodule
