// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

// Recirculation block if not IDLE
module recir_idle (
  // Clks
  input wire clk1f,
	input wire clk2f,						// clock in @2f
  input wire clk4f,						// clock in @4f
  input reset,
  // Serial Parallel input
  input wire valido,
  // Inputs
  input wire [7:0] in0,
  input wire [7:0] in1,
  input wire [7:0] in2,
  input wire [7:0] in3,
  input wire [3:0] valid_in,
  // For ff 8buts + 1 valid for mux
  output reg [7:0] out0m,
  output reg [7:0] out1m,
  output reg [7:0] out2m,
  output reg [7:0] out3m,
  output reg [3:0] valid_outm,
  // For ff 8buts + 1 valid for tester
  output reg [7:0] out0t,
  output reg [7:0] out1t,
  output reg [7:0] out2t,
  output reg [7:0] out3t,
  output reg [3:0] valid_outt
  );

 // Assign standar singnals
 // Input idle

 // Conecctions
 reg [7:0] outm0, outm1, outm2, outm3;
 reg [7:0] outt0, outt1, outt2, outt3;
 reg idle_stand;
 reg [3:0] validoutm, validoutt;

 initial idle_stand <= 1;

 always @(posedge clk4f) begin
      if (valido) begin
        outm0 <= in0;
        outm1 <= in1;
        outm2 <= in2;
        outm3 <= in3;
        outt0 <= 0;
        outt1 <= 0;
        outt2 <= 0;
        outt3 <= 0;
        validoutm <= valid_in;
      end // end if

    else begin // valido  == 0
      outm0 <= 0;
      outm1 <= 0;
      outm2 <= 0;
      outm3 <= 0;
      outt0 <= in0;
      outt1 <= in1;
      outt2 <= in2;
      outt3 <= in3;
      validoutt <= valid_in;
      end // end else
 end // always posedge 4f


always @(posedge clk1f) begin
  valid_outt <= validoutt;
  valid_outm <= validoutm;
  out0m <= outm0;
  out1m <= outm1;
  out2m <= outm2;
  out3m <= outm3;
  out0t <= outt0;
  out1t <= outt1;
  out2t <= outt2;
  out3t <= outt3;
end // end always *

endmodule
