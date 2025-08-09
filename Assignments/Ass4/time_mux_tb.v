module time_mux_tb();
    reg [1 : 0]     in0,
                    in1,
                    in2,
                    in3;
    reg     rst,
            clk;
    wire [1 : 0]  out;

    time_mux DUT(in0,
                in1,
                in2,
                in3,
                clk,
                rst,
                out);

    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        in0 = 0;
        in1 = 1;
        in2 = 2;
        in3 = 3;
        rst = 1;
        @(negedge clk);
        if(out != 0) begin
            $display("Error - Reset");
            $stop;
        end

        rst = 0;
        repeat(1000) @(negedge clk);

        $stop;
    end
endmodule