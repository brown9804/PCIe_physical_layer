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
  input wire [3:0] validout_s,

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


    // reset
      repeat (32) begin        
  		@(posedge clk4f);
  		reset <= 0;
  		end

      /*@(posedge clk1f);
      {in0} = 'hFF;
      {in1} = 'hEE;
      {in2} = 'hDD;
      {in3} = 'hCC;*/


      @(posedge clk32f);																						
  		#226 reset <= 1;
	
      

    repeat (4) begin      // setup delay
  		@(posedge clk4f);
      validin <= validin;
    end

    repeat (32) begin
       @(posedge clk4f);
      end

    repeat (32) begin
       @(posedge clk4f);
      end
      repeat (32) begin
      @(posedge clk1f);
      validin <= 4'b1111;
      //@(posedge clk1f);
  		{in0} <= 'hBB;
  		{in1} <= 'hAA;
  		{in2} <= 'h99;
  		{in3} <= 'h88;
      end

    repeat (32) begin
       @(posedge clk4f);
      end

      repeat (8) begin
       @(posedge clk4f);
        reset <= 0;
      @(posedge clk1f);
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


      initial in0 <= 'h00;
      initial in1 <= 'h00;
      initial in2 <= 'h00;
      initial in3 <= 'h00;
      initial validin <= 4'b0000;

      // For the clock
      // Initial value to the clock, otherwise it will always be undetermined
      initial	clk 	<= 0;

    // "toggle" every 5* 1ns
    always	#10 clk 	<= ~clk;

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
