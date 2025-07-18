module sle(D, clk, en, ALn, ADn, SLn, SD, LAT, Q);
    input D, clk, en, ALn, ADn, SLn, SD, LAT;
    output Q;
    reg QLat;
    reg Qff;


    always @(*) begin
        if(LAT) begin
            if(clk) begin
                if(en) begin
                    if(~SLn)
                        QLat = SD;
                    else
                        QLat = D;
                end
            end
        end
    end

    assign Q = (LAT) ? QLat : Qff;

    always @(posedge clk or negedge ALn or posedge LAT) begin
        if(~ALn)
            Qff <= ~ADn;
        else if(~LAT) begin
            if(en) begin
                if(~SLn)
                    Qff <= SD;
                else
                    Qff <= D;
            end
        end
    end
endmodule