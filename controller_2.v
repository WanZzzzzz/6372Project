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
    ,start_3
    ,neuron_rdy
    ,neuron_rdy_ahead
    ,write_rdy
    );
input [15:0] in;
input start;
input start_2;
input start_3;
output neuron_rdy;
output neuron_rdy_ahead;
output write_rdy;

reg neuron_rdy = 0;
reg neuron_rdy_ahead = 0;
reg write_rdy = 0;
reg [7:0] num_to_cnt = 8'd24 ; // (in_channel/4+1) * 5 * 5 - 1   ;  +2 is to delay the signal for 2 cycles

reg [7:0] counter = 0;
reg [7:0] counter_2 = 0;
reg [7:0] counter_3 = 0;

always@(in) begin
    if(!start) counter<=counter;
    else if(counter == num_to_cnt) begin counter<=0;neuron_rdy<=1;end
    else begin counter<= counter+1; neuron_rdy<=0;end    
end 

always@(in) begin
    if(!start_2) counter_2<=counter_2;
    else if(counter_2 == num_to_cnt) begin counter_2<=0;write_rdy <= 1;end
    else begin counter_2<= counter_2+1;write_rdy <= 0;end    
end 

always@(in) begin
    if(!start_3) counter_3<=counter_3;
    else if(counter_3 == num_to_cnt) begin counter_3<=0;neuron_rdy_ahead <= 1;end
    else begin counter_3<= counter_3+1;neuron_rdy_ahead <= 0;end    
end 


endmodule







module plane_rdy(
    in
    ,in2
//    ,start
//    ,start_2
    ,plane_rdy
    ,plane_rdy2
    );
input in;
input in2;
output plane_rdy;
/*
<<<<<<< HEAD
//reg [1:0] plane_rdy = 0;
reg plane_rdy = 0;
reg [15:0] num_to_cnt = 16'd783; // R*C - 1
=======
*/
output plane_rdy2;
reg plane_rdy = 0;
reg plane_rdy2 = 0;
reg [15:0] num_to_cnt = 16'd784; // R*C - 1
//>>>>>>> master
reg [15:0] counter = 0;
reg [15:0] counter2 = 0;
always@(posedge in) begin
    
    if(counter == num_to_cnt) begin counter<=1; plane_rdy<=1;end    //counter reset to 1 because the delay happens only after first plane
    else begin counter<= counter+1;end
    end    

always@(negedge in) begin
    plane_rdy <= 0;
    end
/*<<<<<<< HEAD
*/
//=======

always@(posedge in2) begin
    if(counter2 == num_to_cnt) begin counter2<=1; plane_rdy2<=1;end
    else begin counter2<= counter2+1;end
    end    
always@(negedge in2) begin
    plane_rdy2 <= 0;
    end
    
//>>>>>>> master
endmodule






module out_addr_rdy(
    wr_rdy
    ,neuron_rdy
    ,plane_rdy
    ,plane_rdy2
    ,out_addr
    ,out_addr_2);
input wr_rdy;
input neuron_rdy;
input plane_rdy;
input plane_rdy2;
output [15:0] out_addr;
output [15:0] out_addr_2;
reg [15:0] out_addr = -1'b1;
reg [15:0] out_addr_2 = -1'b1;
reg [7:0] counter = 0;
reg [7:0] out_channel_idx = 1;
reg full = 0;
reg [15:0] out_size = 16'd784;

always@(posedge neuron_rdy) begin

    if(!plane_rdy) 
    out_addr <= out_addr + 1;

    end

always@(posedge plane_rdy) begin    
    out_addr <= (out_channel_idx/4)*out_size;
    end
    
always@(posedge wr_rdy) begin

    if(!plane_rdy2) 
    out_addr_2 <= out_addr_2 + 1;

    end
    
always@(posedge plane_rdy2) begin    
    out_addr_2 <= (out_channel_idx/4)*out_size;
    end   
        
always@(posedge plane_rdy) begin                                               // plane_rdy is the later signal,idx change after it to make the address correct.
    out_channel_idx <= out_channel_idx + 1;
    end
    
endmodule