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
module compare_sram_id(clk , reset , ena , comp_result_0 , comp_result_1 , comp_result_2 , comp_result_3 ,comp_result_4 , comp_result_5 , comp_result_6 , comp_result_7 , comp_result_8 , comp_result_9 , comp_result_10 , comp_result_11 , comp_result_12 , comp_result_13 , id_comp_result_valid , id_comp_zero_valid , change_data , ID_data_0 , ID_data_1 , ID_data_2 , ID_data_3 ,ID_data_4 , ID_data_5 , ID_data_6 , ID_data_7 , ID_data_8 , ID_data_9 , ID_data_10 , ID_data_11 , ID_data_12 , ID_data_13 , packet_in_ID);
//module compare_sram_id(id_comp_result , id_comp_result_valid , id_comp_zero_valid , ID_data , change_data , packet_in_ID , ena);
	input						clk , reset;
	input			[13:0]	ena;
	input			[3:0]		change_data;
	input			[15:0]	ID_data_0 , ID_data_1 , ID_data_2 , ID_data_3 ,ID_data_4 , ID_data_5 , ID_data_6; 
	input			[15:0]	ID_data_7 , ID_data_8 , ID_data_9 , ID_data_10 , ID_data_11 , ID_data_12 , ID_data_13;	
	input			[15:0]	packet_in_ID;
	output reg		[1:0]	comp_result_0 , comp_result_1 , comp_result_2 , comp_result_3 ,comp_result_4 , comp_result_5 , comp_result_6; 
	output reg		[1:0]	comp_result_7 , comp_result_8 , comp_result_9 , comp_result_10 , comp_result_11 , comp_result_12 , comp_result_13;	
	output reg				id_comp_result_valid;
	output reg				id_comp_zero_valid;
	//reg				[1:0]	comp_result	[13:0];
	
	/*always@(*)
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
	end*/
	
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
			case(comp_result[change_data])
				//the value in data_addr isn't zero
				2'd0: 
				begin
					id_comp_result <= 4'd0;
					id_comp_result_valid <= 1'b0;
					id_comp_zero_valid <= 1'b0;
				end
				2'd1:
				begin
					id_comp_result <= change_data;
					id_comp_result_valid <= 1'b1;
					id_comp_zero_valid <= 1'b0;
				end
				2'd2:
				begin
					id_comp_result <= change_data;
					id_comp_result_valid <= 1'b0;
					id_comp_zero_valid <= 1'b1;
				end
				default:
				begin
					id_comp_result <= 4'd0;
					id_comp_result_valid <= 1'b0;
					id_comp_zero_valid <= 1'b0;
				end
			endcase
		end
	end*/
	
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_0 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_0)&ena[0])
			begin
				comp_result_0 <= 2'd1;
			end
			else if((ID_data_0 == 16'd0)&ena[0])
			begin
				comp_result_0 <= 2'd2;
			end
			else
			begin
				comp_result_0 <= 2'd0;
			end
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_1 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_1)&ena[1])
			begin
				comp_result_1 <= 2'd1;
			end
			else if((ID_data_1 == 16'd0)&ena[1])
			begin
				comp_result_1 <= 2'd2;
			end
			else
			begin
				comp_result_1 <= 2'd0;
			end
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_2 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_2)&ena[2])
			begin
				comp_result_2 <= 2'd1;
			end
			else if((ID_data_2 == 16'd0)&ena[2])
			begin
				comp_result_2 <= 2'd2;
			end
			else
			begin
				comp_result_2 <= 2'd0;
			end
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_3 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_3)&ena[3])
			begin
				comp_result_3 <= 2'd1;
			end
			else if((ID_data_3 == 16'd0)&ena[3])
			begin
				comp_result_3 <= 2'd2;
			end
			else
			begin
				comp_result_3 <= 2'd0;
			end
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_4 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_4)&ena[4])
			begin
				comp_result_4 <= 2'd1;
			end
			else if((ID_data_4 == 16'd0)&ena[4])
			begin
				comp_result_4 <= 2'd2;
			end
			else
			begin
				comp_result_4 <= 2'd0;
			end
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_5 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_5)&ena[5])
			begin
				comp_result_5 <= 2'd1;
			end
			else if((ID_data_5 == 16'd0)&ena[5])
			begin
				comp_result_5 <= 2'd2;
			end
			else
			begin
				comp_result_5 <= 2'd0;
			end
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_6 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_6)&ena[6])
			begin
				comp_result_6 <= 2'd1;
			end
			else if((ID_data_6 == 16'd0)&ena[6])
			begin
				comp_result_6 <= 2'd2;
			end
			else
			begin
				comp_result_6 <= 2'd0;
			end
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_7 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_7)&ena[7])
			begin
				comp_result_7 <= 2'd1;
			end
			else if((ID_data_7 == 16'd0)&ena[7])
			begin
				comp_result_7 <= 2'd2;
			end
			else
			begin
				comp_result_7 <= 2'd0;
			end
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_8 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_8)&ena[8])
			begin
				comp_result_8 <= 2'd1;
			end
			else if((ID_data_8 == 16'd0)&ena[8])
			begin
				comp_result_8 <= 2'd2;
			end
			else
			begin
				comp_result_8 <= 2'd0;
			end
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_9 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_9)&ena[9])
			begin
				comp_result_9 <= 2'd1;
			end
			else if((ID_data_9 == 16'd0)&ena[9])
			begin
				comp_result_9 <= 2'd2;
			end
			else
			begin
				comp_result_9 <= 2'd0;
			end
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_10 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_10)&ena[10])
			begin
				comp_result_10 <= 2'd1;
			end
			else if((ID_data_10 == 16'd0)&ena[10])
			begin
				comp_result_10 <= 2'd2;
			end
			else
			begin
				comp_result_10 <= 2'd0;
			end
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_11 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_11)&ena[11])
			begin
				comp_result_11 <= 2'd1;
			end
			else if((ID_data_11 == 16'd0)&ena[11])
			begin
				comp_result_11 <= 2'd2;
			end
			else
			begin
				comp_result_11 <= 2'd0;
			end
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_12 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_12)&ena[12])
			begin
				comp_result_12 <= 2'd1;
			end
			else if((ID_data_12 == 16'd0)&ena[12])
			begin
				comp_result_12 <= 2'd2;
			end
			else
			begin
				comp_result_12 <= 2'd0;
			end
		end
	end
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			comp_result_13 <= 2'd0;
		end
		else
		begin
			if((packet_in_ID == ID_data_13)&ena[13])
			begin
				comp_result_13 <= 2'd1;
			end
			else if((ID_data_13 == 16'd0)&ena[13])
			begin
				comp_result_13 <= 2'd2;
			end
			else
			begin
				comp_result_13 <= 2'd0;
			end
		end
	end
	
endmodule

