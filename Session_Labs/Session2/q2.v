module dff_en_pre(E, D, Q, clk, PRE);

    input E, D, clk, PRE;
    output reg Q;

    always @(posedge clk) begin
        if(~PRE)
            Q <= 1'b1;
        else if (E)
            Q <= D;
        //! Common Mistake
        /*
        else
            Q <= Q; //! Creates a Mux at the input INCORRECT!!
        */
    end

endmodule