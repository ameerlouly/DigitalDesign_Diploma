module alu_seq_tb();
    reg [3:0] A, B;
    reg [1:0] opcode;
    reg [7:0] out_expected;
    reg rst, clk;
    
    wire [7:0] out;

    alu_seq aluDUT(A, B, opcode, rst, clk, out);

    initial begin
        clk = 0;
        forever
            #1 clk = ~clk;
    end

    initial begin
        $monitor("A = %d, B = %d, opcode: %d, out = %d", A, B, opcode, out);
    end

    integer i;
    initial begin
        rst = 1;
        A = 4'd5;
        B = 4'd5;
        repeat(2) @(negedge clk)
        if(out != 0) begin
            $display("Reset Not working");
            $stop;
        end
        $display("Reset Works");

        rst = 0;
        for(i = 0; i < 100; i = i + 1) begin
            A = $random;
            B = $random;
            opcode = $random;

            case(opcode)
                0: out_expected = A + B;
                1: out_expected = A * B;
                2: out_expected = A - B;
                3: out_expected = A & B;
            endcase
            
            repeat (2) @(negedge clk);

            if(out != out_expected) begin
                $display("Design Error");
                $stop;
            end            
        end
        $display("Design Works");
        $stop;
    end
endmodule

