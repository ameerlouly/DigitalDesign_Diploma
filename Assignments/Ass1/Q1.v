module Q1(A, B, C, D, E, F, sel, out, out_bar);

    input A, B, C, D, E, F, sel;
    output out, out_bar;
    wire X1, X2;

    and(X1, A, B, C);
    xnor(X2, D, E, F);
    assign out = (sel == 1)? X2 : X1;
    assign out_bar = ~out;

endmodule