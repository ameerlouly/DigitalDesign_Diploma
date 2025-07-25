module vending(clk, rstn, Q_in, D_in, dispense, change);
    parameter WAIT = 2'b00;
    parameter Q_25 = 2'b01;
    parameter Q_50 = 2'b10;
    (* fsm_encoding = "gray" *) // Synthesis Attribute
    input clk, rstn, Q_in, D_in;
    output reg dispense, change;
    reg [1:0] cs, ns;

    // State Memory
    always @(posedge clk or negedge rstn) begin
        if(~rstn)
            cs <= WAIT;
        else
            cs <= ns;
    end

    // Next State Logic
    always @(cs, D_in, Q_in) begin
        case(cs)
            WAIT:  begin
            if(D_in) ns = WAIT;
            else if(Q_in) ns = Q_25;
            else ns = WAIT;
            end
            Q_25:  begin if(Q_in) ns = Q_50; else ns = Q_25; end
            Q_50:  begin if(Q_in) ns = WAIT; else ns = Q_50; end
        endcase
    end

    // Output Logic
    always @(cs, D_in, Q_in) begin
        if(cs == WAIT && D_in) begin
            change = 1;
            dispense = 1;
        end
        else if(cs == Q_50 && Q_in) begin
            change = 0;
            dispense = 1;
        end
        else begin
            change = 0;
            dispense = 0;
        end
    end
endmodule