// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef PHY
`define PHY

`include "./src/phy_tx.v"
`include "./src/phy_rx.v"

module phy(
  input wire clk1f,
  input wire clk2f,
  input wire clk4f,
  input wire clk32f,
  input wire reset,
  input wire [7:0] in0,
  input wire [7:0] in1,
  input wire [7:0] in2,
  input wire [7:0] in3,
  input wire [3:0] validin,
  output reg [7:0] out0,
  output reg [7:0] out1,
  output reg [7:0] out2,
  output reg [7:0] out3,
  output reg [3:0] validout,
// outputs for recirc module
  output reg [7:0] out0_recir,
  output reg [7:0] out1_recir,
  output reg [7:0] out2_recir,
  output reg [7:0] out3_recir,
  output reg [7:0] valid_out_recir
  );


// Connect the rx to tx
wire rxtx;
// Connect the tx to rx
wire txrx;
// Valid out
wire [3:0] v_out_conec;
// For outputs
wire [7:0] o0, o1, o2, o3;
wire [7:0] rc0, rc1, rc2, rc3;
wire [7:0] valid_orecir;
// Transmiiter Layer
// Layer of the physical transmitter
phy_tx_b phy_tx_f(/*AUTOINST*/
    // Outputs
    .out_b (txrx),
    // outputs for recirc module
    .out0_recir (rc0),
    .out1_recir (rc1),
    .out2_recir (rc2),
    .out3_recir (rc3),
    .valid_out_recir (valid_orecir),
    // Inputs
    .clk1f (clk1f),
    .clk2f (clk2f),
    .clk4f (clk4f),
    .clk32f (clk32f),
    .reset (reset),
    .in0 (in0),
    .in1 (in1),
    .in2 (in2),
    .in3 (in3),
    .in_rx_tx (rxtx),
    .validmux41 (validin)
    );

// Decode layer
phy_rx phy_rx_f(/*AUTOINST*/
    // Outputs
    .out0 (o0),
    .out1 (o1),
    .out2 (o2),
    .out3 (o3),
    .out_rx_tx (rxtx),
    .valid_out_mux14 (v_out_conec),
    // Inputs
    .clk1f (clk1f),
    .clk2f (clk2f),
    .clk4f (clk4f),
    .clk32f (clk32f),
    .reset (reset),
    .in (txrx)
);

always@(*) begin
 validout = v_out_conec;
 out0 = o0;
 out1 = o1;
 out2 = o2;
 out3 = o3;
 out0_recir = rc0;
 out1_recir = rc1;
 out2_recir = rc2;
 out3_recir = rc3;
 valid_out_recir = valid_orecir;
end


endmodule


// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
