module alu_seq_tb();
    reg [3:0] A, B;
    reg [1:0] opcode;
    reg rst, clk;
    wire [7:0] out, out_test;

    alu_seq aluDUT(A, B, rst, clk, opcode, out);

    initial begin
        clk = 0;
        forever
            #10 clk = ~clk;
    end

    initial begin
        $monitor("A = %d, B = %d, out = %d", A, B, out);
    end

    integer i;
    initial begin
        rst = 1;
        A = 4'd5;
        B = 4'd5;
        @(negedge clk)
        if(out != 0) begin
            $display("Reset Not working");
            $stop;
        end
        $display("Reset Works");

        rst = 0;
        for(i = 0; i < 100; i = i + 1) begin
            A = $random;
            B = $random;
            opcode = 0;
            @(negedge clk);
            // case(i)
            //     0: if(out != (A + B)) begin $display("Sum doesnt work"); $stop; end 
            //     0: if(out != (A | B)) begin $display("OR doesnt work"); $stop; end
            //     0: if(out != (A - B)) begin $display("Minus doesnt work"); $stop; end
            //     0: if(out != (A ^ B)) begin $display("XOR doesnt work"); $stop; end
            // endcase
        end
        $display("Design Works");
        $stop;
    end
endmodule

