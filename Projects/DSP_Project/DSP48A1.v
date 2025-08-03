module dsp48a1 #(
    parameter   A0REG = 0,
                A1REG = 1,
                B0REG = 0,
                B1REG = 1,
                CREG = 1,
                DREG = 1,
                MREG = 1,
                PREG = 1,
                CARRYINREG = 1,
                CARRYOUTREG = 1,
                OPMODEREG = 1,
                CARRYINSEL = "OPMODE5",
                B_INPUT = "DIRECT",
                RSTTYPE = "SYNC"
) (
    input [17 : 0]  A,
                    B,
                    D,
                    BCIN,
    input [7 : 0]   OPMODE,
    input [47 : 0]  C,
                    PCIN,
    input   CLK,
            CARRYIN,
            RSTA,
            RSTB,
            RSTM,
            RSTP,
            RSTC,
            RSTD,
            RSTCARRYIN,
            RSTOPMODE,
            CEA,
            CEB,
            CEM,
            CEP,
            CEC,
            CED,
            CECARRYIN,
            CEOPMODE,
    output  [17 : 0]    BCOUT,
    output  [47 : 0]    PCOUT,
                        PM,
    output  [35 : 0]    M,
    output  CARRYOUT,
            CARRYOUTF 
);
    wire [17 : 0]   A0_out,
                    D_out,
                    B0_in,
                    B0_out;

    mux_reg #(  .REG(A0REG),
                .RSTTYPE(RSTTYPE),
                .WIDTH(18)) A0_REG (
                    .in(A),
                    .out(A0_out),
                    .clk(CLK),
                    .ce(CEA),
                    .rst(RSTA)
                );

    mux_reg #(  .REG(DREG),
                .RSTTYPE(RSTTYPE),
                .WIDTH(18)) D_REG (
                    .in(D),
                    .out(D_out),
                    .clk(CLK),
                    .ce(CED),
                    .rst(RSTD)
                );

    generate
        if(B_INPUT == "DIRECT") begin
            B0_in = B;
        end
        else if (B_INPUT == "CASCADE") begin
            B0_in = BCIN;
        end
        else begin
            B0_in = 0;
        end
    endgenerate

    mux_reg #(  .REG(B0REG),
                .RSTTYPE(RSTTYPE),
                .WIDTH(18)) B0_REG (
                    .in(B0_in),
                    .out(B0_out),
                    .clk(CLK),
                    .ce(CEB),
                    .rst(RSTB)
                );

    
endmodule