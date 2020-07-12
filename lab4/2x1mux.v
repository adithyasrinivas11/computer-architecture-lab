module mux21(i0,i1,s,q);
    
input i1,i0,s;
output q;
										//s =1 then i1 is choosen
assign q= (!s & i0)|(s & i1);

endmodule
