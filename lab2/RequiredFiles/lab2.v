`include "WallaceMultiplier16Bit.v"
`include "2scomp.v"
`include "cla_8bit.v"
`include "shi_1.v"
module float_multiplier(a,b,c);

input [15:0] a,b ;
output [15:0] c ;


wire sign_a,sign_b,cout ;
wire [15:0] diff ,shift_count,twos_off_diff,exponent_b1;
wire [15:0] mantisa_a,mantisa_b,smaller_man,shifted_smaller_man,sum_man,sum_mantisa,x;
wire [15:0] result;
wire [7:0] exponent_a,exponent_b,sum_expo,sum1,actual_sum1;
wire [31:0] mantisa_product;
wire [10:0] mantisa_product1;
wire [15:0] out;
assign sign_a= a[15];
assign sign_b= b[15];

assign exponent_a[4:0]=a[14:10];
assign exponent_b[4:0]=b[14:10];
assign exponent_a[7:5]=3'b000;
assign exponent_b[7:5]=3'b000;

assign mantisa_a[9:0]=a[9:0];
assign mantisa_b[9:0]=b[9:0];
assign mantisa_a[15:11]=5'b00000;
assign mantisa_b[15:11]=5'b00000;


assign mantisa_a[10]=(|a[14:0])?1'b1:1'b0;
assign mantisa_b[10]=(|b[14:0])?1'b1:1'b0;

WallaceMultiplier16Bit b1(mantisa_a,mantisa_b,mantisa_product);	//multiplying mantisa

FullAdder8Bit x1( exponent_a,exponent_b, 1'b0, sum_expo, cout);    //adding the exponents  x+15,y+15
twos_comp tt1(4'b1111,out);
carry_look_ahead_8bit  ai91(sum_expo,out, 1'b0, sum1,cout);		//removing the offset 15


assign sel=mantisa_product[21];						
assign shift=(sel)?1'b1:1'b0;							//checking for shift if its denormalized format eg 10.01....

shi_1 ss1(shift,mantisa_product[19:10],mantisa_product1[9:0]);		

assign result[9:0]=mantisa_product1[9:0];
carry_look_ahead_8bit  ai01(sum1,shift, 1'b0, actual_sum1,cout);	//

wire x11;
assign result[14:10]=actual_sum1[4:0];	
assign c[15]= sign_a ^ sign_b;		
assign x11=(^a[14:0]) | (^b[14:0]);
assign c[14:0]= (x11)?result[14:0]:14'b00000000000000;
//always @(*)
//begin
//$display("resu=%5b ,%b, %b ,%b",result[14:0],mantisa_product,mantisa_product1,shift);
//end

endmodule
