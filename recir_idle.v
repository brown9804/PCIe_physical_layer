// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

// Recirculation block if not IDLE
module recir_idle (
  input  clk,
  input reset,
  // Serial Parallel input
  input wire active,
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
 idle_stand = 1;
 // Conecctions
 wire [7:0] out_c0, out_c1, out_c2, out_c3;

 reg [3:0] validoutm, validoutt;

 always @(posedge clk4f) begin
      out_c0 <= in0;
      out_c1 <= in1;
      out_c2 <= in2;
      out_c3 <= in3;
      if (active) begin
        out0m <= out_c0;
        out1m <= out_c1;
        out2m <= out_c2;
        out3m <= out_c3;
        out0t <= 0;
        out1t <= 0;
        out2t <= 0;
        out3t <= 0;
        validoutm <= valid_in;
      end // end if
    else begin // active  == 0
        out0t <= out_c0;
        out1t <= out_c1;
        out2t <= out_c2;
        out3t <= out_c3;
        out0m <= 0;
        out1m <= 0;
        out2m <= 0;
        out3m <= 0;
        validoutt <= valid_in;
      end // end else

 end // always posedge 4f


always(*) begin
  valid_outt = validoutt;
  valid_outm = validoutm;
end // end always *

endmodule
