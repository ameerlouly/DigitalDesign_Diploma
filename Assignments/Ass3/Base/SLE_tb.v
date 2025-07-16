module sle_tb();
    reg D, clk, en, ALn, ADn, SLn, SD, LAT;
    wire Q;

    sle DUT(D, clk, en, ALn, ADn, SLn, SD, LAT, Q);

    initial begin
        clk = 0;
        forever begin
            #10 clk = ~clk;
        end
    end

    initial begin
        LAT = 0;

        ALn = 0;
        repeat(10) begin
            ADn = $random;
            D = $random;
            @(negedge clk);
            if(Q != ~ADn) begin
                $display("Error Async Load");
                $exit;
            end
        end

        ALn = 1;
        SLn = 0;
        en = 1;
        repeat(10)begin
            SD = $random;
            D = $random;
            @(negedge clk);
            if(Q != SD) begin
                $display("Error Sync Load");
                $exit;
            end
        end

        ALn = 1;
        SLn = 1;
        en = 1;
        repeat(10)begin
            SD = $random;
            D = $random;
            @(negedge clk);
            if(Q != D) begin
                $display("Error Latch Operation");
                $exit;
            end
        end

        LAT = 1;

        ALn = 1;
        SLn = 0;
        en = 1;
        repeat(20)begin
            SD = $random;
            D = $random;
            #1;
        end

        ALn = 1;
        SLn = 1;
        en = 1;
        repeat(20)begin
            SD = $random;
            D = $random;
            #1;
        end

        $display("Design Works");
        $exit;
    end
endmodule