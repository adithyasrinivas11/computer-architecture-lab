`include "FullAdder8Bit.v"

module FullAdder16Bit( a, b, cin, sum, carry);
	input [15:0] a,b;
	input cin;
	output [15:0] sum;
	output carry;
	wire c;
	
	FullAdder8Bit f8_1(a[7:0], b[7:0], cin, sum[7:0], c);
	FullAdder8Bit f8_2(a[15:8], b[15:8], c, sum[15:8], carry);
	
endmodule


