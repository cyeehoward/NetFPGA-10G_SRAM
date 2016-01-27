`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:53:21 01/05/2016 
// Design Name: 
// Module Name:    compare_addr 
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
module compare_addr(clk , reset , ena , data_comp_result , addr_iden , addr_count_data_0 , addr_count_data_1 , addr_count_data_2 , addr_count_data_3 ,addr_count_data_4 , addr_count_data_5 , addr_count_data_6 , addr_count_data_7 , addr_count_data_8 , addr_count_data_9 , addr_count_data_10 , addr_count_data_11 , addr_count_data_12 , addr_count_data_13 , packet_in_addr);
	input							clk , reset;
	input			[18:0]		addr_count_data_0 , addr_count_data_1 , addr_count_data_2 , addr_count_data_3 ,addr_count_data_4 , addr_count_data_5 , addr_count_data_6 , addr_count_data_7 , addr_count_data_8 , addr_count_data_9 , addr_count_data_10 , addr_count_data_11 , addr_count_data_12 , addr_count_data_13;
	input			[18:0]		packet_in_addr;
	input							ena;
	output reg	[3:0]			data_comp_result;
	output reg					addr_iden;
	reg	[13:0]		comp_result;
	
	always@(posedge clk or negedge reset)
	begin
		if(~reset)
		begin
			data_comp_result <= 4'd0;
			addr_iden <= 1'b0;
		end
		else
		begin
			case(comp_result)
				14'b00_0000_0000_0001:
				begin
					data_comp_result <= 4'd1;
					addr_iden <= 1'b1;
				end
				14'b00_0000_0000_0010:
				begin
					data_comp_result <= 4'd2;
					addr_iden <= 1'b1;
				end
				14'b00_0000_0000_0100:
				begin
					data_comp_result <= 4'd3;
					addr_iden <= 1'b1;
				end
				14'b00_0000_0000_1000:
				begin
					data_comp_result <= 4'd4;
					addr_iden <= 1'b1;
				end
				14'b00_0000_0001_0000:
				begin
					data_comp_result <= 4'd5;
					addr_iden <= 1'b1;
				end
				14'b00_0000_0010_0000:
				begin
					data_comp_result <= 4'd6;
					addr_iden <= 1'b1;
				end
				14'b00_0000_0100_0000:
				begin
					data_comp_result <= 4'd7;
					addr_iden <= 1'b1;
				end
				14'b00_0000_1000_0000:
				begin
					data_comp_result <= 4'd8;
					addr_iden <= 1'b1;
				end
				14'b00_0001_0000_0000:
				begin
					data_comp_result <= 4'd9;
					addr_iden <= 1'b1;
				end
				14'b00_0010_0000_0000:
				begin
					data_comp_result <= 4'd10;
					addr_iden <= 1'b1;
				end
				14'b00_0100_0000_0000:
				begin
					data_comp_result <= 4'd11;
					addr_iden <= 1'b1;
				end
				14'b00_1000_0000_0000:
				begin
					data_comp_result <= 4'd12;
					addr_iden <= 1'b1;
				end
				14'b01_0000_0000_0000:
				begin
					data_comp_result <= 4'd13;
					addr_iden <= 1'b1;
				end
				14'b10_0000_0000_0000:
				begin
					data_comp_result <= 4'd14;
					addr_iden <= 1'b1;
				end
				default:
				begin
					data_comp_result <= 4'd0;
					addr_iden <= 1'b0;
				end
			endcase
		end
	end
	/*always@(*)
	begin
		case(comp_result)
			14'b00_0000_0000_0001:
			begin
				data_comp_result = 4'd1;
				addr_iden = 1'b1;
			end
			14'b00_0000_0000_0010:
			begin
				data_comp_result = 4'd2;
				addr_iden = 1'b1;
			end
			14'b00_0000_0000_0100:
			begin
				data_comp_result = 4'd3;
				addr_iden = 1'b1;
			end
			14'b00_0000_0000_1000:
			begin
				data_comp_result = 4'd4;
				addr_iden = 1'b1;
			end
			14'b00_0000_0001_0000:
			begin
				data_comp_result = 4'd5;
				addr_iden = 1'b1;
			end
			14'b00_0000_0010_0000:
			begin
				data_comp_result = 4'd6;
				addr_iden = 1'b1;
			end
			14'b00_0000_0100_0000:
			begin
				data_comp_result = 4'd7;
				addr_iden = 1'b1;
			end
			14'b00_0000_1000_0000:
			begin
				data_comp_result = 4'd8;
				addr_iden = 1'b1;
			end
			14'b00_0001_0000_0000:
			begin
				data_comp_result = 4'd9;
				addr_iden = 1'b1;
			end
			14'b00_0010_0000_0000:
			begin
				data_comp_result = 4'd10;
				addr_iden = 1'b1;
			end
			14'b00_0100_0000_0000:
			begin
				data_comp_result = 4'd11;
				addr_iden = 1'b1;
			end
			14'b00_1000_0000_0000:
			begin
				data_comp_result = 4'd12;
				addr_iden = 1'b1;
			end
			14'b01_0000_0000_0000:
			begin
				data_comp_result = 4'd13;
				addr_iden = 1'b1;
			end
			14'b10_0000_0000_0000:
			begin
				data_comp_result = 4'd14;
				addr_iden = 1'b1;
			end
			default:
			begin
				data_comp_result = 4'd0;
				addr_iden = 1'b0;
			end
		endcase
	end*/

	always@(*)
	begin
		if((packet_in_addr == addr_count_data_0)&&ena)
		begin
			comp_result[0] = 1;
		end
		else
		begin
			comp_result[0] = 0;
		end
	end
	always@(*)
	begin
		if((packet_in_addr == addr_count_data_1)&&ena)
		begin
			comp_result[1] = 1;
		end
		else
		begin
			comp_result[1] = 0;
		end
	end
	always@(*)
	begin
		if((packet_in_addr == addr_count_data_2)&&ena)
		begin
			comp_result[2] = 1;
		end
		else
		begin
			comp_result[2] = 0;
		end
	end
	always@(*)
	begin
		if((packet_in_addr == addr_count_data_3)&&ena)
		begin
			comp_result[3] = 1;
		end
		else
		begin
			comp_result[3] = 0;
		end
	end
	always@(*)
	begin
		if((packet_in_addr == addr_count_data_4)&&ena)
		begin
			comp_result[4] = 1;
		end
		else
		begin
			comp_result[4] = 0;
		end
	end
	always@(*)
	begin
		if((packet_in_addr == addr_count_data_5)&&ena)
		begin
			comp_result[5] = 1;
		end
		else
		begin
			comp_result[5] = 0;
		end
	end
	always@(*)
	begin
		if((packet_in_addr == addr_count_data_6)&&ena)
		begin
			comp_result[6] = 1;
		end
		else
		begin
			comp_result[6] = 0;
		end
	end
	always@(*)
	begin
		if((packet_in_addr == addr_count_data_7)&&ena)
		begin
			comp_result[7] = 1;
		end
		else
		begin
			comp_result[7] = 0;
		end
	end
	always@(*)
	begin
		if((packet_in_addr == addr_count_data_8)&&ena)
		begin
			comp_result[8] = 1;
		end
		else
		begin
			comp_result[8] = 0;
		end
	end
	always@(*)
	begin
		if((packet_in_addr == addr_count_data_9)&&ena)
		begin
			comp_result[9] = 1;
		end
		else
		begin
			comp_result[9] = 0;
		end
	end
	always@(*)
	begin
		if((packet_in_addr == addr_count_data_10)&&ena)
		begin
			comp_result[10] = 1;
		end
		else
		begin
			comp_result[10] = 0;
		end
	end
	always@(*)
	begin
		if((packet_in_addr == addr_count_data_11)&&ena)
		begin
			comp_result[11] = 1;
		end
		else
		begin
			comp_result[11] = 0;
		end
	end
	always@(*)
	begin
		if((packet_in_addr == addr_count_data_12)&&ena)
		begin
			comp_result[12] = 1;
		end
		else
		begin
			comp_result[12] = 0;
		end
	end
	always@(*)
	begin
		if((packet_in_addr == addr_count_data_13)&&ena)
		begin
			comp_result[13] = 1;
		end
		else
		begin
			comp_result[13] = 0;
		end
	end
	
endmodule

