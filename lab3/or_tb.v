`include "or.v"
module top;
reg [15:0]a,b;
wire  [15:0]c;

oring o11(a,b,c);

initial
begin
#0 a=16'd0;b=16'b1111111111111111;
end

initial  $monitor("a=%b,b=%b,c=%b",a,b,c);
endmodule

