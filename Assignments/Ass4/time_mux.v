module time_mux(in0,
                in1,
                in2,
                in3,
                clk,
                rst,
                out);
    
    input [1 : 0]   in0,
                    in1,
                    in2,
                    in3;
    input   rst,
            clk;
    output reg [1 : 0]  out;

    reg [1 : 0] counter_reg;

    always @(posedge clk) begin
        if(rst)
            counter_reg <= 0;
        else begin
            if(counter_reg >= 3)
                counter_reg <= 0;
            else
                counter_reg <= counter_reg + 1;
        end
    end

    always @(*) begin
        case(counter_reg)
            0:  out = in0;
            1:  out = in1;
            2:  out = in2;
            3:  out = in3;
        endcase
    end

endmodule