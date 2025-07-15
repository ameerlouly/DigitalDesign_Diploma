module dff_tb();
    reg d, rstn, clk;
    wire Q, Q_bar, Q_expected,Q_bar_expected;

    ff #(.FF_TYPE("DFF")) DUT(d, rstn, clk, Q, Q_bar);
    dff goldenModel(d, rstn, clk, Q_expected,Q_bar_expected);

    initial begin
        clk = 0;
        forever
            #1 clk = ~clk;
    end

    initial begin
        rstn = 0;
        @(negedge clk);
        if((Q != Q_expected) && (Q_bar != Q_bar_expected)) begin
            $display("Error - Reset");
            $exit;
        end
        rstn = 1;

        repeat(100) begin
            d = $random;
            @(negedge clk);
            if((Q != Q_expected) && (Q_bar != Q_bar_expected)) begin
            $display("Error - Incorrect Value");
            $exit;
            end
        end

        $display("Design Passed!");
        $exit;
    end
endmodule

module tff_tb();
    reg t, rstn, clk;
    wire Q, Q_bar, Q_expected,Q_bar_expected;

    ff #(.FF_TYPE("TFF")) DUT(t, rstn, clk, Q, Q_bar);
    tff goldenModel(t, rstn, clk, Q_expected,Q_bar_expected);

    initial begin
        clk = 0;
        forever
            #1 clk = ~clk;
    end

    initial begin
        rstn = 0;
        @(negedge clk);
        if((Q != Q_expected) && (Q_bar != Q_bar_expected)) begin
            $display("Error - Reset");
            $exit;
        end
        rstn = 1;

        repeat(100) begin
            t = $random;
            @(negedge clk);
            if((Q != Q_expected) && (Q_bar != Q_bar_expected)) begin
            $display("Error - Incorrect Value");
            $exit;
            end
        end

        $display("Design Passed!");
        $exit;
    end
endmodule