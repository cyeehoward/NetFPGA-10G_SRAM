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
    parameter NUM_RO_REGS = 0
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
    output [18:0]				reg_read_addr,
    output					hash_reg_sel,
    input					dout_burst_ready,
    input	[3:0]				r_w_ctrl_state,
    input					reg_read_start,
    input					cal_done,
    input	[1:0]				sketch_state		
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
		reg	[31:0]	packet_count;
		reg	[15:0]	eth_type , pre_eth_type;

		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				ro_regs <= {(NUM_RO_REGS*C_S_AXI_DATA_WIDTH){1'b0}};
			end
			else if(state == WAIT_1)//received SRAM data
			begin
				ro_regs[32*16-1:0] <= {pre_read_data , read_data , packet_count};//{SRAM_data , packet_count}	//ro_regs[15:0]
				ro_regs[32*18-1:32*17] <= ro_regs[32*18-1:32*17];
				ro_regs[32*20-1:32*19] <= ro_regs[32*20-1:32*19];
				ro_regs[32*19-1:32*18] <= ro_regs[32*19-1:32*18];
				ro_regs[32*17-1:32*16] <= wo_regs;
				ro_regs[32*21-1:32*20] <= ro_regs[32*21-1:32*20];
			end
			else if(cal_done)						//ro_regs[18]
			begin
				ro_regs[32*18-1:32*17] <= r_w_ctrl_state;
				ro_regs[32*20-1:32*19] <= ro_regs[32*20-1:32*19];
				ro_regs[32*19-1:32*18] <= ro_regs[32*19-1:32*18];
				ro_regs[32*17-1:32*16] <= wo_regs;
				ro_regs[32*21-1:32*20] <= ro_regs[32*21-1:32*20];
			end
			else if(reg_read_start)						//ro_regs[19]
			begin
				ro_regs[32*19-1:32*18] <= sketch_state;
				ro_regs[32*20-1:32*19] <= ro_regs[32*20-1:32*19];
				ro_regs[32*18-1:32*17] <= ro_regs[32*18-1:32*17];
				ro_regs[32*17-1:32*16] <= wo_regs;
				ro_regs[32*21-1:32*20] <= five_tuple_data;
			end
			else if(hash_reg_sel)		//test sync data valid		//ro_regs[20]
			begin
				ro_regs[32*20-1:32*19] <= reg_read_addr;
				ro_regs[32*18-1:32*17] <= ro_regs[32*18-1:32*17];
				ro_regs[32*19-1:32*18] <= ro_regs[32*19-1:32*18];
				ro_regs[32*17-1:32*16] <= wo_regs;
				ro_regs[32*21-1:32*20] <= ro_regs[32*21-1:32*20];
			end
			else
			begin
				ro_regs <= ro_regs;
				ro_regs[32*17-1:32*16] <= wo_regs;			//ro_regs[17]
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

		/*always@(posedge memclk)
		begin
			if(memreset)
			begin
				packet_count <= 32'd0;
			end
			else if(r_w_ctrl_state == 4'd5)
			begin
				packet_count <= packet_count + 1'b1;
			end
			else
			begin
				packet_count <= packet_count;
			end
		end

		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				ro_regs <= {(NUM_RO_REGS*C_S_AXI_DATA_WIDTH){1'b0}};
			end
			else
			begin
				ro_regs[31:0] <= packet_count;
				ro_regs[NUM_RO_REGS*C_S_AXI_DATA_WIDTH-1:32] <= 480'd0;
			end
		end*/
	
		/*always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				ro_regs <= {(NUM_RO_REGS*C_S_AXI_DATA_WIDTH){1'b0}};
			end
			//else if(state == WAIT_1)
			//begin
			//	ro_regs[401:0] <= {pre_read_data , read_data};
				//ro_regs[NUM_RO_REGS*C_S_AXI_DATA_WIDTH-1:402] <= 111'h7FFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
			//end
			else if(universal_data_valid&&(~reg_read_start))
			begin
				ro_regs[415:402] <= 14'd0;
				ro_regs[447:416] <= five_tuple_data;
				ro_regs[NUM_RO_REGS*C_S_AXI_DATA_WIDTH-1:448] <= 64'd0;
			end
			else
			begin
				ro_regs <= ro_regs;
			end
		end*/
	
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

		//FSM for SRAM reg_read
		always@(posedge axi_aclk or negedge axi_aresetn)
		begin
			if(~axi_aresetn)
			begin
				state <= IDLE;
				pre_read_data  <= 201'd0;
			end
			else
			begin
				state <= nextstate; 
				pre_read_data <= read_data;
			end
		end
		always@(*)
		begin
			read_data = 201'd0;
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
						read_data = async_reg_reg_data;
						nextstate = WAIT_1;
					end
					else
					begin
						read_data = {(201){1'b1}};
						nextstate = WAIT_0;
					end
				end
				WAIT_1://wait for SRAM data_1
				begin
					read_data = async_reg_reg_data;
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
		  .dout(reg_read_addr),
		  .full(),//wfull
		  //.almost_full(),//w_almost_full
		  .empty(async_reg_w_empty),//rempty
		  //.almost_empty(),//r_almost_empty
		  .valid(hash_reg_sel)
		  //.prog_full()
		);

		/*always@(posedge axi_aclk)
		begin
			if(~axi_aresetn)
			begin
				reg_read_r_count <= 4'd0;
				async_reg_r_en <= 1'b0;
			end
			else if((reg_read_r_count == 4'd8)&&(~async_reg_r_empty))
			begin
				reg_read_r_count <= reg_read_r_count + 1'b1;
				async_reg_r_en <= 1'b1;
			end
			else if((reg_read_r_count == 4'd6)&&(~async_reg_r_empty))
			begin
				reg_read_r_count <= 4'd0;
				async_reg_r_en <= 1'b1;
			end
			else if(reg_read_data_valid)
			begin
				reg_read_r_count <= 1'b1;
				async_reg_r_en <= 1'b0;
			end
			else if(reg_read_r_count != 4'd0)
			begin
				reg_read_r_count <= reg_read_r_count + 1'b1;
				async_reg_r_en <= 1'b0;
			end
			else
			begin
				reg_read_r_count <= 4'd0;
				async_reg_r_en <= 1'b0;
			end
		end*/
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
