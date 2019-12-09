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


module data_pack(
     neuron_rdy
    ,plane_rdy2
    ,din_acc
    ,din_ram
    ,dout
    );
input neuron_rdy;
input plane_rdy2;
input [15:0] din_acc;
input [63:0] din_ram;
output [63:0] dout;


reg [63:0] dout = 0;
reg [1:0] counter = 0;

always@(posedge neuron_rdy) begin
    if(din_acc[15] == 1) begin                     // relu function
    case(counter)
    2'b00: dout <= {16'h0000,din_ram[47:0]};
    2'b01: dout <= {din_ram[63:48],16'h0000,din_ram[31:0]};
    2'b10: dout <= {din_ram[63:32],16'h0000,din_ram[15:0]};
    2'b11: dout <= {din_ram[63:16],16'h0000};
    endcase
    end
    else
    case(counter)
    2'b00: dout <= {din_acc,din_ram[47:0]};
    2'b01: dout <= {din_ram[63:48],din_acc,din_ram[31:0]};
    2'b10: dout <= {din_ram[63:32],din_acc,din_ram[15:0]};
    2'b11: dout <= {din_ram[63:16],din_acc};
    endcase
end

always@(posedge plane_rdy2) begin
    if(counter == 3) counter <= 0;
    else counter <= counter + 1;
    end
    

endmodule
