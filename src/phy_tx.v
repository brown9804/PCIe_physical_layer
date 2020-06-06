
// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef PHY_TX
`define PHY_TX


`include "./src/mux4x1_behav.v"
`include "./src/paralelltoserial.v"
`include "./src/serie_paralelo_idle.v"
`include "./src/recir_idle.v"

// Layer of the physical transmitter
module phy_tx_b (
    // Clks on different frequency
    input wire clk1f,
    input wire clk2f,
    input wire clk4f,
    input wire clk32f,
    input wire reset,
    // Four inputs
    input wire [7:0] in0,
    input wire [7:0] in1,
    input wire [7:0] in2,
    input wire [7:0] in3,
    input wire in_rx_tx,            // active/valid from Rx
    // Valid for inputs
    input wire [3:0] validmux41,

    // outputs for recirc module
        output reg [7:0] out0_recir,
        output reg [7:0] out1_recir,
        output reg [7:0] out2_recir,
        output reg [7:0] out3_recir,

    // One output of paralle-serial
    output reg out_b
);

    wire [3:0] valid_in;
    wire [7:0] mux41_to_parserno;   // Wire for connect between mux41 and the parallel-serial
    wire out_conec;
    wire active_inter;
    // valid of seral parallel
    wire validparserno;

    // wire inside block for outputs
    wire [7:0] o0, o1, o2, o3;
    wire [7:0] ot0,ot1, ot2, ot3;

    recir_idle reciridle(/*AUTOINST*/
      // Outputs
      // For ff 8buts + 1 valid for mux
      .out0m (o0[7:0]),
      .out1m (o1[7:0]),
      .out2m (o2[7:0]),
      .out3m (o3[7:0]),
      .valid_outm (validmux41[3:0]),
      // For ff 8buts + 1 valid for tester
      .out0t (ot0[7:0]),
      .out1t (ot1[7:0]),
      .out2t (ot2[7:0]),
      .out3t (ot3[7:0]),
      .valid_outt (validmux41[3:0]),
      // Inputs
      .clk1f (clk1f),
      .clk2f (clk2f),
      .clk4f (clk4f),
      .reset (reset),
      // Serial Parallel input
      .valido (active_inter),
      // Inputs
      .in0 (in0[7:0]),
      .in1 (in1[7:0]),
      .in2 (in2[7:0]),
      .in3 (in3[7:0]),
      .valid_in (validmux41[3:0])
      );

      // Serial parallel idle
      serieparaleloIDL spidle(
          // OUTPUTS
          .valido  (active_inter),
          // Inputs
          .in        (in_rx_tx),
          .clk32f (clk32f),
          .clk4f (clk4f),
          .reset (reset)
      );

      // Connecting Mux 4:1 of 8 bits plus valid
      mux4x1_behav mux41_phy_tx(/*AUTOINST*/
          .out     (mux41_to_parserno[7:0]),
          .validout(validparserno),
          .valid    (validmux41[3:0]),
          .clk1f (clk1f),
          .clk2f (clk2f),
          .clk4f (clk4f),
          .reset          (reset),
          .in0      (o0[7:0]),
          .in1      (o1[7:0]),
          .in2      (o2[7:0]),
          .in3      (o3[7:0])

      );

          // Connecting Parallel- Serial of 8 bits plus valid
          paralelo_a_serial parserno_tx(/*AUTOINST*/
              .out     (out_conec),
              .in     (mux41_to_parserno[7:0]),
              .in_valid     (validparserno),                //**************
              .reset        (reset),
              .clk32f      (clk32f)
          );



    always @(*) begin
        out_b = out_conec;
        out0_recir = ot0;
        out1_recir = ot1;
        out2_recir = ot2;
        out3_recir = ot3;
    end

endmodule


// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
