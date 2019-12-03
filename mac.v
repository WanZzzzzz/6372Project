`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/13 11:06:27
// Design Name: 
// Module Name: mac
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


module mac(
    clk
    ,ifm_0
    ,ifm_1
    ,ifm_2
    ,ifm_3
    ,w_0
    ,w_1
    ,w_2
    ,w_3
    ,product_0
    ,product_1
    ,product_2
    ,product_3

    );
input clk;
input [15:0] ifm_0;
input [15:0] ifm_1;
input [15:0] ifm_2;
input [15:0] ifm_3;
input [15:0] w_0;
input [15:0] w_1;
input [15:0] w_2;
input [15:0] w_3;
output [15:0] product_0;
output [15:0] product_1;
output [15:0] product_2;
output [15:0] product_3;


mult_gen_0 inst_0(
    .CLK(clk),
    .A(ifm_0),
    .B(w_0),
    .P(product_0));
mult_gen_0 inst1(
    .CLK(clk),
    .A(ifm_1),
    .B(w_1),
    .P(product_1));
mult_gen_0 inst2(
    .CLK(clk),
    .A(ifm_2),
    .B(w_2),
    .P(product_2));
mult_gen_0 inst3(
    .CLK(clk),
    .A(ifm_3),
    .B(w_3),
    .P(product_3));
        
endmodule
