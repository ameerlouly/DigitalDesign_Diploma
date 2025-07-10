module mux31_2(d0, d1, d2, s0, s1, y);
    input d0, d1, d2, s0, s1;
    output y;

    assign y = (s0) ? d2 :
               (s1) ? d1 : d0;

endmodule

module mux31_3(d0, d1, d2, s0, s1, y);
    input d0, d1, d2, s0, s1;
    output reg y;

    always @(*) begin
        case({s1, s0})
        2'b00: y = d0;
        2'b01: y = d1;
        2'b10, 2'b11: y = d2;
        endcase
    end

endmodule

module mux31_tb();
    reg d0, d1, d2, s0, s1; // Inputs
    wire y_dut2, y_dut3;    // Outputs

    mux31_2 dut2(d0, d1, d2, s0, s1, y_dut2);   // Test
    mux31_3 dut3(d0, d1, d2, s0, s1, y_dut3);   // Model

    integer i;
    initial begin
        for(i = 0; i < 100; i = i + 1) begin
            d0 = $random;
            d1 = $random;
            d2 = $random;
            s0 = $random;
            s1 = $random;
            #10; // delay 10ns
            if(y_dut2 != y_dut3) begin
                $display("Error - Incorrect mux31 output");
                $stop;
            end // If Statement End
        end // For Loop End
    end // Initial Block 1 End

    initial begin
        $monitor("d0 = %b, d1 = %b, d2 = %b, s0 = %b, s1 = %b, y_dut2 = %b, y_dut3 = %b", d0, d1, d2, s0, s1, y_dut2, y_dut3);
    end


endmodule