module BSMux (A, B, S, Z);

    input A, B, S; //declare data inputs
                        //declare select input
    output Z;      //declare output

    assign Z = S==0 ? A : B; //select input
endmodule
