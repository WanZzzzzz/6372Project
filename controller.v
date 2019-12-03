`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/13 22:20:04
// Design Name: 
// Module Name: controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller(
    clock
    ,m
    ,r
    ,c
    ,n
    ,i
    ,j
    ,ifm_addr
    ,weight_addr
//    ,out_addr
    ,weight_ena
    ,input_ena
    ,out_ena
    ,wea
    ,out_wea             				// output buf write enable
//    ,out_chan_idx       				// output channel index: 0~3
//    ,cell_ready           			// the value in 16 registers is ready to go into output buffer
    );
    
input clock;
input [7:0] m;
input [7:0] r;							//output iterator row
input [7:0] c;							//output iterator column
input [7:0] n;							//weight iterator row
input [3:0] i;							//weight iterator column
input [3:0] j;

output [15:0] ifm_addr;					//image feature map address
output [15:0] weight_addr;				//weight address
//output [15:0] out_addr;
output weight_ena = 1;
output input_ena = 1;
output out_ena = 1;
output wea;
output [7:0] out_wea;
//output [1:0] out_chan_idx;


reg [15:0] ifm_addr = 0;
reg [15:0] weight_addr = 0;
//reg [15:0] out_addr;
wire [3:0] out_reg_idx;



reg wea = 0;
reg [7:0] out_wea = 1;
//reg [3:0] out_chan_idx = 0;  // temporary set as first channel



reg [3:0] k = 5;
reg [7:0] in_size = 8'd32;
reg [7:0] in_channel = 1;
reg [7:0] out_size = 8'd28;
reg [7:0] out_channel = 6;


always@(posedge clock) begin
    ifm_addr <= (n/4)*in_size*in_size + (r+i)*in_size + (c+j);
    weight_addr <= m*in_channel*k*k + (n/4)*k*k + i*k + j;
//    out_addr_i <= r*out_size + c;
    end
    
//shift_reg out_addr_delay(
//    .clk(clock),
//    .in(out_addr_i),
//    .out(out_addr));

//shift_reg out_reg_delay(
//    .clk(clock),
//    .in(out_addr_i),
//    .out(out_reg_idx));
        
endmodule

module shift_reg(
    clk
    ,in
    ,out
    );
 input clk;
 input [7:0] in;
 output [7:0] out;
 
 reg [7:0] r1;
 reg [7:0] r2;
 reg [7:0] r3;
 reg [7:0] r4;
 reg [7:0] r5;
 reg [7:0] r6;
 reg [7:0] r7;
 reg [7:0] r8;
 reg [7:0] out;
 always@(posedge clk) begin
    r1 <= in;
    r2 <= r1;
    r3 <= r2;
    r4 <= r3;
    r5 <= r4;
    r6 <= r5;
    r7 <= r6;
    r8 <= r7;
    out <= r8;  
 end
 
 endmodule