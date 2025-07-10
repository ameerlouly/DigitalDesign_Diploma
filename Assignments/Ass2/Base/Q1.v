module ALUx(in0, in1, out);
    
    parameter N = 4;
    parameter OPCODE = 0;
    input [N - 1:0] in0, in1;
    output reg [N - 1:0] out;

    always @(*) begin
        casex(OPCODE) 
            2'h0: out = in0 + in1;
            2'h1: out = in0 | in1;
            2'h2: out = in0 - in1;
            2'h3: out = in0 ^ in1;
        endcase
    end

endmodule

module ALUx_tb1();
    reg [4 - 1:0] in0, in1, out_expected;
    wire [3:0] out_dut;

    ALUx #(4, 0) ALU_dut(in0, in1, out_dut);

    initial begin
        in0 = $random;
        in1 = $random;

        #10 // Delay

        out_expected = in0 + in1;

        if(out_dut != out_expected) begin
            $display("Incorrect Addition Value Value");
            $stop;
        end // End of If condition
    end // End of For initial Block

    initial begin
        $monitor("in0 = %b, in1 = %b, out_dut = %b, test_dut = %d", in0, in1, out_dut, out_expected);
    end
endmodule

module ALUx_tb2();
    reg [4 - 1:0] in0, in1, out_expected;
    wire [3:0] out_dut;

    ALUx #(4, 1) ALU_dut(in0, in1, out_dut);

    initial begin
        in0 = $random;
        in1 = $random;

        #10 // Delay

        out_expected = in0 | in1;

        if(out_dut != out_expected) begin
            $display("Incorrect Addition Value Value");
            $stop;
        end // End of If condition
    end // End of For initial Block

    initial begin
        $monitor("in0 = %b, in1 = %b, out_dut = %b, test_dut = %d", in0, in1, out_dut, out_expected);
    end
endmodule

module ALUx_tb3();
    reg [4 - 1:0] in0, in1, out_expected;
    wire [3:0] out_dut;

    ALUx #(4, 2) ALU_dut(in0, in1, out_dut);

    initial begin
        in0 = $random;
        in1 = $random;

        #10 // Delay

        out_expected = in0 - in1;

        if(out_dut != out_expected) begin
            $display("Incorrect Addition Value Value");
            $stop;
        end // End of If condition
    end // End of For initial Block

    initial begin
        $monitor("in0 = %b, in1 = %b, out_dut = %b, test_dut = %d", in0, in1, out_dut, out_expected);
    end
endmodule

module ALUx_tb4();
    reg [4 - 1:0] in0, in1, out_expected;
    wire [3:0] out_dut;

    ALUx #(4, 3) ALU_dut(in0, in1, out_dut);

    initial begin
        in0 = $random;
        in1 = $random;

        #10 // Delay

        out_expected = in0 ^ in1;

        if(out_dut != out_expected) begin
            $display("Incorrect Addition Value Value");
            $stop;
        end // End of If condition
    end // End of For initial Block

    initial begin
        $monitor("in0 = %b, in1 = %b, out_dut = %b, test_dut = %d", in0, in1, out_dut, out_expected);
    end
endmodule