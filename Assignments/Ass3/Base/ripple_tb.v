module ripple_counter_tb();
    reg clk, rstn;
    wire [3:0] out;

    ripple_counter DUT(clk, rstn, out);

    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        rstn = 0;
        @(negedge clk)
        rstn = 1;

        #100;

        $exit;
    end
endmodule