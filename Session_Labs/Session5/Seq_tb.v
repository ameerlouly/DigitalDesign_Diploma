module seq011();
    reg clk, rstn, x;
    wire [2:0] y;

    seq011 DUT(clk, rstn, x, y);

    initial begin
        clk = 0;
        forever begin
            clk = ~clk;
        end
    end

    initial begin
        rstn = 0;
        @(negedge clk)

        rstn = 1;

        repeat(100) begin
            x = $random
        end
    end

endmodule