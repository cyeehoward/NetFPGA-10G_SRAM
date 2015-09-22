/*******************************************************************************
 *
 *  NetFPGA-10G http://www.netfpga.org
 *
 *  File:
 *        nf10_nic_output_port_lookup.v
 *
 *  Library:
 *        hw/std/pcores/nf10_sram_fifo
 *
 *  Module:
 *        fifomem
 *
 *  Author:
 *        Sam D'Amico
 *
 *  Description:
 *        Arbitrated FIFO to/from memory interface
 *
 *  Copyright notice:
 *        Copyright (C) 2010,2011 The Board of Trustees of The Leland Stanford
 *                                Junior University
 *
 *  Licence:
 *        This file is part of the NetFPGA 10G development base package.
 *
 *        This package is free software: you can redistribute it and/or modify
 *        it under the terms of the GNU Lesser General Public License as
 *        published by the Free Software Foundation, either version 3 of the
 *        License, or (at your option) any later version.
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

//TODO: might want to use almost_full instead of full for memory, as it might
//clip when full and not notify FIFOs.

module r_w_ctrl
#(
///////////////////////////////////////////////////////////////////////////////
// Parameter Definitions
///////////////////////////////////////////////////////////////////////////////
  // Width of AXI data bus in bytes
  parameter integer TDATA_WIDTH        = 32,
  parameter integer TUSER_WIDTH        = 128,
  parameter integer NUM_QUEUES         = 4,
  parameter integer QUEUE_ID_WIDTH     = 2,
  parameter integer NUM_MEM_INPUTS     = 6,
  parameter integer NUM_MEM_CHIPS      = 3,
  parameter integer MEM_WIDTH          = 36,
  parameter integer MEM_ADDR_WIDTH     = 19,
  parameter integer MEM_NUM_WORDS      = 524288,
  parameter integer QUEUE_SIZE         = MEM_NUM_WORDS/4
)
(
    input                          		clk,
    input                          		reset,
    input  [(QUEUE_ID_WIDTH-1):0]   		read_queue_id,
    output reg [(QUEUE_ID_WIDTH-1):0]  		read_data_queue_id,
    input                          		read_data_ready,
    output reg [((8*TDATA_WIDTH+9)-1):0]  	read_data,
    output                         		read_data_valid,
    output reg 			  		read_empty,
    output reg                     		read_burst_state,


    input [(QUEUE_ID_WIDTH-1):0]   		write_queue_id,
    input [((8*TDATA_WIDTH+9)-1):0]  		write_data,
    input [31:0]  				write_data_addr,
    input                          		write_data_valid,
    output reg 			  		write_full,
    output reg                     		next_write_burst_state,

    input                          		sram_read_full,
    input                          		sram_write_full,
    output reg [(MEM_WIDTH*NUM_MEM_INPUTS-1):0] dout,
    output reg [(MEM_ADDR_WIDTH-1):0]  		dout_addr,
    output reg                         		dout_burst_ready,
    input  [(MEM_WIDTH*NUM_MEM_INPUTS-1):0]     din,
    input  [(NUM_MEM_CHIPS-1):0]                din_valid,
    output reg [(MEM_ADDR_WIDTH-1):0]  		din_addr,
    output reg                         		din_ready
);

reg [(MEM_ADDR_WIDTH-3):0] 	next_num_used;
reg [(MEM_ADDR_WIDTH-3):0] 	num_used;
reg [(MEM_ADDR_WIDTH-1):0] 	next_read_addr;
reg [(MEM_ADDR_WIDTH-1):0] 	read_addr;
reg [(MEM_ADDR_WIDTH-1):0] 	next_write_addr;
reg [(MEM_ADDR_WIDTH-1):0] 	write_addr;
reg 				next_read_data_valid;
reg 				next_read_burst_state;
reg 				write_burst_state;
reg 				dout_ready;
reg 				read_mem_word_valid;
reg [(MEM_ADDR_WIDTH-1):0] 	next_din_addr;
reg 				next_din_ready;

reg [(MEM_WIDTH*NUM_MEM_INPUTS-1):0] 	next_dout;
reg [(MEM_ADDR_WIDTH-1):0] 		next_dout_addr;
reg                        		next_dout_burst_ready;
reg 		 			next_read_empty;
reg 		 			next_write_full;


reg [31:0] 				next_before_mem_cnt;
reg [31:0] 				next_after_mem_cnt;

reg before_mem_cnt_inc, after_mem_cnt_inc;
reg next_before_mem_cnt_inc, next_after_mem_cnt_inc;

wire	delay_addr_valid , count_delay_valid;

localparam BURST_STATE_OFF = 1'b0;
localparam BURST_STATE_HALFWAY = 1'b1;

genvar i;

always @(posedge clk)
begin
    if(reset)
    begin
        read_burst_state 	<= BURST_STATE_OFF;
        write_burst_state 	<= BURST_STATE_OFF;
        dout 			<= {(MEM_WIDTH*NUM_MEM_INPUTS){1'b0}};
        dout_addr 		<= {(MEM_ADDR_WIDTH){1'b0}};
        dout_burst_ready 	<= 1'b0;
        write_full 		<= {(NUM_QUEUES){1'b0}};
        din_addr 		<= {(MEM_ADDR_WIDTH){1'b0}};
        din_ready 		<= 1'b0;
	read_addr 		<= ({(MEM_ADDR_WIDTH){1'b0}});
        write_addr 		<= ({(MEM_ADDR_WIDTH){1'b0}});
        num_used 		<= {(MEM_ADDR_WIDTH-2){1'b0}};
    end
    else
    begin
        read_burst_state 	<= next_read_burst_state;
        write_burst_state 	<= next_write_burst_state;
        dout 			<= next_dout;
        dout_addr 		<= next_dout_addr;
        dout_burst_ready 	<= next_dout_burst_ready;
        din_addr 		<= next_din_addr;
        din_ready 		<= next_din_ready;
        write_full 		<= next_write_full;
	read_addr 		<= next_read_addr;
        write_addr 		<= next_write_addr;
        num_used 		<= next_num_used;
    end
end

///////////////////////////////////////////////////////////////////////////
//read data merge
wire  	[(MEM_WIDTH*NUM_MEM_INPUTS-1):0]   	din_merged;
wire 	[(NUM_MEM_CHIPS-1):0] 			din_merged_empty;
wire 						din_merged_valid;
reg  	[(MEM_WIDTH*NUM_MEM_INPUTS-1):0]   	din_merged_delay;
reg 						din_merged_valid_delay;
assign 	din_merged_valid 	= ((din_merged_empty[0] | din_merged_empty[1]) == 0);
assign 	read_data_valid 	= din_merged_valid && read_mem_word_valid;
generate
    for(i=0;i<NUM_MEM_CHIPS;i=i+1)
    begin : memreadfifos
        fallthrough_small_fifo
            #(.WIDTH(72), .MAX_DEPTH_BITS(2))
            fifo(.din(din[((i+1)*MEM_WIDTH*2-1):(i*MEM_WIDTH*2)]),
                 .wr_en(din_valid[i]),
                 .rd_en(din_merged_valid),
                 .dout(din_merged[((i+1)*MEM_WIDTH*2-1):(i*MEM_WIDTH*2)]),
                 .empty(din_merged_empty[i]),
                 .reset(reset),
                 .clk(clk)
                );
    end
endgenerate

always @(posedge clk)
        begin
            if(reset)
            begin
                din_merged_delay <= 216'd0;
		din_merged_valid_delay <= 1'd0;
            end
            else
            begin
                din_merged_delay <= din_merged;
		din_merged_valid_delay <= din_merged_valid; 
            end
        end
///////////////////////////////////////////////////////////////////////////
reg rw_same_queue;

always @(din or din_merged or read_queue_id or write_queue_id or read_addr or write_addr or num_used or 
	read_burst_state or write_burst_state or read_data_valid or write_data_valid or 
	write_data or dout_ready or dout_burst_ready or sram_read_full or sram_write_full or read_data_ready or 
	write_data_addr or delay_addr_valid or rmw_addr or din_merged_valid_delay)
begin
    	next_read_burst_state = BURST_STATE_OFF;
    	next_write_burst_state = BURST_STATE_OFF;
    	next_din_ready = 1'b0;
    	dout_ready = 1'b0;
    	next_dout_addr = {(MEM_ADDR_WIDTH){1'b0}};
    	next_din_addr = {(MEM_ADDR_WIDTH){1'b0}};
    	//read data part
    	read_data = din_merged[((8*TDATA_WIDTH+9)-1):0];
    	read_data_queue_id = din_merged[((8*TDATA_WIDTH+9+QUEUE_ID_WIDTH)-1):(8*TDATA_WIDTH+9)];
	//write data part
	if(din_merged_valid_delay)	//write and modify after read
	begin
		next_dout[((8*TDATA_WIDTH+9)-1):0] = din_merged_delay + 1'b1;
    		next_dout[((8*TDATA_WIDTH+9+QUEUE_ID_WIDTH)-1):(8*TDATA_WIDTH+9)] = 2'd0;
    		next_dout[8*TDATA_WIDTH+9+QUEUE_ID_WIDTH] = 1'b1;
    		next_dout[(MEM_WIDTH*NUM_MEM_INPUTS-1):(8*TDATA_WIDTH+9+QUEUE_ID_WIDTH + 1)] = 12'd0;
		
	end
	else	//write first
	begin	
		next_dout[((8*TDATA_WIDTH+9)-1):0] = write_data;
    		next_dout[((8*TDATA_WIDTH+9+QUEUE_ID_WIDTH)-1):(8*TDATA_WIDTH+9)] = write_queue_id;
    		next_dout[8*TDATA_WIDTH+9+QUEUE_ID_WIDTH] = write_data_valid;
    		next_dout[(MEM_WIDTH*NUM_MEM_INPUTS-1):(8*TDATA_WIDTH+9+QUEUE_ID_WIDTH + 1)] = 12'd0;
	end
	
    	read_mem_word_valid = din_merged[8*TDATA_WIDTH+9+QUEUE_ID_WIDTH];
    	next_read_data_valid = 1'b0;
    	next_num_used = num_used;
    
    	// TODO: SRAM read and write full signals
    	// only seems to matter before calibration completes
	///////////////////////////////////////////////////////////////////////////
	//read addr assign start
    	if(read_data_ready && (~read_burst_state) /*&& ~read_empty*/)
    	begin
		if(!read_empty)
		begin
			next_din_ready = 1'b1;            
			next_read_data_valid = 1'b1; 
			next_din_addr = addr_delay;
			if(read_burst_state == BURST_STATE_OFF)
				next_read_burst_state = BURST_STATE_HALFWAY;
		end
		else
		begin
			next_din_addr = read_addr;
		end
	end
	else if(dout_burst_ready && (~ read_burst_state))
	begin
		next_din_ready = 1'b1;            
		next_read_data_valid = 1'b1; 
		next_din_addr = rmw_addr;
		if(read_burst_state == BURST_STATE_OFF)
			next_read_burst_state = BURST_STATE_HALFWAY;	
	end
	else
	begin
		next_din_addr = read_addr;
	end
	//read addr assign end
	///////////////////////////////////////////////////////////////////////////
	//write addr assign start
    	if(write_data_valid && (~write_burst_state) /* && ~write_full*/)
    	begin
		if(!write_full)
		begin
		   	next_dout_addr[MEM_ADDR_WIDTH-1:0] = write_data_addr;
		   	dout_ready = 1'b1;
			if(write_burst_state == BURST_STATE_OFF)
		       		next_write_burst_state = BURST_STATE_HALFWAY;
		end
		else
		begin
		   	next_dout_addr = write_addr;
			dout_ready = 1'b0;
		end
    	end
	else if(delay_addr_valid && (~write_burst_state))
	begin
		next_dout_addr[MEM_ADDR_WIDTH-1:0] = rmw_addr;
		dout_ready = 1'b1;
		if(write_burst_state == BURST_STATE_OFF)
			next_write_burst_state = BURST_STATE_HALFWAY;
	end
    	else 
    	begin
    		next_dout_addr = write_addr;
    	end
	//write addr assign end
	///////////////////////////////////////////////////////////////////////////
    
    	if(next_din_ready && ~dout_ready) //(din_ready & ~dout_ready)
    	begin
		next_num_used = num_used - 1;
    	end
    	if(dout_ready && ~next_din_ready)//(dout_ready & ~din_ready)
    	begin
    	    	next_num_used = num_used + 1;
    	end
    	next_dout_burst_ready = /*~write_burst_state &&*/ dout_ready;
