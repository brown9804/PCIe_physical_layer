// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef TB_PHY_RX
`define TB_PHY_RX

// scale time unit (value of one) / precision
`timescale 	1ns				/ 1ns
// includes verilog files
// Can be omitted and called from the testbench
// Cmos
`include "./lib/cmos_cells.v"
`include "./src/phy_rx.v"
`include "./syn/phy_rx_syn.v"

`include "./testers/t_phy_rx.v"

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
wire  inTB;
wire [7:0] out0_BTB, out1_BTB, out2_BTB, out3_BTB, out_rx_txBTB;
wire [7:0] out0_STB, out1_STB, out2_STB, out3_STB, out_rx_txSTB;
wire [3:0] valid_out_mux14TB;
wire [3:0] valid_out_mux14TS;


///////////////////////////////////////////////////////////////////////////////////////////
              ////////////  PHY_RX BEHAVIORAL
              ////////////
///////////////////////////////////////////////////////////////////////////////////////////


phy_rx phy_x_b(/*AUTOINST*/
    // Outputs
    .out0 (out0_BTB),
    .out1 (out1_BTB),
    .out2 (out2_BTB),
    .out3 (out3_BTB),
    .out_rx_tx (out_rx_tx_BTB),
    .valid_out_mux14 (valid_out_mux14TB),
    // Inputs
    .clk1f (clk1f),
    .clk2f (clk2f),
    .clk4f (clk4f),
    .clk32f (clk32f),
    .reset (reset),
    .in (inTB)
);



///////////////////////////////////////////////////////////////////////////////////////////
              ////////////  PHY_RX SYN
              ////////////
///////////////////////////////////////////////////////////////////////////////////////////


phy_rx_syn phy_x_s(/*AUTOINST*/
    // Outputs
    .out0 (out0_STB),
    .out1 (out1_STB),
    .out2 (out2_STB),
    .out3 (out3_STB),
    .out_rx_tx (out_rx_tx_STB),
    .valid_out_mux14 (valid_out_mux14TB),
    // Inputs
    .clk1f (clk1f),
    .clk2f (clk2f),
    .clk4f (clk4f),
    .clk32f (clk32f),
    .reset (reset),
    .in (inTB)
);



///////////////////////////////////////////////////////////////////////////////////////////
              ////////////  PHY_RX TESTER
              ////////////
///////////////////////////////////////////////////////////////////////////////////////////

t_phy_rx t_phy_rx_tb(/*AUTOINST*/
    // Outputs
    .out0 (out0_BTB),
    .out1 (out1_BTB),
    .out2 (out2_BTB),
    .out3 (out3_BTB),
    .out_rx_tx (out_rx_tx_BTB),
    .out0_s (out0_STB),
    .out1_s (out1_STB),
    .out2_s (out2_STB),
    .out3_s (out3_STB),
    .out_rx_tx_s (out_rx_tx_STB),
    .valid_out_mux14B(valid_out_mux14TB),
    .valid_out_mux14S(valid_out_mux14TS),
    // Inputs
    .clk1f (clk1f),
    .clk2f (clk2f),
    .clk4f (clk4f),
    .clk32f (clk32f),
    .reset (reset),
    .in (inTB)
);

endmodule
// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
