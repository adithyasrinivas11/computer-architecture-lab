module FullAdder(A,B,Cin, Sum, Carry);
	input A,B, Cin;
	output Sum, Carry;
	assign Sum= A^B^Cin;
	assign Carry= ((A^B)&Cin) | (A&B);
	
endmodule
