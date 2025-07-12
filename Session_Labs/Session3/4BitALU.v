module alu_seq(A, B, opcode, rst, clk, out);
    input [3:0] A, B;
    input [1:0] opcode;
    input rst, clk;
    output reg [7:0] out;

    reg [3:0] Areg, Breg;
    reg [1:0] opcodereg;
    wire [7:0] ALUOut;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            Areg <= 0;
            Breg <= 0;
            opcodereg <= 0;
        end
        else
            {Areg, Breg, opcodereg} <= {A, B, opcode};
    end

    always @(posedge clk, posedge rst) begin
        if (rst)
            out <= 8'b0;
        else begin
            casex(opcodereg) 
                2'h0: out <= Areg + Breg;
                2'h1: out <= Areg * Breg;
                2'h2: out <= Areg - Breg;
                2'h3: out <= Areg & Breg;
            endcase
        end
    end
    
endmodule
