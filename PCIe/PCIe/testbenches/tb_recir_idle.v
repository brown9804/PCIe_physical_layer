// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef TB_RECIR_IDLE
`define TB_RECIR_IDLE


// scale time unit (value of one) / precision
`timescale 	1ns				/ 1ns
// includes verilog files
// Can be omitted and called from the testbench
// Cmos
`include "./lib/cmos_cells.v"
`include "./src/recir_idle.v"
`include "./syn/recir_idle_syn.v"

`include "./testers/t_recir_idle.v"


// Recirculation block if not IDLE
module TestBench ();

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

// Clks
wire clk1f;
wire clk2f;					// clock in @2f
wire clk4f;						// clock in @4f
wire reset;
// Serial Parallel input
wire valido;
// Inputs
wire [7:0] in0;
wire [7:0] in1;
wire [7:0] in2;
wire [7:0] in3;
wire [3:0] valid_in;
// For ff 8bits + 1 valid for mux
wire [7:0] out0m;
wire [7:0] out1m;
wire [7:0] out2m;
wire [7:0] out3m;
wire [3:0] valid_outm;
// For ff 8bits + 1 valid for tester
wire [7:0] out0t;
wire [7:0] out1t;
wire [7:0] out2t;
wire [7:0] out3t;
wire [3:0] valid_outt;
// For ff 8bits + 1 valid for mux
wire [7:0] out0m_s;
wire [7:0] out1m_s;
wire [7:0] out2m_s;
wire [7:0] out3m_s;
wire [3:0] valid_outm_s;
// For ff 8bits + 1 valid for tester
wire [7:0] out0t_s;
wire [7:0] out1t_s;
wire [7:0] out2t_s;
wire [7:0] out3t_s;
wire [3:0] valid_outt_s;


recir_idle  recir_idle_TB(
  // For ff 8buts + 1 valid for mux
  .out0m (out0m),
  .out1m (out1m),
  .out2m (out2m),
  .out3m (out3m),
  .valid_outm (valid_outm),
  // For ff 8buts + 1 valid for tester
  .out0t (out0t),
  .out1t (out1t),
  .out2t (out2t),
  .out3t (out3t),
  .valid_outt (valid_outt),
  // Clks
  .clk1f (clk1f),
	.clk2f (clk2f),						// clock in @2f
  .clk4f (clk4f),						// clock in @4f
  .reset (reset),
  // Serial Parallel input
  .valido (valido),

  .in0 (in0),
  .in1 (in1),
  .in2 (in2),
  .in3 (in3),

  .valid_in (valid_in)
  );

recir_idle_syn  recir_idle_syn_TB(
  // For ff 8buts + 1 valid for mux
  .out0m (out0m_s),
  .out1m (out1m_s),
  .out2m (out2m_s),
  .out3m (out3m_s),
  .valid_outm (valid_outm_s),
  // For ff 8buts + 1 valid for tester
  .out0t (out0t_s),
  .out1t (out1t_s),
  .out2t (out2t_s),
  .out3t (out3t_s),
  .valid_outt (valid_outt_s),
  // Clks
  .clk1f (clk1f),
	.clk2f (clk2f),						// clock in @2f
  .clk4f (clk4f),						// clock in @4f
  .reset (reset),
  // Serial Parallel input
  .valido (valido),

  .in0 (in0),
  .in1 (in1),
  .in2 (in2),
  .in3 (in3),
  .valid_in (valid_in)
  );


t_recir_idle t_recir_idle_TB(
  // For ff 8buts + 1 valid for mux
  .out0m (out0m),
  .out1m (out1m),
  .out2m (out2m),
  .out3m (out3m),
  .valid_outm (valid_outm),
  // For ff 8buts + 1 valid for tester
  .out0t (out0t),
  .out1t (out1t),
  .out2t (out2t),
  .out3t (out3t),
  .valid_outt (valid_outt),
  // For structural
  // For ff 8buts + 1 valid for mux
  .out0m_s (out0m_s),
  .out1m_s (out1m_s),
  .out2m_s (out2m_s),
  .out3m_s (out3m_s),
  .valid_outm_s (valid_outm_s),
  // For ff 8buts + 1 valid for tester
  .out0t_s (out0t_s),
  .out1t_s (out1t_s),
  .out2t_s (out2t_s),
  .out3t_s (out3t_s),
  .valid_outt_s (valid_outt_s),
  // Clks
  .clk1f (clk1f),
	.clk2f (clk2f),						// clock in @2f
  .clk4f (clk4f),						// clock in @4f
  .reset (reset),
  // Serial Parallel input
  .valido (valido),

  .in0 (in0),
  .in1 (in1),
  .in2 (in2),
  .in3 (in3),

  .valid_in (valid_in)
  );

endmodule
// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
