module alsu(A,
            B,
            opcode,
            cin,
            serial_in,
            direction,
            red_op_A,
            red_op_B,
            bypass_A,   
            bypass_B,
            clk,
            rst, 
            out,
            leds);
parameter INPUT_PRIORITY = "A";
parameter FULL_ADDER = "ON";
input [2:0] A;
input [2:0] B;
input [2:0] opcode;
input cin,
      serial_in,
      direction,
      red_op_A,
      red_op_B,
      bypass_A,
      bypass_B,
      clk,
      rst;
output reg [5:0] out;
output reg [15:0] leds;

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

always @(posedge clk or posedge rst) begin

    cin_reg = cin;
    serial_in_reg = serial_in;
    direction_reg = direction;
    red_op_A_reg = red_op_A;
    red_op_B_reg = red_op_B;
    bypass_A_reg = bypass_A;
    bypass_B_reg = bypass_B;
    A_reg = A;
    B_reg = B;
    opcode_reg = opcode;

    if(rst) begin
        out = 0;
        leds = 0;
    end
    else if(bypass_A || bypass_B || Invalid_Case) begin
        if(Invalid_Case) begin
            leds = ~leds;
            out = 0;
        end
        else
            leds = 0;
        
        if(bypass_A_reg && bypass_B_reg) begin
            if(INPUT_PRIORITY == "A")
                out = A_reg;
            if(INPUT_PRIORITY == "B")
                out = B_reg;
        end
        else if(bypass_A_reg)
            out = A_reg;
        else if(bypass_B_reg)
            out = B_reg;
    end
    else begin
        case(opcode_reg)
            000: begin
                if(red_op_A_reg && red_op_B_reg) begin
                    if(INPUT_PRIORITY == "A")
                        out = &A_reg;
                    else if(INPUT_PRIORITY == "B")
                        out = &B_reg;
                end
                else if (red_op_A_reg)
                    out = &A;
                else if(red_op_B_reg)
                    out = &B_reg;
                
                Invalid_Case = 0;
            end
            001: begin
                if(red_op_A_reg && red_op_B_reg) begin
                    if(INPUT_PRIORITY == "A")
                        out = ^A_reg;
                    else if(INPUT_PRIORITY == "B")
                        out = ^B_reg;
                end
                else if (red_op_A_reg)
                    out = ^A_reg;
                else if(red_op_B_reg)
                    out = ^B_reg;

                Invalid_Case = 0;
            end
            010: begin
                if (red_op_A_reg || red_op_B_reg)
                    Invalid_Case = 1;
                else if(FULL_ADDER == "ON")
                    begin out = A_reg + B_reg + cin_reg; Invalid_Case = 0; end
                else if (FULL_ADDER == "OFF")
                    begin out = A_reg + B_reg; Invalid_Case = 0; end
            end
            011: begin
                if (red_op_A_reg || red_op_B_reg)
                    Invalid_Case = 1;
                else
                    begin out = A_reg * B_reg; Invalid_Case = 0; end
            end
            100: begin
                if (red_op_A_reg || red_op_B_reg)
                    Invalid_Case = 1;
                else if(direction_reg)
                    begin out = {out[4:0], serial_in_reg}; Invalid_Case = 0; end
                else
                    begin out = {serial_in_reg, out[5:1]}; Invalid_Case = 0; end
            end
            101: begin
                if (red_op_A_reg || red_op_B_reg)
                    Invalid_Case = 1;
                else if(direction_reg)
                    begin out = {out[4:0], out[5]}; Invalid_Case = 0; end
                else
                    begin out = {out[0], out[5:1]}; Invalid_Case = 0; end
            end
            110: Invalid_Case = 1;
            111: Invalid_Case = 1;
        endcase
    end

    if(~Invalid_Case)
        leds = 0;
end

endmodule