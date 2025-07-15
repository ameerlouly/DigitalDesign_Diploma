module shift_reg_tb();
    reg sclr, sset, shiftin, load, clk, enable, aclr, aset;
    reg [SHIFT_WIDTH - 1 : 0] data;
    wire shiftout;
    wire [SHIFT_WIDTH - 1 : 0] q;

    shift_reg #(.LOAD_AVALUE(2),
                .LOAD_SVALUE)
endmodule