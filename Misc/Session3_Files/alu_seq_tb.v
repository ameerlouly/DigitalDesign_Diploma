module dff_tb();
// DFF tb
    reg clk, D, rst;

    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        rst = 1; // active high
        @(negedge clk);
        if(d != 0)
            $stop;
        rst = 0;

        D = 1;
        @(negedge clk);
        if(D != 1)
         $stop;
    end

endmodule