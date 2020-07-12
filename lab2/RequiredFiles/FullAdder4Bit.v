//`include "FullAdder.v"

module FullAdder4Bit( a, b, cin, sum, carry);
	input [3:0] a,b;
	input cin;
	output [3:0] sum;
	output carry;
	wire [2:0] c;
	
	FullAdder f1_1(a[0], b[0], cin, sum[0], c[0]);
	FullAdder f1_2(a[1], b[1], c[0], sum[1], c[1]);
	FullAdder f1_3(a[2], b[2], c[1], sum[2], c[2]);
	FullAdder f1_4(a[3], b[3], c[2], sum[3], carry);
	
endmodule
