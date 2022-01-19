module FullAdder (A, B, Cin, Sum, Cout);
    input A, B, Cin;
    output Sum, Cout;

    assign Sum = A ^ B ^ Cin;
    assign Cout = A&&B || ((A ^ B) && Cin);

endmodule