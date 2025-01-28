//module MantissaAddMux (A, B, S, Z);
//
//	input [9:0] A, B; 
//	input S; //declare data inputs
//						//declare select input
//	output [9:0]Z;      //declare output
//
//	assign Z = S==0 ? B : A; //select input
//endmodule
module MantissaAddMux
(
    input [9:0] A, B,
    input S,
    output [9:0] Z
);
    always_comb
    begin
        if (S == 1'b1)
            Z = A;
        else
            Z = B;
    end

endmodule
