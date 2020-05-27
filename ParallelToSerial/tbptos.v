`timescale 	100ns				/ 100ns

`include "paralelltoserial.v"
`include "t_ptos.v"
//`include "demux1_4synth.v"

module testbench_ptos;

 wire [7:0] in;
 wire in_valid;
 wire reset;
 wire clk;
 wire clk1f;
 wire clk2f;
 wire clk4f;
 wire clk8f;
 wire clk16f;
 wire clk32f;
 wire out;

paralelo_a_serial paralelo_a_serialtb(
                                        .in (in),
                                        .in_valid  (in_valid),
                                        .reset (reset),
                                        .clk32f (clk32f),
                                        .out    (out)
);

t_ptos t_ptostb(      .in (in),
                      .in_valid (in_valid),
                      .reset (reset),
                      .clk   (clk),
                      .clk1f (clk1f),
                      .clk2f (clk2f),
                      .clk4f (clk4f),
                      .clk8f (clk8f),
                      .clk16f (clk16f),
                      .clk32f (clk32f),
                      .out    (out)
);

endmodule 