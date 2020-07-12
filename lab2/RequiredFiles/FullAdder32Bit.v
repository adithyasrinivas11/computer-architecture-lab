//`include "FullAdder16Bit.v"

module FullAdder32Bit( a, b, cin, sum, carry);
	input [31:0] a,b;
	input cin;
	output [31:0] sum;
	output carry;
	wire c;
	
	FullAdder16Bit f16_1(a[15:0], b[15:0], cin, sum[15:0], c);
	FullAdder16Bit f16_2(a[31:16], b[31:16], c, sum[31:16], carry);
	
endmodule


