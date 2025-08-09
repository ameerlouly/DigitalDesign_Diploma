module simple_dsp_tb ();

    parameter OPERATION = "ADD";

    reg [17 : 0]    A,
                    B,
                    D;
    reg [47 : 0]    C;
    reg clk,
        rst_n;
    wire [47 : 0] P;

    simple_dsp  DUT(
                    A,
                    B,
                    C,
                    D,
                    clk,
                    rst_n,
                    P);

    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        rst_n = 0;
        repeat(50) begin
            A = $random;
            B = $random;
            C = $random;
            D = $random;
            repeat(4) @(negedge clk);
            if(P != 0) begin
                $display("ERROR - Reset");
                $stop;
            end
        end

        rst_n = 1;
        D = 20;
        B = 25;
        A = 53;
        C = 60;
        repeat(4) @(negedge clk);
        if(P != 2445) begin
            $display("Error - Path 1");
            $stop;
        end

        $display("Simulation Successfull");
        $stop;
    end

endmodule