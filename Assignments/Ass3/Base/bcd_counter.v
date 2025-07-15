module bcd_counter(clk, rst, clk_div10_out);
    input clk, rst;
    output clk_div10_out;
    reg [3:0] cnt;
    assign clk_div10_out = &(~(cnt ^ 4'd10));

    always @(posedge clk or posedge rst) begin
        if(rst)
            cnt <= 0;
        else if(clk_div10_out)
            cnt <= 0;
        else
            cnt <= cnt + 1;
    end
endmodule