`include "2scomp.v"
`include "mux_8_1.v"
//add not function

module logic_unit(sel,a,b,out);

input [2:0]sel;
input [15:0] a, b;
output [15:0]out;

wire [15:0] out0,out1,out2,out3,out4,out5,out6,out7;

assign out0=a&b;
assign out1[15:0]=a[15:0] | b[15:0];
assign out2=~a & ~b;
assign out3=~a | ~b;
assign out4=a^b;
assign out5= ~(a^b);
assign  out6=~a;

twos_comp xxx2(a,out7);

mux_81 mu1(sel,out0,out1,out2,out3,out4,out5,out6,out7,out);
always @(*) begin
$display("o0 =%b,o1 =%b, o2=%b, o3=%b, o4=%b, o5=%b, o6=%b, o7=%b",out0,out1,out2,out3,out4,out5,out6,out7);
end
endmodule
