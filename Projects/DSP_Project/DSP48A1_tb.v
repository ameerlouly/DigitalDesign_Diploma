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
    wire  [17 : 0]    BCOUT;
    wire  [47 : 0]  PCOUT,
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
        // Testing Reset
        RSTA = 1;
        RSTB = 1;
        RSTM = 1;
        RSTP = 1; 
        RSTC = 1;
        RSTD = 1;
        RSTCARRYIN = 1;
        RSTOPMODE = 1;
        repeat(100) begin
            A = $random;
            B = $random;
            D = $random;
            BCIN = $random;
            OPMODE = $random;
            C = $random;
            PCIN = $random;
            CLK = $random;
            CARRYIN = $random;
            CEA = $random;
            CEB = $random;
            CEM = $random;
            CEP = $random;
            CEC = $random;
            CED = $random;
            CECARRYIN = $random;
            CEOPMODE = $random;

            @(negedge CLK);

            if (BCOUT     != 0 ||
                PCOUT     != 0 ||
                P         != 0 ||
                M         != 0 ||
                CARRYOUT  != 0 ||
                CARRYOUTF != 0) begin
                $display("ERROR - Reset");
                $exit;
            end
        end // End of Reset Test Loop

        RSTA = 0;
        RSTB = 0;
        RSTM = 0;
        RSTP = 0;
        RSTC = 0;
        RSTD = 0;
        RSTCARRYIN = 0;
        RSTOPMODE = 0;

        CEA        = 1;
        CEB        = 1;
        CEM        = 1;
        CEP        = 1;
        CEC        = 1;
        CED        = 1;
        CECARRYIN  = 1;
        CEOPMODE   = 1;

        OPMODE = 8'b11011101;
        A = 20;
        B = 10;
        C = 350;
        D = 25;
        repeat(100) begin
            BCIN     = $random;
            PCIN     = $random;
            CARRYIN  = $random;
            repeat(4) @(negedge CLK);

            if (BCOUT      != 'hf     &&
                M          != 'h12c   &&
                P          != 'h32    &&
                PCOUT      != 'h32    &&
                CARRYOUT   != 0       &&
                CARRYOUTF  != 0) begin
                $display("ERROR - DSP Path 1");
                $exit;
            end
        end // End of DSP Path 1 Loop

        OPMODE = 8'b00010000;
        A      = 20;
        B      = 10;
        C      = 350;
        D      = 25;

        repeat(100) begin
            BCIN     = $random;
            PCIN     = $random;
            CARRYIN  = $random;

            repeat(3) @(negedge CLK); // Wait for DREG, B1REG, MREG propagation

            if (
                BCOUT      != 'h23   &&
                M          != 'h2bc  &&
                P          != 0      &&
                PCOUT      != 0      &&
                CARRYOUT   != 0      &&
                CARRYOUTF  != 0
            )begin
                $display("ERROR - DSP Path 2");
                $exit;
            end
        end // End of DSP Path 2 Loop

        // DSP Path 3 — No Pre-addition, P Feedback through Mux X and Z
        OPMODE = 8'b00001010;
        A      = 20;
        B      = 10;
        C      = 350;
        D      = 25;

        repeat(100) begin
            BCIN     = $random;
            PCIN     = $random;
            CARRYIN  = $random;

            repeat(3) @(negedge CLK); // Wait for B1REG, MREG, PREG propagation

            if (
                BCOUT      != 'ha   &&
                M          != 'hc8  &&
                P          != PCOUT &&
                CARRYOUT   != CARRYOUTF
            ) begin
                $display("ERROR - DSP Path 3");
                $exit;
            end
        end // End of DSP Path 3 Loop

        // DSP Path 4 — Post-subtraction with D:A:B concatenation and PCIN routing
        OPMODE = 8'b10100111;
        A      = 5;
        B      = 6;
        C      = 350;
        D      = 25;
        PCIN   = 3000;

        repeat(100) begin
            BCIN     = $random;
            CARRYIN  = $random;

            repeat(3) @(negedge CLK); // Wait for B1REG, MREG, PREG propagation

            if (
                BCOUT      != 'h6                    &&
                M          != 'h1e                   &&
                P          != 'hfe6fffec0bb1         &&
                PCOUT      != 'hfe6fffec0bb1         &&
                CARRYOUT   != 1                      &&
                CARRYOUTF  != 1
            ) begin
                $display("ERROR - DSP Path 4");
                $exit;
            end
        end // End of DSP Path 4 Loop



        $display("Test Successful");
        $exit;
    end
endmodule