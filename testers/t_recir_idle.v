// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef T_RECIR_IDLE
`define T_RECIR_IDLE

//                            TESTER

//                         RECIRCULATION IDLE

// Verifying that the generic structural description works using the automatic
// verifier already built. What is done using the checker and the tester

// Recirculation block if not IDLE
module t_recir_idle (
  // Clks
  output reg clk1f,
	output reg clk2f,						// clock in @2f
  output reg clk4f,						// clock in @4f
  output reg reset,
  // Serial Parallel input
  output reg valido,

  output reg [7:0] in0,
  output reg [7:0] in1,
  output reg [7:0] in2,
  output reg [7:0] in3,
  output reg [3:0] valid_in,
  // For ff 8buts + 1 valid for mux
  input wire [7:0] out0m,
  input wire [7:0] out1m,
  input wire [7:0] out2m,
  input wire [7:0] out3m,
  input wire [3:0] valid_outm,
  // For ff 8buts + 1 valid for tester
  input wire [7:0] out0t,
  input wire [7:0] out1t,
  input wire [7:0] out2t,
  input wire [7:0] out3t,
  input wire [3:0] valid_outt,
  // For structural
  // For ff 8buts + 1 valid for mux
  input wire [7:0] out0m_s,
  input wire [7:0] out1m_s,
  input wire [7:0] out2m_s,
  input wire [7:0] out3m_s,
  input wire [3:0] valid_outm_s,
  // For ff 8buts + 1 valid for tester
  input wire [7:0] out0t_s,
  input wire [7:0] out1t_s,
  input wire [7:0] out2t_s,
  input wire [7:0] out3t_s,
  input wire [3:0] valid_outt_s
  );

reg clk;
reg clk8f;
reg clk16f;
reg clk32f;

  initial
  begin



// Defining the dumpfile NAME_OF_FILE_CHOICE_PERSONAL.vcd), or known by change dump variable, this file contains
// information about the simulator used, time scale, creation date, variable definitions, and value changes.

    $dumpfile("recir_idle.vcd");
    $dumpvars;
// Another signals
// This passes the first clock cycle ... Defining initial values ​​....
// Inputs
  in0 = 8'b0;
  in1 = 8'b0;
  in2 = 8'b0;
  in3 = 8'b0;
  valido = 0;
  valid_in = 0;
  // Another signals
  #4 reset = 0;

  repeat (32) begin        // reset = 0  7C -> x6
	@(posedge clk4f);
	reset <= 0;
	end

	repeat (4) begin																							// Repeat the test
	@(posedge clk1f);																								// sync with clock
	#10 reset <= 1;
	end

          ///testing valido/active behave
	repeat (4) begin															
  @(posedge clk1f);
  valido <= ~valido;
  valid_in <= 4'b1111;
  {in0} <= 8'hFF;
	{in1} <= 8'hEE;
	{in2} <= 8'hDD;
	{in3} <= 8'hCC;
  @(posedge clk4f);
  end



      //Testing valid in Beha
  repeat (4) begin																							
  @(posedge clk1f);
  valido <= ~valido;
  valid_in <= 0;
	{in0} <= 8'hBB;
	{in1} <= 8'hAA;
	{in2} <= 8'h99;
	{in3} <= 8'h88;

  end

  // The stimulus must be changed, where it allows testing to give an idea of ​​the behavior of the signals.
  // Therefore, the inputs will be initialized with a value chosen between one and zero. Since they are not defined
  // initial conditions in the algorithm request. They are personally chosen.

  // VERILOG ASSIGNMENTS FOR NUMBERS - FORMAT
  // 'b binary base
  // 'd Decimal base
  // 'h Hexadecimal base
  // 'or octal base
  // and what comes after the letter is the value then in the case of binary
  // the following examples are considered for understanding
  // 2'b0 = 2'b00 = 00
  // 2'b1 = 2'b01 = 01
  // 2'b10 = 10
  // 2'b11 = 11
  // If it does not indicate the size, 32 bits are assigned by default, that is, 'b0 = 00000000000000000000000000000000
  
  
  //other test

	@(posedge clk1f);
  valido <= 1;
	{in0} <= 8'hFF;
	{in1} <= 8'hEE;
	{in2} <= 8'hDD;
	{in3} <= 8'hCC;
  valid_in <= 4'b1111;


	@(posedge clk1f);
   valido <= 1;
	{in0} <= 8'hBB;
	{in1} <= 8'hAA;
	{in2} <= 8'h99;
	{in3} <= 8'h88;
  valid_in <= 4'b0;

	@(posedge clk1f);
	{in2} <= 8'h77;
	#10 reset <= 0;


  #40 $finish;
  end // end initial block (big one)



initial #4 reset <= 0;

// clks

  initial clk32f <= 0;
  initial clk16f <= 0;
  initial clk8f <= 0;
  initial clk4f <= 0;
  initial clk2f <= 0;
  initial clk1f <= 0;
  initial clk <= 0;
  // clock logic
  always	#5 clk				<= ~clk;		// toggle every 10ns

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
