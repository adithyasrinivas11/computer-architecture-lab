module lead1_detector(inp,out);

input [10:0]inp;
output [3:0]out;

assign out=(inp[10])?4'b0000:
		(inp[9])?4'b0001:
		(inp[8])?4'b0010:
		(inp[7])?4'b0011:
		(inp[6])?4'b0100:
		(inp[5])?4'b0101:
		(inp[4])?4'b0110:
		(inp[3])?4'b0111:
		(inp[2])?4'b1000:
		(inp[1])?4'b1001:
		(inp[0])?4'b1100:4'b0000;

endmodule

