module bcd_counter_tb();
    reg clk, rst;
    wire clk_div10_out;

    bcd_counter DUT(clk, rst, clk_div10_out);

    initial begin
        clk = 0;
        forever begin
            #50 clk = ~clk;
        end
    end

    initial begin
        rst = 1;
        @(negedge clk);
        rst = 0;
        #10000;

        $exit;
    end
endmodule