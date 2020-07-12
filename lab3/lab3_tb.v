`include "lab3.v"
module top1;

reg [2:0]sel;
reg [15:0] a, b;
wire [15:0] out;

logic_unit u1(sel,a,b,out);

initial
begin
#0 sel=3'b000;a=16'b0000000000000000;b=16'b1111111111111111;
#5 sel=3'b001;//a=16'b0000000000000000;b=16'b1111111111111111;
#10 sel=3'b010;
#15 sel=3'b011;
end

initial $monitor($time,"sel=%b a=%5b b=%5b out=%5b ",sel,a,b,out);
endmodule
