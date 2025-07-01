module Q5(A, out_with_parity);

    input [7:0] A;
    output [8:0] out_with_parity;

    assign out_with_parity[8:1] = A;
    assign out_with_parity[0] = ~^A;

endmodule