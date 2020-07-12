`include "mux.v"

module shi_1(s,i,op);

input s;
input [11:0]i;

output [11:0]op;


mux_2 mi1(i[0],i[1],s,op[0]); 					//s =1 then i1 is choosen
mux_2 mi2(i[1],i[2],s,op[1]);
mux_2 mi3(i[2],i[3],s,op[2]);
mux_2 mi4(i[3],i[4],s,op[3]);
mux_2 mi5(i[4],i[5],s,op[4]);
mux_2 mi6(i[5],i[6],s,op[5]);
mux_2 mi7(i[6],i[7],s,op[6]);
mux_2 mi8(i[7],i[8],s,op[7]);
mux_2 mi9(i[8],i[9],s,op[8]);
mux_2 mi0(i[9],i[10],s,op[9]);
mux_2 mi012(i[10],i[11],s,op[10]);
mux_2 mii01(i[11],1'b0,s,op[11]);


endmodule
