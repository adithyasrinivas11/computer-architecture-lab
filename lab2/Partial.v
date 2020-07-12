module partprod(A, B, part);
	input [7:0] A;
	input B;
	output [7:0] part;

	assign part[0] = A[0]&B;
	assign part[1] = A[1]&B;
	assign part[2] = A[2]&B;
	assign part[3] = A[3]&B;
	assign part[4] = A[4]&B;
	assign part[5] = A[5]&B;
	assign part[6] = A[6]&B;
	assign part[7] = A[7]&B;


endmodule