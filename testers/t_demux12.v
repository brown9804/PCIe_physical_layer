// Brown Ramírez, Belinda 
// Mayo, 2020
// timna.brown@ucr.ac.cr

// 						&


/////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R EIE
// Engineer: Esquivel Molina,  Brandon 
//
//////////////////////////////////////////////////////////////////////////////////


module tester(

// OUTPUTS
output reg [7:0] in,
output reg valid,

output reg reset,
output reg clk1f,
output reg clk2f,
output reg clk4f,
// INPUTS
input [7:0] out0c,
input [7:0] out1c,
input [7:0] out0s,
input [7:0] out1s,
input [1:0] validoutc,
input [1:0] validouts

);

	//Internal
reg [3:0] counts; 		// counters
reg [3:0] countc;
reg clk, clk16f,clk8f,clk32f;


initial begin

		$dumpfile("demux12.vcd");
		$dumpvars;												// "dumpping" variables


		in			= 8'b0;
		valid		= 4'b0;
		#4 reset = 0;

		@(posedge clk1f);
		reset <= 0;

		repeat (2) begin
		valid <= 4'b0;
		end

		repeat (6) begin																							// Repeat the test 3 times
		@(posedge clk1f);																								// sync with clock
		#4 reset <= 1;
		end

		repeat(6) begin
		@(posedge clk4f);
		{in} <= 8'hFF;
		valid <= 4'b1;
		end

		repeat(6) begin
		@(posedge clk4f);
		{in} <= 8'hDD;
		valid <= 4'b1;
		end

		repeat(6) begin
		@(posedge clk4f);
		{in} <= 8'hEE;
		valid <= 4'b1;
		end

		repeat(6) begin
		@(posedge clk4f);
		{in} <= 8'hCC;
		valid <= 4'b1;
		end

		repeat(6) begin
		@(posedge clk4f);
		{in} <= 8'hBB;
		valid <= 4'b1;
		end

		repeat(6) begin
		@(posedge clk4f);
		{in} <= 8'h99;
		valid <= 4'b1;
		end

		repeat(6) begin
		@(posedge clk4f);
		{in} <= 8'hAA;
		valid <= 4'b1;
		end

		repeat(6) begin
		@(posedge clk4f);
		{in} <= 8'h88;
		valid <= 4'b1;
		end

		repeat(6) begin
		@(posedge clk4f);
		{in} <= 8'h77;
		valid <= 4'b1;
		end

		repeat (4) begin
		@(posedge clk1f);				// testing static ins
		valid <= 4'b1;
		end


       	$finish;													// save variables finish
		end																// initial begin


	// clock logic
	initial	clk	 			<= 0;			// Initial value to avoid indeterminations
	always	#5 clk			<= ~clk;		// toggle every 10ns


reg test;

	always@(posedge clk) begin
    if(out0c != out0s | out1c != out1s)
    begin
       //$display ("ERROR behavioral file and structural file are not the same");
       test <= 0;
     end // end display

     else begin
        test <= 1;
      end //else
end // always checker



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
