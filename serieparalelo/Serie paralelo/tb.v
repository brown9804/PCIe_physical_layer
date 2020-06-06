`include "tester.v"
`include "serieparalelo.v"
`include "cmos_cells.v" 

module bancoPruebas();
    wire in;
    wire [7:0] outc;
    wire [7:0] outs;
    wire reset;
    wire clk4f;
    wire valid;
    wire clk32f;

tester Probador(
                    .outc(outc),
 		            .outs(outs),
                    .in(in),
                    .clk4f(clk4f),
                    .clk32f(clk32f),
                    .reset(reset),
                    .valid(valid)
    );

serieparalelo spc (
                    .in(in),
                    .clk32f(clk32f),
                    .clk4f(clk4f),
                    .reset(reset),
                    .out(outc),
                    .valid(valid)
);

serieparalelo sps (
                    .in(in),
                    .clk32f(clk32f),
                    .clk4f(clk4f),
                    .reset(reset),
                    .out(outs),
                    .valid(valid)
);
endmodule
