`timescale 	1ns/1ps

`include "./src/paralelltoserial_IDLE.v"
`include "./testers/t_ptos_idle.v"
`include "./syn/paralelltoserial_IDLE_syn.v"
`include "./lib/cmos_cells.v"

module testbench_ptos_idle;


 wire active;
 wire reset;
 wire clk4f;
 wire clk32f;
 wire outc;
 wire outs;

paralelo_a_serial_IDLE paralelo_a_serialtb_b(
                                        .active  (active),
                                        .reset (reset),
                                        .clk32f (clk32f),
                                        .out    (outc)
);


paralelo_a_serial_IDLE_struct paralelo_a_serialtb_s(
                                        .active  (active),
                                        .reset (reset),
                                        .clk32f (clk32f),
                                        .out    (outs)
);




t_ptos_idle t_ptostb(      
                      .active (active),
                      .reset (reset),
                      .clk32f (clk32f),
                      .outc    (outc),
                      .outs    (outs)
);

endmodule 
