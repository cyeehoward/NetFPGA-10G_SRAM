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
	input								hash_reg_sel,
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
	parameter IDLE = 0 , INIT = 1 , INIT_READ = 2 , READ_WRITE_WAIT = 3 , READ = 4 , WRITE = 5 , INIT_READ_1 = 6 , REG_READ = 7;
	
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
	reg		[1:0]						read_vaild_num;
	//use shift register to save the data
	//reg		[3:0]		change_data , pre_change_data;
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
	//compare addr and ID
	wire	[3:0]	comp_result;//comp_result_0 , comp_result_1
	wire			comp_addr_valid;
	wire	[1:0]	id_comp_result_ID_0	[13:0];
	wire	[1:0]	id_comp_result_ID_1	[13:0];
	wire	[1:0]	id_comp_result_ID_2	[13:0];
	wire	[1:0]	id_comp_result_ID_3	[13:0];
	wire			id_comp_result_ID_0_valid , id_comp_result_ID_1_valid , id_comp_result_ID_2_valid , id_comp_result_ID_3_valid;
	reg	[6:0] id_comp_result;
	wire	[3:0]	id_comp_zero;

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
	//delay rmw_addr, packet_count, byte_count for dout
	reg		[18:0]		delay_rmw_addr;
	reg		[3:0]		delay_packet_count_ID_0;
	reg		[15:0]		delay_byte_count_ID_0;
	reg		[15:0]		delay_SRAM_ID_0;
	reg		[3:0]		delay_packet_count_ID_1;
	reg		[15:0]		delay_byte_count_ID_1;
	reg		[15:0]		delay_SRAM_ID_1;
	reg		[3:0]		delay1_packet_count_ID_2 , delay2_packet_count_ID_2;
	reg		[15:0]		delay1_byte_count_ID_2 , delay2_byte_count_ID_2;
	reg		[15:0]		delay1_SRAM_ID_2 , delay2_SRAM_ID_2;
	reg		[3:0]		delay1_packet_count_ID_3 , delay2_packet_count_ID_3;
	reg		[15:0]		delay1_byte_count_ID_3 , delay2_byte_count_ID_3;
	reg		[15:0]		delay1_SRAM_ID_3 , delay2_SRAM_ID_3;
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			delay_rmw_addr			<= 18'd0;
			delay_packet_count_ID_0		<= 4'd0;
			delay_byte_count_ID_0		<= 16'd0;
			delay_SRAM_ID_0			<= 16'd0;
			delay_packet_count_ID_1		<= 4'd0;
			delay_byte_count_ID_1		<= 16'd0;
			delay_SRAM_ID_1			<= 16'd0;
			delay1_packet_count_ID_2	<= 4'd0;
			delay1_byte_count_ID_2		<= 16'd0;
			delay1_SRAM_ID_2		<= 16'd0;
			delay1_packet_count_ID_3	<= 4'd0;
			delay1_byte_count_ID_3		<= 16'd0;
			delay1_SRAM_ID_3		<= 16'd0;
			delay2_packet_count_ID_2	<= 4'd0;
			delay2_byte_count_ID_2		<= 16'd0;
			delay2_SRAM_ID_2		<= 16'd0;
			delay2_packet_count_ID_3	<= 4'd0;
			delay2_byte_count_ID_3		<= 16'd0;
			delay2_SRAM_ID_3		<= 16'd0;
		end
		else
		begin
			delay_rmw_addr			<= rmw_addr;
			delay_packet_count_ID_0		<= packet_count_ID_0;
			delay_byte_count_ID_0		<= byte_count_ID_0;
			delay_SRAM_ID_0			<= SRAM_ID_0;
			delay_packet_count_ID_1		<= packet_count_ID_1;
			delay_byte_count_ID_1		<= byte_count_ID_1;
			delay_SRAM_ID_1			<= SRAM_ID_1;
			delay1_packet_count_ID_2	<= packet_count_ID_2;
			delay1_byte_count_ID_2		<= byte_count_ID_2;
			delay1_SRAM_ID_2		<= SRAM_ID_2;
			delay1_packet_count_ID_3	<= packet_count_ID_3;
			delay1_byte_count_ID_3		<= byte_count_ID_3;
			delay1_SRAM_ID_3		<= SRAM_ID_3;
			delay2_packet_count_ID_2	<= delay1_packet_count_ID_2;
			delay2_byte_count_ID_2		<= delay1_byte_count_ID_2;
			delay2_SRAM_ID_2		<= delay1_SRAM_ID_2;
			delay2_packet_count_ID_3	<= delay1_packet_count_ID_3;
			delay2_byte_count_ID_3		<= delay1_byte_count_ID_3;
			delay2_SRAM_ID_3		<= delay1_SRAM_ID_3;
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
	reg	[13:0]		ena_comp;
	always@(*)
	begin
		if((nextstate_init == READ)||nextstate_init == WRITE)
		begin
			ena_comp[0] = data_bit_array[0];
			ena_comp[1] = data_bit_array[1];
			ena_comp[2] = data_bit_array[2];
			ena_comp[3] = data_bit_array[3];
			ena_comp[4] = data_bit_array[4];
			ena_comp[5] = data_bit_array[5];
			ena_comp[6] = data_bit_array[6];
			ena_comp[7] = data_bit_array[7];
			ena_comp[8] = data_bit_array[8];
			ena_comp[9] = data_bit_array[9];
			ena_comp[10] = data_bit_array[10];
			ena_comp[11] = data_bit_array[11];
			ena_comp[12] = data_bit_array[12];
			ena_comp[13] = data_bit_array[13];
		end
		else
		begin
			ena_comp[0] = 1'b0;
			ena_comp[1] = 1'b0;
			ena_comp[2] = 1'b0;
			ena_comp[3] = 1'b0;
			ena_comp[4] = 1'b0;
			ena_comp[5] = 1'b0;
			ena_comp[6] = 1'b0;
			ena_comp[7] = 1'b0;
			ena_comp[8] = 1'b0;
			ena_comp[9] = 1'b0;
			ena_comp[10] = 1'b0;
			ena_comp[11] = 1'b0;
			ena_comp[12] = 1'b0;
			ena_comp[13] = 1'b0;
		end
	end
	///////////////////////////////////////////////////////////////////////////////
	//compare address module
	compare_addr U1(
	.clk(clk) , 
	.reset(reset) , 
	.ena(ena_comp) ,//&write_data_vaild
	.comp_addr_valid(comp_addr_valid) , 
	.data_comp_result(comp_result),
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
	/*always@(*)
	begin
		case({id_comp_result_ID_3_valid , id_comp_result_ID_2_valid , id_comp_result_ID_1_valid , id_comp_result_ID_0_valid})
			//data_addr not zero
			4'b0001:id_comp_result = {3'd1 , id_comp_result_ID_0};
			4'b0010:id_comp_result = {3'd2 , id_comp_result_ID_1};
			4'b0100:id_comp_result = {3'd3 , id_comp_result_ID_2};
			4'b1000:id_comp_result = {3'd4 , id_comp_result_ID_3};
			default:
			begin
				case(id_comp_zero[3:1])
					3'b111:id_comp_result = {3'd2 , id_comp_result_ID_1};
					3'b110:id_comp_result = {3'd3 , id_comp_result_ID_2};
					3'b100:id_comp_result = {3'd4 , id_comp_result_ID_3};
					default:id_comp_result = 7'd0;
				endcase
			end
		endcase
	end*/
	
	compare_sram_id U2(
	.clk(clk) , 
	.reset(reset) , 
	.ena(ena_comp) ,//&write_data_vaild
	//.id_comp_result(id_comp_result_ID_0) , 
	.comp_result_0(id_comp_result_ID_0[0]) , 
	.comp_result_1(id_comp_result_ID_0[1]) , 
	.comp_result_2(id_comp_result_ID_0[2]) , 
	.comp_result_3(id_comp_result_ID_0[3]) , 
	.comp_result_4(id_comp_result_ID_0[4]) , 
	.comp_result_5(id_comp_result_ID_0[5]) , 
	.comp_result_6(id_comp_result_ID_0[6]) , 
	.comp_result_7(id_comp_result_ID_0[7]) , 
	.comp_result_8(id_comp_result_ID_0[8]) , 
	.comp_result_9(id_comp_result_ID_0[9]) , 
	.comp_result_10(id_comp_result_ID_0[10]) , 
	.comp_result_11(id_comp_result_ID_0[11]) , 
	.comp_result_12(id_comp_result_ID_0[12]) , 
	.comp_result_13(id_comp_result_ID_0[13]) , 
	.id_comp_result_valid(id_comp_result_ID_0_valid) , 
	.id_comp_zero_valid(id_comp_zero[0]) , 
	.change_data(comp_result) , 
	.ID_data_0(addr_count_data[0][15:0]) , 
	.ID_data_1(addr_count_data[1][15:0]) , 
	.ID_data_2(addr_count_data[2][15:0]) , 
	.ID_data_3(addr_count_data[3][15:0]) ,
	.ID_data_4(addr_count_data[4][15:0]) , 
	.ID_data_5(addr_count_data[5][15:0]) , 
	.ID_data_6(addr_count_data[6][15:0]) , 
	.ID_data_7(addr_count_data[7][15:0]) , 
	.ID_data_8(addr_count_data[8][15:0]) , 
	.ID_data_9(addr_count_data[9][15:0]) , 
	.ID_data_10(addr_count_data[10][15:0]) , 
	.ID_data_11(addr_count_data[11][15:0]) , 
	.ID_data_12(addr_count_data[12][15:0]) , 
	.ID_data_13(addr_count_data[13][15:0]) , 
	.packet_in_ID(write_data[47:32]));
	
	compare_sram_id U3(
	.clk(clk) , 
	.reset(reset) , 
	.ena({ena_comp[13:1] , 1'b0}) ,//&write_data_vaild
	//.id_comp_result(id_comp_result_ID_0) , 
	.comp_result_0(id_comp_result_ID_1[0]) , 
	.comp_result_1(id_comp_result_ID_1[1]) , 
	.comp_result_2(id_comp_result_ID_1[2]) , 
	.comp_result_3(id_comp_result_ID_1[3]) , 
	.comp_result_4(id_comp_result_ID_1[4]) , 
	.comp_result_5(id_comp_result_ID_1[5]) , 
	.comp_result_6(id_comp_result_ID_1[6]) , 
	.comp_result_7(id_comp_result_ID_1[7]) , 
	.comp_result_8(id_comp_result_ID_1[8]) , 
	.comp_result_9(id_comp_result_ID_1[9]) , 
	.comp_result_10(id_comp_result_ID_1[10]) , 
	.comp_result_11(id_comp_result_ID_1[11]) , 
	.comp_result_12(id_comp_result_ID_1[12]) , 
	.comp_result_13(id_comp_result_ID_1[13]) , 
	.id_comp_result_valid(id_comp_result_ID_1_valid) , 
	.id_comp_zero_valid(id_comp_zero[1]) , 
	.change_data(comp_result) , 
	.ID_data_0(addr_count_data_ID_1[0][15:0]) , 
	.ID_data_1(addr_count_data_ID_1[1][15:0]) , 
	.ID_data_2(addr_count_data_ID_1[2][15:0]) , 
	.ID_data_3(addr_count_data_ID_1[3][15:0]) ,
	.ID_data_4(addr_count_data_ID_1[4][15:0]) , 
	.ID_data_5(addr_count_data_ID_1[5][15:0]) , 
	.ID_data_6(addr_count_data_ID_1[6][15:0]) , 
	.ID_data_7(addr_count_data_ID_1[7][15:0]) , 
	.ID_data_8(addr_count_data_ID_1[8][15:0]) , 
	.ID_data_9(addr_count_data_ID_1[9][15:0]) , 
	.ID_data_10(addr_count_data_ID_1[10][15:0]) , 
	.ID_data_11(addr_count_data_ID_1[11][15:0]) , 
	.ID_data_12(addr_count_data_ID_1[12][15:0]) , 
	.ID_data_13(16'd0) , 
	.packet_in_ID(write_data[47:32]));
	
	compare_sram_id U4(
	.clk(clk) , 
	.reset(reset) , 
	.ena({ena_comp[13:2] , 2'd0}) ,//&write_data_vaild
	//.id_comp_result(id_comp_result_ID_0) , 
	.comp_result_0(id_comp_result_ID_2[0]) , 
	.comp_result_1(id_comp_result_ID_2[1]) , 
	.comp_result_2(id_comp_result_ID_2[2]) , 
	.comp_result_3(id_comp_result_ID_2[3]) , 
	.comp_result_4(id_comp_result_ID_2[4]) , 
	.comp_result_5(id_comp_result_ID_2[5]) , 
	.comp_result_6(id_comp_result_ID_2[6]) , 
	.comp_result_7(id_comp_result_ID_2[7]) , 
	.comp_result_8(id_comp_result_ID_2[8]) , 
	.comp_result_9(id_comp_result_ID_2[9]) , 
	.comp_result_10(id_comp_result_ID_2[10]) , 
	.comp_result_11(id_comp_result_ID_2[11]) , 
	.comp_result_12(id_comp_result_ID_2[12]) , 
	.comp_result_13(id_comp_result_ID_2[13]) , 
	.id_comp_result_valid(id_comp_result_ID_2_valid) , 
	.id_comp_zero_valid(id_comp_zero[2]) , 
	.change_data(comp_result) , 
	.ID_data_0(addr_count_data_ID_2[0][15:0]) , 
	.ID_data_1(addr_count_data_ID_2[1][15:0]) , 
	.ID_data_2(addr_count_data_ID_2[2][15:0]) , 
	.ID_data_3(addr_count_data_ID_2[3][15:0]) ,
	.ID_data_4(addr_count_data_ID_2[4][15:0]) , 
	.ID_data_5(addr_count_data_ID_2[5][15:0]) , 
	.ID_data_6(addr_count_data_ID_2[6][15:0]) , 
	.ID_data_7(addr_count_data_ID_2[7][15:0]) , 
	.ID_data_8(addr_count_data_ID_2[8][15:0]) , 
	.ID_data_9(addr_count_data_ID_2[9][15:0]) , 
	.ID_data_10(addr_count_data_ID_2[10][15:0]) , 
	.ID_data_11(addr_count_data_ID_2[11][15:0]) , 
	.ID_data_12(16'd0) , 
	.ID_data_13(16'd0) , 
	.packet_in_ID(write_data[47:32]));
	
	compare_sram_id U5(
	.clk(clk) , 
	.reset(reset) , 
	.ena({ena_comp[13:3] , 3'd0}) ,//&write_data_vaild
	//.id_comp_result(id_comp_result_ID_0) , 
	.comp_result_0(id_comp_result_ID_3[0]) , 
	.comp_result_1(id_comp_result_ID_3[1]) , 
	.comp_result_2(id_comp_result_ID_3[2]) , 
	.comp_result_3(id_comp_result_ID_3[3]) , 
	.comp_result_4(id_comp_result_ID_3[4]) , 
	.comp_result_5(id_comp_result_ID_3[5]) , 
	.comp_result_6(id_comp_result_ID_3[6]) , 
	.comp_result_7(id_comp_result_ID_3[7]) , 
	.comp_result_8(id_comp_result_ID_3[8]) , 
	.comp_result_9(id_comp_result_ID_3[9]) , 
	.comp_result_10(id_comp_result_ID_3[10]) , 
	.comp_result_11(id_comp_result_ID_3[11]) , 
	.comp_result_12(id_comp_result_ID_3[12]) , 
	.comp_result_13(id_comp_result_ID_3[13]) ,  
	.id_comp_result_valid(id_comp_result_ID_3_valid) , 
	.id_comp_zero_valid(id_comp_zero[3]) , 
	.change_data(comp_result) , 
	.ID_data_0(addr_count_data_ID_3[0][15:0]) , 
	.ID_data_1(addr_count_data_ID_3[1][15:0]) , 
	.ID_data_2(addr_count_data_ID_3[2][15:0]) , 
	.ID_data_3(addr_count_data_ID_3[3][15:0]) ,
	.ID_data_4(addr_count_data_ID_3[4][15:0]) , 
	.ID_data_5(addr_count_data_ID_3[5][15:0]) , 
	.ID_data_6(addr_count_data_ID_3[6][15:0]) , 
	.ID_data_7(addr_count_data_ID_3[7][15:0]) , 
	.ID_data_8(addr_count_data_ID_3[8][15:0]) , 
	.ID_data_9(addr_count_data_ID_3[9][15:0]) , 
	.ID_data_10(addr_count_data_ID_3[10][15:0]) , 
	.ID_data_11(16'd0) , 
	.ID_data_12(16'd0) , 
	.ID_data_13(16'd0) , 
	.packet_in_ID(write_data[47:32]));
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
			//change_data <= 13'd0;
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
			//change_data <= pre_change_data;
		end
	end
	always@(state_init or cal_done or dout_addr or din_addr or test or din_valid or vaild_count or data_bit_array or delay3_write_data_valid or pre_count_data_num or delay_din or pre_mod_finish or write_data_valid or delay3_write_data_addr or delay1_write_data_addr or rmw_addr or SRAM_ID_0 or packet_count_ID_0 or byte_count_ID_0 or SRAM_ID_1 or packet_count_ID_1 or byte_count_ID_1 or SRAM_ID_2 or packet_count_ID_2 or byte_count_ID_2 or SRAM_ID_3 or packet_count_ID_3 or byte_count_ID_3 or delay2_write_data_valid or delay1_write_data_valid or comp_result)
	begin
		next_dout_burst_ready = 1'b0;
		next_dout_data = 216'd0;
		next_dout_addr = 19'd0;
		next_din_ready = 1'b0;
		next_din_addr = 19'd0;
		count_data_num = 1'b0;
		mod_finish = 1'b0;
		write_data_rn = 1'b0;
		//pre_change_data = 3'd0;
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
				if(dout_addr == 11'b111_1111_1111)////19'b111_1111_1111_1111_1111
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
				else if(hash_reg_sel)
				begin
					nextstate_init = REG_READ;
				end
				else
				begin
					nextstate_init = READ_WRITE_WAIT;
				end
			end
			READ : 
			begin
				//command read addr or change data in DFFs	
				if(comp_result!=0)
				begin
					next_din_addr = 19'd0;
					next_din_ready = 1'b0;
					//pre_change_data = comp_result;
				end
				else	//there's no data in shift memory
				begin
					//send read addr
					next_din_addr = delay1_write_data_addr;//{7'd0 , delay1_write_data_addr[10:0]}
					next_din_ready = 1'b1;
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
					next_dout_addr = {delay_rmw_addr[18:0]};
					if(delay_din[215:200] == 16'd0)
					begin	
						next_dout_data[215:200] = delay_SRAM_ID_0[15:0];		//SRAM_ID
						{next_dout_data[199:180] , next_dout_data[143:132]} = delay_packet_count_ID_0;	//packet count
						{next_dout_data[131:108] , next_dout_data[71:36]} = {44'd0 , delay_byte_count_ID_0};		//byte count							
						next_dout_data[179:144] = 36'd0;
						next_dout_data[107:72] = 36'd0;
						next_dout_data[35:0] = 36'd0;
						mod_finish = 1;
					end
					else if(delay_din[215:200] == SRAM_ID_0[15:0])
					begin	
						next_dout_data[215:200] = delay_SRAM_ID_0[15:0];		//SRAM_ID
						{next_dout_data[199:180] , next_dout_data[143:132]} = {next_dout_data[199:180] , next_dout_data[143:132]} + delay_packet_count_ID_0;	//packet count
						{next_dout_data[131:108] , next_dout_data[71:36]} = {next_dout_data[131:108] , next_dout_data[71:36]} + delay_byte_count_ID_0;
						next_dout_data[179:144] = delay_din[179:144];
						next_dout_data[107:72] = delay_din[107:72];
						next_dout_data[35:0] = delay_din[35:0];
						mod_finish = 1;
					end
					else if(delay_din[179:164] == 16'd0)
					begin
						next_dout_data[179:164] = delay_SRAM_ID_1[15:0];		//SRAM_ID
						{next_dout_data[163:144] , next_dout_data[107:96]} = delay_packet_count_ID_1;	//packet count
						{next_dout_data[95:72] , next_dout_data[35:0]} = {44'd0 , delay_byte_count_ID_1};	//byte count							
						next_dout_data[215:180] = delay_din[215:180];
						next_dout_data[143:108] = delay_din[143:108];
						next_dout_data[71:36] = delay_din[71:36];
						mod_finish = 1;
					end
					else if(delay_din[179:164] == SRAM_ID_1[15:0])
					begin	
						next_dout_data[179:164] = delay_SRAM_ID_1[15:0];		//SRAM_ID
						{next_dout_data[163:144] , next_dout_data[107:96]} = {next_dout_data[163:144] , next_dout_data[107:96]} + delay_packet_count_ID_1;	//packet count
						{next_dout_data[95:72] , next_dout_data[35:0]} = {next_dout_data[95:72] , next_dout_data[35:0]} + delay_byte_count_ID_1;							
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
						next_dout_data[215:200] = delay2_SRAM_ID_2[15:0];		//SRAM_ID
						{next_dout_data[199:180] , next_dout_data[143:132]} = delay2_packet_count_ID_2;	//packet count
						{next_dout_data[131:108] , next_dout_data[71:36]} = {44'd0 , delay2_byte_count_ID_2};		//byte count							
						next_dout_data[179:144] = 36'd0;
						next_dout_data[107:72] = 36'd0;
						next_dout_data[35:0] = 36'd0;
					end
					else if(delay_din[215:200] == SRAM_ID_2[15:0] && (~pre_mod_finish))
					begin	
						next_dout_data[215:200] = delay2_SRAM_ID_2[15:0];		//SRAM_ID
						{next_dout_data[199:180] , next_dout_data[143:132]} = {next_dout_data[199:180] , next_dout_data[143:132]} + delay2_packet_count_ID_2;	//packet count
						{next_dout_data[131:108] , next_dout_data[71:36]} = {next_dout_data[131:108] , next_dout_data[71:36]} + delay2_byte_count_ID_2;
						next_dout_data[179:144] = delay_din[179:144];
						next_dout_data[107:72] = delay_din[107:72];
						next_dout_data[35:0] = delay_din[35:0];	
					end
					else if(delay_din[179:164] == 16'd0 && (~pre_mod_finish))
					begin
						next_dout_data[179:164] = delay2_SRAM_ID_3[15:0];		//SRAM_ID
						{next_dout_data[163:144] , next_dout_data[107:96]} = delay2_packet_count_ID_3;	//packet count
						{next_dout_data[95:72] , next_dout_data[35:0]} = {44'd0 , delay2_byte_count_ID_3};	//byte count							
						next_dout_data[215:180] = delay_din[215:180];
						next_dout_data[143:108] = delay_din[143:108];
						next_dout_data[71:36] = delay_din[71:36];
					end
					else if(delay_din[179:164] == SRAM_ID_3[15:0] && (~pre_mod_finish))
					begin		
						next_dout_data[179:164] = delay2_SRAM_ID_3[15:0];		//SRAM_ID
						{next_dout_data[163:144] , next_dout_data[107:96]} = {next_dout_data[163:144] , next_dout_data[107:96]} + delay2_packet_count_ID_3;	//packet count
						{next_dout_data[95:72] , next_dout_data[35:0]} = {next_dout_data[95:72] , next_dout_data[35:0]} + delay2_byte_count_ID_3;					
						next_dout_data[215:180] = delay_din[215:180];
						next_dout_data[143:108] = delay_din[143:108];
						next_dout_data[71:36] = delay_din[71:36];
					end
					else
					begin
						next_dout_data = delay_din;
					end
					mod_finish = 0;
					if(write_data_valid)
					begin
						nextstate_init = READ;
					end
					else
					begin
						nextstate_init = READ_WRITE_WAIT;
					end
				end
				/*if(write_data_valid)
				begin
					//command read addr or change data in DFFs	
					if(comp_result!=0)
					begin
						next_din_addr = 19'd0;
						next_din_ready = 1'b0;
						//pre_change_data = comp_result;
					end
					else	//there's no data in shift memory
					begin
						//send read addr
						next_din_addr = {write_data_addr[18:0]};
						next_din_ready = 1'b1;
					end
					//state change 
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
				end*/
				if(delay1_write_data_valid)
				begin
					//command read addr or change data in DFFs	
					if(comp_result!=0)
					begin
						next_din_addr = 19'd0;
						next_din_ready = 1'b0;
						//pre_change_data = comp_result;
					end
					else	//there's no data in shift memory
					begin
						//send read addr
						next_din_addr = {delay1_write_data_addr[18:0]};
						next_din_ready = 1'b1;
					end
					//state change 
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
				else
				begin
					next_din_addr = 19'd0;
					next_din_ready = 1'b0;
					//state change 
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
			end
			REG_READ:
			begin
				next_din_addr = delay1_write_data_addr;
				next_din_ready = 1'b1;
				next_dout_addr = delay1_write_data_addr;
				next_dout_data = 216'd0;
				next_dout_burst_ready = 1'b1;
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
			if((comp_result == 4'd0)&(next_din_ready))
			begin
				addr_count_data[0] 		<= {4'd1 , delay1_write_data_addr[18:0] , delay1_write_data[63:32]};	//{packet_count --> 4bits , addr --> 19bits , data_byte --> 16bits , SRAM_ID --> 16bits}
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
			end			//when in READ state --> compre the packet_in addr and the addr in DFFs 
			else
			begin
				data_bit_array			<= data_bit_array << 1; //set the bit array left shift one bit
				case(comp_result)
					//change_data = 1
					4'd1:
					begin
							if(id_comp_result_ID_0[0][0])
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1] 			<= addr_count_data[0];
								addr_count_data[2] 			<= {(addr_count_data[1][54:51] + 1'b1) , addr_count_data[1][50:32] , (addr_count_data[1][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							else
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1] 			<= addr_count_data[0];
								addr_count_data[2] 			<= addr_count_data[2];
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
								addr_count_data_ID_1[0] 	<= 36'd0;
								addr_count_data_ID_1[1] 	<= {(addr_count_data_ID_1[0][35:32] + 1'b1) , (addr_count_data_ID_1[0][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
					end
					//change_data = 2
					4'd2:
					begin
						case({id_comp_result_ID_1[1][0] , id_comp_result_ID_0[1][0]})
							2'b01:
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1]		 	<= addr_count_data[0];
								addr_count_data[2] 			<= addr_count_data[1];
								addr_count_data[3] 			<= {(addr_count_data[2][54:51] + 1'b1) , addr_count_data[2][50:32] , (addr_count_data[2][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							2'b10:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
								addr_count_data_ID_1[0] 	<= 36'd0;
								addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
								addr_count_data_ID_1[2] 	<= {(addr_count_data_ID_1[1][35:32] + 1'b1) , (addr_count_data_ID_1[1][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							default:
							begin
								if(id_comp_result_ID_1[1][1])
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
									addr_count_data[13] 			<= addr_count_data[12];
									{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
									addr_count_data_ID_1[0] 	<= 36'd0;
									addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
									addr_count_data_ID_1[2] 	<= {(addr_count_data_ID_1[1][35:32] + 1'b1) , (addr_count_data_ID_1[1][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
								else
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
									addr_count_data[13] 		<= addr_count_data[12];
									{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
									addr_count_data_ID_2[1] 	<= {(addr_count_data_ID_2[0][35:32] + 1'b1) , (addr_count_data_ID_2[0][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							end
						endcase
					end
					//change_data = 3
					4'd3:
					begin
						case({id_comp_result_ID_2[2][0] , id_comp_result_ID_1[2][0] , id_comp_result_ID_0[2][0]})
							3'b001:
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1]		 	<= addr_count_data[0];
								addr_count_data[2] 			<= addr_count_data[1];
								addr_count_data[3] 			<= addr_count_data[2];
								addr_count_data[4] 			<= {(addr_count_data[3][54:51] + 1'b1) , addr_count_data[3][50:32] , (addr_count_data[3][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							3'b010:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
								addr_count_data_ID_1[0] 	<= 36'd0;
								addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
								addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
								addr_count_data_ID_1[3] 	<= {(addr_count_data_ID_1[2][35:32] + 1'b1) , (addr_count_data_ID_1[2][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							3'b100:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_2[2] 	<= {(addr_count_data_ID_2[1][35:32] + 1'b1) , (addr_count_data_ID_2[1][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							default:
							begin
								case({id_comp_result_ID_2[2][1] , id_comp_result_ID_1[2][1]})
									2'b11:
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
										addr_count_data[13] 			<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
										addr_count_data_ID_1[0] 	<= 36'd0;
										addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
										addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
										addr_count_data_ID_1[3] 	<= {(addr_count_data_ID_1[2][35:32] + 1'b1) , (addr_count_data_ID_1[2][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									2'b10:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_2[2] 	<= {(addr_count_data_ID_2[1][35:32] + 1'b1) , (addr_count_data_ID_2[1][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									default:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_3[1] 	<= {(addr_count_data_ID_3[0][35:32] + 1'b1) , (addr_count_data_ID_3[0][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
						endcase
					end
					//change_data = 4
					4'd4:
					begin
						case({id_comp_result_ID_3[3][0] , id_comp_result_ID_2[3][0] , id_comp_result_ID_1[3][0] , id_comp_result_ID_0[3][0]})
							4'b0001:
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1]		 	<= addr_count_data[0];
								addr_count_data[2] 			<= addr_count_data[1];
								addr_count_data[3] 			<= addr_count_data[2];
								addr_count_data[4] 			<= addr_count_data[3];
								addr_count_data[5] 			<= {(addr_count_data[4][54:51] + 1'b1) , addr_count_data[4][50:32] , (addr_count_data[4][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data[6] 			<= addr_count_data[5];
								addr_count_data[7] 			<= addr_count_data[6];
								addr_count_data[8] 			<= addr_count_data[7];
								addr_count_data[9] 			<= addr_count_data[8];
								addr_count_data[10] 		<= addr_count_data[9];
								addr_count_data[11] 		<= addr_count_data[10];
								addr_count_data[12] 		<= addr_count_data[11];
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
							4'b0010:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
								addr_count_data_ID_1[0] 	<= 36'd0;
								addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
								addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
								addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
								addr_count_data_ID_1[4] 	<= {(addr_count_data_ID_1[3][35:32] + 1'b1) , (addr_count_data_ID_1[3][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b0100:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_2[3] 	<= {(addr_count_data_ID_2[2][35:32] + 1'b1) , (addr_count_data_ID_2[2][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b1000:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_3[2] 	<= {(addr_count_data_ID_3[1][35:32] + 1'b1) , (addr_count_data_ID_3[1][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							default:
							begin
								case({id_comp_result_ID_3[3][1] , id_comp_result_ID_2[3][1] , id_comp_result_ID_1[3][1]})
									3'b111:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
										addr_count_data_ID_1[0] 	<= 36'd0;
										addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
										addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
										addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
										addr_count_data_ID_1[4] 	<= {(addr_count_data_ID_1[3][35:32] + 1'b1) , (addr_count_data_ID_1[3][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b110:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_2[3] 	<= {(addr_count_data_ID_2[2][35:32] + 1'b1) , (addr_count_data_ID_2[2][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b100:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_3[2] 	<= {(addr_count_data_ID_3[1][35:32] + 1'b1) , (addr_count_data_ID_3[1][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
						endcase
					end
					//change_data = 5
					4'd5:
					begin
						case({id_comp_result_ID_3[4][0] , id_comp_result_ID_2[4][0] , id_comp_result_ID_1[4][0] , id_comp_result_ID_0[4][0]})
							4'b0001:
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1]		 	<= addr_count_data[0];
								addr_count_data[2] 			<= addr_count_data[1];
								addr_count_data[3] 			<= addr_count_data[2];
								addr_count_data[4] 			<= addr_count_data[3];
								addr_count_data[5] 			<= addr_count_data[4];
								addr_count_data[6] 			<= {(addr_count_data[5][54:51] + 1'b1) , addr_count_data[5][50:32] , (addr_count_data[5][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data[7] 			<= addr_count_data[6];
								addr_count_data[8] 			<= addr_count_data[7];
								addr_count_data[9] 			<= addr_count_data[8];
								addr_count_data[10] 		<= addr_count_data[9];
								addr_count_data[11] 		<= addr_count_data[10];
								addr_count_data[12] 		<= addr_count_data[11];
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
							4'b0010:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
								addr_count_data_ID_1[0] 	<= 36'd0;
								addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
								addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
								addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
								addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
								addr_count_data_ID_1[5] 	<= {(addr_count_data_ID_1[4][35:32] + 1'b1) , (addr_count_data_ID_1[4][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b0100:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_2[4] 	<= {(addr_count_data_ID_2[3][35:32] + 1'b1) , (addr_count_data_ID_2[3][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b1000:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_3[3] 	<= {(addr_count_data_ID_3[2][35:32] + 1'b1) , (addr_count_data_ID_3[2][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data_ID_3[4] 	<= addr_count_data_ID_3[3];
								addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
								addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
								addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
								addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
								addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
								addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
								{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];		
							end
							default:
							begin
								case({id_comp_result_ID_3[4][1] , id_comp_result_ID_2[4][1] , id_comp_result_ID_1[4][1]})
									3'b111:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
										addr_count_data_ID_1[0] 	<= 36'd0;
										addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
										addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
										addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
										addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
										addr_count_data_ID_1[5] 	<= {(addr_count_data_ID_1[4][35:32] + 1'b1) , (addr_count_data_ID_1[4][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b110:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_2[4] 	<= {(addr_count_data_ID_2[3][35:32] + 1'b1) , (addr_count_data_ID_2[3][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b100:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_3[3] 	<= {(addr_count_data_ID_3[2][35:32] + 1'b1) , (addr_count_data_ID_3[2][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
										addr_count_data_ID_3[4] 	<= addr_count_data_ID_3[3];
										addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
										addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
										addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
										addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
										addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
										addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
										{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
									end
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
						endcase
					end
					//change_data = 6
					4'd6:
					begin
						case({id_comp_result_ID_3[5][0] , id_comp_result_ID_2[5][0] , id_comp_result_ID_1[5][0] , id_comp_result_ID_0[5][0]})
							4'b0001:
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1]		 	<= addr_count_data[0];
								addr_count_data[2] 			<= addr_count_data[1];
								addr_count_data[3] 			<= addr_count_data[2];
								addr_count_data[4] 			<= addr_count_data[3];
								addr_count_data[5] 			<= addr_count_data[4];
								addr_count_data[6] 			<= addr_count_data[5];
								addr_count_data[7] 			<= {(addr_count_data[6][54:51] + 1'b1) , addr_count_data[6][50:32] , (addr_count_data[6][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data[8] 			<= addr_count_data[7];
								addr_count_data[9] 			<= addr_count_data[8];
								addr_count_data[10] 		<= addr_count_data[9];
								addr_count_data[11] 		<= addr_count_data[10];
								addr_count_data[12] 		<= addr_count_data[11];
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
							4'b0010:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
								addr_count_data_ID_1[0] 	<= 36'd0;
								addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
								addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
								addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
								addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
								addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
								addr_count_data_ID_1[6] 	<= {(addr_count_data_ID_1[5][35:32] + 1'b1) , (addr_count_data_ID_1[5][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b0100:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_2[5] 	<= {(addr_count_data_ID_2[4][35:32] + 1'b1) , (addr_count_data_ID_2[4][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b1000:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_3[4] 	<= {(addr_count_data_ID_3[3][35:32] + 1'b1) , (addr_count_data_ID_3[3][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
								addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
								addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
								addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
								addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
								addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
								{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];	
							end
							default:
							begin
								case({id_comp_result_ID_3[5][1] , id_comp_result_ID_2[5][1] , id_comp_result_ID_1[5][1]})
									3'b111:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
										addr_count_data_ID_1[0] 	<= 36'd0;
										addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
										addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
										addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
										addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
										addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
										addr_count_data_ID_1[6] 	<= {(addr_count_data_ID_1[5][35:32] + 1'b1) , (addr_count_data_ID_1[5][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b110:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_2[5] 	<= {(addr_count_data_ID_2[4][35:32] + 1'b1) , (addr_count_data_ID_2[4][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b100:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_3[4] 	<= {(addr_count_data_ID_3[3][35:32] + 1'b1) , (addr_count_data_ID_3[3][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
										addr_count_data_ID_3[5] 	<= addr_count_data_ID_3[4];
										addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
										addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
										addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
										addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
										addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
										{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
									end
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
						endcase
					end
					//change_data = 7
					4'd7:
					begin
						case({id_comp_result_ID_3[6][0] , id_comp_result_ID_2[6][0] , id_comp_result_ID_1[6][0] , id_comp_result_ID_0[6][0]})
							4'b0001:
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1]		 	<= addr_count_data[0];
								addr_count_data[2] 			<= addr_count_data[1];
								addr_count_data[3] 			<= addr_count_data[2];
								addr_count_data[4] 			<= addr_count_data[3];
								addr_count_data[5] 			<= addr_count_data[4];
								addr_count_data[6] 			<= addr_count_data[5];
								addr_count_data[7] 			<= addr_count_data[6];
								addr_count_data[8] 			<= {(addr_count_data[7][54:51] + 1'b1) , addr_count_data[7][50:32] , (addr_count_data[7][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data[9] 			<= addr_count_data[8];
								addr_count_data[10] 		<= addr_count_data[9];
								addr_count_data[11] 		<= addr_count_data[10];
								addr_count_data[12] 		<= addr_count_data[11];
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
							4'b0010:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
								addr_count_data_ID_1[0] 	<= 36'd0;
								addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
								addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
								addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
								addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
								addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
								addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
								addr_count_data_ID_1[7] 	<= {(addr_count_data_ID_1[6][35:32] + 1'b1) , (addr_count_data_ID_1[6][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b0100:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_2[6] 	<= {(addr_count_data_ID_2[5][35:32] + 1'b1) , (addr_count_data_ID_2[5][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b1000:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_3[5] 	<= {(addr_count_data_ID_3[4][35:32] + 1'b1) , (addr_count_data_ID_3[4][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
								addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
								addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
								addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
								addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
								{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];		
							end
							default:
							begin
								case({id_comp_result_ID_3[6][1] , id_comp_result_ID_2[6][1] , id_comp_result_ID_1[6][1]})
									3'b111:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
										addr_count_data_ID_1[0] 	<= 36'd0;
										addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
										addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
										addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
										addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
										addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
										addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
										addr_count_data_ID_1[7] 	<= {(addr_count_data_ID_1[6][35:32] + 1'b1) , (addr_count_data_ID_1[6][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b110:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_2[6] 	<= {(addr_count_data_ID_2[5][35:32] + 1'b1) , (addr_count_data_ID_2[5][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b100:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_3[5] 	<= {(addr_count_data_ID_3[4][35:32] + 1'b1) , (addr_count_data_ID_3[4][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
										addr_count_data_ID_3[6] 	<= addr_count_data_ID_3[5];
										addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
										addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
										addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
										addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
										{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
									end
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
						endcase
					end
					//change_data = 8
					4'd8:
					begin
						case({id_comp_result_ID_3[7][0] , id_comp_result_ID_2[7][0] , id_comp_result_ID_1[7][0] , id_comp_result_ID_0[7][0]})
							4'b0001:
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1]		 	<= addr_count_data[0];
								addr_count_data[2] 			<= addr_count_data[1];
								addr_count_data[3] 			<= addr_count_data[2];
								addr_count_data[4] 			<= addr_count_data[3];
								addr_count_data[5] 			<= addr_count_data[4];
								addr_count_data[6] 			<= addr_count_data[5];
								addr_count_data[7] 			<= addr_count_data[6];
								addr_count_data[8] 			<= addr_count_data[7];
								addr_count_data[9] 			<= {(addr_count_data[8][54:51] + 1'b1) , addr_count_data[8][50:32] , (addr_count_data[8][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data[10] 		<= addr_count_data[9];
								addr_count_data[11] 		<= addr_count_data[10];
								addr_count_data[12] 		<= addr_count_data[11];
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
							4'b0010:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
								addr_count_data_ID_1[0] 	<= 36'd0;
								addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
								addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
								addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
								addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
								addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
								addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
								addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
								addr_count_data_ID_1[8] 	<= {(addr_count_data_ID_1[7][35:32] + 1'b1) , (addr_count_data_ID_1[7][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b0100:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_2[7] 	<= {(addr_count_data_ID_2[6][35:32] + 1'b1) , (addr_count_data_ID_2[6][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b1000:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_3[6] 	<= {(addr_count_data_ID_3[5][35:32] + 1'b1) , (addr_count_data_ID_3[5][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
								addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
								addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
								addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
								{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
							end
							default:
							begin
								case({id_comp_result_ID_3[7][1] , id_comp_result_ID_2[7][1] , id_comp_result_ID_1[7][1]})
									3'b111:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
										addr_count_data_ID_1[0] 	<= 36'd0;
										addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
										addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
										addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
										addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
										addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
										addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
										addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
										addr_count_data_ID_1[8] 	<= {(addr_count_data_ID_1[7][35:32] + 1'b1) , (addr_count_data_ID_1[7][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b110:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_2[7] 	<= {(addr_count_data_ID_2[6][35:32] + 1'b1) , (addr_count_data_ID_2[6][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b100:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_3[6] 	<= {(addr_count_data_ID_3[5][35:32] + 1'b1) , (addr_count_data_ID_3[5][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
										addr_count_data_ID_3[7] 	<= addr_count_data_ID_3[6];
										addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
										addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
										addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
										{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
									end
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
						endcase
					end
					//change_data = 9
					4'd9:
					begin
						case({id_comp_result_ID_3[8][0] , id_comp_result_ID_2[8][0] , id_comp_result_ID_1[8][0] , id_comp_result_ID_0[8][0]})
							4'b0001:
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1]		 	<= addr_count_data[0];
								addr_count_data[2] 			<= addr_count_data[1];
								addr_count_data[3] 			<= addr_count_data[2];
								addr_count_data[4] 			<= addr_count_data[3];
								addr_count_data[5] 			<= addr_count_data[4];
								addr_count_data[6] 			<= addr_count_data[5];
								addr_count_data[7] 			<= addr_count_data[6];
								addr_count_data[8] 			<= addr_count_data[7];
								addr_count_data[9] 			<= addr_count_data[8];
								addr_count_data[10] 		<= {(addr_count_data[9][54:51] + 1'b1) , addr_count_data[9][50:32] , (addr_count_data[9][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data[11] 		<= addr_count_data[10];
								addr_count_data[12] 		<= addr_count_data[11];
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
							4'b0010:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
								addr_count_data_ID_1[0] 	<= 36'd0;
								addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
								addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
								addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
								addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
								addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
								addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
								addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
								addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
								addr_count_data_ID_1[9] 	<= {(addr_count_data_ID_1[8][35:32] + 1'b1) , (addr_count_data_ID_1[8][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b0100:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_2[8] 	<= {(addr_count_data_ID_2[7][35:32] + 1'b1) , (addr_count_data_ID_2[7][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b1000:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_3[7] 	<= {(addr_count_data_ID_3[6][35:32] + 1'b1) , (addr_count_data_ID_3[6][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
								addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
								addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
								{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];	
							end
							default:
							begin
								case({id_comp_result_ID_3[8][1] , id_comp_result_ID_2[8][1] , id_comp_result_ID_1[8][1]})
									3'b111:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
										addr_count_data_ID_1[0] 	<= 36'd0;
										addr_count_data_ID_1[1] 	<= addr_count_data_ID_1[0];
										addr_count_data_ID_1[2] 	<= addr_count_data_ID_1[1];
										addr_count_data_ID_1[3] 	<= addr_count_data_ID_1[2];
										addr_count_data_ID_1[4] 	<= addr_count_data_ID_1[3];
										addr_count_data_ID_1[5] 	<= addr_count_data_ID_1[4];
										addr_count_data_ID_1[6] 	<= addr_count_data_ID_1[5];
										addr_count_data_ID_1[7] 	<= addr_count_data_ID_1[6];
										addr_count_data_ID_1[8] 	<= addr_count_data_ID_1[7];
										addr_count_data_ID_1[9] 	<= {(addr_count_data_ID_1[8][35:32] + 1'b1) , (addr_count_data_ID_1[8][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b110:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_2[8] 	<= {(addr_count_data_ID_2[7][35:32] + 1'b1) , (addr_count_data_ID_2[7][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b100:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_3[7] 	<= {(addr_count_data_ID_3[6][35:32] + 1'b1) , (addr_count_data_ID_3[6][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
										addr_count_data_ID_3[8] 	<= addr_count_data_ID_3[7];
										addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
										addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
										{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];	
									end
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
						endcase
					end
					//change_data = 10
					4'd10:
					begin
						case({id_comp_result_ID_3[9][0] , id_comp_result_ID_2[9][0] , id_comp_result_ID_1[9][0] , id_comp_result_ID_0[9][0]})
							4'b0001:
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1]		 	<= addr_count_data[0];
								addr_count_data[2] 			<= addr_count_data[1];
								addr_count_data[3] 			<= addr_count_data[2];
								addr_count_data[4] 			<= addr_count_data[3];
								addr_count_data[5] 			<= addr_count_data[4];
								addr_count_data[6] 			<= addr_count_data[5];
								addr_count_data[7] 			<= addr_count_data[6];
								addr_count_data[8] 			<= addr_count_data[7];
								addr_count_data[9] 			<= addr_count_data[8];
								addr_count_data[10] 		<= addr_count_data[9];
								addr_count_data[11] 		<= {(addr_count_data[10][54:51] + 1'b1) , addr_count_data[10][50:32] , (addr_count_data[10][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data[12] 		<= addr_count_data[11];
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
							4'b0010:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_1[10] 	<= {(addr_count_data_ID_1[9][35:32] + 1'b1) , (addr_count_data_ID_1[9][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b0100:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_2[8] 	<=  addr_count_data_ID_2[7];
								addr_count_data_ID_2[9] 	<={(addr_count_data_ID_2[8][35:32] + 1'b1) , (addr_count_data_ID_2[8][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b1000:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_3[8] 	<= {(addr_count_data_ID_3[7][35:32] + 1'b1) , (addr_count_data_ID_3[7][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
								addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
								{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];	
							end
							default:
							begin
								case({id_comp_result_ID_3[9][1] , id_comp_result_ID_2[9][1] , id_comp_result_ID_1[9][1]})
									3'b111:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_1[10] 	<= {(addr_count_data_ID_1[9][35:32] + 1'b1) , (addr_count_data_ID_1[9][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b110:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_2[9] 	<= {(addr_count_data_ID_2[8][35:32] + 1'b1) , (addr_count_data_ID_2[8][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b100:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_3[8] 	<= {(addr_count_data_ID_3[7][35:32] + 1'b1) , (addr_count_data_ID_3[7][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
										addr_count_data_ID_3[9] 	<= addr_count_data_ID_3[8];
										addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
										{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
									end
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
						endcase
					end
					//change_data = 11
					4'd11:
					begin
						case({id_comp_result_ID_3[10][0] , id_comp_result_ID_2[10][0] , id_comp_result_ID_1[10][0] , id_comp_result_ID_0[10][0]})
							4'b0001:
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1]		 	<= addr_count_data[0];
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
								addr_count_data[12] 		<= {(addr_count_data[11][54:51] + 1'b1) , addr_count_data[11][50:32] , (addr_count_data[11][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
							4'b0010:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_1[11] 	<= {(addr_count_data_ID_1[10][35:32] + 1'b1) , (addr_count_data_ID_1[10][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b0100:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_2[10] 	<= {(addr_count_data_ID_2[9][35:32] + 1'b1) , (addr_count_data_ID_2[9][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b1000:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_3[9] 	<= {(addr_count_data_ID_3[8][35:32] + 1'b1) , (addr_count_data_ID_3[8][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
								{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];
							end
							default:
							begin
								case({id_comp_result_ID_3[10][1] , id_comp_result_ID_2[10][1] , id_comp_result_ID_1[10][1]})
									3'b111:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_1[11] 	<= {(addr_count_data_ID_1[10][35:32] + 1'b1) , (addr_count_data_ID_1[10][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b110:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_2[10] 	<= {(addr_count_data_ID_2[9][35:32] + 1'b1) , (addr_count_data_ID_2[9][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b100:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_3[9] 	<= {(addr_count_data_ID_3[8][35:32] + 1'b1) , (addr_count_data_ID_3[8][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
										addr_count_data_ID_3[10] 	<= addr_count_data_ID_3[9];
										{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];	
									end
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
						endcase
					end
					//change_data = 12
					4'd12:
					begin
						case({id_comp_result_ID_3[11][0] , id_comp_result_ID_2[11][0] , id_comp_result_ID_1[11][0] , id_comp_result_ID_0[11][0]})
							4'b0001:
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1]		 	<= addr_count_data[0];
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
								addr_count_data[13] 		<= {(addr_count_data[12][54:51] + 1'b1) , addr_count_data[12][50:32] , (addr_count_data[12][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
							4'b0010:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_1[12] 	<= {(addr_count_data_ID_1[11][35:32] + 1'b1) , (addr_count_data_ID_1[11][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b0100:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_2[11] 	<= {(addr_count_data_ID_2[10][35:32] + 1'b1) , (addr_count_data_ID_2[10][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b1000:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								addr_count_data_ID_3[10] 	<= {(addr_count_data_ID_3[9][35:32] + 1'b1) , (addr_count_data_ID_3[9][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
								{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];	
							end
							default:
							begin
								case({id_comp_result_ID_3[11][1] , id_comp_result_ID_2[11][1] , id_comp_result_ID_1[11][1]})
									3'b111:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_1[12] 	<= {(addr_count_data_ID_1[11][35:32] + 1'b1) , (addr_count_data_ID_1[11][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b110:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_2[11] 	<= {(addr_count_data_ID_2[10][35:32] + 1'b1) , (addr_count_data_ID_2[10][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b100:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										addr_count_data_ID_3[10] 	<= {(addr_count_data_ID_3[9][35:32] + 1'b1) , (addr_count_data_ID_3[9][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
										{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= addr_count_data_ID_3[10];	
									end
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
						endcase
					end
					//change_data = 13
					4'd13:
					begin
						case({id_comp_result_ID_3[12][0] , id_comp_result_ID_2[12][0] , id_comp_result_ID_1[12][0] , id_comp_result_ID_0[12][0]})
							4'b0001:
							begin
								addr_count_data[0] 			<= 51'd0;
								addr_count_data[1]		 	<= addr_count_data[0];
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= {(addr_count_data[13][54:51] + 1'b1) , addr_count_data[13][50:32] , (addr_count_data[13][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b0010:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= {(addr_count_data_ID_1[12][35:32] + 1'b1) , (addr_count_data_ID_1[12][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b0100:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  <= {(addr_count_data_ID_2[11][35:32] + 1'b1) , (addr_count_data_ID_2[11][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
							4'b1000:
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
								addr_count_data[13] 		<= addr_count_data[12];
								{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
								{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  	<= {(addr_count_data_ID_3[10][35:32] + 1'b1) , (addr_count_data_ID_3[10][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
							end
							default:
							begin
								case({id_comp_result_ID_3[12][1] , id_comp_result_ID_2[12][1] , id_comp_result_ID_1[12][1]})
									3'b111:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										{packet_count_ID_1 , byte_count_ID_1 , SRAM_ID_1}  		<= {(addr_count_data_ID_1[12][35:32] + 1'b1) , (addr_count_data_ID_1[12][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b110:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										{packet_count_ID_2 , byte_count_ID_2 , SRAM_ID_2}  		<= {(addr_count_data_ID_2[11][35:32] + 1'b1) , (addr_count_data_ID_2[11][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
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
									3'b100:
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
										addr_count_data[13] 		<= addr_count_data[12];
										{packet_count_ID_0 , rmw_addr , byte_count_ID_0 , SRAM_ID_0} 	<= addr_count_data[13];
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
										{packet_count_ID_3 , byte_count_ID_3 , SRAM_ID_3}  		<= {(addr_count_data_ID_3[10][35:32] + 1'b1) , (addr_count_data_ID_3[10][31:16] + delay1_write_data[63:48]) , delay1_write_data[47:32]};
									end
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
						endcase
					end
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

