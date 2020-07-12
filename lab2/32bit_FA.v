`include "16bit_FA.v"
module thirtytwobitadder(A,B,cin,sum,carry);

input [31:0]A,B;input cin;
output [31:0] sum;output carry;
wire w1;

sixteenbitadder fa01(A[15:0],B[15:0],cin,sum[15:0],w1);
sixteenbitadder fa11(A[31:16],B[31:16],w1,sum[31:16],carry);

endmodule


