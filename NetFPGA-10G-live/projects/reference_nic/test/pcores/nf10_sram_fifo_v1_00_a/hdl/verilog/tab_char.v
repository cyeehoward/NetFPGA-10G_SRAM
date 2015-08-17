`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:47:01 01/16/2015 
// Design Name: 
// Module Name:    Tab_char 
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
module Tab_char(five_tuple_data , axi_aclk , axi_aresetn , tab_char_data , data_valid);
	input 		axi_aclk , axi_aresetn , data_valid;
	input 	[103:0] five_tuple_data;
	output	[31:0]	tab_char_data;
	reg	[31:0]	tab_char_data;

	wire 	[31:0]	hash_table [12:0];
	
	rand_table_0  U0 (.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .index_num(five_tuple_data[7:0]) , .rand_out(hash_table[0]) , .en(data_valid));
	rand_table_1  U1 (.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .index_num(five_tuple_data[15:8]) , .rand_out(hash_table[1]) , .en(data_valid));
	rand_table_2  U2 (.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .index_num(five_tuple_data[23:16]) , .rand_out(hash_table[2]) , .en(data_valid));
	rand_table_3  U3 (.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .index_num(five_tuple_data[31:24]) , .rand_out(hash_table[3]) , .en(data_valid));
	rand_table_4  U4 (.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .index_num(five_tuple_data[39:32]) , .rand_out(hash_table[4]) , .en(data_valid));
	rand_table_5  U5 (.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .index_num(five_tuple_data[47:40]) , .rand_out(hash_table[5]) , .en(data_valid));
	rand_table_6  U6 (.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .index_num(five_tuple_data[55:48]) , .rand_out(hash_table[6]) , .en(data_valid));
	rand_table_7  U7 (.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .index_num(five_tuple_data[63:56]) , .rand_out(hash_table[7]) , .en(data_valid));
	rand_table_8  U8 (.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .index_num(five_tuple_data[71:64]) , .rand_out(hash_table[8]) , .en(data_valid));
	rand_table_9  U9 (.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .index_num(five_tuple_data[79:72]) , .rand_out(hash_table[9]) , .en(data_valid));
	rand_table_10  U10(.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .index_num(five_tuple_data[87:80]) , .rand_out(hash_table[10]) , .en(data_valid));
	rand_table_11  U11(.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .index_num(five_tuple_data[95:88]) , .rand_out(hash_table[11]) , .en(data_valid));
	rand_table_12  U12(.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .index_num(five_tuple_data[103:96]) , .rand_out(hash_table[12]) , .en(data_valid));
	
	//XOR data
	always@(posedge axi_aclk)
	begin
		if(axi_aresetn)
		begin
			tab_char_data <= 32'd0;
		end
		else
		begin
			tab_char_data <= (((hash_table[0] ^ hash_table[1])^(hash_table[2] ^ hash_table[3]))^((hash_table[4] ^ hash_table[5])^(hash_table[6] ^ hash_table[7])))^(((hash_table[8] ^ hash_table[9])^(hash_table[10] ^ hash_table[11]))^hash_table[12]);
		end
	end
	
endmodule
