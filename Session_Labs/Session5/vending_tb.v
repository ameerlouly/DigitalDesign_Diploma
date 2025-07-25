module vending_tb();
    reg clk, rstn, Q_in, D_in;
    wire dispense, change;

    vending DUT(clk, rstn, Q_in, D_in, dispense, change);

    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        Q_in = 0;
        D_in = 0;
        rstn = 0;
        @(negedge clk)
        rstn = 1;

        repeat(100) begin
            Q_in = $random;
            @(negedge clk);
        end


        rstn = 0;
        @(negedge clk)
        rstn = 1;
        repeat(100) begin
            D_in = $random;
            @(negedge clk);
        end

        $stop;
    end
endmodule