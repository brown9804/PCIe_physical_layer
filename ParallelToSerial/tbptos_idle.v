`timescale 	100ns				/ 100ns

`include "paralelltoserial_IDLE.v"
`include "t_ptos_idle.v"


module testbench_ptos_idle;


 wire active;
 wire reset;
 wire clk;
 wire clk1f;
 wire clk2f;
 wire clk4f;
 wire clk8f;
 wire clk16f;
 wire clk32f;
 wire out;

paralelo_a_serial_IDLE paralelo_a_serialtb(
                                        .active  (active),
                                        .reset (reset),
                                        .clk32f (clk32f),
                                        .out    (out)
);

t_ptos_idle t_ptostb(      
                      .active (active),
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