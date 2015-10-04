`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:59:58 09/29/2015 
// Design Name: 
// Module Name:    r_w_ctrl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module r_w_ctrl
#(
	///////////////////////////////////////////////////////////////////////////////
	// Parameter Definitions
	///////////////////////////////////////////////////////////////////////////////
	// Width of AXI data bus in bytes
	parameter integer TDATA_WIDTH        = 24,
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
	input                          					clk,
	input                          					reset,
	
	output reg [(QUEUE_ID_WIDTH-1):0]  				read_data_queue_id,
    output reg [((8*TDATA_WIDTH+9)-1):0]  			read_data,
    output                         					read_data_valid,
    output reg 			  							read_empty,
    output reg                     					read_burst_state,
	
	input 		[((8*TDATA_WIDTH+9)-1):0]  			write_data,
	input 		[31:0]  							write_data_addr,
	input                          					write_data_valid,
	output reg 			  							write_full,
	output reg                     					next_write_burst_state,

	input                          					sram_read_full,
	input                          					sram_write_full,
	output reg 	[(MEM_WIDTH*NUM_MEM_INPUTS-1):0] 	dout,
	output reg 	[(MEM_ADDR_WIDTH-1):0]  			dout_addr,
	output reg                         				dout_burst_ready,
	input  		[(MEM_WIDTH*NUM_MEM_INPUTS-1):0] 	din,
	input  		[(NUM_MEM_CHIPS-1):0]            	din_valid,
	output reg 	[(MEM_ADDR_WIDTH-1):0]  			din_addr,
	output reg                         				din_ready,
	input								cal_done
);
	reg		[2:0]	state_init , nextstate_init;
	parameter IDLE = 0 , INIT = 1 , INIT_READ = 2 , READ_WRITE_WAIT = 3 , READ = 4 , WRITE = 5;
	reg 		[(MEM_WIDTH*NUM_MEM_INPUTS-1):0] 	next_dout_data;
	reg 		[(MEM_ADDR_WIDTH-1):0]  		next_dout_addr;
	reg                         				next_dout_burst_ready;
	reg 		[(MEM_ADDR_WIDTH-1):0]  		next_din_addr;
	reg                         				next_din_ready;
	reg		[(MEM_ADDR_WIDTH-1):0]			delay_data_addr;
	reg		[11:0]					reg_rmw_addr;
	wire		[18:0]					rmw_addr;
	wire		[31:0]					count_data;
	wire							delay_addr_valid , count_delay_valid;

	//assign 	reg_rmw_addr = rmw_addr;

	//FSM for initialization
	always@(posedge clk)
	begin
		if(reset)
		begin
			state_init <= IDLE;
		end
		else
		begin
			state_init <= nextstate_init;
		end
	end
	always@(posedge clk)
	begin
		if(reset)
		begin
			dout <= 216'd0;
			dout_addr <= 19'd0;
			dout_burst_ready <= 1'b0;
			din_addr <= 19'd0;
			din_ready <= 1'b0;
		end
		else
		begin
			dout <= next_dout_data;
			dout_addr <= next_dout_addr;
			dout_burst_ready <= next_dout_burst_ready;
			din_addr <= next_din_addr;
			din_ready <= next_din_ready;
		end
	end
	///////////////////////////////////////////////////////////////////////////////	
	//din vaild count	
	reg	vaild_count;
	always@(posedge clk)
	begin
		if(reset)
		begin
			vaild_count <= 1'b0;
		end
		else if(write_data_valid)
		begin
			vaild_count <= vaild_count + 1;
		end
		else if(din_valid)
		begin
			vaild_count <= 1'b0;
		end
		else
		begin
			vaild_count <= vaild_count;
		end
	end
	///////////////////////////////////////////////////////////////////////////////	
	always@(*)
	begin
		next_dout_burst_ready = 1'b0;
		next_dout_data = 216'd0;
		next_dout_addr = 19'd0;
		next_din_ready = 1'b0;
		next_din_addr = 19'd0;
		case(state_init)
			IDLE : 
			begin
				if(cal_done)								//go to initializtion after cal_done rise
				begin
					next_dout_burst_ready = 1'b0;
					next_dout_data = 216'd0;
					next_dout_addr = 19'd0;
					nextstate_init = INIT;
				end
				else
				begin
					next_dout_burst_ready = 1'b0;
					next_dout_data = 216'd0;
					next_dout_addr = 19'd0;
					nextstate_init = IDLE;
				end
			end
			INIT : 											//reset the memory to all zero
			begin
				if(dout_addr == 11'b111_1111_1111)//19'b111_1111_1111_1111_1111
				begin
					next_dout_burst_ready = 1'b0;
					next_dout_data = 216'd0;
					nextstate_init = READ_WRITE_WAIT;
					next_dout_addr = 19'd0;
				end
				else
				begin
					next_dout_burst_ready = 1'b1;
					next_dout_data = 216'd0;
					next_dout_addr = dout_addr + 1'b1;
					nextstate_init = INIT;
				end
			end
			/*INIT_READ : 									//ensure the memory are all zero --> read from all memory location
			begin
				if(din_addr == 19'b111_1111_1111_1111_1111)
				begin
					next_din_ready = 1'b0;
					next_din_addr = 19'd0;
					nextstate_init = OFF_state;
				end
				else
				begin
					next_din_ready = 1'b1;
					next_din_addr = din_addr + 1'b1;
					nextstate_init = INIT_READ;
				end
			end*/
			READ_WRITE_WAIT : 								//stay at this state after initialization
			begin
				next_dout_burst_ready = 1'b0;
				next_dout_data = 216'd0;
				next_dout_addr = 19'd0;
				next_din_ready = 1'b0;
				next_din_addr = 19'd0;
				if(write_data_valid)
				begin
					nextstate_init = READ;
				end
				else if(din_valid && vaild_count)
				begin
					nextstate_init = WRITE;
				end
				else
				begin
					nextstate_init = READ_WRITE_WAIT;
				end
			end
			READ : 
			begin
				next_din_ready = 1'b1;
				next_din_addr = {7'd0 , delay_data_addr[10:0]};
				nextstate_init = READ_WRITE_WAIT;
			end
			WRITE : 
			begin
				next_dout_burst_ready = 1'b1;
				next_dout_addr = {7'd0 , rmw_addr[10:0]};
				//compare
				if(din[215:200] == 16'd0)
				begin	
					next_dout_data[215:200] = count_data[15:0];		//SRAM_ID
					{next_dout_data[199:180] , next_dout_data[143:132]} = 32'd1;	//packet count
					{next_dout_data[131:108] , next_dout_data[71:36]} = {44'd0 , count_data[31:16]};	//byte count
					next_dout_data[179:144] = 36'd0;
					next_dout_data[107:72] = 36'd0;
					next_dout_data[35:0] = 36'd0;
				end
				else if(din[215:200] == count_data[15:0])
				begin		
					{next_dout_data[199:180] , next_dout_data[143:132]} = {next_dout_data[199:180] , next_dout_data[143:132]} + 1;	//packet count
					{next_dout_data[131:108] , next_dout_data[71:36]} = {next_dout_data[131:108] , next_dout_data[71:36]} + count_data[31:16];	//byte count
					next_dout_data[179:144] = din[179:144];
					next_dout_data[107:72] = din[107:72];
					next_dout_data[35:0] = din[35:0];
				end
				else if(din[179:164] == 16'd0)
				begin
					next_dout_data[179:164] = count_data[15:0];		//SRAM_ID
					{next_dout_data[163:144] , next_dout_data[107:96]} = 32'd1;	//packet count
					{next_dout_data[85:72] , next_dout_data[35:0]} = {44'd0 , count_data[31:16]};	//byte count
					next_dout_data[215:180] = din[215:180];
					next_dout_data[143:108] = din[143:108];
					next_dout_data[71:36] = din[71:36];
				end
				else if(din[179:164] == count_data[15:0])
				begin		
					{next_dout_data[163:144] , next_dout_data[107:96]} = {next_dout_data[163:144] , next_dout_data[107:96]} + 1;	//packet count
					{next_dout_data[85:72] , next_dout_data[35:0]} = {next_dout_data[85:72] , next_dout_data[35:0]} + count_data[31:16];	//byte count
					next_dout_data[215:180] = din[215:180];
					next_dout_data[143:108] = din[143:108];
					next_dout_data[71:36] = din[71:36];
				end
				next_din_ready = 1'b1;
				next_din_addr = {7'd0 , rmw_addr[10:0]};
				nextstate_init = READ_WRITE_WAIT;
			end
			default : 
			begin
				next_dout_burst_ready = 1'b0;
				next_dout_data = 216'd0;
				next_dout_addr = 19'd0;
				next_din_ready = 1'b0;
				next_din_addr = 19'd0;
			end
		endcase
	end	

	always@(posedge clk)
	begin
		if(reset)
		begin
			delay_data_addr <= 19'd0;
		end
		else
		begin
			delay_data_addr <= write_data_addr;
		end
	end	
	
	fifo_addr_delay 
	fifo_addr_delay 
	(
		.clk(clk), 			// input clk
	  	.rst(reset), 			// input rst
		.din(write_data_addr[18:0]), 	// input [18 : 0] din
	  	.wr_en(write_data_valid), 	// input wr_en
	  	.rd_en(din_valid), 		// input rd_en
	  	.dout(rmw_addr),		// output [18 : 0] dout
	  	.full(), 			// output full
	  	.empty(), 			// output empty
	  	.valid(delay_addr_valid) 	// output valid
	);
	
	count_delay 
	count_delay 
	(
  		.clk(clk), 			// input clk
  		.rst(reset), 			// input rst
  		.din(write_data[63:32]), 	// input [31 : 0] din
  		.wr_en(write_data_valid), 	// input wr_en
  		.rd_en(din_valid), 		// input rd_en
  		.dout(count_data), 		// output [31 : 0] dout
  		.full(), 			// output full
  		.empty() ,			// output empty
		.valid(count_delay_valid) 	// output valid
	);

endmodule

