module alsu_tb();

    reg [2:0] A, B, opcode;
    reg cin,
        serial_in,
        direction,
        red_op_A,
        red_op_B,
        bypass_A,
        bypass_B,
        clk,
        rst;
    reg [5:0] out_expected;
    wire [5:0] out;
    wire [15:0] leds;

    alsu_seq DUT(A,
             B,
             opcode,
             cin,
             serial_in,
             direction,
             red_op_A,
             red_op_B,
             bypass_A,
             bypass_B,
             clk,
             rst,
             out,
             leds);

    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        // Reset Functionality
        A = 0;
        B = 0;
        opcode = 0;
        cin = 0;
        serial_in = 0;
        direction = 0;
        red_op_A = 0;
        red_op_B = 0;
        bypass_A = 0;
        bypass_B = 0;
        clk = 0;
        rst = 1;
        repeat(2) @(negedge clk)
        if(out != 0 && leds != 0) begin
            $display("Error - Reset");
            $exit;
        end

        // bypass functionality
        rst = 0;
        bypass_A = 1;
        bypass_B = 1;
        repeat(50) begin
            A = $random;
            B = $random;
            opcode =  $urandom_range(0, 5);
            out_expected = A;
            repeat(2) @(negedge clk);
            if(out != out_expected) begin
                $display("Error - Bypass");
                $exit;
            end
        end
        
        rst = 1;
        repeat(2) @(negedge clk)
        
        // Opcode = 0 functionality
        rst = 0;
        A = 0;
        B = 0;
        bypass_A = 0;
        bypass_B = 0;
        opcode = 0;
        repeat(2) @(negedge clk)
        repeat(50) begin
            A = $random;
            B = $random;
            red_op_A = $random;
            red_op_B = $random;
            if(red_op_A && red_op_B)
                out_expected = &A;
            else if(red_op_A)
                out_expected = &A;
            else if(red_op_B)
                out_expected = &B;
            else
                out_expected = A & B;
            repeat(2) @(negedge clk)
            if(out != out_expected) begin
                $display("Error - Opcode 0 AND");
                $exit;
            end
        end

        // Opcode = 1 functionality
        rst = 0;
        A = 0;
        B = 0;
        opcode = 1;
        repeat(2) @(negedge clk)
        repeat(50) begin
            A = $random;
            B = $random;
            red_op_A = $random;
            red_op_B = $random;
            if(red_op_A && red_op_B)
                out_expected = ^A;
            else if(red_op_A)
                out_expected = ^A;
            else if(red_op_B)
                out_expected = ^B;
            else
                out_expected = A ^ B;
            repeat(2) @(negedge clk)
            if(out != out_expected) begin
                $display("Error - Opcode 1 XOR");
                $exit;
            end
        end

        // Opcode = 2 functionality
        rst = 0;
        A = 0;
        B = 0;
        opcode = 2;
        red_op_A = 0;
        red_op_B = 0;
        repeat(2) @(negedge clk)
        repeat(50) begin
            A = $random;
            B = $random;
            cin = $random;
            out_expected = A + B + cin;
            repeat(2) @(negedge clk)
            if(out != out_expected) begin
                $display("Error - Opcode 2 ADD");
                $exit;
            end
        end

        // Opcode = 3 functionality
        rst = 0;
        A = 0;
        B = 0;
        opcode = 3;
        red_op_A = 0;
        red_op_B = 0;
        repeat(2) @(negedge clk)
        repeat(50) begin
            A = $random;
            B = $random;
            out_expected = A * B;
            repeat(2) @(negedge clk)
            if(out != out_expected) begin
                $display("Error - Opcode 3 Multiply");
                $exit;
            end
        end
        $display("Simulation Successful");
        $display("Testing Invalid Case");

        rst = 0;
        A = 0;
        B = 0;
        opcode = 3;
        red_op_A = 1;
        red_op_B = 0;
        repeat(100) @(negedge clk);

        $exit;
    end // End of Initial Block

endmodule