
module t_data(
  // Outputs
  

  output reg  [7:0] in0,
  output reg  [7:0] in1,
  output reg  [7:0] in2,
  output reg  [7:0] in3,
  output reg [3:0] validmux41

  
  // Inputs


  );

  reg clk;
  reg clk1f;
  reg clk2f;
  reg clk4f;
  reg clk8f;
  reg clk16f;
  reg clk32f;
  reg reset;
  
  initial
  begin
       
       	repeat (6) begin
		@(posedge clk);	
		reset <= 0;
		end		

		repeat (6) begin																							// Repeat the test 3 times
		@(posedge clk);																								// sync with clock																			 	
		#4 reset <= 1;
        end

        repeat(3) begin
		@(posedge clk1f);		
		{in0} <= 'hFF;
		{in1} <= 'hEE;															
		{in2} <= 'hDD;
		{in3} <= 'hCC;


		@(posedge clk1f);		
		{in0} <= 'hBB;
		{in1} <= 'hAA;															
		{in2} <= 'h99;
		{in3} <= 'h88;


		@(posedge clk1f);		
		{in0} <= 'hFF;
		{in1} <= 'hEE;															
		{in2} <= 'hDD;
		{in3} <= 'hCC;


		@(posedge clk1f);		
		{in0} <= 'hBB;
		{in1} <= 'hAA;															
		{in2} <= 'h99;
		{in3} <= 'h88;



		@(posedge clk1f);		
		{in0} <= 'hFF;
		{in1} <= 'hEE;															
		{in2} <= 'hDD;
		{in3} <= 'hCC;


		@(posedge clk1f);		
		{in0} <= 'hBB;
		{in1} <= 'hAA;															
		{in2} <= 'h99;
		{in3} <= 'h88;


		@(posedge clk1f);		
		{in0} <= 'hFF;
		{in1} <= 'hEE;															
		{in2} <= 'hDD;
		{in3} <= 'hCC;


		@(posedge clk1f);		
		{in0} <= 'hBB;
		{in1} <= 'hAA;															
		{in2} <= 'h99;
		{in3} <= 'h88;
        end
        
		repeat (8) begin
		@(posedge clk1f);				// testing static ins		
		validmux41 = 4'b1111;
		end

    #40 $finish;
    end // end initial block (big one)





  // clock logic
  initial	clk	 	    		<= 0;	
  initial	clk32f	 			<= 0;			// Initial value to avoid indeterminations
  initial	clk16f	 			<= 0;	
  initial	clk8f	 			<= 0;	
  initial	clk4f	 			<= 0;
  initial	clk2f	 			<= 0;
  initial	clk1f	 			<= 0;

  always	#5 clk			<= ~clk;		// toggle every 10ns

  // clks


	// Initial Values
	initial	in0			<= 8'b0;
	initial in1			<= 8'b0;
	initial in2			<= 8'b0;
	initial in3			<= 8'b0;
	initial validmux41		<= 4'b1111;	
	initial #2 reset 		<= 0;


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
