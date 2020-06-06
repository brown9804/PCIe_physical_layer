// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef T_PHY
`define T_PHY

module t_phy(
// outputs for recirc module
  input wire [7:0] out0_recir,
  input wire [7:0] out1_recir,
  input wire [7:0] out2_recir,
  input wire [7:0] out3_recir,
  input wire [7:0] valid_out_recir,
// outputs for recirc module
  input wire [7:0] out0_recir_s,
  input wire [7:0] out1_recir_s,
  input wire [7:0] out2_recir_s,
  input wire [7:0] out3_recir_s,
  input wire [7:0] valid_out_recir_s,
  input wire [7:0] out0,
  input wire [7:0] out1,
  input wire [7:0] out2,
  input wire [7:0] out3,
  input wire [7:0] out0_s,
  input wire [7:0] out1_s,
  input wire [7:0] out2_s,
  input wire [7:0] out3_s,
  input wire [3:0] validout,

  output reg clk1f,
  output reg  clk2f,
  output reg  clk4f,
  output reg  clk32f,
  output reg  reset,
  output reg  [7:0] in0,
  output reg  [7:0] in1,
  output reg  [7:0] in2,
  output reg  [7:0] in3,
  output reg  [3:0] validin
  );


  reg clk;
  reg clk8f;
  reg clk16f;
  // Initial block works to provide you with initial stimule - if we think about it physically,
  // can be interpreted as stimuli from the environment that the device we are creating will receive -
  // An analogy with mathematical equations would be comparing the initial block
  // with initial conditions to find a result.

  initial
  begin


  // Defining the dumpfile NAME_OF_FILE_CHOICE_PERSONAL.vcd), or known by change dump variable, this file contains
  // information about the simulator used, time scale, creation date, variable definitions, and value changes.

      $dumpfile("phy.vcd");
  // It is used to specify which variables are to be put in the dump file. The bibliography mentions that the way
  // simple to do it is only with $ dumpvars since this way they all assign them to the test bench
      $dumpvars;

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
  // This passes the first clock cycle ... Defining initial values ​​....
    // Inputs
    in0 = 8'b0;
    in1 = 8'b0;
    in2 = 8'b0;
    in3 = 8'b0;
    #4 reset = 0;
    validin = 4'b0;


  // This passes the first clock cycle ... Defining initial values ​​....

    // Binary, Hexadecimal
    // 0x88 = 10001000
    // 0x99 = 10011001
    // 0xAA = 10101010
    // 0xBB = 10111011
    // 0xCC = 11001100
    // 0xDD = 11011101
    // 0XEE = 11101110
    // 0XFF = 11111111

    repeat (6) begin
   		@(posedge clk32f);
   		reset = 0;
      validin <= 4'b0;
   		end

      // Begin Tests


      repeat(5) begin         // BC = 10 1111 00
      @(posedge clk1f);
      in0  <=  8'hBC;
      in1  <=  8'hBC;
      in2  <=  8'hBC;
      in3  <=  8'hBC;
      @(posedge clk1f);
      in0  <=  8'hBC;
      in1  <=  8'hBC;
      in2  <=  8'hBC;
      in3  <=  8'hBC;
      end


      repeat (6) begin																							// Repeat the test 3 times
  		@(posedge clk1f);																								// sync with clock
  		#4 reset = 1;
      validin <= 4'b1111;
  		end


  		//repeat (15) begin
  		@(posedge clk1f);
  		in0 <= 8'hFF;
  		in1 <= 8'hEE;
  		in2 <= 8'hDD;
  		in3 <= 8'hCC;
  		// end


  		@(posedge clk1f);
  		in0 <= 8'hBB;
  		in1 <= 8'hAA;
  		in2 <= 8'h99;
  		in3 <= 8'h88;

  		@(posedge clk1f);
  		in2 <= 8'h77;
  		validin <= 4'b1;


  		repeat (5) begin
  		@(posedge clk1f);				// testing static ins
      validin <= 4'b1;
  		end

      #40 $finish;
      end // end initial block (big one)


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

    // For the clock
    // Initial value to the clock, otherwise it will always be undetermined
    initial	clk 	<= 0;
    // "toggle" every 2* 10ns
    always	#5 clk 	<= ~clk;

  endmodule


  // Local Variables:
  // verilog-library-directories:("."):
  // End:
  `endif
