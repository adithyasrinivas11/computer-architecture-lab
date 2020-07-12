`include "4bit_FA.v"
module eightbitadder(A,B,cin,sum,carry);

input [7:0]A,B;input cin;
output [7:0] sum;output carry;
wire w1;

fourbitadder fa01(A[3:0],B[3:0],cin,sum[3:0],w1);
fourbitadder fa11(A[7:4],B[7:4],w1,sum[7:4],carry);

endmodule


