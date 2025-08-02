module mux_reg(in, out, clk, ce, rst);
    parameter WIDTH = 18;
    parameter RSTTYPE = "SYNC";
    parameter REG = 0;
    input [WIDTH - 1 : 0] in;
    input clk, ce, rst;
    output [WIDTH - 1 : 0] out;

    reg [WIDTH - 1 : 0] in_reg;

    generate
        if(REG == 1) begin
            if(RSTTYPE == "SYNC") begin
            always @(posedge clk) begin
                    if(rst)
                        in_reg <= 0;
                    else if(ce)
                        in_reg <= in;
                end
            end
            else if (RSTTYPE == "ASYNC") begin
                always @(posedge clk or posedge rst) begin
                    if(rst)
                        in_reg <= 0;
                    else if(ce)
                        in_reg <= in;
                end
            end
            assign out = in_reg;
        end
        else if (REG == 0)
           assign out = in;
    endgenerate
endmodule