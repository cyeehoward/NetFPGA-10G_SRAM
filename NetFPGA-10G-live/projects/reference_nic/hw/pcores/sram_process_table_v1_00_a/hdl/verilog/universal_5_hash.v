`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:05:56 01/27/2015 
// Design Name: 
// Module Name:    universal_5_hash 
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
module universal_5_hash(axi_aclk , axi_aresetn , tab_char_data , universal_data , din_inc , fifo_en , data_id_delay_2);
	input 			axi_aclk , axi_aresetn;
	input 	[31:0]	tab_char_data;
	output	[31:0]	universal_data;
	reg		[31:0]	universal_data;
	output			din_inc;
	reg				din_inc;
	output			fifo_en;
	reg				fifo_en;
	output	[31:0]	data_id_delay_2;
	reg		[31:0]	data_id_delay_2;
	reg		[31:0]	data_id_delay_1 , data_id;
	
	wire	[31:0] 	mul_mod_data_x_2 , mul_mod_data_b_x , mul_mod_data_d_x;
	wire	[31:0]	mul_mod_data_a_x_2 , mul_mod_data_b_x_3 , mul_mod_data_c_x_2;
	//reg	[31:0]	mul_mod_data_d_x;
	wire	[31:0]	mul_mod_data_a_x_4;
	reg		[31:0]	mul_mod_data_b_c , mul_mod_data_b_c_d , mul_mod_data_b_c_d_e;
	
	reg 	[31:0]	mul_mod_data_x_2_delay_1 , mul_mod_data_x_2_delay_2 , mul_mod_data_x_2_delay_3;
	reg		[31:0]	mul_mod_data_d_x_delay_1 , mul_mod_data_d_x_delay_2 , mul_mod_data_d_x_delay_3 , mul_mod_data_d_x_delay_4;
	
	parameter a = 32'd312347 , b = 32'd214992 , c = 32'd56536 , d = 32'd298778 , e = 32'd258021;
	reg		[1:0]	count_clock;
	
	//x^2
	mul_mod X2(.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .mul_data_1(tab_char_data) , .mul_data_2(tab_char_data) , .mul_mod_data(mul_mod_data_x_2));
	//b*x
	mul_mod BX(.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .mul_data_1(b) , .mul_data_2(tab_char_data) , .mul_mod_data(mul_mod_data_b_x));
	//d*x
	mul_mod DX(.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .mul_data_1(d) , .mul_data_2(tab_char_data) , .mul_mod_data(mul_mod_data_d_x));
	//(x^2) * (a)
	mul_mod AX2(.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .mul_data_1(mul_mod_data_x_2) , .mul_data_2(a) , .mul_mod_data(mul_mod_data_a_x_2));
	//(x^2) * (b*x)
	mul_mod BX3(.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .mul_data_1(mul_mod_data_x_2) , .mul_data_2(mul_mod_data_b_x) , .mul_mod_data(mul_mod_data_b_x_3));
	//(x^2) * (c)
	mul_mod CX2(.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .mul_data_1(mul_mod_data_x_2) , .mul_data_2(c) , .mul_mod_data(mul_mod_data_c_x_2));
	//(a*x^2) * (x^2) 
	mul_mod AX4(.axi_aclk(axi_aclk) , .axi_aresetn(axi_aresetn) , .mul_data_1(mul_mod_data_a_x_2) , .mul_data_2(mul_mod_data_x_2_delay_3) , .mul_mod_data(mul_mod_data_a_x_4));

	//dx + e
	always@(posedge axi_aclk)
	begin
		if(axi_aresetn)
		begin
			mul_mod_data_d_x_delay_1 <= 32'd0;
			mul_mod_data_d_x_delay_2 <= 32'd0;
			mul_mod_data_d_x_delay_3 <= 32'd0;
			mul_mod_data_d_x_delay_4 <= 32'd0;
		end
		else// if(mul_mod_data_d_x != 32'd0)
		begin
			mul_mod_data_d_x_delay_1 <= mul_mod_data_d_x;
			mul_mod_data_d_x_delay_2 <= mul_mod_data_d_x_delay_1;	
			mul_mod_data_d_x_delay_3 <= mul_mod_data_d_x_delay_2;
			mul_mod_data_d_x_delay_4 <= mul_mod_data_d_x_delay_3;
		end
	end
	//bx^3 + cx^2 + dx + e 
	always@(posedge axi_aclk)	
	begin
		if(axi_aresetn)
		begin
			mul_mod_data_b_c <= 32'd0;
			mul_mod_data_b_c_d <= 32'd0;
			mul_mod_data_b_c_d_e <= 32'd0;
			universal_data <= 32'd0;
			din_inc <= 1'd0;
			fifo_en <= 1'b0;
		end
		else
		begin
			mul_mod_data_b_c <= mul_mod_data_c_x_2 + mul_mod_data_b_x_3;		
			mul_mod_data_b_c_d <= mul_mod_data_d_x_delay_4 + mul_mod_data_b_c;
			if(mul_mod_data_b_c_d == 32'd0)
			begin
				mul_mod_data_b_c_d_e <= 32'd0;
				fifo_en <= 1'b0;
			end
			else
			begin
				mul_mod_data_b_c_d_e <= mul_mod_data_b_c_d + e;
				fifo_en <= 1'b1;
			end
			if(mul_mod_data_b_c_d_e == 32'd0)
			begin
				din_inc <= 1'd0;
			end
			else
			begin
				din_inc <= 1'd1;
			end
			universal_data <= mul_mod_data_b_c_d_e + mul_mod_data_a_x_4;
		end
	end
	//x^2 delay 
	always@(posedge axi_aclk)
	begin
		if(axi_aresetn)
		begin
			mul_mod_data_x_2_delay_1 <= 32'd0;
			mul_mod_data_x_2_delay_2 <= 32'd0;
			mul_mod_data_x_2_delay_3 <= 32'd0;
		end
		else
		begin
			mul_mod_data_x_2_delay_1 <= mul_mod_data_x_2;
			mul_mod_data_x_2_delay_2 <= mul_mod_data_x_2_delay_1;
			mul_mod_data_x_2_delay_3 <= mul_mod_data_x_2_delay_2;
		end
	end
	//ID calculate
	always@(posedge axi_aclk)
	begin
		if(axi_aresetn)
		begin
			data_id 	<= 32'd0;
			data_id_delay_1 <= 32'd0;
			data_id_delay_2 <= 32'd0;
		end
		else if(mul_mod_data_d_x_delay_4 != 32'd0)
		begin
			data_id		<= mul_mod_data_d_x_delay_4 + e;
			data_id_delay_1 <= data_id;
			data_id_delay_2 <= data_id_delay_1;			
		end
		else
		begin
			data_id		<= 32'd0;
			data_id_delay_1 <= data_id;
			data_id_delay_2 <= data_id_delay_1;
		end
	end
endmodule

