`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:47 01/20/2015 
// Design Name: 
// Module Name:    mul_mod 
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
module mul_mod(axi_aclk , axi_aresetn , mul_data_1 , mul_data_2 , mul_mod_data);
	input 				axi_aclk , axi_aresetn;
	input 	[31:0]	mul_data_1 , mul_data_2;
	output	[31:0]	mul_mod_data;
	
	parameter			param = 32'b11111111_11111111_11111111_11111111;
	wire		[63:0]	mul_out;
	wire		[32:0]	mul_mod_out;
	reg		[31:0]	mul_mod_data;
	
	multiplier M0 
	(
	  .clk(axi_aclk), // input clk
	  .a(mul_data_1), // input [31 : 0] a
	  .b(mul_data_2), // input [31 : 0] b
	  .sclr(axi_aresetn), // input sclr
	  .p(mul_out) // output [63 : 0] p
	);
	
	assign mul_mod_out = mul_out[31:0] + mul_out[63:32];
	
	always@(posedge axi_aclk)
	begin
		if(axi_aresetn)
		begin
			mul_mod_data <= 32'd0;
		end
		else if(mul_mod_out[32] != 1'b0)
		begin
			mul_mod_data <= mul_mod_out - param;
		end
		else
		begin
			mul_mod_data <= mul_mod_out;
		end
	end
	
endmodule
