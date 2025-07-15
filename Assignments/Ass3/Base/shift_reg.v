module shift_reg(sclr, sset, shiftin, load, clk, enable, aclr, aset, data, shiftout, q);
    parameter LOAD_AVALUE = 1;
    parameter SHIFT_DIRECTION = "LEFT";
    parameter LOAD_SVALUE = 1;
    parameter SHIFT_WIDTH = 8;

    input sclr, sset, shiftin, load, clk, enable, aclr, aset;
    input [SHIFT_WIDTH - 1 : 0] data;
    output reg shiftout;
    output reg [SHIFT_WIDTH - 1 : 0] q;

    always @(posedge clk or posedge aclr or posedge aset) begin
        if(aclr)
            q <= 0;
        else if(aset)
            q <= LOAD_AVALUE;
        else if(enable) begin
            if(sclr)
                q <= 0;
            else if(sset)
                q <= LOAD_SVALUE;
            else if(load)
                q <= data;
            else if(SHIFT_DIRECTION == "LEFT")
                {shiftout, q} = {q, shiftin};
            else if(SHIFT_DIRECTION == "RIGHT")
                {q, shiftout} = {shiftin, q};
        end /* End of Enable IF STATEMENT */
    end /* End of Always Block */
endmodule