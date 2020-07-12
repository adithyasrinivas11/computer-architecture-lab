`include "8bit_FA.v"
module sixteenbitadder(A,B,cin,sum,carry);

input [15:0]A,B;input cin;
output [15:0] sum;output carry;
wire w1;

eightbitadder fa01(A[7:0],B[7:0],cin,sum[7:0],w1);
eightbitadder fa11(A[15:8],B[15:8],w1,sum[15:8],carry);

endmodule


