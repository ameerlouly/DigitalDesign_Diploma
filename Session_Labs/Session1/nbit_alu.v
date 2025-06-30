module ALUx(in0, in1, opcode, out);
    
    parameter N = 1;
    input [N - 1:0] in0, in1;
    input [1:0] opcode;
    output reg [N - 1:0] out;

    always @(*) begin
        casex(opcode) 
            2'h0: out = in0 + in1;
            2'h1: out = in0 | in1;
            2'h2: out = in0 - in1;
            2'h3: out = in0 ^ in1;
        endcase
    end

endmodule