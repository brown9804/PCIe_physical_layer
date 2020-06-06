// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef T_PHY_TX
`define T_PHY_TX

//                            TESTER

//                         Layer Physcal Transmitter

// Verifying that the generic structural description works using the automatic
// verifier already built. What is done using the checker and the tester



module t_phy_tx(
  // Outputs
  output reg clk1f,
  output reg clk2f,
  output reg clk4f,
  output reg clk32f,
  output reg  reset,
  output reg  [7:0] in0,
  output reg  [7:0] in1,
  output reg  [7:0] in2,
  output reg  [7:0] in3,
  output reg in_rx_tx,
  output reg [3:0] validmux41,
  
  // Inputs
  input wire out_b,
  input wire out_s,

  input wire [7:0] out0_recirc,
  input wire [7:0] out1_recirc,
  input wire [7:0] out2_recirc,
  input wire [7:0] out3_recirc,

  input wire [7:0] out0_recirs,
  input wire [7:0] out1_recirs,
  input wire [7:0] out2_recirs,
  input wire [7:0] out3_recirs


  );

  reg clk;
  reg clk8f;
  reg clk16f;


  initial
  begin



  // Defining the dumpfile NAME_OF_FILE_CHOICE_PERSONAL.vcd), or known by change dump variable, this file contains
  // information about the simulator used, time scale, creation date, variable definitions, and value changes.

      $dumpfile("phy_tx.vcd");
      $dumpvars;
// Another signals
    #4 reset = 0;
        
    repeat (6) begin        // reset = 0  7C -> x6
		@(posedge clk4f);	
		reset <= 0;
		end		

		repeat (6) begin																							// Repeat the test 3 times
		@(posedge clk4f);																								// sync with clock																			 	
		#4 reset <= 1;
		end

	  repeat (10) begin																							// Repeat the test 3 times
		@(posedge clk4f);																								// sync with clock																			 	
		#4 reset <= 1;
		end	repeat (6) begin																							// Repeat the test 3 times
		@(posedge clk4f);																								// sync with clock																			 	
		#4 reset <= 1;
		end	repeat (6) begin																							// Repeat the test 3 times
		@(posedge clk4f);																								// sync with clock																			 	
		#4 reset <= 1;
		end	repeat (6) begin																							// Repeat the test 3 times
		@(posedge clk4f);																								// sync with clock																			 	
		#4 reset <= 1;
		end	repeat (6) begin																							// Repeat the test 3 times
		@(posedge clk4f);																								// sync with clock																			 	
		#4 reset <= 1;
		end



    #40 $finish;
    end // end initial block (big one)

  //CHECKER
  reg test;
  always@(posedge clk) begin
      if(out_b != out_s)
      begin
       $display ("ERROR behavioral file and structural file are not the same");
       test <= 1;
  end // end display
  else begin
      test <= 0;
  end //else
  end // always checker

  initial #4 reset <= 0;

  // clock logic
  initial	clk	 			<= 0;			// Initial value to avoid indeterminations
  always	#5 clk				<= ~clk;		// toggle every 10ns

  // clks

  initial clk32f <= 0;
    initial clk16f <= 0;
    initial clk8f <= 0;
    initial clk4f <= 0;
    initial clk2f <= 0;
    initial clk1f <= 0;


    // Faster frequency
    always @(posedge clk) begin
    clk32f <= ~clk32f; // if was LOW change to HIGH
        end
    //////////////////////////////
    // For 16 Hz
    always @(posedge clk32f) begin
        clk16f <= ~clk16f; // if was LOW change to HIGH
        end
    //////////////////////////////
    // For 8 Hz
    always @(posedge clk16f) begin
            clk8f <= ~clk8f; // if was LOW change to HIGH
    end
    //////////////////////////////
    // For 4 Hz
    always @(posedge clk8f) begin
        clk4f <= ~clk4f; // if was LOW change to HIGH
        end
    //////////////////////////////
    // At 2 Hz
    always @(posedge clk4f) begin
        clk2f <= ~clk2f; // if was LOW change to HIGH
        end

    //////////////////////////////
    // At 1 HZ
    always @(posedge clk2f) begin
    clk1f <= ~clk1f; // if was LOW change to HIGH
  end

  endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
