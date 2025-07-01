module Q2(D, A, B, C, sel, out, out_bar);

    input [2:0] D;
    input A, B, C, sel;
    output out, out_bar;
    wire AND2, OR1, XNOR1;

    and(AND2, D[0], D[1]);
    or(OR1, AND2, D[2]);
    xnor(XNOR1, A, B, C);

    assign out = (sel == 1) ? XNOR1 : OR1;
    assign out_bar = ~out_bar;

endmodule