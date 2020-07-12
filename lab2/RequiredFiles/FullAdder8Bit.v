`include "FullAdder4Bit.v"

module FullAdder8Bit( a, b, cin, sum, carry);
	input [7:0] a,b;
	input cin;
	output [7:0] sum;
	output carry;
	wire c;
	
	FullAdder4Bit f4_1(a[3:0], b[3:0], cin, sum[3:0], c);
	FullAdder4Bit f4_2(a[7:4], b[7:4], c, sum[7:4], carry);
	
endmodule