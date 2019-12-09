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
// Dependencies: s
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module acc(
     clk
	,sum_muladd
	,clear
	,enable
	,plane_rdy
	,sum
	);
	
input clk;
/*input [15:0] in_0;
input [15:0] in_1; 
input [15:0] in_2;
input [15:0] in_3;
*/
input [15:0] sum_muladd;			//sum of multiplier_adder 
input clear;
input enable;
input plane_rdy;
output [15:0] sum;

reg [15:0] sum = 0;
reg [15:0] sum0 = 16'b0000000000000011;
reg [15:0] sum1 = 16'b1111111111111011;
reg [15:0] sum2 = 16'b0000000000101010;
reg [15:0] sum3 =16'b0000000000010010;
reg [15:0] sum4 = 16'b0000000000010100;
reg [15:0] sum5 = 16'b0000000000011101;



always@(posedge plane_rdy) begin
    sum0 <= sum1;
    sum1 <= sum2;
    sum2<= sum3;
    sum3 <= sum4;
    sum4<= sum5;
end

//always@(posedge clk) begin
//    case(counter)
//    8'h00:    if(!enable) sum<=sum;
//              else if(clear)
//              sum <= (in_0 + in_1 + in_2 + in_3)+16'b0000000000000011;
//              else sum <= sum + (in_0 + in_1 + in_2 + in_3);
//    8'h01:    if(!enable) sum1<=sum1;
//              else if(clear&&(!plane_rdy))
//              sum1 <= (in_0 + in_1 + in_2 + in_3)+16'b1111111111111011;
//              else sum1 <= sum1 + (in_0 + in_1 + in_2 + in_3);
//    8'h02:    if(!enable) sum2<=sum2;
//              else if(clear&&(!plane_rdy))
//              sum2 <= (in_0 + in_1 + in_2 + in_3)+16'b0000000000101010;
//              else sum2 <= sum2 + (in_0 + in_1 + in_2 + in_3);
//    8'h03:    if(!enable) sum3<=sum3;
//              else if(clear&&(!plane_rdy))
//              sum3 <= (in_0 + in_1 + in_2 + in_3)+16'b0000000000010010;
//              else sum3 <= sum3 + (in_0 + in_1 + in_2 + in_3);
//    8'h04:    if(!enable) sum4<=sum4;
//              else if(clear&&(!plane_rdy))
//              sum4 <= (in_0 + in_1 + in_2 + in_3)+16'b0000000000010100;
//              else sum4 <= sum4 + (in_0 + in_1 + in_2 + in_3);
//    8'h05:    if(!enable) sum5<=sum5;
//              else if(clear&&(!plane_rdy))
//              sum5 <= (in_0 + in_1 + in_2 + in_3)+16'b0000000000011101;
//              else sum5 <= sum5 + (in_0 + in_1 + in_2 + in_3);    
//    endcase
//    end
    
always@(posedge clk) begin
    if(!enable) sum<=sum;
    else if(clear)
// <<<<<<< HEAD
        sum <= sum0 + sum_muladd;
    else sum <= sum + sum_muladd;
/*
=======
        sum<= sum0 + (in_0 + in_1 + in_2 + in_3);
    else sum <= sum + (in_0 + in_1 + in_2 + in_3);
>>>>>>> master
*/  
  end
    
//always@(posedge plane_rdy) begin
//    counter <= counter + 1;
//    end

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
