module counter_tb();
    
    reg clk, reset, en_load, up_ndown;
    reg [3 : 0] load;
    wire [3 : 0] cnt;

    counter DUT(clk, reset, en_load, load, up_ndown, cnt);

    initial begin
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        clk = 0;
        reset = 1;
        en_load = 1;
        load = 0;
        up_ndown = 1;
        @(negedge clk);
        if(cnt)
            $display("Load Doesnt Wokr");
        
        en_load = 0;
        @(negedge clk);

        $monitor("cnt = %d", cnt);
    end



endmodule