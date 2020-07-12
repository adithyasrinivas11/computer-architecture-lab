`include "bar_shi.v"
module top;
reg [10:0] i;
reg [4:0] s;
wire [10:0] op;
wire carry;
bar_shif s1(s,i,op);
initial
begin
#0 i=11'b10000000000; s=5'b00001;
#10 i=10'd22; s=4'd2;
#20 i=10'd100; s=4'd2;
//#30 A=32'd656;B=32'd100;cin=1'b0;
//#40 A=32'd3333;B=32'd6666;cin=1'b1;

end
initial $monitor($time,"i=%5b s=%5d op=%5b ",i,s,op);

endmodule

