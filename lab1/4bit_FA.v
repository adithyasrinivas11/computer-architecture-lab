`include "fulladder.v"
module fourbitadder(A,B,cin,sum,carry);

input [3:0]A,B;input cin;
output [3:0]sum;output carry;
wire w1,w2,w3;

fulladder fa0(A[0],B[0],cin,sum[0],w1);
fulladder fa1(A[1],B[1],w1,sum[1],w2);
fulladder fa2(A[2],B[2],w2,sum[2],w3);
fulladder fa3(A[3],B[3],w3,sum[3],carry);

endmodule


