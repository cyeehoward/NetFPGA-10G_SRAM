`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:42:23 02/01/2016 
// Design Name: 
// Module Name:    clk_div 
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
module clk_div(reset , memclk , clk);
	input		memclk , reset;
	output reg	clk;
	
	//reg	[1:0] count_clk;
	
	always@(posedge memclk or negedge reset)
	begin
		if(~reset)
		begin
			//count_clk <= 1'b0;
			clk <= 1'b0;
		end
		/*else if(count_clk == 1'b1)
		begin
			clk <= ~clk;
			count_clk <= 1'b0;
		end*/
		else
		begin
			clk <= clk + 1'b1;
			//count_clk <= count_clk + 1'b1;
		end
	end

endmodule
