module ModExSub #(parameter W=5)
(
	input [W-1:0]A,
	input [W-1:0]B,
	//input AddSub,
	output [W-1:0]R,
	output Cout
);

	logic [W-1:0] out;
	logic [W-1:0] outfinal;

RCAddSub RCAddSub_inst
(
	.AddSub(1'b1) ,	// input  AddSub_sig
	.A(A) ,	// input [3:0] A_sig
	.B(B) ,	// input [3:0] B_sig
	.S(out) ,	// output [3:0] S_sig
	.Cout(Cout) 	// output  Cout_sig
);

//twosign twosign_inst
//(
//	.A(out) ,	// input [N-1:0] A_sig
//	.B(outfinal) 	// output [N-1:0] B_sig
//);


Newtwosign Newtwosign_inst
(
	.A(out) ,	// input [7:0] A_sig
	.B(outfinal) 	// output [7:0] B_sig
);

mux2to1 mux2to1_inst
(
	.A(outfinal) ,	// input [N-1:0] A_sig
	.B(out) ,	// input [N-1:0] B_sig
	.S(Cout) ,	// input  S_sig
	.Z(R) 	// output [N-1:0] Z_sig
);
//assign R = (Cout == 1'b0) ? outfinal : out;



endmodule
