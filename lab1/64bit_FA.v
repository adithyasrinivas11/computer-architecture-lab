`include "16bit_FA.v"
module sixtyfourbitadder(A,B,cin,sum,carry);

input [63:0]A,B;input cin;
output [63:0] sum;output carry;
wire w1,w2,w3;

sixteenbitadder fa01(A[15:0],B[15:0],cin,sum[15:0],w1);
sixteenbitadder fa11(A[31:16],B[31:16],w1,sum[31:16],w2);
sixteenbitadder fa10(A[47:32],B[47:32],w2,sum[47:32],w3);
sixteenbitadder fa12(A[63:48],B[63:48],w3,sum[63:48],carry);

endmodule


