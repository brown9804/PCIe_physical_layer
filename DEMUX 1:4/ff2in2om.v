// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

//            FLIP FlOP 2 inputs and 2 outputs
// Its for 8 bits plus valid

  module ff2in2om(
      input clk,
      input reset,
      // Inputs, are 2
      input wire  in0,
      input wire  in1,
      // Outputs, are 2
      output reg  out0,
      output reg out1
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

// Local Variables:
// verilog-library-directories:("."):
// End:
