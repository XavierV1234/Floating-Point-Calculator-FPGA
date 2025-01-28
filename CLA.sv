module CLA #(parameter N = 11)
(
    input  [N-1:0] A,      // First operand
    input  [N-1:0] B,      // Second operand
    input  opCode,         // Operation code (0 for addition, 1 for subtraction)
    output [N-1:0] R,      // Result output
    output Cout            // Final carry-out
);

    wire [N:0] C;           // Carry wires (including carry-out)
    wire [N-1:0] B_effective; // Effective B after applying opCode
    wire [N-1:0] SUM;       // Sum/difference output from Full Adders

    // Complement B if opCode = 1 (for subtraction)
    assign B_effective = B ^ {N{opCode}}; // If opCode = 1, B_effective = ~B (bitwise XOR with all 1s)

    // Initialize the carry-in based on opCode (0 for addition, 1 for subtraction)
    assign C[0] = opCode;

    // Create the Full Adders
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1)
        begin : FullAdderFor
            FAbehavSV FAbehavSV_inst
            (
                .a(A[i]),          // Input A
                .b(B_effective[i]), // Input B (adjusted for subtraction if needed)
                .cin(C[i]),        // Carry-in
                .s(SUM[i]),        // Sum/difference output
                .cout(C[i+1])      // Carry-out
            );
        end
    endgenerate

    // Final result assignment
    assign R = SUM;         // Assign the result of the addition/subtraction
    assign Cout = C[N];     // Assign the final carry-out

endmodule
