module counter(clk, reset, en_load, load, up_ndown, cnt);
    parameter width = 4;
    input clk, reset, en_load, up_ndown;
    input [width - 1: 0] load;
    output reg [width - 1: 0] cnt;

    always @(posedge clk) begin
        if (en_load) begin
            cnt <= load;
        end
        else begin
            if (!reset)
                cnt <= 0;
            else begin
                if(up_ndown)
                    cnt <= cnt + 1;
                else
                    cnt <= cnt - 1;
            end // End of Reset if
        end // End en_load else
    end // End of always block

endmodule