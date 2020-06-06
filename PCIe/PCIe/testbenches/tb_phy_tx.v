
// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef TB_PHY_TX
`define TB_PHY_TX


// scale time unit (value of one) / precision
`timescale 	1ns				/ 1ns
// includes verilog files
// Can be omitted and called from the testbench
// Cmos
`include "./lib/cmos_cells.v"
`include "./src/phy_tx.v"
`include "./syn/phy_tx_syn.v"
`include "./testers/t_phy_tx.v"
`include "./testers/t_active.v"
`include "./testers/t_data.v"

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
wire reset_TB, clk1fTB, clk2fTB, clk4fTB, clk32fTB;
wire [7:0] in0_TB, in1_TB, in2_TB, in3_TB;
wire in_rx_txTB;
wire out_BTB, out_STB;
wire [3:0] validmux41_TB;
 
    // wires for recirc module
wire [7:0] out0_recir_BTB;
wire [7:0] out1_recir_BTB;
wire [7:0] out2_recir_BTB;
wire [7:0] out3_recir_BTB;

wire [7:0] out0_recir_STB;
wire [7:0] out1_recir_STB;
wire [7:0] out2_recir_STB;
wire [7:0] out3_recir_STB;



/*AUTOREGINPUT*/


///////////////////////////////////////////////////////////////////////////////////////////
              //////////// PHY TX BEHAVIORAL
              ////////////
///////////////////////////////////////////////////////////////////////////////////////////

phy_tx_b phy_tx_b_TB(/*AUTOINST*/
	// One output
	.out_b (out_BTB),
	.out0_recir(out0_recir_BTB),
	.out1_recir(out1_recir_BTB),
	.out2_recir(out2_recir_BTB),
	.out3_recir(out3_recir_BTB),

	// clks at different frequency and reset
	.clk1f (clk1fTB),
	.clk2f (clk2fTB),
	.clk4f (clk4fTB),
	.clk32f (clk32fTB),
	.reset (reset_TB),
	// Four inputs
	.in0 (in0_TB),
	.in1 (in1_TB),
	.in2 (in2_TB),
	.in3 (in3_TB),
	.in_rx_tx (in_rx_txTB),
	// Valid for inputs
	.validmux41 (validmux41_TB)
	);

	///////////////////////////////////////////////////////////////////////////////////////////
	              //////////// PHY TX SYN
	              ////////////
	///////////////////////////////////////////////////////////////////////////////////////////

// 						Synthesis
phy_tx_b_syn phy_tx_b_syn_TB(/*AUTOINST*/
	// One output
	.out_b (out_STB),
	.out0_recir(out0_recir_STB),
	.out1_recir(out1_recir_STB),
	.out2_recir(out2_recir_STB),
	.out3_recir(out3_recir_STB),

	// clks at different frequency and reset
	.clk1f (clk1fTB),
	.clk2f (clk2fTB),
	.clk4f (clk4fTB),
	.clk32f (clk32fTB),
	.reset (reset_TB),
	// Four inputs
	.in0 (in0_TB),
	.in1 (in1_TB),
	.in2 (in2_TB),
	.in3 (in3_TB),
	.in_rx_tx (in_rx_txTB),

	// Valid for inputs
	.validmux41 (validmux41_TB)
	);

	///////////////////////////////////////////////////////////////////////////////////////////
	              //////////// PHY TX TESTER
	              ////////////
	///////////////////////////////////////////////////////////////////////////////////////////

t_phy_tx t_phy_tx_TB(/*AUTOINST*/
	//Outputs
	.out_s (out_STB),
	.out_b (out_BTB),

	// Clks at different frequency and reset
	.clk1f (clk1fTB),
	.clk2f (clk2fTB),
	.clk4f (clk4fTB),
	.clk32f (clk32fTB),
	.reset (reset_TB)
	);



  t_active t_active(
    .in_rx_tx(in_rx_txTB)
  );

  t_data t_data(
 .in0(in0_TB),
 .in1(in1_TB),
 .in2(in2_TB),
 .in3(in3_TB),
  .validmux41(validmux41_TB)

);





endmodule


`endif
