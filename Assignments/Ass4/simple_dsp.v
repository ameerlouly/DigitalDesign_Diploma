module simple_dsp(
                    A,
                    B,
                    C,
                    D,
                    clk,
                    rst_n,
                    P);

    parameter OPERATION = "ADD";

    input [17 : 0]  A,
                    B,
                    D;
    input [47 : 0]  C;
    input   clk,
            rst_n;
    output [47 : 0] P;

    reg [17 : 0]    A_reg,
                    A1_reg,
                    B_reg,
                    D_reg,
                    pre_adder_out;
    reg [35 : 0]    multiplier_out;
    input [47 : 0]  C_reg,
                    P_reg;
    
    // First Stage
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            A_reg <= 0;
            B_reg <= 0;
            C_reg <= 0;
            D_reg <= 0;
        end
        else begin
            A_reg <= A;
            B_reg <= B;
            C_reg <= C;
            D_reg <= D;
        end
    end

    // Second Stage
    generate;
        case(OPERATION)
            "ADD": begin
                always @(posedge clk or negedge rst_n) begin
                    if(~rst_n) begin
                        pre_adder_out <= 0;
                        A1_reg <= 0;
                    end
                    else begin
                        A1_reg <= A_reg;
                        pre_adder_out <= D_reg + B_reg;
                    end
                end
            end
            "SUBTRACT": begin
                always @(posedge clk or negedge rst_n) begin
                    if(~rst_n) begin
                        pre_adder_out <= 0;
                        A1_reg <= 0;
                    end
                    else begin
                        A1_reg <= A_reg;
                        pre_adder_out <= D_reg - B_reg;
                    end
                end
            end
        endcase
    endgenerate

    // Third Stage
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            multiplier_out <= 0
        end
        else begin
            multiplier_out <= A1_reg * pre_adder_out;
        end
    end

    // Last Stage
    generate;
        case(OPERATION)
            "ADD": begin
                always @(posedge clk or negedge rst_n) begin
                    if(~rst_n) begin
                        P_reg <= 0;
                    end
                    else begin
                        P_reg <= multiplier_out + C_reg;
                    end
                end
            end
            "SUBTRACT": begin
                always @(posedge clk or negedge rst_n) begin
                    if(~rst_n) begin
                        P_reg <= 0;
                    end
                    else begin
                        P_reg <= multiplier_out - C_reg;
                    end
                end
            end
        endcase
    endgenerate

    assign P = P_reg;
        


endmodule