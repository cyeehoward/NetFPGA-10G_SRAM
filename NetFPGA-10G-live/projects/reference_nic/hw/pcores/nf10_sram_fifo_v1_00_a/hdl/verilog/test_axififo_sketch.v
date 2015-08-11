`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:		CYCUEE
// Engineer:		Huang, Chao-Yuan
// 
// Create Date:    	11:40:43 05/07/2015 
// Design Name:    	
// Module Name:    	test_axififo_sketch
// Project Name: 	
// Target Devices: 	virtex 5
// Tool versions: 	ISE 13.4
// Description: 	To extract the 5-tuple from the packet.
//			To process this program on 200 MHz clock.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module test_axififo_sketch
#(
	///////////////////////////////////////////////////////////////////////////////
	// Parameter Definitions
	///////////////////////////////////////////////////////////////////////////////
	parameter integer 	CROPPED_TDATA_WIDTH 	= 24,
	parameter integer 	TDATA_WIDTH        	= 32,
	parameter integer 	TUSER_WIDTH        	= 128,
	parameter integer 	NUM_QUEUES         	= 4,
	parameter integer 	QUEUE_ID_WIDTH     	= 2
)
(
	input      				reset,			//reset to 200 MHz
   	input           			memclk,			//200 MHz clock	
	input 	 				rempty_tuser,		//for extract port
	input 	 				dout_valid_tuser,	//for extract port
	input 		[127:0] 		tuser,			//for extract port
   	input  					axififo_empty,	
   	input  	        			axififo_din_valid,
   	input  		[200:0] 		axififo_din,	
	input 			      		axififo_mem_queue_full,
	output reg 				inc,
	output reg 				inc_tuser,
	output	 				din_inc,
	output	 	[(TDATA_WIDTH - 1):0]	universal_data
);
	//register & wire declaration
   reg 			[31:0] 	src_ip;
   reg 			[31:0] 	dest_ip;
	reg 			[15:0] 	src_port , prev_src_port;
	reg 			[15:0] 	dest_port , prev_dest_port;
	reg 			[15:0] 	eth_type , prev_eth_type;
	reg 			[7:0] 	eth_protocol , prev_eth_protocol;
	reg			[1:0]		packet_last;

	//extract 5-tuple
	//src_IP , dst_IP , eth_protocol , eth_type	
	always@(posedge memclk)
	begin
		if(reset)
		begin
			src_ip 				<= 32'd0;
			dest_ip 				<= 32'd0;
			eth_type 			<= 16'd0;
			eth_protocol 		<=  8'd0;
			prev_eth_type 		<= 16'd0;
			prev_eth_protocol <=  8'd0;
			packet_last 		<=  2'd0;
		end
		else if(axififo_din_valid)	//ensure the packet isn't end and the data is valid
		begin
			packet_last <= packet_last + axififo_din[1];
			if(packet_last == 2'b00 && axififo_din[1] == 1'b0)		//the first sliced packet -> get eth_protocol,eth_type
			begin
				eth_type[15:8] 		<= axififo_din[112:105];
				eth_type[7:0] 		<= axififo_din[120:113];
				eth_protocol[7:4] 	<= axififo_din[196:193];
				eth_protocol[3:0] 	<= axififo_din[200:197];
			end
			else if(packet_last == 2'b00 && axififo_din[1])		//the second sliced packet -> get src_ip,dest_ip
			begin
				prev_eth_type 		<= eth_type;
				prev_eth_protocol 	<= eth_protocol;
				src_ip[7:0] 		<= axififo_din[56:49];
				src_ip[15:8] 		<= axififo_din[48:41];
				src_ip[23:16] 		<= axififo_din[40:33];
				src_ip[31:24] 		<= axififo_din[32:25];
				dest_ip[31:24]		<= axififo_din[64:57];
				dest_ip[23:16] 		<= axififo_din[72:65];
				dest_ip[15:8] 		<= axififo_din[80:73];
				dest_ip[7:0]		<= axififo_din[88:81];
			end
		end
		else if(packet_last >= 2'd2)
		begin
			packet_last <= 2'd0;
		end
	end
	//src_port , dst_port
	always@(posedge memclk)
	begin
		if(reset)
		begin
			src_port 	<= 32'd0;
			dest_port 	<= 32'd0;
			prev_src_port 	<= 32'd0;
			prev_dest_port 	<= 32'd0;
		end
		else if(dout_valid_tuser)	//ensure the data is valid
		begin
			src_port 	<= tuser[23:16];
			dest_port 	<= tuser[31:24];
			prev_src_port 	<= src_port;
			prev_dest_port 	<= dest_port;
		end
	end

	wire [31:0]	tab_char_data;	 
	
	//random table lookup
	Tab_char U0
	(.five_tuple_data(axififo_din_valid?{src_ip , dest_ip , prev_src_port , prev_dest_port , prev_eth_protocol}:104'd0) , 
	.axi_aclk(memclk) , 
	.axi_aresetn(reset) , 
	.tab_char_data(tab_char_data),
	.data_valid(axififo_din_valid && packet_last == 2'd1));
	//5-universal hash (ax^4 + bx^3 + cx^2 + dx + e)
	universal_5_hash U1
	(.axi_aclk(memclk) , 
	.axi_aresetn(reset) , 
	.tab_char_data(tab_char_data) , 
	.universal_data(universal_data),
	.din_inc(din_inc));
	//axi to fifo --> asyc_fifo read enable
	always@(*)
	begin
		inc = axififo_din_valid && ((~axififo_empty) && ~axififo_mem_queue_full);
		inc_tuser = dout_valid_tuser && ((~rempty_tuser) && ~axififo_mem_queue_full);
	end
endmodule

