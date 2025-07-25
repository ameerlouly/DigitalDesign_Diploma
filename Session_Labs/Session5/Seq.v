module seq011(clk, rstn, x, y);
    parameter A = 2'b00;
    parameter B = 2'b01;
    parameter C = 2'b11;
    parameter D = 2'b10;
    input clk, rstn, x;
    output reg [2:0] y;

    reg [2:0] cs, ns;

    // Current State Logic
    always @(posedge clk) begin
        if(~rstn)
            cs <= A;
        else
            cs <= ns;
    end

    // Next State Logic
    always @(cs, x) begin
        case(cs)
            A:  if(x == 0)
                    ns = B;
                else
                    ns = A;
            B:  if(x == 0)
                    ns = B;
                else
                    ns = C;
            C:  if(x == 0)
                    ns = B;
                else
                    ns = D;
            D:  if(x == 0)
                    ns = B;
                else
                    ns = A;
        endcase
    end

    // Output Logic
    always @(*) begin
        if(cs == D)
            y = y + 1;
        else
            y = y;
    end
endmodule