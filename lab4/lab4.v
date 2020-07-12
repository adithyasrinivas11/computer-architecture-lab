`include "bar_shi.v"
`include "barellshift.v"
module shifting_unit(l_r,shift_count,inp,out);

input [15:0]inp;
input l_r;
input [3:0]shift_count;
output [15:0]out;

wire [15:0] out1,out2;

bar_shif bb12(shift_count,inp,out1);
barelshift b21(shift_count,inp,out2);

assign out[15:0]=(l_r)?out1:out2;  //1 for right or 0 or left 

endmodule


