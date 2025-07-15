module tff(t, rstn, clk, q, qbar);
    input t, rstn, clk;
    output reg q, qbar;

    always @(posedge clk or negedge rstn) begin
        if(~rstn) begin
            q <= 0;
            qbar <= 1;
        end
        else if(t) begin
            q <= qbar;
            qbar <= q;
        end
    end
endmodule

module dff(d, rstn, clk, q, qbar);
    input d, rstn, clk;
    output reg q, qbar;

    always @(posedge clk or negedge rstn) begin
        if(~rstn) begin
            q <= 0;
            qbar <= 1;
        end
        else begin
            q <= d;
            qbar <= ~d;
        end
    end
endmodule

module ff(d, rstn, clk, q, qbar);
    parameter FF_TYPE = "DFF";
    input d, rstn, clk;
    output q, qbar;

    generate
        if(FF_TYPE == "DFF")
            dff ff1(d, rstn, clk, q, qbar);
        else if(FF_TYPE == "TFF")
            tff ff2(d, rstn, clk, q, qbar);
    endgenerate
endmodule

