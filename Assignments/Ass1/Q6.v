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

module SevenSeg_decoder(A, B, opcode, en, a, b, c, d, e, f, g);

    input [3:0] A, B;
    input [1:0] opcode;
    input en;
    output reg a, b, c, d, e, f, g;
    wire [3:0] ALU_out;

    ALUx #(4) ALU4bit(A, B, opcode, ALU_out);

    always @(*) begin

        if(en) begin
            case(ALU_out)
                4'd0:  {a, b, c, d, e, f, g} = 7'b1111110;
                4'd1:  {a, b, c, d, e, f, g} = 7'b0110000;
                4'd2:  {a, b, c, d, e, f, g} = 7'b1101101;
                4'd3:  {a, b, c, d, e, f, g} = 7'b1111001;
                4'd4:  {a, b, c, d, e, f, g} = 7'b0110011;
                4'd5:  {a, b, c, d, e, f, g} = 7'b1011011;
                4'd6:  {a, b, c, d, e, f, g} = 7'b1011111;
                4'd7:  {a, b, c, d, e, f, g} = 7'b1110000;
                4'd8:  {a, b, c, d, e, f, g} = 7'b1111111;
                4'd9:  {a, b, c, d, e, f, g} = 7'b1111011;
                4'd10: {a, b, c, d, e, f, g} = 7'b1110111;
                4'd11: {a, b, c, d, e, f, g} = 7'b0011111;
                4'd12: {a, b, c, d, e, f, g} = 7'b1001110;
                4'd13: {a, b, c, d, e, f, g} = 7'b0111101;
                4'd14: {a, b, c, d, e, f, g} = 7'b1001111;
                4'd15: {a, b, c, d, e, f, g} = 7'b1000111;
                default:
                    {a, b, c, d, e, f, g} = 7'b0000000;
            endcase
        end // End of If statement
        else
            {a, b, c, d, e, f, g} = 7'b0000000;
    end // End of Always block

endmodule