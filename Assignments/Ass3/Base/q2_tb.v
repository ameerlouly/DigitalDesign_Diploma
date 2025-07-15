module dff_en_pre_tb();
    reg E, D, clk, PRE, Q_expected;
    wire Q;

    dff_en_pre DUT(E, D, Q, clk, PRE);

    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        $monitor("D = %d, Q = %d", D, Q);
    end

    initial begin
        // Preset Check
        PRE = 0;
        @(negedge clk);
        if(Q != 1) begin
            $display("Error - Incorrect PRESET");
            $exit;
        end
        PRE = 1;
        $display("PRESET WORKS");

        // DFF check
        PRE = 0;
        @(negedge clk);
        PRE = 1;
        E = 1;
        repeat(50) begin
            D = $random;
            Q_expected = D;
            @(negedge clk);
            if(Q != Q_expected) begin
                $display("Enable doesn't work");
                $exit;
            end
        end /* End of Repeat */
        $display("DFF WORKS");

        // Enable Closed Check
        E = 1;
        D = 1;
        @(negedge clk);
        E = 0;
        repeat(50) begin
            D = $random;
            @(negedge clk);
            if(Q != 1) begin
                $display("Enable doesn't work");
                $exit;
            end
        end /* End of Repeat */
        $display("ENABLE WORKS");

        $display("Design Works as expected");
        $exit;
    end
endmodule