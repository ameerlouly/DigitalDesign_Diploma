module dsp48a1_tb();
    reg [17 : 0]    A,
                    B,
                    D,
                    BCIN;
    reg [7 : 0]     OPMODE;
    reg [47 : 0]    C,
                    PCIN;
    reg     CLK,
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
            CEOPMODE;
    wire  [17 : 0]    BCOUT,
    wire  [47 : 0]    PCOUT,
                        P;
    wire  [35 : 0]    M;
    wire    CARRYOUT,
            CARRYOUTF;

    dsp48a1 DUT(.A(A),
                .B(B),
                .D(D),
                .BCIN(BCIN),
                .OPMODE(OPMODE),
                .C(C),
                .PCIN(PCIN),
                .CLK(CLK),
                .CARRYIN(CARRYIN),
                .RSTA(RSTA),
                .RSTB(RSTB),
                .RSTM(RSTM),
                .RSTP(RSTP),
                .RSTC(RSTC),
                .RSTD(RSTD),
                .RSTCARRYIN(RSTCARRYIN),
                .RSTOPMODE(RSTOPMODE),
                .CEA(CEA),
                .CEB(CEB),
                .CEM(CEM),
                .CEP(CEP),
                .CEC(CEC),
                .CED(CED),
                .CECARRYIN(CECARRYIN),
                .CEOPMODE(CEOPMODE),
                .BCOUT(BCOUT),
                .PCOUT(PCOUT),
                .P(P),
                .M(M),
                .CARRYOUT(CARRYOUT),
                .CARRYOUTF(CARRYOUTF));

    initial begin
        CLK = 0;
        forever begin
            #1 CLK = ~CLK;
        end
    end

    initial begin
        
    end
endmodule