module alsu_seq(A, B, opcode, cin, serial_in, direction, red_op_A, red_op_B, bypass_A, bypass_B, clk, rst,  out, leds);
    output reg [5:0] out;
    output reg [15:0] leds;
    parameter INPUT_PRIORITY = "A";
    parameter FULL_ADDER = "ON";
    input [2:0] A;
    input [2:0] B;
    input [2:0] opcode;
    input   cin,
            serial_in,
            direction,
            red_op_A,
            red_op_B,
            bypass_A,
            bypass_B,
            clk,
            rst;

    reg Invalid_Case;

    reg cin_reg;
    reg serial_in_reg;
    reg direction_reg;
    reg red_op_A_reg;
    reg red_op_B_reg;
    reg bypass_A_reg;
    reg bypass_B_reg;

    reg [2:0] A_reg;
    reg [2:0] B_reg;
    reg [2:0] opcode_reg;


    // Inputs Always Block
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            cin_reg <= 0;
            serial_in_reg <= 0;
            direction_reg <= 0;
            red_op_A_reg <= 0;
            red_op_B_reg <= 0;
            bypass_A_reg <= 0;
            bypass_B_reg <= 0;
            A_reg <= 0;
            B_reg <= 0;
            opcode_reg <= 0;
        end
        else begin
            cin_reg <= cin;
            serial_in_reg <= serial_in;
            direction_reg <= direction;
            red_op_A_reg <= red_op_A;
            red_op_B_reg <= red_op_B;
            bypass_A_reg <= bypass_A;
            bypass_B_reg <= bypass_B;
            A_reg <= A;
            B_reg <= B;
            opcode_reg <= opcode;
        end
    end

    // LEDs Always Block
    always @(posedge clk or posedge rst) begin
        if(rst)
            leds <= 0;
        else if(Invalid_Case == 1) 
            leds <= ~leds;
        else
            leds <= 0;
    end
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            out <= 0;
        end
        else if(bypass_A_reg || bypass_B_reg) begin
            if(bypass_A_reg && bypass_B_reg) begin
                if(INPUT_PRIORITY == "A")
                    out <= A_reg;
                if(INPUT_PRIORITY == "B")
                    out <= B_reg;
            end
            else if(bypass_A_reg)
                out <= A_reg;
            else if(bypass_B_reg)
                out <= B_reg;
        end
        else begin
            case(opcode_reg)
                3'h0: begin
                    if(red_op_A_reg == 1 && red_op_B_reg == 1) begin
                        if(INPUT_PRIORITY == "A")
                            out <= &A_reg;
                        else if(INPUT_PRIORITY == "B")
                            out <= &B_reg;
                    end else if (red_op_A_reg == 1)
                        out <= {5'b000000, &A_reg};
                    else if(red_op_B_reg == 1)
                        out <= &B_reg;
                    else begin
                        out <= A_reg & B_reg;
                    end
                    
                    Invalid_Case <= 0;
                end
                3'h1: begin
                    if(red_op_A_reg && red_op_B_reg) begin
                        if(INPUT_PRIORITY == "A")
                            out <= ^A_reg;
                        else if(INPUT_PRIORITY == "B")
                            out <= ^B_reg;
                    end
                    else if (red_op_A_reg)
                        out <= ^A_reg;
                    else if(red_op_B_reg)
                        out <= ^B_reg;
                    else begin
                        out <= A_reg ^ B_reg;
                    end

                    Invalid_Case <= 0;
                end
                3'h2: begin
                    if (red_op_A_reg || red_op_B_reg)
                        Invalid_Case <= 1;
                    else if(FULL_ADDER == "ON") begin
                        out <= A_reg + B_reg + cin_reg;
                        Invalid_Case <= 0;
                    end
                    else if (FULL_ADDER == "OFF") begin
                        out <= A_reg + B_reg;
                        Invalid_Case <= 0;
                    end
                end
                3'h3: begin
                    if (red_op_A_reg || red_op_B_reg)
                        Invalid_Case <= 1;
                    else begin
                        out <= A_reg * B_reg;
                        Invalid_Case <= 0;
                    end
                end
                3'h4: begin
                    if (red_op_A_reg || red_op_B_reg)
                        Invalid_Case <= 1;
                    else if(direction_reg) begin
                        out <= {out[4:0], serial_in_reg};
                        Invalid_Case <= 0;
                    end
                    else begin
                        out <= {serial_in_reg, out[5:1]};
                        Invalid_Case <= 0;
                    end
                end
                3'h5: begin
                    if (red_op_A_reg || red_op_B_reg)
                        Invalid_Case <= 1;
                    else if(direction_reg) begin
                        out <= {out[4:0], out[5]};
                        Invalid_Case <= 0;
                    end
                    else begin
                        out <= {out[0], out[5:1]};
                        Invalid_Case <= 0;
                    end
                end
                3'h6: Invalid_Case <= 1;
                3'h7: Invalid_Case <= 1;
            endcase
        end
    end

endmodule