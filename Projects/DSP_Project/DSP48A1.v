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
                        P,
    output  [35 : 0]    M,
    output  CARRYOUT,
            CARRYOUTF 
);
    wire [17 : 0]   A0_out,
                    D_out,
                    B0_in,
                    B0_out,
                    B1_in,
                    A1_out,
                    B1_out;
    reg [17 : 0]    pre_adder_subtractor_out;
    reg [47 : 0]    x_out,
                    z_out;
    wire [47 : 0]   C_out,
                    post_adder_subtractor_out,
                    P_in;
    wire [35 : 0]   multiplier_out,
                    M_out;
    wire [7 : 0]    opmode_out;
    wire    CYI_in,
            CYI_out,
            CYO_in;


    // Input Stage
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

    // assign B0_in = B;
    generate
        if(B_INPUT == "DIRECT") begin
            assign B0_in = B;
        end
        else if (B_INPUT == "CASCADE") begin
            assign B0_in = BCIN;
        end
        else begin
            assign B0_in = 0;
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

    mux_reg #(  .REG(OPMODEREG),
                .RSTTYPE(RSTTYPE),
                .WIDTH(8)) OPMODE_REG (
                    .in(OPMODE),
                    .out(opmode_out),
                    .clk(CLK),
                    .ce(CEOPMODE),
                    .rst(RSTOPMODE)
                );

    mux_reg #(  .REG(CREG),
                .RSTTYPE(RSTTYPE),
                .WIDTH(48)) C_REG (
                    .in(C),
                    .out(C_out),
                    .clk(CLK),
                    .ce(CEC),
                    .rst(RSTC)
                );

    // Pre Adder Subtractor

    always @(*) begin
        if(opmode_out[6])
            pre_adder_subtractor_out = D_out - B0_out;
        else
            pre_adder_subtractor_out = D_out + B0_out;
    end

    assign B1_in = (opmode_out[4]) ? pre_adder_subtractor_out : B0_out;

    mux_reg #(  .REG(A1REG),
                .RSTTYPE(RSTTYPE),
                .WIDTH(18)) A1_REG (
                    .in(A0_out),
                    .out(A1_out),
                    .clk(CLK),
                    .ce(CEA),
                    .rst(RSTA)
                );

    mux_reg #(  .REG(B1REG),
                .RSTTYPE(RSTTYPE),
                .WIDTH(18)) B1_REG (
                    .in(B1_in),
                    .out(B1_out),
                    .clk(CLK),
                    .ce(CEB),
                    .rst(RSTB)
                );

    assign BCOUT = B1_out; //! Might Need to Change Later
    assign multiplier_out = B1_out * A1_out;

    mux_reg #(  .REG(MREG),
                .RSTTYPE(RSTTYPE),
                .WIDTH(36)) M_REG (
                    .in(multiplier_out),
                    .out(M_out),
                    .clk(CLK),
                    .ce(CEM),
                    .rst(RSTM)
                );

    assign M = M_out;

    //* Mux X
    always @(*) begin
        case(opmode_out[1 : 0])
            2'b00: x_out = 0;
            2'b01: x_out = {12'b000000000000, M_out};
            2'b10: x_out = PCOUT;
            2'b11: x_out = {D_out[11:0], A1_out[17:0], B1_out[17:0]};
        endcase
    end

    //* Mux Z
    always @(*) begin
        case(opmode_out[3 : 2])
            2'b00: z_out = 0;
            2'b01: z_out = PCIN;
            2'b10: z_out = PCOUT;
            2'b11: z_out = C_out;
        endcase
    end

    generate
        if(CARRYINSEL == "CARRYIN")
            assign CYI_in = CARRYIN;
        else if(CARRYINSEL == "OPMODE5")
            assign CYI_in = opmode_out[5];
    endgenerate

    mux_reg #(  .REG(CARRYINREG),
                .RSTTYPE(RSTTYPE),
                .WIDTH(1)) CYI_REG (
                    .in(CYI_in),
                    .out(CYI_out),
                    .clk(CLK),
                    .ce(CECARRYIN),
                    .rst(RSTCARRYIN)
                );

    assign {CYO_in, P_in} = (opmode_out[7]) ?
                            z_out - (x_out + CYI_out) :
                            x_out + z_out + CYI_out;

    mux_reg #(  .REG(PREG),
                .RSTTYPE(RSTTYPE),
                .WIDTH(48)) P_REG (
                    .in(P_in),
                    .out(P),
                    .clk(CLK),
                    .ce(CEP),
                    .rst(RSTP)
                );

    assign PCOUT = P;

    mux_reg #(  .REG(CARRYOUTREG),
                .RSTTYPE(RSTTYPE),
                .WIDTH(1)) CYO_REG (
                    .in(CYO_in),
                    .out(CARRYOUT),
                    .clk(CLK),
                    .ce(CECARRYIN),
                    .rst(RSTCARRYIN)
                );
                
    assign CARRYOUT = CARRYOUTF;
endmodule