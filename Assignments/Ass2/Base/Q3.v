module data_latch(D, G, CLR, Q);
    input D, G, CLR;
    output reg Q;

    always @(*) begin
        if(~CLR)
            Q <= 0;
        else
            Q <= D;
    end // End of Always statement
endmodule