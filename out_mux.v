`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/17 16:47:29
// Design Name: 
// Module Name: out_mux
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


module write_data(
     neuron_rdy
     ,plane_rdy
    ,sel
    ,din_acc
    ,din_ram
    ,dout
    );
input neuron_rdy;
input plane_rdy;
input sel;
input [15:0] din_acc;
input [15:0] din_ram;
output [63:0] dout;
reg [1:0] pos = 0;
reg [15:0] psum_0 = 0;
reg [15:0] psum_1 = 0;
reg [15:0] psum_2 = 0;
reg [15:0] psum_3 = 0;
reg [63:0] psum_pkd = 0;
always@(posedge neuron_rdy) begin
    if (sel) begin
        if(pos == 3) pos <= 0;
        else pos <= pos + 1;
        end
    case(pos)
    2'b00: psum_0 <= din;
    2'b01: psum_1 <= din;
    2'b10: psum_2 <= din;
    2'b11: psum_3 <= din;
    endcase
end
always@(posedge clk) begin
    psum_pkd <= {psum_0,psum_1,psum_2,psum_3};
end

endmodule
