module alu_seq(A, B, opcode, rst, clk, out);
    input [3:0] A, B;
    input [1:0] opcode;
    input rst, clk;
    output reg [7:0] out;

    reg [3:0] Areg, Breg;
    reg [1:0] opcodereg;
    wire [7:0] out_wire;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Areg <= 0;
            Breg <= 0;
            opcodereg <= 0;
        end
        else begin
            Areg <= A;
            Breg <= B;
            opcodereg <= opcode;
        end
    end

    ALUx #(.N(4)) ALU4 (.in0(Areg), .in1(Breg), .opcode(opcodereg), .out(out_wire));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out <= 8'b0;
        end
        else begin
            out <= out_wire;
        end
    end
    
endmodule

module ALUx(in0, in1, opcode, out);
    
    parameter N = 1;
    input [N - 1:0] in0, in1;
    input [1:0] opcode;
    output reg [(2 * N) - 1:0] out;

    always @(*) begin
        casex(opcode) 
            2'h0: out = in0 + in1;
            2'h1: out = in0 * in1;
            2'h2: out = in0 - in1;
            2'h3: out = in0 & in1;
        endcase
    end

endmodule
