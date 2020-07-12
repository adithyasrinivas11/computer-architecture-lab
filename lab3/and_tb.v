`include "and.v"
module top;
reg [15:0] a,b;

wire [15:0] c;

anding a1(a,b,c);
initial
begin
#0 a=16'b0000000000000000;b=16'b1111111111111111; 
#10 a=16'b0000000000000101;b=16'b0000000000001001;
//#20 inp=11'b11111111110;
//#30 A=32'd656;B=32'd100;cin=1'b0;
//#40 A=32'd3333;B=32'd6666;cin=1'b1;

end
initial $monitor($time,"a=%5b b=%5b c=%b ",a,b,c);

endmodule

