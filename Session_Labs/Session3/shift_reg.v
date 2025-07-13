module shift_reg(C, SI, nLEFT_RIGHT, rst, PO);
    input C, SI, nLEFT_RIGHT, rst;
    output reg [7:0] PO;

    always @(posedge C or posedge rst) begin
        if(rst)
            PO <= 0;
        else if (nLEFT_RIGHT)
            PO <= {SI, PO[7:1]};
        else
            PO <= {PO[6:0], SI};
    end

endmodule