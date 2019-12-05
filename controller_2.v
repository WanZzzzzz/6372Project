`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/01 14:01:41
// Design Name: 
// Module Name: controller_2
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


//module controller_2(
//    in
//    ,neuron_rdy
//    ,plane_rdy
//    ,out_addr
//    ,out_sel
//    );
//input [15:0] in;
//input neuron_rdy;
//input plane_rdy;
//output [15:0] out_addr;
//output [1:0] out_sel;





//endmodule


module neu_rdy(
    in
    ,start
    ,start_2  // control output address
    ,neuron_rdy
    ,write_rdy
    ,out_addr
    );
input [15:0] in;
input start;
input start_2;
output neuron_rdy;
output write_rdy;
output [15:0] out_addr;
reg [15:0] out_addr = -1'b1;
reg neuron_rdy = 0;
reg write_rdy = 0;
reg [7:0] num_to_cnt = 8'd24 ; // (in_channel/4+1) * 5 * 5 - 1   ;  +2 is to delay the signal for 2 cycles
reg [7:0] counter = 0;
reg [7:0] counter_2 = 0;
always@(in) begin
    if(!start) counter<=counter;
    else if(counter == num_to_cnt) begin counter<=0;neuron_rdy<=1;end
    else begin counter<= counter+1; neuron_rdy<=0;end    
end 
always@(in) begin
    if(!start_2) counter_2<=counter_2;
    else if(counter_2 == num_to_cnt) begin counter_2<=0;write_rdy <= 1;out_addr<=out_addr + 1;end
    else begin counter_2<= counter_2+1;write_rdy <= 0;end    
end 
endmodule


module plane_rdy(
    in
    ,plane_rdy
    );
input [15:0] in;
output plane_rdy;
reg [1:0] plane_rdy = 0;
reg [15:0] num_to_cnt = 16'd783; // R*C - 1
reg [15:0] counter = 0;
always@(posedge in) begin
    if(counter == num_to_cnt) begin counter<=0;plane_rdy<=1;end
    else begin counter<= counter+1; plane_rdy<=0;end    
end 
endmodule