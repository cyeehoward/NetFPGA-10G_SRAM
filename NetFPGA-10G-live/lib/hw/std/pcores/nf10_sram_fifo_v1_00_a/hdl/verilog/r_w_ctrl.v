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
   	output reg [((8*TDATA_WIDTH+9)-1):0]  				read_data,
   	output                         					read_data_valid,
    	output reg 			  				read_empty,
    	output reg                     					read_burst_state,
	
	input 		[((8*TDATA_WIDTH+9)-1):0]  			write_data,
	input 		[31:0]  					write_data_addr,
	input                          					write_data_valid,
	output reg 			  				write_full,
	output reg                     					next_write_burst_state,

	input                          					sram_read_full,
	input                          					sram_write_full,
	output reg 	[(MEM_WIDTH*NUM_MEM_INPUTS-1):0] 		dout,
	output reg 	[(MEM_ADDR_WIDTH-1):0]  			dout_addr,
	output reg                         				dout_burst_ready,
	input  		[(MEM_WIDTH*NUM_MEM_INPUTS-1):0] 		din,
	input  		[(NUM_MEM_CHIPS-1):0]            		din_valid,
	input  		[(NUM_MEM_CHIPS-1):0]            		pre_din_valid,
	output reg 	[(MEM_ADDR_WIDTH-1):0]  			din_addr,
	output reg                         				din_ready,
	input								cal_done
);
	//state declare
	reg		[2:0]						state_init , nextstate_init;
	parameter IDLE = 0 , INIT = 1 , INIT_READ = 2 , READ_WRITE_WAIT = 3 , READ = 4 , WRITE = 5 , INIT_READ_1 = 6;
	
	reg 		[(MEM_WIDTH*NUM_MEM_INPUTS-1):0] 		next_dout_data;
	reg 		[(MEM_ADDR_WIDTH-1):0]  			next_dout_addr;
	reg                         					next_dout_burst_ready;
	reg 		[(MEM_ADDR_WIDTH-1):0]  			next_din_addr;
	reg                         					next_din_ready;
	reg		[11:0]						reg_rmw_addr;
	reg		[18:0]						rmw_addr;
	wire								delay_addr_valid , count_delay_valid;
	reg								pre_count_data_num , count_data_num;
	reg								pre_mod_finish , mod_finish;
	reg								data_r_en , write_data_rn;
	reg								delay_read;
	reg		[1:0]						read_vaild_num;
	//use shift register to save the data
	reg		[3:0]		change_data , pre_change_data;
	reg		[13:0]		data_bit_array;
	reg		[54:0]		addr_count_data			[13:0];
	reg		[3:0]		packet_count_ID_0;
	reg		[15:0]		byte_count_ID_0;
	reg		[15:0]		SRAM_ID_0;
	reg		[35:0]		addr_count_data_ID_1	[12:0];
	reg		[3:0]		packet_count_ID_1;
	reg		[15:0]		byte_count_ID_1;
	reg		[15:0]		SRAM_ID_1;
	reg		[35:0]		addr_count_data_ID_2	[11:0];
	reg		[3:0]		packet_count_ID_2;
	reg		[15:0]		byte_count_ID_2;
	reg		[15:0]		SRAM_ID_2;
	reg		[35:0]		addr_count_data_ID_3	[10:0];
	reg		[3:0]		packet_count_ID_3;
	reg		[15:0]		byte_count_ID_3;
	reg		[15:0]		SRAM_ID_3;
	//delay two clock cycle while need to read but in write state	
	reg 		[((8*TDATA_WIDTH+9)-1):0]  	delay1_write_data;
	reg 		[31:0]  			delay1_write_data_addr;
	reg                          			delay1_write_data_valid;
	reg 		[((8*TDATA_WIDTH+9)-1):0]  	delay2_write_data;
	reg 		[31:0]  			delay2_write_data_addr;
	reg                          			delay2_write_data_valid;
	reg 		[((8*TDATA_WIDTH+9)-1):0]  	delay3_write_data;
	reg 		[31:0]  			delay3_write_data_addr;
	reg                          			delay3_write_data_valid;
	reg 		[((8*TDATA_WIDTH+9)-1):0]  	delay4_write_data;
	reg 		[31:0]  			delay4_write_data_addr;
	reg                          			delay4_write_data_valid;

	///////////////////////////////////////////////////////////////////////////////	
	//for initial data read
	//only for test 
	reg	[18:0]	test;
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			test <= 1'b0;
		end
		else if((test == 19'd6000) && (state_init == INIT_READ))
		begin
			test <= test;
		end
		else if((test == 19'd7000) && (state_init == INIT_READ_1))
		begin
			test <= test;
		end
		else
		begin
			test <= test + 1'b1;
		end
	end
	///////////////////////////////////////////////////////////////////////////////	
	//for counting the data finish
	reg	count_data_rn;
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			count_data_rn <= 1'b0;
		end
		else if(pre_din_valid)
		begin
			count_data_rn <= count_data_rn + 1'b1;
		end
		else
		begin
			count_data_rn <= 1'b0;
		end
	end
	///////////////////////////////////////////////////////////////////////////////	
	//din data delay to wait for the address and data	
	reg	[(MEM_WIDTH*NUM_MEM_INPUTS-1):0]	delay_din , delay_1_din;
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			delay_din <= 216'd0;
			delay_1_din <= 216'd0;
		end
		else
		begin
			delay_din <= din;
			delay_1_din <= delay_din;
		end
	end
	///////////////////////////////////////////////////////////////////////////////	
	//delay two clock cycle while need to read but in write state	
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			delay1_write_data <= 201'd0;
			delay1_write_data_addr <= 32'd0;		
			delay1_write_data_valid <= 1'b0;
			delay2_write_data <= 201'd0;
			delay2_write_data_addr <= 32'd0;		
			delay2_write_data_valid <= 1'b0;
			delay3_write_data <= 201'd0;
			delay3_write_data_addr <= 32'd0;		
			delay3_write_data_valid <= 1'b0;
			delay4_write_data <= 201'd0;
			delay4_write_data_addr <= 32'd0;		
			delay4_write_data_valid <= 1'b0;
		end
		else
		begin
			delay1_write_data <= write_data;
			delay1_write_data_addr <= write_data_addr;		
			delay1_write_data_valid <= write_data_valid;
			delay2_write_data <= delay1_write_data;
			delay2_write_data_addr <= delay1_write_data_addr;		
			delay2_write_data_valid <= delay1_write_data_valid;
			delay3_write_data <= delay2_write_data;
			delay3_write_data_addr <= delay2_write_data_addr;		
			delay3_write_data_valid <= delay2_write_data_valid;
			delay4_write_data <= delay3_write_data;
			delay4_write_data_addr <= delay3_write_data_addr;		
			delay4_write_data_valid <= delay3_write_data_valid;
		end
	end
	///////////////////////////////////////////////////////////////////////////////	
	//din data delay --> wait for the state change	
	reg	[7:0]	vaild_count;
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			vaild_count <= 8'd0;
		end
		else if(write_data_valid)
		begin
			vaild_count <= vaild_count + 1;
		end
		else if(dout_burst_ready)// || (write_data_valid || delay1_write_data_valid)
		begin
			if(vaild_count == 8'd0)
			begin
				vaild_count <= 8'd0;
			end
			else
			begin
				vaild_count <= vaild_count - 1;
			end	
		end
		else
		begin
			vaild_count <= vaild_count;
		end
	end
	///////////////////////////////////////////////////////////////////////////////
	//state delay for enable compatator
	reg	ena_comp;
	/*always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			ena_comp <= 1'b0;
		end
		else if(nextstate_init == READ)
		begin
			ena_comp <= 1'b1;
		end
		else
		begin
			ena_comp <= 1'b0;
		end
	end*/
	always@(*)
	begin
		if(nextstate_init == READ)
		begin
			ena_comp = 1'b1;
		end
		else
		begin
			ena_comp = 1'b0;
		end
	end
	///////////////////////////////////////////////////////////////////////////////
	//compare address module
	wire	[3:0]	comp_result_0 , comp_result_1;
	wire	[1:0]	addr_iden;
	compare_addr U0(
	.clk(clk) , 
	.reset(reset) , 
	.ena(ena_comp) ,//&delay2_write_data_vaild
	.data_comp_result(comp_result_0) ,
	.addr_iden(addr_iden[0]) ,	
	.addr_count_data_0(addr_count_data[0][50:32]) , 
	.addr_count_data_1(addr_count_data[1][50:32]) , 
	.addr_count_data_2(addr_count_data[2][50:32]) , 
	.addr_count_data_3(addr_count_data[3][50:32]) ,
	.addr_count_data_4(addr_count_data[4][50:32]) , 
	.addr_count_data_5(addr_count_data[5][50:32]) , 
	.addr_count_data_6(addr_count_data[6][50:32]) , 
	.addr_count_data_7(addr_count_data[7][50:32]) , 
	.addr_count_data_8(addr_count_data[8][50:32]) , 
	.addr_count_data_9(addr_count_data[9][50:32]) , 
	.addr_count_data_10(addr_count_data[10][50:32]) , 
	.addr_count_data_11(addr_count_data[11][50:32]) , 
	.addr_count_data_12(addr_count_data[12][50:32]) , 
	.addr_count_data_13(addr_count_data[13][50:32]) , 
	.packet_in_addr(delay2_write_data_addr[18:0]));
	
	compare_addr U1(
	.clk(clk) , 
	.reset(reset) , 
	.ena(ena_comp) ,//&write_data_vaild
	.data_comp_result(comp_result_1),
	.addr_iden(addr_iden[1]) ,	
	.addr_count_data_0(addr_count_data[0][50:32]) , 
	.addr_count_data_1(addr_count_data[1][50:32]) , 
	.addr_count_data_2(addr_count_data[2][50:32]) , 
	.addr_count_data_3(addr_count_data[3][50:32]) ,
	.addr_count_data_4(addr_count_data[4][50:32]) , 
	.addr_count_data_5(addr_count_data[5][50:32]) , 
	.addr_count_data_6(addr_count_data[6][50:32]) , 
	.addr_count_data_7(addr_count_data[7][50:32]) , 
	.addr_count_data_8(addr_count_data[8][50:32]) , 
	.addr_count_data_9(addr_count_data[9][50:32]) , 
	.addr_count_data_10(addr_count_data[10][50:32]) , 
	.addr_count_data_11(addr_count_data[11][50:32]) , 
	.addr_count_data_12(addr_count_data[12][50:32]) , 
	.addr_count_data_13(addr_count_data[13][50:32]) , 
	.packet_in_addr(write_data_addr[18:0]));
	///////////////////////////////////////////////////////////////////////////////
	//compare SRAM ID module
	wire	[3:0]	id_comp_result_0_ID_0 , id_comp_result_1_ID_0;
	wire	[3:0]	id_comp_result_0_ID_1 , id_comp_result_1_ID_1;
	wire	[3:0]	id_comp_result_0_ID_2 , id_comp_result_1_ID_2;
	wire	[3:0]	id_comp_result_0_ID_3 , id_comp_result_1_ID_3;
	wire				id_comp_result_0_ID_0_valid , id_comp_result_1_ID_0_valid;
	wire				id_comp_result_0_ID_1_valid , id_comp_result_1_ID_1_valid;
	wire				id_comp_result_0_ID_2_valid , id_comp_result_1_ID_2_valid;
	wire				id_comp_result_0_ID_3_valid , id_comp_result_1_ID_3_valid;
	reg	[7:0] 	id_comp_result;
	wire	[7:0]		id_comp_zero;
	
	/*always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			id_comp_result <= 10'd0;
		end
		else
		begin
			case({pre_change_data , id_comp_zero[7] , id_comp_zero[6] , id_comp_zero[5] , id_comp_zero[4] , id_comp_zero[3] , id_comp_zero[2] , id_comp_zero[1] , id_comp_zero[0] , id_comp_result_0_ID_3_valid , id_comp_result_1_ID_3_valid , id_comp_result_0_ID_2_valid , id_comp_result_1_ID_2_valid , id_comp_result_0_ID_1_valid , id_comp_result_1_ID_1_valid , id_comp_result_0_ID_0_valid , id_comp_result_1_ID_0_valid})
				//data_addr not zero
				16'b0000_0000_0000_0001:id_comp_result <= {4'd1 , id_comp_result_1_ID_0};
				16'b0000_0000_0000_0010:id_comp_result <= {4'd2 , id_comp_result_0_ID_0};
				16'b0000_0000_0000_0100:id_comp_result <= {4'd3 , id_comp_result_1_ID_1};
				16'b0000_0000_0000_1000:id_comp_result <= {4'd4 , id_comp_result_0_ID_1};
				16'b0000_0000_0001_0000:id_comp_result <= {4'd5 , id_comp_result_1_ID_2};
				16'b0000_0000_0010_0000:id_comp_result <= {4'd6 , id_comp_result_0_ID_2};
				16'b0000_0000_0100_0000:id_comp_result <= {4'd7 , id_comp_result_1_ID_3};
				16'b0000_0000_1000_0000:id_comp_result <= {4'd8 , id_comp_result_0_ID_3};
				//data_addr is zero
				default:		  
				begin id_comp_result <= 10'd0;
					pre_change_data
				end
			endcase
		end
	end*/
	always@(*)
	begin
		case({id_comp_result_0_ID_3_valid , id_comp_result_1_ID_3_valid , id_comp_result_0_ID_2_valid , id_comp_result_1_ID_2_valid , id_comp_result_0_ID_1_valid , id_comp_result_1_ID_1_valid , id_comp_result_0_ID_0_valid , id_comp_result_1_ID_0_valid})
			//data_addr not zero
			8'b0000_0001:id_comp_result = {4'd1 , id_comp_result_1_ID_0};
			8'b0000_0010:id_comp_result = {4'd2 , id_comp_result_0_ID_0};
			8'b0000_0100:id_comp_result = {4'd3 , id_comp_result_1_ID_1};
			8'b0000_1000:id_comp_result = {4'd4 , id_comp_result_0_ID_1};
			8'b0001_0000:id_comp_result = {4'd5 , id_comp_result_1_ID_2};
			8'b0010_0000:id_comp_result = {4'd6 , id_comp_result_0_ID_2};
			8'b0100_0000:id_comp_result = {4'd7 , id_comp_result_1_ID_3};
			8'b1000_0000:id_comp_result = {4'd8 , id_comp_result_0_ID_3};
			default://id_comp_result = 9'd0;
			begin
				case(id_comp_zero[7:2]&addr_iden)
					8'b1111_1101:id_comp_result = {5'd2 , id_comp_result_1_ID_1};
					8'b1111_1110:id_comp_result = {5'd1 , id_comp_result_0_ID_1};
					8'b1111_0001:id_comp_result = {5'd4 , id_comp_result_1_ID_2};
					8'b1111_0010:id_comp_result = {5'd3 , id_comp_result_0_ID_2};
					8'b1100_0001:id_comp_result = {5'd6 , id_comp_result_1_ID_3};
					8'b1100_0010:id_comp_result = {5'd5 , id_comp_result_0_ID_3};
					default:id_comp_result = 9'd0;
				endcase
			end
		endcase
	end
	
	compare_sram_id U2(
	.ena(addr_iden[0]|addr_iden[1]) ,//&write_data_valid
	.change_data(pre_change_data) , 
	.id_comp_result(id_comp_result_0_ID_0) ,
	.id_comp_result_valid(id_comp_result_0_ID_0_valid) ,
	.id_comp_zero_valid(id_comp_zero[0]) , 
	.ID_data((addr_count_data[pre_change_data][15:0])) , 
	.packet_in_ID(delay1_write_data[47:32]));
	
	compare_sram_id U3(
	.ena(addr_iden[0]|addr_iden[1]) ,//&write_data_valid
	.change_data(pre_change_data) , 
	.id_comp_result(id_comp_result_1_ID_0) ,
	.id_comp_result_valid(id_comp_result_1_ID_0_valid) ,
	.id_comp_zero_valid(id_comp_zero[1]) , 
	.ID_data((addr_count_data[pre_change_data][15:0])) , 
	.packet_in_ID(delay3_write_data[47:32]));
	
	compare_sram_id U4(
	.ena(addr_iden[0]|addr_iden[1]) ,//&write_data_valid
	.change_data(pre_change_data) , 
	.id_comp_result(id_comp_result_0_ID_1) ,
	.id_comp_result_valid(id_comp_result_0_ID_1_valid) ,
	.id_comp_zero_valid(id_comp_zero[2]) , 
	.ID_data((addr_count_data_ID_1[pre_change_data][15:0])) , 
	.packet_in_ID(delay1_write_data[47:32]));
	
	compare_sram_id U5(
	.ena(addr_iden[0]|addr_iden[1]) ,//&write_data_valid
	.change_data(pre_change_data) , 
	.id_comp_result(id_comp_result_1_ID_1) ,
	.id_comp_result_valid(id_comp_result_1_ID_1_valid) ,
	.id_comp_zero_valid(id_comp_zero[3]) , 
	.ID_data((addr_count_data_ID_1[pre_change_data][15:0])) , 
	.packet_in_ID(delay3_write_data[47:32]));
	
	compare_sram_id U6(
	.ena(addr_iden[0]|addr_iden[1]) ,//&write_data_valid
	.change_data(pre_change_data) , 
	.id_comp_result(id_comp_result_0_ID_2) ,
	.id_comp_result_valid(id_comp_result_0_ID_2_valid) ,
	.id_comp_zero_valid(id_comp_zero[4]) , 
	.ID_data((addr_count_data_ID_2[pre_change_data][15:0])) , 
	.packet_in_ID(delay1_write_data[47:32]));
	
	compare_sram_id U7(
	.ena(addr_iden[0]|addr_iden[1]) ,//&write_data_valid
	.change_data(pre_change_data) , 
	.id_comp_result(id_comp_result_1_ID_2) ,
	.id_comp_result_valid(id_comp_result_1_ID_2_valid) ,
	.id_comp_zero_valid(id_comp_zero[5]) , 
	.ID_data((addr_count_data_ID_2[pre_change_data][15:0])) , 
	.packet_in_ID(delay3_write_data[47:32]));
	
	compare_sram_id U8(
	.ena(addr_iden[0]|addr_iden[1]) ,//&write_data_valid
	.change_data(pre_change_data) , 
	.id_comp_result(id_comp_result_0_ID_3) ,
	.id_comp_result_valid(id_comp_result_0_ID_3_valid) ,
	.id_comp_zero_valid(id_comp_zero[6]) , 
	.ID_data((addr_count_data_ID_3[pre_change_data][15:0])) , 
	.packet_in_ID(delay1_write_data[47:32]));
	
	compare_sram_id U9(
	.ena(addr_iden[0]|addr_iden[1]) ,//&write_data_valid
	.change_data(pre_change_data) , 
	.id_comp_result(id_comp_result_1_ID_3) ,
	.id_comp_result_valid(id_comp_result_1_ID_3_valid) ,
	.id_comp_zero_valid(id_comp_zero[7]) , 
	.ID_data((addr_count_data_ID_3[pre_change_data][15:0])) , 
	.packet_in_ID(delay3_write_data[47:32]));
	
	/*compare_sram_id U2(
	.clk(clk) , 
	.reset(reset) ,
	.ena(ena_comp) ,//&write_data_valid
	.id_comp_result(id_comp_result_0_ID_0) ,
	.id_comp_result_valid(id_comp_result_0_ID_0_valid) ,
	.id_comp_zero_valid(id_comp_zero[0]) , 
	.ID_data_0((addr_count_data[0][15:0])&&data_bit_array[0]) , 
	.ID_data_1((addr_count_data[1][15:0])&&data_bit_array[1]) , 
	.ID_data_2((addr_count_data[2][15:0])&&data_bit_array[2]) , 
	.ID_data_3((addr_count_data[3][15:0])&&data_bit_array[3]) ,
	.ID_data_4((addr_count_data[4][15:0])&&data_bit_array[4]) , 
	.ID_data_5((addr_count_data[5][15:0])&&data_bit_array[5]) , 
	.ID_data_6((addr_count_data[6][15:0])&&data_bit_array[6]) , 
	.ID_data_7((addr_count_data[7][15:0])&&data_bit_array[7]) , 
	.ID_data_8((addr_count_data[8][15:0])&&data_bit_array[8]) , 
	.ID_data_9((addr_count_data[9][15:0])&&data_bit_array[9]) , 
	.ID_data_10((addr_count_data[10][15:0])&&data_bit_array[10]) , 
	.ID_data_11((addr_count_data[11][15:0])&&data_bit_array[11]) , 
	.ID_data_12((addr_count_data[12][15:0])&&data_bit_array[12]) , 
	.ID_data_13((addr_count_data[13][15:0])&&data_bit_array[13]) , 
	.packet_in_ID(write_data[47:32]));
	
	compare_sram_id U3(
	.clk(clk) , 
	.reset(reset) ,
	.ena(ena_comp) ,//&delay2_write_data_valid
	.id_comp_result(id_comp_result_1_ID_0) , 
	.id_comp_result_valid(id_comp_result_1_ID_0_valid) ,
	.id_comp_zero_valid(id_comp_zero[1]) , 
	.ID_data_0((addr_count_data[0][15:0])&&data_bit_array[0]) , 
	.ID_data_1((addr_count_data[1][15:0])&&data_bit_array[1]) , 
	.ID_data_2((addr_count_data[2][15:0])&&data_bit_array[2]) , 
	.ID_data_3((addr_count_data[3][15:0])&&data_bit_array[3]) ,
	.ID_data_4((addr_count_data[4][15:0])&&data_bit_array[4]) , 
	.ID_data_5((addr_count_data[5][15:0])&&data_bit_array[5]) , 
	.ID_data_6((addr_count_data[6][15:0])&&data_bit_array[6]) , 
	.ID_data_7((addr_count_data[7][15:0])&&data_bit_array[7]) , 
	.ID_data_8((addr_count_data[8][15:0])&&data_bit_array[8]) , 
	.ID_data_9((addr_count_data[9][15:0])&&data_bit_array[9]) , 
	.ID_data_10((addr_count_data[10][15:0])&&data_bit_array[10]) , 
	.ID_data_11((addr_count_data[11][15:0])&&data_bit_array[11]) , 
	.ID_data_12((addr_count_data[12][15:0])&&data_bit_array[12]) , 
	.ID_data_13((addr_count_data[13][15:0])&&data_bit_array[13]) , 
	.packet_in_ID(delay2_write_data[47:32]));
	
	compare_sram_id U4(
	.clk(clk) , 
	.reset(reset) ,
	.ena(ena_comp) ,//&write_data_valid
	.id_comp_result(id_comp_result_0_ID_1) , 
	.id_comp_result_valid(id_comp_result_0_ID_1_valid) ,
	.id_comp_zero_valid(id_comp_zero[2]) , 
	.ID_data_0((addr_count_data_ID_1[0][15:0])&&data_bit_array[1]) , 
	.ID_data_1((addr_count_data_ID_1[1][15:0])&&data_bit_array[2]) , 
	.ID_data_2((addr_count_data_ID_1[2][15:0])&&data_bit_array[3]) , 
	.ID_data_3((addr_count_data_ID_1[3][15:0])&&data_bit_array[4]) ,
	.ID_data_4((addr_count_data_ID_1[4][15:0])&&data_bit_array[5]) , 
	.ID_data_5((addr_count_data_ID_1[5][15:0])&&data_bit_array[6]) , 
	.ID_data_6((addr_count_data_ID_1[6][15:0])&&data_bit_array[7]) , 
	.ID_data_7((addr_count_data_ID_1[7][15:0])&&data_bit_array[8]) , 
	.ID_data_8((addr_count_data_ID_1[8][15:0])&&data_bit_array[9]) , 
	.ID_data_9((addr_count_data_ID_1[9][15:0])&&data_bit_array[10]) , 
	.ID_data_10((addr_count_data_ID_1[10][15:0])&&data_bit_array[11]) , 
	.ID_data_11((addr_count_data_ID_1[11][15:0])&&data_bit_array[12]) , 
	.ID_data_12((addr_count_data_ID_1[12][15:0])&&data_bit_array[13]) , 
	.ID_data_13(0) ,  
	.packet_in_ID(write_data[47:32]));
	
	compare_sram_id U5(
	.clk(clk) , 
	.reset(reset) ,
	.ena(ena_comp) ,//&delay2_write_data_valid
	.id_comp_result(id_comp_result_1_ID_1) , 
	.id_comp_result_valid(id_comp_result_1_ID_1_valid) ,
	.id_comp_zero_valid(id_comp_zero[3]) , 
	.ID_data_0((addr_count_data_ID_1[0][15:0])&&data_bit_array[1]) , 
	.ID_data_1((addr_count_data_ID_1[1][15:0])&&data_bit_array[2]) , 
	.ID_data_2((addr_count_data_ID_1[2][15:0])&&data_bit_array[3]) , 
	.ID_data_3((addr_count_data_ID_1[3][15:0])&&data_bit_array[4]) ,
	.ID_data_4((addr_count_data_ID_1[4][15:0])&&data_bit_array[5]) , 
	.ID_data_5((addr_count_data_ID_1[5][15:0])&&data_bit_array[6]) , 
	.ID_data_6((addr_count_data_ID_1[6][15:0])&&data_bit_array[7]) , 
	.ID_data_7((addr_count_data_ID_1[7][15:0])&&data_bit_array[8]) , 
	.ID_data_8((addr_count_data_ID_1[8][15:0])&&data_bit_array[9]) , 
	.ID_data_9((addr_count_data_ID_1[9][15:0])&&data_bit_array[10]) , 
	.ID_data_10((addr_count_data_ID_1[10][15:0])&&data_bit_array[11]) , 
	.ID_data_11((addr_count_data_ID_1[11][15:0])&&data_bit_array[12]) , 
	.ID_data_12((addr_count_data_ID_1[12][15:0])&&data_bit_array[13]) , 
	.ID_data_13(0) ,  
	.packet_in_ID(delay2_write_data[47:32]));
	
	compare_sram_id U6(
	.clk(clk) , 
	.reset(reset) ,
	.ena(ena_comp) ,//&write_data_valid
	.id_comp_result(id_comp_result_0_ID_2) , 
	.id_comp_result_valid(id_comp_result_0_ID_2_valid) ,
	.id_comp_zero_valid(id_comp_zero[4]) , 
	.ID_data_0((addr_count_data_ID_2[0][15:0])&&data_bit_array[2]) , 
	.ID_data_1((addr_count_data_ID_2[1][15:0])&&data_bit_array[3]) , 
	.ID_data_2((addr_count_data_ID_2[2][15:0])&&data_bit_array[4]) , 
	.ID_data_3((addr_count_data_ID_2[3][15:0])&&data_bit_array[5]) ,
	.ID_data_4((addr_count_data_ID_2[4][15:0])&&data_bit_array[6]) , 
	.ID_data_5((addr_count_data_ID_2[5][15:0])&&data_bit_array[7]) , 
	.ID_data_6((addr_count_data_ID_2[6][15:0])&&data_bit_array[8]) , 
	.ID_data_7((addr_count_data_ID_2[7][15:0])&&data_bit_array[9]) , 
	.ID_data_8((addr_count_data_ID_2[8][15:0])&&data_bit_array[10]) , 
	.ID_data_9((addr_count_data_ID_2[9][15:0])&&data_bit_array[11]) , 
	.ID_data_10((addr_count_data_ID_2[10][15:0])&&data_bit_array[12]) , 
	.ID_data_11((addr_count_data_ID_2[11][15:0])&&data_bit_array[13]) , 
	.ID_data_12(0) , 
	.ID_data_13(0) ,  
	.packet_in_ID(write_data[47:32]));
	
	compare_sram_id U7(
	.clk(clk) , 
	.reset(reset) ,
	.ena(ena_comp) ,//&delay2_write_data_valid
	.id_comp_result(id_comp_result_1_ID_2) , 
	.id_comp_result_valid(id_comp_result_1_ID_2_valid) ,
	.id_comp_zero_valid(id_comp_zero[5]) , 
	.ID_data_0((addr_count_data_ID_2[0][15:0])&&data_bit_array[2]) , 
	.ID_data_1((addr_count_data_ID_2[1][15:0])&&data_bit_array[3]) , 
	.ID_data_2((addr_count_data_ID_2[2][15:0])&&data_bit_array[4]) , 
	.ID_data_3((addr_count_data_ID_2[3][15:0])&&data_bit_array[5]) ,
	.ID_data_4((addr_count_data_ID_2[4][15:0])&&data_bit_array[6]) , 
	.ID_data_5((addr_count_data_ID_2[5][15:0])&&data_bit_array[7]) , 
	.ID_data_6((addr_count_data_ID_2[6][15:0])&&data_bit_array[8]) , 
	.ID_data_7((addr_count_data_ID_2[7][15:0])&&data_bit_array[9]) , 
	.ID_data_8((addr_count_data_ID_2[8][15:0])&&data_bit_array[10]) , 
	.ID_data_9((addr_count_data_ID_2[9][15:0])&&data_bit_array[11]) , 
	.ID_data_10((addr_count_data_ID_2[10][15:0])&&data_bit_array[12]) , 
	.ID_data_11((addr_count_data_ID_2[11][15:0])&&data_bit_array[13]) , 
	.ID_data_12(0) , 
	.ID_data_13(0) ,  
	.packet_in_ID(delay2_write_data[47:32]));
	
	compare_sram_id U8(
	.clk(clk) , 
	.reset(reset) ,
	.ena(ena_comp) ,//&write_data_valid
	.id_comp_result(id_comp_result_0_ID_3) , 
	.id_comp_result_valid(id_comp_result_0_ID_3_valid) ,
	.id_comp_zero_valid(id_comp_zero[6]) , 
	.ID_data_0((addr_count_data_ID_3[0][15:0])&&data_bit_array[3]) , 
	.ID_data_1((addr_count_data_ID_3[1][15:0])&&data_bit_array[4]) , 
	.ID_data_2((addr_count_data_ID_3[2][15:0])&&data_bit_array[5]) , 
	.ID_data_3((addr_count_data_ID_3[3][15:0])&&data_bit_array[6]) ,
	.ID_data_4((addr_count_data_ID_3[4][15:0])&&data_bit_array[7]) , 
	.ID_data_5((addr_count_data_ID_3[5][15:0])&&data_bit_array[8]) , 
	.ID_data_6((addr_count_data_ID_3[6][15:0])&&data_bit_array[9]) , 
	.ID_data_7((addr_count_data_ID_3[7][15:0])&&data_bit_array[10]) , 
	.ID_data_8((addr_count_data_ID_3[8][15:0])&&data_bit_array[11]) , 
	.ID_data_9((addr_count_data_ID_3[9][15:0])&&data_bit_array[12]) , 
	.ID_data_10((addr_count_data_ID_3[10][15:0])&&data_bit_array[13]) , 
	.ID_data_11(0) , 
	.ID_data_12(0) , 
	.ID_data_13(0) , 
	.packet_in_ID(write_data[47:32]));
	
	compare_sram_id U9(
	.clk(clk) , 
	.reset(reset) ,
	.ena(ena_comp) ,//&delay2_write_data_valid
	.id_comp_result(id_comp_result_1_ID_3) ,
	.id_comp_result_valid(id_comp_result_1_ID_3_valid) ,
	.id_comp_zero_valid(id_comp_zero[7]) , 
	.ID_data_0((addr_count_data_ID_3[0][15:0])&&data_bit_array[3]) , 
	.ID_data_1((addr_count_data_ID_3[1][15:0])&&data_bit_array[4]) , 
	.ID_data_2((addr_count_data_ID_3[2][15:0])&&data_bit_array[5]) , 
	.ID_data_3((addr_count_data_ID_3[3][15:0])&&data_bit_array[6]) ,
	.ID_data_4((addr_count_data_ID_3[4][15:0])&&data_bit_array[7]) , 
	.ID_data_5((addr_count_data_ID_3[5][15:0])&&data_bit_array[8]) , 
	.ID_data_6((addr_count_data_ID_3[6][15:0])&&data_bit_array[9]) , 
	.ID_data_7((addr_count_data_ID_3[7][15:0])&&data_bit_array[10]) , 
	.ID_data_8((addr_count_data_ID_3[8][15:0])&&data_bit_array[11]) , 
	.ID_data_9((addr_count_data_ID_3[9][15:0])&&data_bit_array[12]) , 
	.ID_data_10((addr_count_data_ID_3[10][15:0])&&data_bit_array[13]) , 
	.ID_data_11(0) , 
	.ID_data_12(0) , 
	.ID_data_13(0) , 
	.packet_in_ID(delay2_write_data[47:32]));*/
	///////////////////////////////////////////////////////////////////////////////
	//FSM for initialization
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			state_init <= IDLE;
		end
		else
		begin
			state_init <= nextstate_init;
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			dout <= 216'd0;
			dout_addr <= 19'd0;
			dout_burst_ready <= 1'b0;
			din_addr <= 19'd0;
			din_ready <= 1'b0;
			pre_count_data_num <= 1'b0;
			pre_mod_finish <= 1'b0;
			change_data <= 13'd0;
		end
		else
		begin
			dout <= next_dout_data;
			dout_addr <= next_dout_addr;
			dout_burst_ready <= next_dout_burst_ready;
			din_addr <= next_din_addr;
			din_ready <= next_din_ready;
			pre_count_data_num <= count_data_num;
			pre_mod_finish <= mod_finish;
			change_data <= pre_change_data;
		end
	end
	always@(state_init or cal_done or dout_addr or din_addr or test or din_valid or vaild_count or data_bit_array or delay3_write_data_valid or pre_count_data_num or delay_din or pre_mod_finish or write_data_valid or delay3_write_data_addr or delay1_write_data_addr or rmw_addr or SRAM_ID_0 or packet_count_ID_0 or byte_count_ID_0 or SRAM_ID_1 or packet_count_ID_1 or byte_count_ID_1 or SRAM_ID_2 or packet_count_ID_2 or byte_count_ID_2 or SRAM_ID_3 or packet_count_ID_3 or byte_count_ID_3 or delay2_write_data_valid or delay1_write_data_valid or comp_result_0 or comp_result_1)
	begin
		next_dout_burst_ready = 1'b0;
		next_dout_data = 216'd0;
		next_dout_addr = 19'd0;
		next_din_ready = 1'b0;
		next_din_addr = 19'd0;
		count_data_num = 1'b0;
		mod_finish = 1'b0;
		write_data_rn = 1'b0;
		delay_read = 1'b0;
		read_vaild_num = 2'd0;
		pre_change_data = 3'd0;
		//nextstate_init = IDLE;
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
			INIT : 											//~reset the memory to all zero
			begin
				if(dout_addr == 19'b111_1111_1111_1111_1111)//11'b111_1111_1111
				begin
					next_dout_burst_ready = 1'b0;
					next_dout_data = 216'd0;
					nextstate_init = INIT_READ;//READ_WRITE_WAIT
					next_dout_addr = 19'd0;
				end
				else
				begin
					next_dout_burst_ready = 1'b1;
					//next_dout_data = dout_addr + 1'b1;
					next_dout_data = 216'd0;
					next_dout_addr = dout_addr + 1'b1;
					nextstate_init = INIT;
				end
			end
			INIT_READ : 									//ensure the memory are all zero --> read from all memory location
			begin
				if(din_addr == 11'd16)
				begin
					next_din_ready = 1'b0;
					next_din_addr = 19'd0;
					nextstate_init = INIT_READ_1;
				end
				else if(test == 19'd6000)
				begin
					next_din_ready = 1'b1;
					next_din_addr = din_addr + 1'b1;
					nextstate_init = INIT_READ;
				end
				else
				begin
					next_din_ready = 1'b0;
					next_din_addr = 19'd0;
					nextstate_init = INIT_READ;
				end
			end
			INIT_READ_1 : 									//ensure the memory are all zero --> read from all memory location
			begin
				if(din_addr == 11'b111_1111_1111)
				begin
					next_din_ready = 1'b0;
					next_din_addr = 19'd0;
					nextstate_init = READ_WRITE_WAIT;
				end
				else if(test == 19'd7000)
				begin
					next_din_ready = 1'b1;
					next_din_addr = din_addr + 1'b1;
					nextstate_init = INIT_READ_1;
				end
				else
				begin
					next_din_ready = 1'b0;
					next_din_addr = 19'd0;
					nextstate_init = INIT_READ_1;
				end
			end
			READ_WRITE_WAIT : 								//stay at this state after initialization
			begin
				next_dout_burst_ready = 1'b0;
				next_dout_data = 216'd0;
				next_dout_addr = 19'd0;
				next_din_ready = 1'b0;
				next_din_addr = 19'd0;
				if(din_valid && (vaild_count != 8'd0))
				begin
					nextstate_init = WRITE;
				end
				else if(write_data_valid)
				begin
					nextstate_init = READ;
				end
				else
				begin
					nextstate_init = READ_WRITE_WAIT;
				end
			end
			READ : 
			begin
				//command read addr or change data in DFFs	
				if(comp_result_0!=0)
				begin
					next_din_addr = 19'd0;
					next_din_ready = 1'b0;
					read_vaild_num = 2'd0;
					pre_change_data = comp_result_0;
				end
				else if(comp_result_1!=0)
				begin
					next_din_addr = 19'd0;
					next_din_ready = 1'b0;
					read_vaild_num = 2'd0;
					pre_change_data = comp_result_1;
				end
				else	//there's no data in shift memory
				begin
					//send read addr
					if(delay3_write_data_valid)
					begin
						next_din_addr = {delay3_write_data_addr[18:0]};
						next_din_ready = 1'b1;
						read_vaild_num = 2'd1;
					end
					else
					begin
						next_din_addr = {delay1_write_data_addr[18:0]};
						next_din_ready = 1'b1;
						read_vaild_num = 2'd2;
					end
				end
				//state change 
				if(din_valid && (vaild_count != 8'd0))	
				begin
					nextstate_init = WRITE;
				end
				else
				begin
					nextstate_init = READ_WRITE_WAIT;
				end
			end
			WRITE : 
			begin
				count_data_num = pre_count_data_num + 1;
				//compare
				if(~pre_count_data_num)			//first data
				begin
					next_dout_burst_ready = 1'b1;
					next_dout_addr = {7'd0 , rmw_addr[10:0]};
					if(delay_din[215:200] == 16'd0)
					begin	
						next_dout_data[215:200] = SRAM_ID_0[15:0];		//SRAM_ID
						{next_dout_data[199:180] , next_dout_data[143:132]} = packet_count_ID_0;	//packet count
						{next_dout_data[131:108] , next_dout_data[71:36]} = {44'd0 , byte_count_ID_0};		//byte count							
						next_dout_data[179:144] = 36'd0;
						next_dout_data[107:72] = 36'd0;
						next_dout_data[35:0] = 36'd0;
						mod_finish = 1;
					end
					else if(delay_din[215:200] == SRAM_ID_0[15:0])
					begin	
						next_dout_data[215:200] = SRAM_ID_0[15:0];		//SRAM_ID
						{next_dout_data[199:180] , next_dout_data[143:132]} = {next_dout_data[199:180] , next_dout_data[143:132]} + packet_count_ID_0;	//packet count
						{next_dout_data[131:108] , next_dout_data[71:36]} = {next_dout_data[131:108] , next_dout_data[71:36]} + byte_count_ID_0;
						next_dout_data[179:144] = delay_din[179:144];
						next_dout_data[107:72] = delay_din[107:72];
						next_dout_data[35:0] = delay_din[35:0];
						mod_finish = 1;
					end
					else if(delay_din[179:164] == 16'd0)
					begin
						next_dout_data[179:164] = SRAM_ID_1[15:0];		//SRAM_ID
						{next_dout_data[163:144] , next_dout_data[107:96]} = packet_count_ID_1;	//packet count
						{next_dout_data[95:72] , next_dout_data[35:0]} = {44'd0 , byte_count_ID_1};	//byte count							
						next_dout_data[215:180] = delay_din[215:180];
						next_dout_data[143:108] = delay_din[143:108];
						next_dout_data[71:36] = delay_din[71:36];
						mod_finish = 1;
					end
					else if(delay_din[179:164] == SRAM_ID_1[15:0])
					begin	
						next_dout_data[179:164] = SRAM_ID_1[15:0];		//SRAM_ID
						{next_dout_data[163:144] , next_dout_data[107:96]} = {next_dout_data[163:144] , next_dout_data[107:96]} + packet_count_ID_1;	//packet count
						{next_dout_data[95:72] , next_dout_data[35:0]} = {next_dout_data[95:72] , next_dout_data[35:0]} + byte_count_ID_1;							
						next_dout_data[215:180] = delay_din[215:180];
						next_dout_data[143:108] = delay_din[143:108];
						next_dout_data[71:36] = delay_din[71:36];
						mod_finish = 1;
					end
					else
					begin
						next_dout_data = delay_din;
						mod_finish = 0;
					end

				end
				else					//second data
				begin
					if(delay_din[215:200] == 16'd0 && (~pre_mod_finish))
					begin	
						next_dout_data[215:200] = SRAM_ID_2[15:0];		//SRAM_ID
						{next_dout_data[199:180] , next_dout_data[143:132]} = packet_count_ID_2;	//packet count
						{next_dout_data[131:108] , next_dout_data[71:36]} = {44'd0 , byte_count_ID_2};		//byte count							
						next_dout_data[179:144] = 36'd0;
						next_dout_data[107:72] = 36'd0;
						next_dout_data[35:0] = 36'd0;
					end
					else if(delay_din[215:200] == SRAM_ID_2[15:0] && (~pre_mod_finish))
					begin	
						next_dout_data[215:200] = SRAM_ID_2[15:0];		//SRAM_ID
						{next_dout_data[199:180] , next_dout_data[143:132]} = {next_dout_data[199:180] , next_dout_data[143:132]} + packet_count_ID_2;	//packet count
						{next_dout_data[131:108] , next_dout_data[71:36]} = {next_dout_data[131:108] , next_dout_data[71:36]} + byte_count_ID_2;
						next_dout_data[179:144] = delay_din[179:144];
						next_dout_data[107:72] = delay_din[107:72];
						next_dout_data[35:0] = delay_din[35:0];	
					end
					else if(delay_din[179:164] == 16'd0 && (~pre_mod_finish))
					begin
						next_dout_data[179:164] = SRAM_ID_3[15:0];		//SRAM_ID
						{next_dout_data[163:144] , next_dout_data[107:96]} = packet_count_ID_3;	//packet count
						{next_dout_data[95:72] , next_dout_data[35:0]} = {44'd0 , byte_count_ID_3};	//byte count							
						next_dout_data[215:180] = delay_din[215:180];
						next_dout_data[143:108] = delay_din[143:108];
						next_dout_data[71:36] = delay_din[71:36];
					end
					else if(delay_din[179:164] == SRAM_ID_3[15:0] && (~pre_mod_finish))
					begin		
						next_dout_data[179:164] = SRAM_ID_3[15:0];		//SRAM_ID
						{next_dout_data[163:144] , next_dout_data[107:96]} = {next_dout_data[163:144] , next_dout_data[107:96]} + packet_count_ID_3;	//packet count
						{next_dout_data[95:72] , next_dout_data[35:0]} = {next_dout_data[95:72] , next_dout_data[35:0]} + byte_count_ID_3;					
						next_dout_data[215:180] = delay_din[215:180];
						next_dout_data[143:108] = delay_din[143:108];
						next_dout_data[71:36] = delay_din[71:36];
					end
					else if(delay2_write_data_valid|delay1_write_data_valid)
					begin
						delay_read = 1'b1;
					end
					else
					begin
						next_dout_data = delay_din;
					end
					mod_finish = 0;
					if(write_data_valid|delay_read)
					begin
						nextstate_init = READ;
					end
					else
					begin
						nextstate_init = READ_WRITE_WAIT;
					end
				end
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
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//delay compare signal
	reg	[8:0]	delay_id_comp_result;
	reg	[1:0]	delay_addr_iden;	
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			delay_id_comp_result 	<= 9'd0;
			delay_addr_iden		<= 2'd0;
		end
		else
		begin
			delay_id_comp_result 	<= id_comp_result;
			delay_addr_iden		<= addr_iden;
		end
	end
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//shift memory		
	//save data in DFFs
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			data_bit_array 			<= 14'd0;
			rmw_addr 					<= 19'd0;
			addr_count_data[0] 			<= 55'd0;
			addr_count_data[1] 			<= 55'd0;
			addr_count_data[2] 			<= 55'd0;
			addr_count_data[3] 			<= 55'd0;
			addr_count_data[4] 			<= 55'd0;
			addr_count_data[5] 			<= 55'd0;
			addr_count_data[6] 			<= 55'd0;
			addr_count_data[7] 			<= 55'd0;
			addr_count_data[8] 			<= 55'd0;
			addr_count_data[9] 			<= 55'd0;
			addr_count_data[10] 		<= 55'd0;
			addr_count_data[11] 		<= 55'd0;
			addr_count_data[12] 		<= 55'd0;
			addr_count_data[13] 		<= 55'd0;
			packet_count_ID_0 			<= 4'd0;
			byte_count_ID_0				<= 16'd0;
			SRAM_ID_0					<= 16'd0;
			addr_count_data_ID_1[0] 	<= 36'd0;
			addr_count_data_ID_1[1] 	<= 36'd0;
			addr_count_data_ID_1[2] 	<= 36'd0;
			addr_count_data_ID_1[3] 	<= 36'd0;
			addr_count_data_ID_1[4] 	<= 36'd0;
			addr_count_data_ID_1[5] 	<= 36'd0;
			addr_count_data_ID_1[6] 	<= 36'd0;
			addr_count_data_ID_1[7] 	<= 36'd0;
			addr_count_data_ID_1[8] 	<= 36'd0;
			addr_count_data_ID_1[9] 	<= 36'd0;
			addr_count_data_ID_1[10] 	<= 36'd0;
			addr_count_data_ID_1[11] 	<= 36'd0;
			addr_count_data_ID_1[12] 	<= 36'd0;
			packet_count_ID_1 			<= 4'd0;
			byte_count_ID_1				<= 16'd0;
			SRAM_ID_1					<= 16'd0;
			addr_count_data_ID_2[0] 	<= 36'd0;
			addr_count_data_ID_2[1] 	<= 36'd0;
			addr_count_data_ID_2[2] 	<= 36'd0;
			addr_count_data_ID_2[3] 	<= 36'd0;
			addr_count_data_ID_2[4] 	<= 36'd0;
			addr_count_data_ID_2[5] 	<= 36'd0;
			addr_count_data_ID_2[6] 	<= 36'd0;
			addr_count_data_ID_2[7] 	<= 36'd0;
			addr_count_data_ID_2[8] 	<= 36'd0;
			addr_count_data_ID_2[9] 	<= 36'd0;
			addr_count_data_ID_2[10] 	<= 36'd0;
			addr_count_data_ID_2[11] 	<= 36'd0;
			packet_count_ID_2 			<= 4'd0;
			byte_count_ID_2				<= 16'd0;
			SRAM_ID_2					<= 16'd0;
			addr_count_data_ID_3[0] 	<= 36'd0;
			addr_count_data_ID_3[1] 	<= 36'd0;
			addr_count_data_ID_3[2] 	<= 36'd0;
			addr_count_data_ID_3[3] 	<= 36'd0;
			addr_count_data_ID_3[4] 	<= 36'd0;
			addr_count_data_ID_3[5] 	<= 36'd0;
			addr_count_data_ID_3[6] 	<= 36'd0;
			addr_count_data_ID_3[7] 	<= 36'd0;
			addr_count_data_ID_3[8] 	<= 36'd0;
			addr_count_data_ID_3[9] 	<= 36'd0;
			addr_count_data_ID_3[10] 	<= 36'd0;
			packet_count_ID_3 			<= 4'd0;
			byte_count_ID_3				<= 16'd0;
			SRAM_ID_3					<= 16'd0;
		end
		else
		begin
			if(din_ready&((state_init == READ_WRITE_WAIT)||(state_init == READ)||(state_init == WRITE)))
			begin
				addr_count_data[0] 		<= {4'd1 , delay2_write_data_addr[18:0] , delay2_write_data[63:32]}|{4'd1 , delay4_write_data_addr[18:0] , delay4_write_data[63:32]};	//{packet_count --> 4bits , addr --> 19bits , data_byte --> 16bits , SRAM_ID --> 16bits}
				addr_count_data[1] 		<= addr_count_data[0];
				addr_count_data[2] 		<= addr_count_data[1];
				addr_count_data[3] 		<= addr_count_data[2];
				addr_count_data[4] 		<= addr_count_data[3];
				addr_count_data[5] 		<= addr_count_data[4];
				addr_count_data[6] 		<= addr_count_data[5];
				addr_count_data[7] 		<= addr_count_data[6];
				addr_count_data[8] 		<= addr_count_data[7];
				addr_count_data[9] 		<= addr_count_data[8];
				addr_count_data[10] 	<= addr_count_data[9];
				addr_count_data[11] 	<= addr_count_data[10];
				addr_count_data[12] 	<= addr_count_data[11];
				addr_count_data[13] 	<= addr_count_data[12];
				{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} <= addr_count_data[13];
				data_bit_array 			<= ((data_bit_array << 1)|1'b1); 
			end
			//when in READ state --> compre the packet_in addr and the addr in DFFs 
			else
			begin
				data_bit_array			<= data_bit_array << 1; //set the bit array left shift one bit
				case({id_comp_result , addr_iden , pre_change_data})
					14'b0001_0001_01_0001:
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[2];
						addr_count_data[2][54:51] 	<= {(addr_count_data[1][54:51] + 1'b1) , addr_count_data[1][50:32] , (addr_count_data[1][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end					
					14'b0010_0001_10_0001:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[2];
						addr_count_data[2][54:51] 	<= {(addr_count_data[1][54:51] + 1'b1) , addr_count_data[1][50:32] , (addr_count_data[1][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end				
					14'b0011_0001_01_0001:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					//if SRAM_ID isn't match first DFFs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1][15:0] 	<= delay3_write_data[47:32];	//byte_count
						addr_count_data_ID_1[1][31:16] 	<= delay3_write_data[63:48];	//SRAM_ID
						addr_count_data_ID_1[1][35:32] 	<= 4'b0001;						
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0100_0001_10_0001:
					//if SRAM_ID isn't the same in first Dffs
					//if SRAM_ID isn't match first DFFs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1][15:0] 	<= delay1_write_data[47:32];	//byte_count
						addr_count_data_ID_1[1][31:16] 	<= delay1_write_data[63:48];	//SRAM_ID
						addr_count_data_ID_1[1][35:32] 	<= 4'b0001;						
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end				
					14'b0001_0010_01_0010:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 55'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[3];
						addr_count_data[3]		 	<= {(addr_count_data[2][54:51] + 1'b1) , addr_count_data[2][50:32] , (addr_count_data[2][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0010_0010_10_0010:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 55'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[3];
						addr_count_data[3]		 	<= {(addr_count_data[2][54:51] + 1'b1) , addr_count_data[2][50:32] , (addr_count_data[2][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end					
					14'b0011_0010_01_0010:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2]	 	<= {(addr_count_data_ID_1[1][35:32] + 1'b1) , (addr_count_data_ID_1[1][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0100_0010_10_0010:
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2]	 	<= {(addr_count_data_ID_1[1][35:32] + 1'b1) , (addr_count_data_ID_1[1][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0101_0010_01_0010:
					begin
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1]	 	<= {4'b0001 , delay3_write_data[63:48] , delay3_write_data[47:32]};						
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0110_0010_10_0010:
					begin
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1]	 	<= {4'b0001 , delay1_write_data[63:48] , delay1_write_data[47:32]};						
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0001_0011_01_0011:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 55'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4]		 	<= {(addr_count_data[3][54:51] + 1'b1) , addr_count_data[3][50:32] , (addr_count_data[3][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0010_0011_10_0011:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 55'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4]		 	<= {(addr_count_data[3][54:51] + 1'b1) , addr_count_data[3][50:32] , (addr_count_data[3][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0011_0011_01_0011:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3]		<= {(addr_count_data_ID_1[2][35:32] + 1'b1) , (addr_count_data_ID_1[2][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0100_0011_10_0011:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3]		<= {(addr_count_data_ID_1[2][35:32] + 1'b1) , (addr_count_data_ID_1[2][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0101_0011_01_0011:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2]		<= {(addr_count_data_ID_2[1][35:32] + 1'b1) , (addr_count_data_ID_2[1][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0110_0011_10_0011:
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2]		<= {(addr_count_data_ID_2[1][35:32] + 1'b1) , (addr_count_data_ID_2[1][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0111_0011_01_0011:
					begin
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
						addr_count_data_ID_3[0] 	<= 36'd0;
						addr_count_data_ID_3[1]	 	<= {4'b0001 , delay3_write_data[63:48] , delay3_write_data[47:32]};						
						addr_count_data_ID_3[2] 	<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 	<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 	<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b0111_0011_10_0011:
					begin
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
						addr_count_data_ID_3[0] 	<= 36'd0;
						addr_count_data_ID_3[1]	 	<= {4'b0001 , delay1_write_data[63:48] , delay1_write_data[47:32]};						
						addr_count_data_ID_3[2] 	<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 	<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 	<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b0001_0100_01_0100:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5]		 	<= {(addr_count_data[4][54:51] + 1'b1) , addr_count_data[4][50:32] , (addr_count_data[4][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0010_0100_10_0100:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5]		 	<= {(addr_count_data[4][54:51] + 1'b1) , addr_count_data[4][50:32] , (addr_count_data[4][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0011_0100_01_0100:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4]		<= {(addr_count_data_ID_1[3][35:32] + 1'b1) , (addr_count_data_ID_1[3][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0100_0100_10_0100:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4]		<= {(addr_count_data_ID_1[3][35:32] + 1'b1) , (addr_count_data_ID_1[3][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0101_0100_01_0100:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3]	 	<= {(addr_count_data_ID_2[2][35:32] + 1'b1) , (addr_count_data_ID_2[2][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0110_0100_10_0100:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3]	 	<= {(addr_count_data_ID_2[2][35:32] + 1'b1) , (addr_count_data_ID_2[2][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0111_0100_01_0100:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 		<= 36'd0;
						addr_count_data_ID_3[1] 		<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2]	 		<= {(addr_count_data_ID_3[1][35:32] + 1'b1) , (addr_count_data_ID_3[1][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_3[3] 		<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 		<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 		<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 		<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 		<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 		<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 		<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 		<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					16'b1000_000100_10_0100:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 		<= 36'd0;
						addr_count_data_ID_3[1] 		<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2]	 		<= {(addr_count_data_ID_3[1][35:32] + 1'b1) , (addr_count_data_ID_3[1][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_3[3] 		<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 		<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 		<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 		<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 		<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 		<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 		<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 		<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b0001_0101_01_0101:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6]		 	<= {(addr_count_data[5][54:51] + 1'b1) , addr_count_data[5][50:32] , (addr_count_data[5][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0010_0101_10_0101:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6]		 	<= {(addr_count_data[5][54:51] + 1'b1) , addr_count_data[5][50:32] , (addr_count_data[5][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0011_0101_01_0101:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5]	 	<= {(addr_count_data_ID_1[4][35:32] + 1'b1) , (addr_count_data_ID_1[4][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0100_0101_10_0101:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5]	 	<= {(addr_count_data_ID_1[4][35:32] + 1'b1) , (addr_count_data_ID_1[4][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0101_0101_01_0101:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4]	 	<= {(addr_count_data_ID_2[3][35:32] + 1'b1) , (addr_count_data_ID_2[3][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0110_0101_10_0101:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4]	 	<= {(addr_count_data_ID_2[3][35:32] + 1'b1) , (addr_count_data_ID_2[3][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0111_0101_01_0101:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 		<= 36'd0;
						addr_count_data_ID_3[1] 		<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 		<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3]	 		<= {(addr_count_data_ID_3[2][35:32] + 1'b1) , (addr_count_data_ID_3[2][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_3[4] 		<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 		<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 		<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 		<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 		<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 		<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 		<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b1000_0101_10_0101:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 		<= 36'd0;
						addr_count_data_ID_3[1] 		<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 		<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3]	 		<= {(addr_count_data_ID_3[2][35:32] + 1'b1) , (addr_count_data_ID_3[2][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_3[4] 		<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 		<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 		<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 		<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 		<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 		<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 		<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b0001_0110_01_0110:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7]		 	<= {(addr_count_data[6][54:51] + 1'b1) , addr_count_data[6][50:32] , (addr_count_data[6][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0010_0110_10_0110:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7]		 	<= {(addr_count_data[6][54:51] + 1'b1) , addr_count_data[6][50:32] , (addr_count_data[6][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0011_0110_01_0110:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6]		<= {(addr_count_data_ID_1[5][35:32] + 1'b1) , (addr_count_data_ID_1[5][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0100_0110_10_0110:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6]		<= {(addr_count_data_ID_1[5][35:32] + 1'b1) , (addr_count_data_ID_1[5][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0101_0110_01_0110:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5]	 	<= {(addr_count_data_ID_2[4][35:32] + 1'b1) , (addr_count_data_ID_2[4][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0110_0110_10_0110:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5]	 	<= {(addr_count_data_ID_2[4][35:32] + 1'b1) , (addr_count_data_ID_2[4][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0111_0110_01_0110:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 	<= 36'd0;
						addr_count_data_ID_3[1] 	<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 	<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 	<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4]		<= {(addr_count_data_ID_3[3][35:32] + 1'b1) , (addr_count_data_ID_3[3][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b1000_0110_10_0110:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 	<= 36'd0;
						addr_count_data_ID_3[1] 	<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 	<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 	<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4]		<= {(addr_count_data_ID_3[3][35:32] + 1'b1) , (addr_count_data_ID_3[3][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b0001_0111_01_0111:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8]		 	<= {(addr_count_data[7][54:51] + 1'b1) , addr_count_data[7][50:32] , (addr_count_data[7][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0010_0111_10_0111:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8]		 	<= {(addr_count_data[7][54:51] + 1'b1) , addr_count_data[7][50:32] , (addr_count_data[7][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0011_0111_01_0111:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7]		 <= {(addr_count_data_ID_1[6][35:32] + 1'b1) , (addr_count_data_ID_1[6][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0100_0111_10_0111:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7]		 <= {(addr_count_data_ID_1[6][35:32] + 1'b1) , (addr_count_data_ID_1[6][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0101_0111_01_0111:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6]	 	<= {(addr_count_data_ID_2[5][35:32] + 1'b1) , (addr_count_data_ID_2[5][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};					
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0110_0111_10_0111:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6]	 	<= {(addr_count_data_ID_2[5][35:32] + 1'b1) , (addr_count_data_ID_2[5][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};					
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0111_0111_01_0111:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 		<= 36'd0;
						addr_count_data_ID_3[1] 		<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 		<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 		<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 		<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5]	 		<= {(addr_count_data_ID_3[4][35:32] + 1'b1) , (addr_count_data_ID_3[4][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_3[6] 		<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 		<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 		<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 		<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 		<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b1000_0111_10_0111:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 		<= 36'd0;
						addr_count_data_ID_3[1] 		<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 		<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 		<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 		<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5]	 		<= {(addr_count_data_ID_3[4][35:32] + 1'b1) , (addr_count_data_ID_3[4][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_3[6] 		<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 		<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 		<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 		<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 		<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b0001_1000_01_1000:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9]		 	<= {(addr_count_data[8][54:51] + 1'b1) , addr_count_data[8][50:32] , (addr_count_data[8][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0010_1000_10_1000:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9]		 	<= {(addr_count_data[8][54:51] + 1'b1) , addr_count_data[8][50:32] , (addr_count_data[8][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0011_1000_01_1000:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8]		<= {(addr_count_data_ID_1[7][35:32] + 1'b1) , (addr_count_data_ID_1[7][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0100_1000_10_1000:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8]		<= {(addr_count_data_ID_1[7][35:32] + 1'b1) , (addr_count_data_ID_1[7][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0101_1000_01_1000:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7]	 	<= {(addr_count_data_ID_2[6][35:32] + 1'b1) , (addr_count_data_ID_2[6][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0110_1000_10_1000:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7]	 	<= {(addr_count_data_ID_2[6][35:32] + 1'b1) , (addr_count_data_ID_2[6][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0111_1000_01_1000:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 		<= 36'd0;
						addr_count_data_ID_3[1] 		<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 		<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 		<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 		<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 		<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6]	 		<= {(addr_count_data_ID_3[5][35:32] + 1'b1) , (addr_count_data_ID_3[5][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};					
						addr_count_data_ID_3[7] 		<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 		<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 		<= addr_count_data_ID_3[8];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b1000_1000_10_1000:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 		<= 36'd0;
						addr_count_data_ID_3[1] 		<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 		<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 		<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 		<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 		<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6]	 		<= {(addr_count_data_ID_3[5][35:32] + 1'b1) , (addr_count_data_ID_3[5][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};					
						addr_count_data_ID_3[7] 		<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 		<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 		<= addr_count_data_ID_3[8];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b0001_1001_01_1001:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10]		 	<= {(addr_count_data[9][54:51] + 1'b1) , addr_count_data[9][50:32] , (addr_count_data[9][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0010_1001_10_1001:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10]		 	<= {(addr_count_data[9][54:51] + 1'b1) , addr_count_data[9][50:32] , (addr_count_data[9][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0011_1001_01_1001:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9]		<= {(addr_count_data_ID_1[8][35:32] + 1'b1) , (addr_count_data_ID_1[8][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0100_1001_10_1001:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9]		<= {(addr_count_data_ID_1[8][35:32] + 1'b1) , (addr_count_data_ID_1[8][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0101_1001_01_1001:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8]	 	<= {(addr_count_data_ID_2[7][35:32] + 1'b1) , (addr_count_data_ID_2[7][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0110_1001_10_1001:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8]	 	<= {(addr_count_data_ID_2[7][35:32] + 1'b1) , (addr_count_data_ID_2[7][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0111_1001_01_1001:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 	<= 36'd0;
						addr_count_data_ID_3[1] 	<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 	<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 	<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 	<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7]	 	<= {(addr_count_data_ID_3[6][35:32] + 1'b1) , (addr_count_data_ID_3[6][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b1000_1001_10_1001:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 	<= 36'd0;
						addr_count_data_ID_3[1] 	<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 	<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 	<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 	<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7]	 	<= {(addr_count_data_ID_3[6][35:32] + 1'b1) , (addr_count_data_ID_3[6][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b0001_1010_01_1010:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11]		 	<= {(addr_count_data[10][54:51] + 1'b1) , addr_count_data[10][50:32] , (addr_count_data[10][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0010_1010_10_1010:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11]		 	<= {(addr_count_data[10][54:51] + 1'b1) , addr_count_data[10][50:32] , (addr_count_data[10][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0011_1010_01_1010:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 		<= 36'd0;
						addr_count_data_ID_1[1] 		<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 		<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 		<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 		<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 		<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 		<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 		<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 		<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 		<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10]		 	<= {(addr_count_data_ID_1[9][35:32] + 1'b1) , (addr_count_data_ID_1[9][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_1[11] 		<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 		<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0100_1010_10_1010:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 		<= 36'd0;
						addr_count_data_ID_1[1] 		<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 		<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 		<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 		<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 		<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 		<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 		<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 		<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 		<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10]		 	<= {(addr_count_data_ID_1[9][35:32] + 1'b1) , (addr_count_data_ID_1[9][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_1[11] 		<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 		<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0101_1010_01_1010:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9]	 	<= {(addr_count_data_ID_2[8][35:32] + 1'b1) , (addr_count_data_ID_2[8][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0110_1010_10_1010:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9]	 	<= {(addr_count_data_ID_2[8][35:32] + 1'b1) , (addr_count_data_ID_2[8][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0111_1010_01_1010:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 	<= 36'd0;
						addr_count_data_ID_3[1] 	<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 	<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 	<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 	<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8]	 	<= {(addr_count_data_ID_3[7][35:32] + 1'b1) , (addr_count_data_ID_3[7][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b1000_1010_10_1010:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 	<= 36'd0;
						addr_count_data_ID_3[1] 	<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 	<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 	<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 	<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8]	 	<= {(addr_count_data_ID_3[7][35:32] + 1'b1) , (addr_count_data_ID_3[7][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b0001_1011_01_1011:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12]		 	<= {(addr_count_data[11][54:51] + 1'b1) , addr_count_data[11][50:32] , (addr_count_data[11][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0010_1011_10_1011:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12]		 	<= {(addr_count_data[11][54:51] + 1'b1) , addr_count_data[11][50:32] , (addr_count_data[11][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0011_1011_01_1011:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs1
					begin
						addr_count_data_ID_1[0] 		<= 36'd0;
						addr_count_data_ID_1[1] 		<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 		<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 		<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 		<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 		<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 		<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 		<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 		<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 		<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 		<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11]	 	<= {(addr_count_data_ID_1[10][35:32] + 1'b1) , (addr_count_data_ID_1[10][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_1[12] 		<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0100_1011_10_1011:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs1
					begin
						addr_count_data_ID_1[0] 		<= 36'd0;
						addr_count_data_ID_1[1] 		<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 		<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 		<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 		<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 		<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 		<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 		<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 		<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 		<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 		<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11]	 	<= {(addr_count_data_ID_1[10][35:32] + 1'b1) , (addr_count_data_ID_1[10][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_1[12] 		<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0101_1011_01_1011:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= {(addr_count_data_ID_2[9][35:32] + 1'b1) , (addr_count_data_ID_2[9][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0110_1011_10_1011:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= {(addr_count_data_ID_2[9][35:32] + 1'b1) , (addr_count_data_ID_2[9][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0111_1011_01_1011:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 	<= 36'd0;
						addr_count_data_ID_3[1] 	<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 	<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 	<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 	<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9]	 	<= {(addr_count_data_ID_3[8][35:32] + 1'b1) , (addr_count_data_ID_3[8][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b1000_1011_10_1011:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 	<= 36'd0;
						addr_count_data_ID_3[1] 	<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 	<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 	<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 	<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9]	 	<= {(addr_count_data_ID_3[8][35:32] + 1'b1) , (addr_count_data_ID_3[8][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b0001_1100_01_1100:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= {addr_count_data[12][54:51] + 1'b1 , addr_count_data[12][50:32] , addr_count_data[12][31:16] + delay3_write_data[63:48] , delay3_write_data[47:32]};							
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0010_1100_10_1100:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= {addr_count_data[12][54:51] + 1'b1 , addr_count_data[12][50:32] , addr_count_data[12][31:16] + delay1_write_data[63:48] , delay1_write_data[47:32]};							
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0011_1100_01_1100:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 		<= 36'd0;
						addr_count_data_ID_1[1] 		<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 		<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 		<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 		<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 		<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 		<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 		<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 		<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 		<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 		<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 		<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= {(addr_count_data_ID_1[11][35:32] + 1'b1) , (addr_count_data_ID_1[11][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0100_1100_10_1100:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 		<= 36'd0;
						addr_count_data_ID_1[1] 		<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 		<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 		<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 		<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 		<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 		<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 		<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 		<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 		<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 		<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 		<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= {(addr_count_data_ID_1[11][35:32] + 1'b1) , (addr_count_data_ID_1[11][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0101_1100_01_1100:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11]	 	<= {(addr_count_data_ID_2[10][35:32] + 1'b1) , (addr_count_data_ID_2[10][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0110_1100_10_1100:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11]	 	<= {(addr_count_data_ID_2[10][35:32] + 1'b1) , (addr_count_data_ID_2[10][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0111_1100_01_1100:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 	<= 36'd0;
						addr_count_data_ID_3[1] 	<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 	<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 	<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 	<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10]	 	<= {(addr_count_data_ID_3[9][35:32] + 1'b1) , (addr_count_data_ID_3[9][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};						
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b1000_1100_10_1100:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 	<= 36'd0;
						addr_count_data_ID_3[1] 	<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 	<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 	<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 	<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10]	 	<= {(addr_count_data_ID_3[9][35:32] + 1'b1) , (addr_count_data_ID_3[9][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};						
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					/*14'b0001_1101_01_1101:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 			<= addr_count_data[9];
						addr_count_data[11] 			<= addr_count_data[10];
						addr_count_data[12] 			<= addr_count_data[11];
						addr_count_data[13][54:51] <= {addr_count_data[12][54:51] + 1'b1 , addr_count_data[12][50:32] , addr_count_data[12][31:16] + delay3_write_data[63:48] , addr_count_data[12][15:0]};
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0010_1101_10_1101:
					//SRAM_ID 0
					//compare the packet_in ID and the ID in DFFs
					begin
						addr_count_data[0] 			<= 51'd0;
						addr_count_data[1] 			<= addr_count_data[0];
						addr_count_data[2] 			<= addr_count_data[1];
						addr_count_data[3] 			<= addr_count_data[2];
						addr_count_data[4] 			<= addr_count_data[3];
						addr_count_data[5] 			<= addr_count_data[4];
						addr_count_data[6] 			<= addr_count_data[5];
						addr_count_data[7] 			<= addr_count_data[6];
						addr_count_data[8] 			<= addr_count_data[7];
						addr_count_data[9] 			<= addr_count_data[8];
						addr_count_data[10] 			<= addr_count_data[9];
						addr_count_data[11] 			<= addr_count_data[10];
						addr_count_data[12] 			<= addr_count_data[11];
						addr_count_data[13][54:51] <= {addr_count_data[12][54:51] + 1'b1 , addr_count_data[12][50:32] , addr_count_data[12][31:16] + delay1_write_data[63:48] , addr_count_data[12][15:0]};
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
					end
					14'b0011_1101_01_1101:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 			<= 36'd0;
						addr_count_data_ID_1[1] 			<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 			<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 			<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 			<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 			<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 			<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 			<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 			<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 			<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 			<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 			<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12]			<= {addr_count_data_ID_1[11][35:32] + 1'b1 , addr_count_data_ID_1[11][31:16] + delay3_write_data[63:48] , delay3_write_data[47:32]};
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0100_1101_10_1101:
					//SRAM_ID 1
					//if SRAM_ID isn't the same in first Dffs
					begin
						addr_count_data_ID_1[0] 			<= 36'd0;
						addr_count_data_ID_1[1] 			<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 			<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 			<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 			<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 			<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 			<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 			<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 			<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 			<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 			<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 			<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12]			<= {addr_count_data_ID_1[11][35:32] + 1'b1 , addr_count_data_ID_1[11][31:16] + delay1_write_data[63:48] , delay1_write_data[47:32]};
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
					end
					14'b0101_1101_01_1101:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 			<= 36'd0;
						addr_count_data_ID_2[1] 			<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 			<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 			<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 			<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 			<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 			<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 			<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 			<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 			<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 			<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11]		 	<= {addr_count_data_ID_2[10][35:32] + 1'b1 , addr_count_data_ID_2[10][31:16] + delay3_write_data[63:48] , delay3_write_data[47:32]};
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0110_1101_10_1101:
					//SRAM_ID 2
					//if SRAM_ID isn't the same in second Dffs
					begin
						addr_count_data_ID_2[0] 			<= 36'd0;
						addr_count_data_ID_2[1] 			<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 			<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 			<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 			<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 			<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 			<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 			<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 			<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 			<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 			<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11]		 	<= {addr_count_data_ID_2[10][35:32] + 1'b1 , addr_count_data_ID_2[10][31:16] + delay1_write_data[63:48] , delay1_write_data[47:32]};
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
					end
					14'b0111_1101_01_1101:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 			<= 36'd0;
						addr_count_data_ID_3[1] 			<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 			<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 			<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 			<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 			<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 			<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 			<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 			<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 			<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10]		 	<= {(addr_count_data_ID_3[9][35:32] + 1'b1) , (addr_count_data_ID_3[9][31:16] + delay3_write_data[63:48]) , delay3_write_data[47:32]};
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
					14'b1000_1101_10_1101:
					//SRAM_ID 3
					//if SRAM_ID isn't the same in third Dffs
					begin
						addr_count_data_ID_3[0] 			<= 36'd0;
						addr_count_data_ID_3[1] 			<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 			<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 			<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 			<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 			<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 			<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 			<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 			<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 			<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10]		 	<= {(addr_count_data_ID_3[9][35:32] + 1'b1) , (addr_count_data_ID_3[9][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end*/
					default:
					begin
						addr_count_data[0] 		<= 55'd0;
						addr_count_data[1] 		<= addr_count_data[0];
						addr_count_data[2] 		<= addr_count_data[1];
						addr_count_data[3] 		<= addr_count_data[2];
						addr_count_data[4] 		<= addr_count_data[3];
						addr_count_data[5] 		<= addr_count_data[4];
						addr_count_data[6] 		<= addr_count_data[5];
						addr_count_data[7] 		<= addr_count_data[6];
						addr_count_data[8] 		<= addr_count_data[7];
						addr_count_data[9] 		<= addr_count_data[8];
						addr_count_data[10] 		<= addr_count_data[9];
						addr_count_data[11] 		<= addr_count_data[10];
						addr_count_data[12] 		<= addr_count_data[11];
						addr_count_data[13] 		<= addr_count_data[12];
						{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
						data_bit_array 			<= data_bit_array << 1;
						addr_count_data_ID_1[0] 	<= 36'd0;
						addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
						addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
						addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
						addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
						addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
						addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
						addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
						addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
						addr_count_data_ID_1[9] 	<= addr_count_data_ID_1[8];
						addr_count_data_ID_1[10] 	<= addr_count_data_ID_1[9];
						addr_count_data_ID_1[11] 	<= addr_count_data_ID_1[10];
						addr_count_data_ID_1[12] 	<= addr_count_data_ID_1[11];
						{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= addr_count_data_ID_1[12];
						addr_count_data_ID_2[0] 	<= 36'd0;
						addr_count_data_ID_2[1] 	<= addr_count_data_ID_2[0];
						addr_count_data_ID_2[2] 	<= addr_count_data_ID_2[1];
						addr_count_data_ID_2[3] 	<= addr_count_data_ID_2[2];
						addr_count_data_ID_2[4] 	<= addr_count_data_ID_2[3];
						addr_count_data_ID_2[5] 	<= addr_count_data_ID_2[4];
						addr_count_data_ID_2[6] 	<= addr_count_data_ID_2[5];
						addr_count_data_ID_2[7] 	<= addr_count_data_ID_2[6];
						addr_count_data_ID_2[8] 	<= addr_count_data_ID_2[7];
						addr_count_data_ID_2[9] 	<= addr_count_data_ID_2[8];
						addr_count_data_ID_2[10] 	<= addr_count_data_ID_2[9];
						addr_count_data_ID_2[11] 	<= addr_count_data_ID_2[10];
						{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= addr_count_data_ID_2[11];
						addr_count_data_ID_3[0] 	<= 36'd0;
						addr_count_data_ID_3[1] 	<= addr_count_data_ID_3[0];
						addr_count_data_ID_3[2] 	<= addr_count_data_ID_3[1];
						addr_count_data_ID_3[3] 	<= addr_count_data_ID_3[2];
						addr_count_data_ID_3[4] 	<= addr_count_data_ID_3[3];
						addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
						addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
						addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
						addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
						addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
						addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
						{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
					end
				endcase
			end
		end
	end
	//////////////////////////////////////////////////////////////////////////////////////
endmodule


