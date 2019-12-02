`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/13 13:49:13
// Design Name: 
// Module Name: loop_counter
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


module loop_counter1(
    clk
    ,k_size
    ,j
    ,carry
    );
input clk;
input [3:0] k_size;
output [3:0] j;
output carry;
reg [3:0] j = 0;
reg carry = 0;

always@(posedge clk) begin
    if (j == k_size-1) begin j<=0;carry<=1;end
    else begin j<=j+1;carry<=0;end   
end
endmodule

module loop_counter2(
    carry_in
    ,k_size
    ,i
    ,carry_out
    );
input carry_in;
input [3:0] k_size;
output [3:0] i;
output carry_out;
reg [3:0] i = 0;
reg carry_out = 0;

always@(carry_in) begin
    if ((i==k_size-1)&&(carry_in==1)) begin i<=0;carry_out<=1;end
    else if (carry_in == 1) begin i<=i+1;carry_out=0;end
    else begin i <= i;carry_out=0;end   
end
endmodule

module loop_counter3(
    carry_in
    ,in_channel
    ,n
    ,carry_out
    );
input carry_in;
input [7:0] in_channel; 
output [7:0] n;
output carry_out;
reg [7:0] n = 0;
reg carry_out = 0;
always@(carry_in) begin
    if ((n>=(in_channel-1)/4)&&(carry_in==1)) begin n<=0;carry_out<=1;end
    else if (carry_in == 1) begin n<=n+1;carry_out=0;end
    else begin n <= n;carry_out=0;end
    
end
endmodule

module loop_counter4(
    carry_in
    ,out_size
    ,c
    ,carry_out
    );
input carry_in;
input [7:0] out_size;
output [7:0] c;
output carry_out;
reg [7:0] c = 0;
reg carry_out = 0;

always@(carry_in) begin
    if ((c==out_size-1)&&(carry_in==1)) begin c<=0;carry_out<=1;end
    else if (carry_in == 1) begin c<=c+1;carry_out=0;end
    else begin c <= c;carry_out=0;end
    
end
endmodule

module loop_counter5(
    carry_in
    ,out_size
    ,r
    ,carry_out
    );
input carry_in;
input [7:0] out_size;
output [7:0] r;
output carry_out;
reg [7:0] r = 0;
reg carry_out = 0;

always@(carry_in) begin
    if ((r==out_size-1)&&(carry_in==1)) begin r<=0;carry_out<=1;end
    else if (carry_in == 1) begin r<=r+1;carry_out=0;end
    else begin r <= r;carry_out=0;end
    
end
endmodule

module loop_counter6(
    carry_in
    ,out_channel
    ,m
    ,carry_out
    );
input carry_in;
input [7:0] out_channel;
output [7:0] m;
output carry_out;
reg [7:0] m = 0;
reg carry_out = 0;

always@(carry_in) begin
    if ((m==out_channel-1)&&(carry_in==1)) begin m<=0;carry_out<=1;end
    else if (carry_in == 1) begin m<=m+1;carry_out=0;end
    else begin m <= m;carry_out=0;end
    
end
endmodule



//-----------------------  Whole For-Loop ------------------------------------------
module loop(
    clk
    ,m
    ,r
    ,c
    ,n
    ,i
    ,j
//    ,neuron_ready
    ,layer_ready);
input clk;
output [7:0] m;
output [7:0] r;
output [7:0] c;
output [7:0] n;
output [3:0] i;
output [3:0] j;
//output neuron_ready;
output layer_ready;

wire carry1;
wire carry2;
wire carry3;
wire carry4;
wire carry5;

reg [3:0] k = 5;
reg [7:0] in_channel = 1;
reg [7:0] out_size = 28;
reg [7:0] out_channel = 6;

//assign neuron_ready = carry3;

loop_counter1 l1(
    .clk(clk),
    .k_size(k),
    .j(j),
    .carry(carry1)
    );
loop_counter2 l2(
    .carry_in(carry1),
    .k_size(k),
    .i(i),
    .carry_out(carry2));
loop_counter3 l3(
    .carry_in(carry2),
    .in_channel(in_channel),
    .n(n),
    .carry_out(carry3));
loop_counter4 l4(
    .carry_in(carry3),
    .out_size(out_size),
    .c(c),
    .carry_out(carry4));
loop_counter5 l5(
    .carry_in(carry4),
    .out_size(out_size),
    .r(r),
    .carry_out(carry5));
loop_counter6 l6(
    .carry_in(carry5),
    .out_channel(out_channel),
    .m(m),
    .carry_out(layer_ready));
endmodule
