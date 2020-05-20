`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R E.I.E
// Engineer: Brandon Esquivel Molina
// 
// Create Date: 19.05.2020
// Design Name: mux2x1_8bits+VALID with automatic selector
// Module Name: Tester for mux2x1 8BITS + VALID
// Project Name: PHY Layer PCIe
// Target Devices: PCIe
// Tool Versions: Yosys 0.9 Iverolg release at 2020
// Description: tester for module Mux2x1 8bits+ valid a submodule in mux4x2 8bits + valid first level L1
// Dependencies: mux2x1_behav
// 
// Revision: 0.0
// Revision 0.01 - File Created
// Additional Comments: A conversion of MUX2X1 4bits
// 
//////////////////////////////////////////////////////////////////////////////////


module tester(
	//OUTPUTS
output reg selector,
output reg [8:0] in0,
output reg [8:0] in1,
output reg clk,
output reg reset,
	//INPUTS
input [8:0] out
);

reg [3:0] count;

initial begin
		$dumpfile("muxy.vcd");																						// "dump" file
		$dumpvars;																									// "dumpping" variables
		$display ("clk,\tselector,\tin0,\tin1,\tout,\tcount,\treset");														// print onces
		$monitor($time,"%b\t\t%b\t\t%b\t%b\t%b\t%b", clk, selector, in0, in1, out, count,reset); 							// print everytime	
		repeat (6) begin																							// Repeat the test 3 times
		
		@(posedge clk);																								// sync with clock
		{in1} <= {in1}+1;																					// change the inputs	 	
		reset = 1;

		@(posedge clk);				
		{in1} <= {in1}+1;
		{in0} <= {in0}-1;													
		#5 selector = selector + 1;										// change selector with delay
		
		end

       	$finish;													// save variables finish
		end																// initial begin
	

	

	// Initial Values
	initial	in0			<= 2'b0;
	initial in1			<= 2'b0;	
	initial selector	<= 0;
	initial #2 reset 	<= 0;

	// clock logic
	initial	clk	 		<= 0;			// Initial value to avoid indeterminations
	always	#10 clk 	<= ~clk;		// toggle every 10ns

	// Positive Transitions Counter
	initial count <= 0;
	always@(posedge out) begin
	count<=count+1;
	end	
endmodule
