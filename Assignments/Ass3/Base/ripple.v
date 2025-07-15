module ripple_counter(
    clk,
    rstn,
    out
);
    input clk, rstn;
    output  [3:0] out;

    wire [3:0] clk_chain;
    assign clk_chain[0] = clk;
    genvar i;
    generate
        for(i = 0; i < 4; i = i +1) begin
            wire d_q_bar;
            if(i > 0)
                assign clk_chain[i] = out[i - 1];
            
            dff u_dff(d_q_bar, rstn, clk_chain[i], out[i], d_q_bar);
        end
    endgenerate
endmodule