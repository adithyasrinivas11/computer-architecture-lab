`include "cla_16bit.v"
module top;
reg [10:0] a,b;
reg cin;
wire [10:0] sum;
wire carry;

carry_look_ahead_16bit a1(a,b, cin, sum,cout);


initial
begin
#0 a=11'd100; b=11'd100;cin=1'b0;
#10 a=11'd25;b=11'd63;cin=1'b0;
//#20 A=32'd10400;B=32'd52454;cin=1'b1;
//#30 A=32'd656;B=32'd100;cin=1'b0;
//#40 A=32'd3333;B=32'd6666;cin=1'b1;

end
initial $monitor($time,"A=%5d B=%5d cin=%4d  sum=%5d carry=%5d",a,b,cin,sum,carry);

endmodule

