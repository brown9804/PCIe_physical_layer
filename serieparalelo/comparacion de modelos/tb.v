`include "tester.v"
`include "serieparalelo.v"

module bancoPruebas();
    wire in;
    wire [7:0] out;
    wire [7:0] outs;
    wire reset;
    wire clk4f;
    wire valid;
    wire clk32f;

tester Probador(
                    .out(out),
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
                    .out(out),
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
