module mux_2(i0,i1,s,q);
    
input [15:0]i1,i0;
input s;
output [15:0]q;
wire [15:0] padds;
assign padds = {16{s}};								//s =1 then i1 is choosen
//assign q= (!s & i0)|(s & i1);
assign q[15:0]=(s)?i1:i0;
endmodule
