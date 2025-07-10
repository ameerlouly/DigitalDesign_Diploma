module ALUx(in0, in1, out, clk, rst);
    
    parameter N = 4;
    parameter OPCODE = 0;

    input clk, rst;
    input [N - 1:0] in0, in1;
    output reg [N - 1:0] out;

    always @(posedge clk) begin
        if(rst)
            out = 0;
        else begin
            casex(OPCODE) 
            2'h0: out <= in0 + in1;
            2'h1: out <= in0 | in1;
            2'h2: out <= in0 - in1;
            2'h3: out <= in0 ^ in1;
            endcase
        end
    end

endmodule