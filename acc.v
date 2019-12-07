`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/07 11:19:45
// Design Name: 
// Module Name: acc
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


module acc(
     clk
	,in_0
	,in_1
	,in_2
	,in_3
	,clear
	,enable
	,sum
	);
	
input clk;
input [15:0] in_0;
input [15:0] in_1; 
input [15:0] in_2;
input [15:0] in_3;
input clear;
input enable;
output [15:0] sum;


reg [15:0] sum = 0;


always@(posedge clk) begin
    if(!enable) sum<=sum;
    else if(clear)
        sum <= (in_0 + in_1 + in_2 + in_3);
    else sum <= sum + (in_0 + in_1 + in_2 + in_3);
    end


//always@(*) begin
//    case(rdy_cnt)        
//        8'd24: begin
//               wr_rdy <= 1;
//               out_addr <= out_addr + 1;
//               #10
//               sum <= 0;
//               end
        
//        default: begin
//                 sum <= sum + (in_0 + in_1 + in_2 + in_3);
//                 wr_rdy <= 0;
//                 end
//    endcase
//    end
	    
endmodule
