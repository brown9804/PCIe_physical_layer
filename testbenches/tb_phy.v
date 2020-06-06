// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef TB_PHY
`define TB_PHY


// scale time unit (value of one) / precision
`timescale 	1ns				/ 1ns
// includes verilog files
// Can be omitted and called from the testbench
// Cmos
`include "./lib/cmos_cells.v"
`include "./src/phy.v"
`include "./syn/phy_syn.v"
`include "./testers/t_phy.v"

module TestBench; // Testbench
// Usually the signals in the test bench are wires.
// They do not store a value, they are handled by other module instances.
// Since they require matching the size of the inputs and outputs, they must be assigned their size
// defined in the modules

// If you define quantity format, it is recommended to keep it in the same format being the
// same used in the module for the number of bits - [1: 0] ---, another way to do it is with
// [0: 1]

// We are going to use AUTOINST: It is responsible for replacing the connections (considering it is HDL)
// pin to an instance (module) with variables as they change over time automatically in the instantiated module

// It's needed /*AUTOWIRE*/ because: Creates wires for outputs that ins't declare

/*AUTOWIRE*/
wire reset, clk1f, clk2f, clk4f, clk32f;
wire [7:0] in0_TB, in1_TB, in2_TB, in3_TB;
wire [7:0] out0_BTB, out1_BTB, out2_BTB, out3_BTB, out_rx_txBTB;
wire [7:0] out0_STB, out1_STB, out2_STB, out3_STB, out_rx_txSTB;
wire [3:0] validout_TB;
wire [3:0] validin_TB;
wire [7:0] out0_recir;
wire [7:0] out1_recir;
wire [7:0] out2_recir;
wire [7:0] out3_recir;
wire [7:0] valid_out_recir;
wire [7:0] out0_recir_s;
wire [7:0] out1_recir_s;
wire [7:0] out2_recir_s;
wire [7:0] out3_recir_s;
wire [7:0] valid_out_recir_s;


///////////////////////////////////////////////////////////////////////////////////////////
              ////////////  PHY BEHAVIORAL
              ////////////
///////////////////////////////////////////////////////////////////////////////////////////
phy phy_tb(/*AUTOINST*/
  //Outputs
  .out0_recir (out0_recir),
  .out1_recir (out1_recir),
  .out2_recir (out2_recir),
  .out3_recir (out3_recir),
  .valid_out_recir (valid_out_recir),
  .out0 (out0_BTB),
  .out1 (out1_BTB),
  .out2 (out2_BTB),
  .out3 (out3_BTB),
  .validout (validout_TB),
  // Inputs
  .clk1f (clk1f),
  .clk2f (clk2f),
  .clk4f (clk4f),
  .clk32f (clk32f),
  .reset (reset),
  .in0 (in0_TB),
  .in1 (in1_TB),
  .in2 (in2_TB),
  .in3 (in3_TB),
  .validin (validin_TB)
  );



///////////////////////////////////////////////////////////////////////////////////////////
              ////////////  PHY SYN
              ////////////
///////////////////////////////////////////////////////////////////////////////////////////

phy_syn phy_syn_tb(/*AUTOINST*/
  //Outputs
  .out0_recir (out0_recir_s),
  .out1_recir (out1_recir_s),
  .out2_recir (out2_recir_s),
  .out3_recir (out3_recir_s),
  .valid_out_recir (valid_out_recir_s),
  .out0 (out0_STB),
  .out1 (out1_STB),
  .out2 (out2_STB),
  .out3 (out3_STB),
  .validout (validout_TB),
  // Inputs
  .clk1f (clk1f),
  .clk2f (clk2f),
  .clk4f (clk4f),
  .clk32f (clk32f),
  .reset (reset),
  .in0 (in0_TB),
  .in1 (in1_TB),
  .in2 (in2_TB),
  .in3 (in3_TB),
  .validin (validin_TB)
  );


///////////////////////////////////////////////////////////////////////////////////////////
              ////////////  PHY TESTER
              ////////////
///////////////////////////////////////////////////////////////////////////////////////////

t_phy t_phy_tb(/*AUTOINST*/
  //Outputs
  .out0_recir (out0_recir),
  .out1_recir (out1_recir),
  .out2_recir (out2_recir),
  .out3_recir (out3_recir),
  .valid_out_recir (valid_out_recir),
  .out0_recir_s (out0_recir_s),
  .out1_recir_s (out1_recir_s),
  .out2_recir_s (out2_recir_s),
  .out3_recir_s (out3_recir_s),
  .valid_out_recir_s (valid_out_recir_s),
  .out0 (out0_BTB),
  .out1 (out1_BTB),
  .out2 (out2_BTB),
  .out3 (out3_BTB),

  .out0_s (out0_STB),
  .out1_s (out1_STB),
  .out2_s (out2_STB),
  .out3_s (out3_STB),
  
  .validout (validout_TB),
  // Inputs
  .clk1f (clk1f),
  .clk2f (clk2f),
  .clk4f (clk4f),
  .clk32f (clk32f),
  .reset (reset),
  .in0 (in0_TB),
  .in1 (in1_TB),
  .in2 (in2_TB),
  .in3 (in3_TB),
  .validin (validin_TB)
  );


endmodule


// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
