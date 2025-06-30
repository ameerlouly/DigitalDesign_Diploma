//! Incorrect soltuion according to spec
/*
? Should seperate the inputs and output to x0, x1, x2, x3 and y0, y1
? and concatenate them in casex
*/

module priorityEncoder(x, y);

    input [3:0] x;
    output reg [1:0] y;

    always @(x) begin
        casex(x)

            4'b1XXX:    y = 2'b11;
            4'b1XX:     y = 2'b10;
            4'b1X:      y = 2'b01;
            default:    y = 2'b00;

        endcase
    end

endmodule