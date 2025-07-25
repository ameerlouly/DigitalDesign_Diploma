module dpr_sync_tb();
    parameter MEM_WIDTH = 16;
    parameter MEM_DEPTH = 1024;
    parameter ADDR_SIZE = 10;
    reg wr_en, rd_en, blk_select, clk, rst;
    wire [MEM_WIDTH - 1 : 0] dout;
    reg [MEM_WIDTH - 1 : 0] din;
    reg [ADDR_SIZE - 1 : 0] add_rd, add_wr;

    dpr_sync DUT(din, add_wr, add_rd, wr_en, rd_en, blk_select, dout, clk, rst);



    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        $readmemh("mem.dat", DUT.mem, 0, 1023);

        wr_en = 0;
        rd_en = 0;
        blk_select = 0;
        din = 0;
        rst = 1;
        @(negedge clk);
        rst = 0;

        wr_en = 1;
        blk_select = 1;
        repeat(100) begin
            add_wr = $random;
            din = $random;
            @(negedge clk);
        end

        rd_en = 1;
        blk_select = 1;
        repeat(100) begin
            add_rd = $random;
            add_wr = ~add_rd;
            din = $random;
            @(negedge clk);
        end
    end
endmodule