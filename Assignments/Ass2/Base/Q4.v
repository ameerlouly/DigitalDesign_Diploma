module latch4(aset, data, gate, aclr, q);
    parameter LAT_WIDTH;
    input [LAT_WIDTH - 1 : 0] data;
    input aset, gate, aclr;
    output reg [LAT_WIDTH - 1 : 0] q;

    always @(*) begin
        if (aclr)
            q <= 0;
        else if (aset)
            q <= {LAT_WIDTH {1'b1}};
        else if (gate)
            q <= data;
    end

endmodule