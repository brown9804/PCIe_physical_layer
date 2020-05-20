// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

//            FLIP FlOP 4 inputs and 4 outputs
// Its for 8 bits plus valid

  module ff4in4o(
      input clk,
      input reset,
      // Inputs, are 4
      input wire [8:0] in0,
      input wire [8:0] in1,
      input wire [8:0] in2,
      input wire [8:0] in3,
      // Outputs, are 4
      output reg [8:0] out0,
      output reg [8:0] out1,
      output reg [8:0] out2,
      output reg [8:0] out3
  );
  // Each positive edge of the clock make these changes
  always @(posedge clk)
  //If this happens on a positive edge of the clock, make the following changes for the next clock edge
  begin
    // Reset synchronous
    if (reset == 0) // If reset in LOW nonblobking assing zero
    begin
      out0 <= 0;
      out1 <= 0;
      out2 <= 0;
      out3 <= 0;
    end // end if
    else begin // reset  == 1
      out0 <= in0;
      out1 <= in1;
      out2 <= in2;
      out3 <= in3;
    end // end else
  end // end always posedge clk

endmodule
