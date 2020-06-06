// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef PHY_RX
`define PHY_RX

// Include files requiered
// Demux 1:4
// Serial-Paralell COM
// Paralell-Serial Active COM
`include "./src/demux1x4_behav.v"
`include "./src/serieparalelo.v"
`include "./src/paralelltoserial_IDLE.v"


module phy_rx(
    input wire clk1f,
    input wire clk2f,
    input wire clk4f,
    input wire clk32f,
    input reset,
    // Inputs
    input wire in,
    // Outputs
    output reg [7:0] out0,
    output reg [7:0] out1,
    output reg [7:0] out2,
    output reg [7:0] out3,
    output reg out_rx_tx,
    output reg [3:0] valid_out_mux14
);

    // Wire connect serial- parallel to demux 1:4
    wire [7:0] in_demux;
    // Active
    wire active_inter;
    // Valid from serie parallel to demux 1:4
    wire validin;
    // Wire from par-serno to out of block
    wire tx_rx;
    // Wire to connect the outputs
    wire [7:0] conec0, conec1, conec2, conec3;
    wire [3:0] validout_conec;


    serieparalelo c1(
        // OUTPUTS
        .out (in_demux),
        .reset (reset),
        // Output valid
        .valid (validin),
        .active (active_inter),
        // INPUTS
        .in (in),
        .clk4f (clk4f),
        .clk32f (clk32f)

    );

    demux1x4_behav c2(
      //OUTPUTS
      .out0 (conec0),
      .out1 (conec1),
      .out2 (conec2),
      .out3 (conec3),
      .validout (validout_conec),
      .clk1f (clk1f),
      .clk2f (clk2f),
      .clk4f (clk4f),
      .reset (reset),
      //INPUTS
      .in (in_demux),
      .valid (validin)
    );

    paralelo_a_serial_IDLE c3(
        // OUTPUTS
        .out (tx_rx),
        // INPUTS
        .active (active_inter),
        .reset (reset),
        .clk32f (clk32f)
    );

    always @(*) begin
        out0 = conec0;
        out1 = conec1;
        out2 = conec2;
        out3 = conec3;
        out_rx_tx = tx_rx;
        valid_out_mux14 = validout_conec;
    end

endmodule


// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
