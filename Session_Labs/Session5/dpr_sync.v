module dpr_sync(din, add_wr, add_rd, wr_en, rd_en, blk_select, dout, clk, rst);
    parameter MEM_WIDTH = 16;
    parameter MEM_DEPTH = 1024;
    parameter ADDR_SIZE = 10;
    input wr_en, rd_en, blk_select, clk, rst;
    output reg [MEM_WIDTH - 1 : 0] dout;
    input [MEM_WIDTH - 1 : 0] din;
    input [ADDR_SIZE - 1 : 0] add_rd, add_wr;

    reg [MEM_WIDTH - 1 : 0] mem [MEM_DEPTH - 1 : 0];

    always @(posedge clk) begin
        if(rst)
            dout <= 0;
        else if(blk_select) begin
            if(wr_en)
                mem[add_wr] <= din;
            if(rd_en)
                dout <= mem[add_rd];
        end
    end
endmodule