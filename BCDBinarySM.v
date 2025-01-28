module BCDBinarySM #(parameter N=16)
	(
		input [19:0] BCD,
		output [N-1:0] binarySM
	);
		assign binarySM = 	BCD[19:16] * 16'd10000
								+	BCD[15:12] * 16'd1000
								+	BCD[11:8]  * 16'd100
								+  BCD[7:4]   * 16'd10
								+  BCD[3:0];		//BCD[15]*(8'b10000000) + BCD[11:8]*(8'b01100100) + BCD[7:4]*(8'b1010) + BCD[3:0];
									
endmodule