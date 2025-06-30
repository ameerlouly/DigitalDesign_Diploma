/*First Implementation*/

module mux2_1(sel, in0, in1, out);

input in0, in1, sel;
output out;

assign out = (sel == 0) ? in0 : in1;

endmodule

/*Second Implementation using always*/

module mux2_2(sel, in0, in1, out);

input in0, in1, sel;
output reg out;

always @(*) begin
  
    if(sel == 0)
        out = in0;
    else
        out = in1;

end

endmodule