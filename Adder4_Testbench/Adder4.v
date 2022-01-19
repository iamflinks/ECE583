module Adder4 (A, B, Cin, Sum, Cout);
    output [3:0] Sum; // create a vector of 4 elements
    output Cout;
    input [3:0] A, B;
    input Cin;

    wire [3:1] C; // C is an internal signal of length 3

    // Instantiate four copies of the FullAdder

    FullAdder FA0 (A[0], B[0], Cin, Sum[0], C[1]); // The first adder takes the LSB from the input.
    FullAdder FA1 (A[1], B[1], C[1], Sum[1], C[2]);
    FullAdder FA2 (A[2], B[2], C[2], Sum[2], C[3]);
    FullAdder FA3 (A[3], B[3], C[3], Sum[3], Cout);

endmodule