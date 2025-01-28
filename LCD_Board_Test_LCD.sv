module LCD_Board_Test_LCD
	 (
	  input [3:0] row,
	  
	  input                clk      , // 50MHz Clock
	  input                lcd_reset    , // LCD Reset
	  input    [0:11] 	LCD_Board_PB , // LCD Board Push Buttons
          input    [0:4] 	LCD_Board_SW , // LCD Board Switches
	  inout    [7:0]       lcd_data     , // LCD Data Bus
	  input                LoadA, LoadB, LoadC, trig,
	  input                 regreset,
          output   [0:7] 	LCD_Board_LED, // LCD Board LEDs
          output   [3:0]    col,
          output   [0:9] 	DE10_LED		, // DE10_Lite Red LEDs
	  output               lcd_rs       , // LCD Register Select
	  output               lcd_rw       , // LCD Read Write Select
	  output               lcd_e         // LCD Execute
	  

	  );  
	  

	  

	 logic [19:0] A;
	 logic [3:0] value;
	 logic [15:0] binarySM;
	 logic [15:0] regA, regB, regC;
	 logic [15:0]Floatresult;

		




inputMod inputMod1
(
	.clk(clk) ,	// input  clk_sig
	.reset(regreset) ,	// input  reset_sig
	.row(row) ,	// input [3:0] row_sig
	.col(col) ,	// output [3:0] col_sig
	.out(A) ,	// output [DIGITS*4-1:0] out_sig
	.value(value) ,	// output [3:0] value_sig
	//.trig(trig) 	// output  trig_sig
);



NbitRegisterSV NbitRegisterSVA
(
	.D(A) ,	// input [N-1:0] D_sig
	.CLK(LoadA) ,	// input  CLK_sig
	.CLR(lcd_reset) ,	// input  CLR_sig
	.Q(regA) 	// output [N-1:0] Q_sig
);

NbitRegisterSV NbitRegisterSVB
(
	.D(A) ,	// input [N-1:0] D_sig
	.CLK(LoadB) ,	// input  CLK_sig
	.CLR(lcd_reset) ,	// input  CLR_sig
	.Q(regB) 	// output [N-1:0] Q_sig
);


		FloatingPointAdd FloatingPointAdd_inst
(
	.A(regA) ,	// input [15:0] A_sig
	.B(regB) ,	// input [15:0] B_sig
	.Result(Floatresult) 	// output [15:0] Result_sig
);

NbitRegisterSV NbitRegisterSVC
(
	.D(Floatresult) ,	// input [N-1:0] D_sig
	.CLK(LoadC) ,	// input  CLK_sig
	.CLR(lcd_reset) ,	// input  CLR_sig
	.Q(regC) 	// output [N-1:0] Q_sig
);


	LCD #(
		 .WIDTH(64),
		 .DIGITS(16),
		 .FLOAT(0),
		 .MODE(1),
		 .LINES(4),
		 .CHARS(20),//20
		 .LINE_STARTS({7'h00, 7'h40, 7'h14, 7'h54})
		 )(
		 .clk(clk),
		 .lcd_data(lcd_data),
		 .lcd_rs(lcd_rs),
		 .lcd_rw(lcd_rw),
		 .lcd_e(lcd_e),
		 .lcd_reset(!lcd_reset),
		 .A(regA),//32'd111111111 value
		 .B(regB),//32'd123456789 value
		 .C(regC),//32'd123456789 value
		 .Operation(2'b01) // PLUS
	);

endmodule