end

	//to see if the memory is full
	//by counting the addr that used
	always @(num_used)
	begin
		read_empty = num_used==0;
		next_write_full = (num_used)>=((QUEUE_SIZE)-5);
	end

	///////////////////////////////////////////////////////////////////////////	
	//address delay
	reg	[(MEM_ADDR_WIDTH-1):0]	addr_delay , addr_delay_1;
	wire	[(MEM_ADDR_WIDTH-1):0]	rmw_addr;
	always@(posedge clk)
	begin
		if(reset)
		begin
			addr_delay <= 19'd0;
			addr_delay_1 <= 19'd0;
		end
		else
		begin
			addr_delay <= write_data_addr;
			addr_delay_1 <= rmw_addr;
		end
	end

	fifo_addr_delay 
	fifo_addr_delay 
	(
		.clk(clk), 			// input clk
	  	.rst(reset), 			// input rst
		.din(write_data_addr), 		// input [18 : 0] din
	  	.wr_en(write_data_valid), 	// input wr_en
	  	.rd_en(din_merged_valid), 	// input rd_en
	  	.dout(rmw_addr),		// output [18 : 0] dout
	  	.full(), 			// output full
	  	.empty(), 			// output empty
	  	.valid(delay_addr_valid) 	// output valid
	);
	///////////////////////////////////////////////////////////////////////////
	/*wire	[31:0]			count_delay;
	count_delay 
	your_instance_name 
	(
  		.clk(clk), // input clk
  		.rst(reset), // input rst
  		.din(write_data[63:32]), // input [31 : 0] din
  		.wr_en(write_data_valid), // input wr_en
  		.rd_en(din_merged_valid), // input rd_en
  		.dout(count_delay), // output [31 : 0] dout
  		.full(), // output full
  		.empty() // output empty
		.valid(count_delay_valid) // output valid
	);*/
	///////////////////////////////////////////////////////////////////////////

endmodule

