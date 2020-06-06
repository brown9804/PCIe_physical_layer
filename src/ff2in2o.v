// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

//            FLIP FlOP 2 inputs and 2 outputs
// Its for 8 bits plus valid

  module ff2in2o(
      input wire clk,
      input wire reset,
      // Inputs, are 2
      input wire [7:0] in0,
      input wire [7:0] in1,
      // Outputs, are 2
      output reg [7:0] out0,
      output reg [7:0] out1
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
    end // end if
    else begin // reset  == 1
      out0 <= in0;
      out1 <= in1;
    end // end else
  end // end always posedge clk

endmodule
