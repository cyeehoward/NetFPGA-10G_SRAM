`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:		CYCUEE
// Engineer:		Huang, Chao-Yuan
// 
// Create Date:    	11:40:43 05/07/2015 
// Design Name:    	
// Module Name:    	sketch_calculate
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
module test_sketch_calculate
#(
	//////////////////////////////////////////////////////////////////////////////
	// Parameter Definitions
	//////////////////////////////////////////////////////////////////////////////
	parameter integer TDATA_WIDTH        	= 32,
	parameter integer CROPPED_TDATA_WIDTH 	= 24,
	parameter integer TUSER_WIDTH        	= 128,
	parameter integer NUM_QUEUES         	= 4,
	parameter integer QUEUE_ID_WIDTH     	= 2
)
(
    	input      						reset,			//reset to 200 MHz
    	input           					memclk,			//200 MHz clock	
	input 	[(TUSER_WIDTH - 1):0] 				tuser,			//for extract port
	input 	 						rempty_tuser,
	input 	 						dout_valid_tuser,
    	input  							axififo_empty,	
    	input  	        					axififo_din_valid,
    	input  	[((8*CROPPED_TDATA_WIDTH+9)-1):0]		axififo_din,
	input	[18:0]						reg_read_addr,	
	//input 			        			axififo_mem_queue_full,
	output reg 						inc,
	output reg 						inc_tuser,
	output reg 						universal_data_valid,
	output reg	[((TDATA_WIDTH/2) - 1) : 0]		packet_byte,
	output reg						packet_byte_vaild,
	output reg	[(TDATA_WIDTH - 1):0]  			universal_data,
	output reg	[((TDATA_WIDTH/2) - 1) : 0]		SRAM_ID,
	input							hash_reg_sel,
	output reg 	[103:0]					five_tuple_data,
	output reg						reg_read_start,
	output reg	[1:0]					state
);

	//register & wire declaration
   	reg 	[(TDATA_WIDTH - 1):0] 		src_ip;
   	reg 	[(TDATA_WIDTH - 1):0] 		dest_ip;
	reg 	[((TDATA_WIDTH/2) - 1):0] 	src_port;
	reg 	[((TDATA_WIDTH/2) - 1):0] 	dest_port;
	reg 	[((TDATA_WIDTH/2) - 1):0] 	prev_src_port;
	reg 	[((TDATA_WIDTH/2) - 1):0] 	prev_dest_port;
	reg 	[((TDATA_WIDTH/2) - 1):0] 	eth_type , prev_eth_type;
	reg 	[((TDATA_WIDTH/4) - 1):0] 	eth_protocol , prev_eth_protocol;
	reg	[((TDATA_WIDTH/2) - 1):0] 	byte_count;
	
	reg		[1:0]						packet_last;

	always@(posedge memclk)
	begin
		if(reset)
		begin
			packet_last 		<= 2'd0;
		end
		else if(axififo_din_valid)
		begin
			packet_last 		<= packet_last + axififo_din[1];
		end
		/*else if((packet_last != 2'd2)&&axififo_din_valid&&((five_tuple_data[103:72] != src_ip)||(five_tuple_data[103:72] != 32'd0)))
		begin
			packet_last 		<= packet_last + axififo_din[1];
		end*/
		else if(packet_last == 2'd2)
		begin
			packet_last 		<= 2'd0;
		end
		else
		begin
			packet_last 		<= packet_last;
		end
	end

	//extract 5-tuple	
	always@(posedge memclk)
	begin
		if(reset)
		begin
			src_ip 				<= {TDATA_WIDTH{1'b0}};
			dest_ip 			<= {TDATA_WIDTH{1'b0}};
			src_port 			<= {(TDATA_WIDTH/2){1'b0}};
			dest_port 			<= {(TDATA_WIDTH/2){1'b0}};
			eth_type 			<= {(TDATA_WIDTH/2){1'b0}};
			eth_protocol 		<= {(TDATA_WIDTH/4){1'b0}};
			prev_eth_type 		<= {(TDATA_WIDTH/2){1'b0}};
			prev_eth_protocol 	<= {(TDATA_WIDTH/4){1'b0}};
			//packet_last 		<= 2'd0;
			prev_src_port 			<= {(TDATA_WIDTH/2){1'b0}};	//get src_port,dest_port number
			prev_dest_port 			<= {(TDATA_WIDTH/2){1'b0}};	//to reduce the usage of resources
			byte_count		<= 16'd0;
		end
		else if(axififo_din_valid)	//ensure the packet isn't end and the data is valid
		begin
			//packet_last <= packet_last + axififo_din[1];
			if(packet_last == 2'b00 && ~axififo_din[1])		//the first sliced packet -> get eth_protocol,eth_type
			begin
				eth_type[15:8] 		<= axififo_din[112:105];
				eth_type[7:0] 		<= axififo_din[120:113];
				eth_protocol[7:4] 	<= axififo_din[196:193];
				eth_protocol[3:0] 	<= axififo_din[200:197];
				src_port 			<= tuser[23:16];	//get src_port,dest_port number
				dest_port 			<= tuser[31:24];	//to reduce the usage of resources
				byte_count		<= tuser[15:0];
			end
			else if(packet_last == 2'b00 && axififo_din[1])		//the second sliced packet -> get src_ip,dest_ip
			begin
				prev_eth_type 		<= eth_type;
				prev_eth_protocol 	<= eth_protocol;
				src_ip[15:8]		<= axififo_din[48:41];
				src_ip[7:0] 		<= axififo_din[56:49];
				src_ip[23:16] 		<= axififo_din[40:33];
				src_ip[31:24] 		<= axififo_din[32:25];
				dest_ip[31:24]		<= axififo_din[64:57];
				dest_ip[23:16] 		<= axififo_din[72:65];
				dest_ip[15:8] 		<= axififo_din[80:73];
				dest_ip[7:0]		<= axififo_din[88:81];
				prev_src_port 			<= src_port ;	//get src_port,dest_port number
				prev_dest_port 			<= dest_port;	//to reduce the usage of resources
			end
		end
		else if(packet_last == 2'd2)
		begin
			src_ip 				<= {TDATA_WIDTH{1'b0}};
			dest_ip 			<= {TDATA_WIDTH{1'b0}};
			src_port 			<= {(TDATA_WIDTH/2){1'b0}};
			dest_port 			<= {(TDATA_WIDTH/2){1'b0}};
			eth_type 			<= {(TDATA_WIDTH/2){1'b0}};
			eth_protocol 		<= {(TDATA_WIDTH/4){1'b0}};
			prev_eth_type 		<= {(TDATA_WIDTH/2){1'b0}};
			prev_eth_protocol 	<= {(TDATA_WIDTH/4){1'b0}};
			//packet_last 		<= 2'd0;
			prev_src_port 			<= {(TDATA_WIDTH/2){1'b0}};	//get src_port,dest_port number
			prev_dest_port 			<= {(TDATA_WIDTH/2){1'b0}};	//to reduce the usage of resources
			byte_count		<= 16'd0;
		end
		else
		begin
			src_ip 				<= src_ip;
			dest_ip 			<= dest_ip;
			src_port 			<= src_port;
			dest_port 			<= dest_port;
			eth_type 			<= eth_type;
			eth_protocol 			<= eth_protocol;
			prev_eth_type 			<= prev_eth_type;
			prev_eth_protocol 		<= prev_eth_protocol;
			prev_src_port 			<= prev_src_port;	//get src_port,dest_port number
			prev_dest_port 			<= prev_dest_port;	//to reduce the usage of resources
			byte_count		<= byte_count;
		end
	end

	//delay reg_read_addr to wait state
	reg	[18:0]	delay_reg_read_addr;
	always@(posedge memclk)
	begin
		if(reset)
		begin
			delay_reg_read_addr <= 19'd0;
		end
		else
		begin
			delay_reg_read_addr <= reg_read_addr;
		end
	end

	reg	[1:0]	nextstate;
	reg	[1:0] 	IDLE = 0 , HASH_UPDATE = 1 , REG_READ = 2;

	always@(posedge memclk)
	begin
		if(reset)
		begin
			state <= IDLE;
		end
		else
		begin
			state <= nextstate;
		end
	end
	always@(*)
	begin
		case(state)
			IDLE:
			begin
				universal_data		= 32'd0;
				universal_data_valid	= 1'b0;
				packet_byte		= 16'd0;
				packet_byte_vaild	= 1'b0;
				SRAM_ID			= 16'd0;
				five_tuple_data		= 104'd0;
				reg_read_start		= 1'b0;
				if(packet_last == 2'd1)
				begin
					nextstate = HASH_UPDATE;
				end
				else if(hash_reg_sel == 1'b1)
				begin
					nextstate = REG_READ;
				end
				else
				begin
					nextstate = IDLE;
				end
			end
			HASH_UPDATE:
			begin
				universal_data		= {src_ip|dest_ip};
				universal_data_valid	= 1'b1;
				packet_byte		= byte_count;
				packet_byte_vaild	= 1'b1;
				SRAM_ID			= {src_ip[15:0]|dest_ip[15:0]};
				five_tuple_data		= {src_ip , dest_ip , prev_src_port , prev_dest_port , prev_eth_protocol};
				reg_read_start		= 1'b0;
				nextstate = IDLE;
			end
			REG_READ://pass reg_write address to r_w_ctrl
			begin
				universal_data		= delay_reg_read_addr;
				universal_data_valid	= 1'b1;
				packet_byte		= 16'd0;
				packet_byte_vaild	= 1'b0;
				SRAM_ID			= 16'd0;
				five_tuple_data		= 104'd0;
				reg_read_start		= 1'b1;
				nextstate = IDLE;
			end
			default:
			begin
				universal_data		= 32'd0;
				universal_data_valid	= 1'b0;
				packet_byte		= 16'd0;
				packet_byte_vaild	= 1'b0;
				SRAM_ID			= 16'd0;
				five_tuple_data		= 104'd0;
				reg_read_start		= 1'b0;
				nextstate = IDLE;
			end
		endcase
	end
	
	//axi to fifo --> asyc_fifo read enable
	always@(*)
	begin
		inc = axififo_din_valid && ((~axififo_empty));// && ~axififo_mem_queue_full
		inc_tuser = dout_valid_tuser && ((~rempty_tuser));// && ~axififo_mem_queue_full
	end
	
endmodule



