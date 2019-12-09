module muladd1(
	clock
	,a_0
	,a_1
	,a_2
	,a_3
	,b_0
	,b_1
	,b_2
	,b_3
	,sum

);


input clock;
input [15:0] a_0;
input [15:0] a_1;
input [15:0] a_2;
input [15:0] a_3;
input [15:0] b_0;
input [15:0] b_1;
input [15:0] b_2;
input [15:0] b_3;

output [15:0] sum;


wire [31:0] mul_0;
wire [31:0] mul_1;
wire [31:0] mul_2;
wire [31:0] mul_3;

wire [15:0] mul_0_trim;
wire [15:0] mul_1_trim;
wire [15:0] mul_2_trim;
wire [15:0] mul_3_trim;

reg  [15:0] sum;


mul mul1(
	a_0
	,b_0
	,mul_0
);


mul mul2(
	a_1
	,b_1
	,mul_1
);

mul mul3(
	a_2
	,b_2
	,mul_2
);

mul mul4(
	a_3
	,b_3
	,mul_3
);


assign mul_0_trim = mul_0[23:8];
assign mul_1_trim = mul_1[23:8];
assign mul_2_trim = mul_2[23:8];
assign mul_3_trim = mul_3[23:8];

always@(posedge clock) begin

   sum <= mul_0_trim + mul_1_trim + mul_2_trim + mul_3_trim;
	
	
	end







endmodule







