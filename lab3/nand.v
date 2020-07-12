module nanding(a,b,c);

input [15:0]a,b;
output [15:0]c;

wire [15:0]a1,b1;

assign a1[15:0]=~a[15:0];
assign b1[15:0]=~b[15:0];

assign c[15:0]=a1[15:0] | b1[15:0];

endmodule	
