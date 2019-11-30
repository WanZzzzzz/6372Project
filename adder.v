module acc(
    clk
    ,finish
	,in_0
	,in_1
	,in_2
	,in_3
	,sel
	,sum);
	
input clk;
input finish;
input [15:0] in_0;
input [15:0] in_1; 
input [15:0] in_2;
input [15:0] in_3;
inout [3:0] sel;  // select register to store the current psum
output [15:0] sum;

reg [15:0] sum;
reg [15:0] reg_0;
reg [15:0] reg_1;
reg [15:0] reg_2;
reg [15:0] reg_3;
reg [15:0] reg_4;
reg [15:0] reg_5;
reg [15:0] reg_6;
reg [15:0] reg_7;
reg [15:0] reg_8;
reg [15:0] reg_9;
reg [15:0] reg_10;
reg [15:0] reg_11;
reg [15:0] reg_12;
reg [15:0] reg_13;
reg [15:0] reg_14;
reg [15:0] reg_15;

always @(posedge clk) begin
     case(sel)
	 4'b0000: begin reg_0 <= reg_0 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_0; end
	 4'b0001: begin reg_1 <= reg_1 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_1; end
	 4'b0010: begin reg_2 <= reg_2 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_2; end
	 4'b0011: begin reg_3 <= reg_3 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_3; end
	 4'b0100: begin reg_4 <= reg_4 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_4; end
	 4'b0101: begin reg_5 <= reg_5 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_5; end
	 4'b0110: begin reg_6 <= reg_6 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_6; end
	 4'b0111: begin reg_7 <= reg_7 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_7; end
	 4'b1000: begin reg_8 <= reg_8 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_8; end
	 4'b1001: begin reg_9 <= reg_9 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_9; end
	 4'b1010: begin reg_10 <= reg_10 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_10; end
	 4'b1011: begin reg_11 <= reg_11 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_11; end
	 4'b1100: begin reg_12 <= reg_12 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_12; end
	 4'b1101: begin reg_13 <= reg_13 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_13; end
	 4'b1110: begin reg_14 <= reg_14 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_14; end
	 4'b1111: begin reg_15 <= reg_15 + (in_0 + in_1 + in_2 + in_3);if(finish) sum <= reg_15; end
	endcase
	end
//always @(posedge clk) begin
//    sum <= acc;
//    end
    
endmodule
