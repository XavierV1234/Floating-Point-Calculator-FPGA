//module ExponentMux (A, B, S, Z);
//
//input [4:0] A, B;
// input S; //declare data inputs
//						//declare select input
//	output [4:0]Z;      //declare output
//
//	assign Z = S==0 ? B : A; //select input
//endmodule
module ExponentMux
(
    input [4:0] A, B,
    input S,
    output [4:0] Z
);
    always_comb
    begin
        if (S == 1'b1)
            Z = A;
        else
            Z = B;
    end

endmodule