`include "lab4.v"
module top2;

reg l_r;
reg [3:0] shift_count;
reg [15:0]  inp;
wire [15:0] out;

shifting_unit ss1(l_r,shift_count,inp,out);

initial
begin
#0 l_r=1'b0;shift_count=4'b0100;inp=16'b0000000000010001;
#10 l_r=1'b1;shift_count=4'b0100;inp=16'b0000000000010001;
//#5 sel=3'b001;//a=16'b0000000000000000;b=16'b1111111111111111;
//#10 sel=3'b010;
//#15 sel=3'b011;
end

initial $monitor($time,"shift_count=%b a=%5b out=%5b ",shift_count,inp,out);
endmodule
