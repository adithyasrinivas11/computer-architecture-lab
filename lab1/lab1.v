`include "2scomp.v"
`include "cla_16bit.v"
`include "cla_8bit.v"
`include "bar_shi.v"
`include "shi_1.v"
`include "lead_1_detector.v"
`include "barellshift.v"

module float_adder(a_s,a,b,c);

input a_s ;
input [15:0] a,b ;
output [15:0] c ;


wire sign_a,sign_b,cout,cout1,sel ;
wire [15:0] exponent_a,exponent_b,diff ,shift_count,twos_off_diff,exponent_b1,smaller_exp,larger_exp,larger_man;
wire [15:0] mantisa_a,mantisa_b,smaller_man,shifted_smaller_man,sum_man,sum_mantisa,x,twos_exponent_b,twos_mantisa_b,sub_mantisa;
wire smaller_exp1;
wire [15:0] smaller_man_1,larger_man_1,shifted_smaller_man_1,twos_mantisa_a,twos_shifted_smaller_man_1;
wire [15:0] zero_shift;

assign sign_a= a[15];
assign sign_b= b[15];

assign exponent_a[4:0]=a[14:10];
assign exponent_b[4:0]=b[14:10];
assign exponent_a[15:5]=11'b00000000000;
assign exponent_b[15:5]=11'b00000000000;

assign mantisa_a[9:0]=a[9:0];
assign mantisa_b[9:0]=b[9:0];
assign mantisa_a[15:11]=5'b00000;
assign mantisa_b[15:11]=5'b00000;


assign mantisa_a[10]=(|a[14:0])?1'b1:1'b0;
assign mantisa_b[10]=(|b[14:0])?1'b1:1'b0;

assign smaller_exp1=(exponent_a < exponent_b);
assign smaller_exp[4:0]=smaller_exp1?exponent_a:exponent_b;		//if(exponent_a>exponent_b)
assign larger_exp[4:0]=(~smaller_exp1)?exponent_a:exponent_b;		//if(exponent_a>exponent_b)

assign smaller_man[10:0]=smaller_exp1?mantisa_a:mantisa_b;		//mantisa of smaller exponent	
assign larger_man[10:0]=(~smaller_exp1)?mantisa_a:mantisa_b;   //mantisa of larger exponent


assign smaller_exp[15:5]=11'b00000000000;
assign larger_exp[15:5]=11'b00000000000;

assign smaller_man[15:11]=5'b00000;
assign larger_man[15:11]=5'b00000;


twos_comp a1(exponent_b,exponent_b1);    //twos complement

carry_look_ahead_16bit b1(exponent_a,exponent_b1, 1'b0, diff,cout);   //exponent(a) -exponent(b)

twos_comp a2(diff,twos_of_diff);
//shfiting the smaller one ?how to do ?
assign shift_count[4:0] =  {5{diff[5]}} & twos_of_diff |  ( {5{~diff[5]} } & diff);

assign shift_count[15:5] = 11'b00000000000;

bar_shif bb1(shift_count[4:0],smaller_man,shifted_smaller_man);

carry_look_ahead_16bit c1(larger_man,shifted_smaller_man, 1'b0, sum_man,cout);			//adding mantisa



wire [15:0] sum_ab;
wire [15:0] resultant_exp,rem;
assign sel=sum_man[11];
shi_1 xxx(sel,sum_man,sum_ab);
assign rem[0]=sel;
assign rem[15:1]=15'b000000000000000;
carry_look_ahead_16bit c123(larger_exp,rem, 1'b0, resultant_exp,cout);
//assign x[10:0]=sel & shi_1 s1(sel,sum_man,sum_mantisa) |(!sel & shi_1 s2(sel,sum_man,sum_mantisa));

wire neg_check1;
assign neg_check1=sum_man[15];
wire [15:0]addition;

assign addition[9:0]=sum_ab[9:0];
assign addition[14:10]=resultant_exp[4:0];
assign addition[15]=(neg_check1 == 1'b1)?1'b1:1'b0;
//chossing sign 

/////////////////////////////////////////////////////////subtraction.///////////////////////////////////////////////////////////
wire s1,s2,s3,s4;
wire [10:0]sub_mantisa_1;
wire [15:0]subtracted_mantisa;
wire [15:0] twos_zero_shift,corrected_exp;
twos_comp aa1(mantisa_b,twos_mantisa_b1); 
twos_comp aab1(mantisa_a,twos_mantisa_a1); 
//undeclared
assign twos_mantisa_b[10:0]=(~sign_b)?mantisa_b:twos_mantisa_b1;			//-b or b
assign twos_mantisa_a[10:0]=(~sign_a)?mantisa_a:twos_mantisa_a1;			//-a or a
/////

assign smaller_man_1[10:0]=(~smaller_exp1)?twos_mantisa_b:twos_mantisa_a;		//mantisa of smaller exponent	
assign larger_man_1[10:0]=(smaller_exp1)?twos_mantisa_b:twos_mantisa_a;   //mantisa of larger exponent
assign smaller_man_1[15:11]=5'b00000;
assign larger_man_1[15:11]=5'b00000;
assign shifted_smaller_man_1[15:11]=5'b00000;

twos_comp tt1(shifted_smaller_man_1,twos_shifted_smaller_man_1); 

bar_shif bar1(shift_count[4:0],smaller_man_1,shifted_smaller_man_1);  //shifting

carry_look_ahead_16bit ccd1(larger_man_1,twos_shifted_smaller_man_1, 1'b0, sub_mantisa,cout1);

lead1_detector l1(sub_mantisa,zero_shift); // no of leading ones!

assign zero_shift[15:5]=11'b00000000000;
assign s1=zero_shift[0];
assign s2=zero_shift[1];
assign s3=zero_shift[2];
assign s4=zero_shift[3];

barelshift bi1(s1,s2,s3,s4,1'b0,sub_mantisa[10:0],sub_mantisa_1);

wire neg_check;
assign neg_check=sub_mantisa[15];

assign subtracted_mantisa[15]= (neg_check)?1'b1:1'b0;				//sign_a ^ sign_b;
//assign subtracted_mantisa[9:0]=sub_mantisa_1[9:0];

twos_comp tqt1(zero_shift,twos_zero_shift); 

carry_look_ahead_16bit cbd1(larger_exp, twos_zero_shift, 1'b0, corrected_exp,cout1);

wire [15:0]twos_sub_mantisa_1;

twos_comp tqt111(sub_mantisa_1,twos_sub_mantisa_1); 
assign subtracted_mantisa[9:0]=(sub_mantisa[15])?twos_sub_mantisa_1:sub_mantisa_1;

assign subtracted_mantisa[14:10]=(^sub_mantisa[9:0])?corrected_exp[4:0]:5'b00000;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////final_output////////////////////////////////////////////////////

assign c[15:0]= (a_s)?addition[15:0]:subtracted_mantisa[15:0];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//always @(*)
//begin
//	$display("zero_shift = %b ,%b ,%b ,%b, %b, --%b  ",subtracted_mantisa,smaller_man,shifted_smaller_man,sum_man[11:0],sel,sub_mantisa);
//end


endmodule
