// Brandon Esquivel Molina

//            FLIP FlOP 4 inputs and 4 outputs
// Its for 1 bit
`ifndef FF4IN40VALID
`define FF4IN40VALID

  module ff4in4ovalid(
      input wire clk,
      input wire reset,
      // Inputs, are 4
      input wire  in0,
      input wire  in1,
      input wire  in2,
      input wire  in3,
      // Outputs, are 4
      output reg  out0,
      output reg  out1,
      output reg  out2,
      output reg  out3
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


// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
