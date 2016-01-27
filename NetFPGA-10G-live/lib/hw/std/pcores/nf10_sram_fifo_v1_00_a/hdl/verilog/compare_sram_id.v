`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:28:55 01/12/2016 
// Design Name: 
// Module Name:    compare_sram_id 
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
/*module compare_sram_id(clk , reset , ena , id_comp_result , id_comp_result_valid , id_comp_zero_valid , ID_data_0 , ID_data_1 , ID_data_2 , ID_data_3 ,ID_data_4 , ID_data_5 , ID_data_6 , ID_data_7 , ID_data_8 , ID_data_9 , ID_data_10 , ID_data_11 , ID_data_12 , ID_data_13 , packet_in_ID);*/
module compare_sram_id(id_comp_result , id_comp_result_valid , id_comp_zero_valid , ID_data , change_data , packet_in_ID , ena);
	/*input						clk , reset;
	input						ena;
	input			[15:0]	ID_data_0 , ID_data_1 , ID_data_2 , ID_data_3 ,ID_data_4 , ID_data_5 , ID_data_6; 
	input			[15:0]	ID_data_7 , ID_data_8 , ID_data_9 , ID_data_10 , ID_data_11 , ID_data_12 , ID_data_13;	
	input			[15:0]	packet_in_ID;
	output reg	[3:0]		id_comp_result;
	output reg				id_comp_result_valid;
	output reg				id_comp_zero_valid;
	reg			[1:0]	comp_result_0 , comp_result_1 , comp_result_2 , comp_result_3 ,comp_result_4 , comp_result_5 , comp_result_6; 
	reg			[1:0]	comp_result_7 , comp_result_8 , comp_result_9 , comp_result_10 , comp_result_11 , comp_result_12 , comp_result_13;*/	
	
	input			[15:0]	ID_data;
	input			[3:0]		change_data;
	input			[15:0]	packet_in_ID;
	input						ena;
	output reg	[3:0]		id_comp_result;
	output reg				id_comp_result_valid;
	output reg				id_comp_zero_valid;
	
	always@(*)
	begin
		if((ID_data == 16'd0)&ena)
		begin
			id_comp_result = 4'd0;
			id_comp_result_valid = 1'b0;
			id_comp_zero_valid = 1'b1;
		end
		else if((ID_data == packet_in_ID)&ena)
		begin
			id_comp_result = change_data;
			id_comp_result_valid = 1'b1;
			id_comp_zero_valid = 1'b0;
		end
		else
		begin
			id_comp_result = 4'd0;
			id_comp_result_valid = 1'b0;
			id_comp_zero_valid = 1'b0;
		end
	end
	
	/*always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			id_comp_result <= 4'd0;
			id_comp_result_valid <= 1'b0;
			id_comp_zero_valid <= 1'b0;
		end
		else
		begin
			case({(comp_result_0[1]|comp_result_1[1]|comp_result_2[1]|comp_result_3[1]|comp_result_4[1]|comp_result_5[1]|comp_result_6[1]|comp_result_7[1]|comp_result_8[1]|comp_result_9[1]|comp_result_10[1]|comp_result_11[1]|comp_result_12[1]|comp_result_13[1]) , comp_result_0[1] , comp_result_1[1] , comp_result_2[1] , comp_result_3[1] , comp_result_4[1] , comp_result_5[1] , comp_result_6[1] , comp_result_7[1] , comp_result_8[1] , comp_result_9[1] , comp_result_10[1] , comp_result_11[1] , comp_result_12[1] , comp_result_13[1] , comp_result_0[0] , comp_result_1[0] , comp_result_2[0] , comp_result_3[0] ,comp_result_4[0] , comp_result_5[0] , comp_result_6[0] , comp_result_7[0] , comp_result_8[0] , comp_result_9[0] , comp_result_10[0] , comp_result_11[0] , comp_result_12[0] , comp_result_13[0]})
				//the value in data_addr isn't zero
				29'd000_0000_0000_0000_00_0000_0000_0001:
				begin
					id_comp_result <= 4'd1;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				29'd000_0000_0000_0000_00_0000_0000_0010:
				begin
					id_comp_result <= 4'd2;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				29'd000_0000_0000_0000_00_0000_0000_0100:
				begin
					id_comp_result <= 4'd3;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				29'd000_0000_0000_0000_00_0000_0000_1000:
				begin
					id_comp_result <= 4'd4;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				29'd000_0000_0000_0000_00_0000_0001_0000:
				begin
					id_comp_result <= 4'd5;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				29'd000_0000_0000_0000_00_0000_0010_0000:
				begin
					id_comp_result <= 4'd6;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				29'd000_0000_0000_0000_00_0000_0100_0000:
				begin
					id_comp_result <= 4'd7;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				29'd000_0000_0000_0000_00_0000_1000_0000:
				begin
					id_comp_result <= 4'd8;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				29'd000_0000_0000_0000_00_0001_0000_0000:
				begin
					id_comp_result <= 4'd9;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				29'd000_0000_0000_0000_00_0010_0000_0000:
				begin
					id_comp_result <= 4'd10;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				29'd000_0000_0000_0000_00_0100_0000_0000:
				begin
					id_comp_result <= 4'd11;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				29'd000_0000_0000_0000_00_1000_0000_0000:
				begin
					id_comp_result <= 4'd12;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				29'd000_0000_0000_0000_01_0000_0000_0000:
				begin
					id_comp_result <= 4'd13;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				29'd000_0000_0000_0000_10_0000_0000_0000:
				begin
					id_comp_result <= 4'd14;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				//the value in data_addr is zero
				29'd111_1111_1111_1111_00_0000_0000_0000:
				begin
					id_comp_result <= 4'd0;
					id_comp_result_valid <= 1'b0;
					id_comp_zero_valid <= 1'b1;
				end
				default:					 
				begin
					id_comp_result <= 4'd0;
					id_comp_result_valid <= 1'b0;
					id_comp_zero_valid <= 1'b1;
				end
			endcase
		end
	end
	
	always@(*)
	begin
		if((packet_in_ID == ID_data_0)&ena)
		begin
			comp_result_0 = 2'd1;
		end
		else if((ID_data_0 == 16'd0)&ena)
		begin
			comp_result_0 = 2'd2;
		end
		else
		begin
			comp_result_0 = 2'd0;
		end
	end
	always@(*)
	begin
		if((packet_in_ID == ID_data_1)&ena)
		begin
			comp_result_1 = 2'd1;
		end
		else if((ID_data_1 == 16'd0)&ena)
		begin
			comp_result_1 = 2'd2;
		end
		else
		begin
			comp_result_1 = 2'd0;
		end
	end
	always@(*)
	begin
		if((packet_in_ID == ID_data_2)&ena)
		begin
			comp_result_2 = 2'd1;
		end
		else if((ID_data_2 == 16'd0)&ena)
		begin
			comp_result_2 = 2'd2;
		end
		else
		begin
			comp_result_2 = 2'd0;
		end
	end
	always@(*)
	begin
		if((packet_in_ID == ID_data_3)&ena)
		begin
			comp_result_3 = 2'd1;
		end
		else if((ID_data_3 == 16'd0)&ena)
		begin
			comp_result_3 = 2'd2;
		end
		else
		begin
			comp_result_3 = 2'd0;
		end
	end
	always@(*)
	begin
		if((packet_in_ID == ID_data_4)&ena)
		begin
			comp_result_4 = 2'd1;
		end
		else if((ID_data_4 == 16'd0)&ena)
		begin
			comp_result_4 = 2'd2;
		end
		else
		begin
			comp_result_4 = 2'd0;
		end
	end
	always@(*)
	begin
		if((packet_in_ID == ID_data_5)&ena)
		begin
			comp_result_5 = 2'd1;
		end
		else if((ID_data_5 == 16'd0)&ena)
		begin
			comp_result_5 = 2'd2;
		end
		else
		begin
			comp_result_5 = 2'd0;
		end
	end
	always@(*)
	begin
		if((packet_in_ID == ID_data_6)&ena)
		begin
			comp_result_6 = 2'd1;
		end
		else if((ID_data_6 == 16'd0)&ena)
		begin
			comp_result_6 = 2'd2;
		end
		else
		begin
			comp_result_6 = 2'd0;
		end
	end
	always@(*)
	begin
		if((packet_in_ID == ID_data_7)&ena)
		begin
			comp_result_7 = 2'd1;
		end
		else if((ID_data_7 == 16'd0)&ena)
		begin
			comp_result_7 = 2'd2;
		end
		else
		begin
			comp_result_7 = 2'd0;
		end
	end
	always@(*)
	begin
		if((packet_in_ID == ID_data_8)&ena)
		begin
			comp_result_8 = 2'd1;
		end
		else if((ID_data_8 == 16'd0)&ena)
		begin
			comp_result_8 = 2'd2;
		end
		else
		begin
			comp_result_8 = 2'd0;
		end
	end
	always@(*)
	begin
		if((packet_in_ID == ID_data_9)&ena)
		begin
			comp_result_9 = 2'd1;
		end
		else if((ID_data_9 == 16'd0)&ena)
		begin
			comp_result_9 = 2'd2;
		end
		else
		begin
			comp_result_9 = 2'd0;
		end
	end
	always@(*)
	begin
		if((packet_in_ID == ID_data_10)&ena)
		begin
			comp_result_10 = 2'd1;
		end
		else if((ID_data_10 == 16'd0)&ena)
		begin
			comp_result_10 = 2'd2;
		end
		else
		begin
			comp_result_10 = 2'd0;
		end
	end
	always@(*)
	begin
		if((packet_in_ID == ID_data_11)&ena)
		begin
			comp_result_11 = 2'd1;
		end
		else if((ID_data_11 == 16'd0)&ena)
		begin
			comp_result_11 = 2'd2;
		end
		else
		begin
			comp_result_11 = 2'd0;
		end
	end
	always@(*)
	begin
		if((packet_in_ID == ID_data_12)&ena)
		begin
			comp_result_12 = 2'd1;
		end
		else if((ID_data_12 == 16'd0)&ena)
		begin
			comp_result_12 = 2'd2;
		end
		else
		begin
			comp_result_12 = 2'd0;
		end
	end
	always@(*)
	begin
		if((packet_in_ID == ID_data_13)&ena)
		begin
			comp_result_13 = 2'd1;
		end
		else if((ID_data_13 == 16'd0)&ena)
		begin
			comp_result_13 = 2'd2;
		end
		else
		begin
			comp_result_13 = 2'd0;
		end
	end*/
	
endmodule

