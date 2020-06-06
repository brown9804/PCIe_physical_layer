// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef T_PHY_RX
`define T_PHY_RX


module t_phy_rx(
    // Outputs
    output reg clk1f,
    output reg clk2f,
    output reg clk4f,
    output reg clk32f,
    output reg reset,
    output  reg in,
    // Outputs behavioral
    input wire  [7:0] out0,
    input wire  [7:0] out1,
    input wire  [7:0] out2,
    input wire  [7:0] out3,
    input wire  out_rx_tx,
    // Outputs structural
    input wire  [7:0] out0_s,
    input wire  [7:0] out1_s,
    input wire  [7:0] out2_s,
    input wire  [7:0] out3_s,
    input wire  out_rx_tx_s,
    // Valid out mux14
    input wire  [3:0] valid_out_mux14B,
    input wire  [3:0] valid_out_mux14S
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

    $dumpfile("phy_rx.vcd");
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
  in = 0;
  #4 reset = 0;


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
		end		

		repeat (6) begin																							// Repeat the test 3 times
		@(posedge clk32f);																								// sync with clock																			 	
		reset = 1;
		end

        @(posedge clk32f);

        // pruebas 

        repeat(3) begin         // 01010101  -> NO HAY ACTIVE YA QUE BC < 4
        @(posedge clk32f);
        in  <=  ~in;
        end


        repeat(5) begin         // BC = 10 1111 00        
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  0;
        end
        
        // EN ESTE PUNTO SE TIENEN 5 BC > ACTIVE = 1 Y SE RECIBE UNA PALABRA valida
        
             // Nueva palabra a enviar  -> FF -> 11111111
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;

        // nueva palabra DD 11011101
        
         @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;



         // Nueva palabra a enviar  -> EE -> 11101110
      @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        
        // nueva palabra CC ->  11001100
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  0;

        // NUEVA PALABRA BB -> 10111011 

        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;

        // NUEVA PALABRA 99 -> 10011001
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;

        // NUEVA PALABRA 10101010 -> AA 
            
@(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;

        // Nueva palabra a enviar  -88 -> 10001000
      @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  0;

         repeat(8) begin         
        @(posedge clk32f);
         end
       

        










        repeat(100) begin         // BC = 10 1111 00        
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  0;
        end





  #40 $finish;
  end // end initial block (big one)


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
