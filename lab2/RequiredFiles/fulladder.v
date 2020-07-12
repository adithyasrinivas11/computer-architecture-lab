module fulladder(A,B,cin,sum,carry);

input A,B,cin;
output sum,carry;
assign sum=A^B^cin;
assign carry=(A&B)|(B&cin)|(cin&A);

endmodule
