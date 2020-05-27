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
// Revision: 1.0  -> Change Sruct of valid, putting out of Ins busses
// Revision 0.01 - File Created
// Additional Comments: A conversion of MUX2X1 4bits
// 
//////////////////////////////////////////////////////////////////////////////////


module tester(
	//OUTPUTS
output reg [7:0] in0,
output reg [7:0] in1,
output reg [1:0] valid,
output reg clk,
output reg reset,
	//INPUTS
input [7:0] out
);

reg [3:0] count;

initial begin
		$dumpfile("muxy.vcd");																						// "dump" file
		$dumpvars;																									// "dumpping" variables
		$display ("clk,\tin0,\tin1,\tvalid,\tout,\tcount,\treset");														// print onces
		$monitor($time,"%b\t\t%b\t\t%b\t%b\t%b\t%b", clk, in0, in1, valid, out, count,reset); 							// print everytime	
				
		repeat (3) begin
		@(posedge clk);				// test for reset	- wait 3 cicles with reset 0 to avoid Flipflops errors																			// sync with clock																		
		{in1} <= {in1}+1;
		{in0} <= {in0}-1;
		end
		reset = 1;					// test for reset
		
		repeat (4) begin			// Repeat the test 4 times to see de general behave
		@(posedge clk);				// sync with clock reset 1, valid 11
		//{in1} <= {in1}+1;			// change the inputs	 	
		//{in0} <= {in0}-1;	
		end	

		repeat (7) begin
		@(posedge clk);				// testing valid			
		{in1} <= {in1}+1;
		{in0} <= {in0}-1;															
		{valid} <= {valid}+1;
		end
		

       	$finish;													// save variables finish
		end																// initial begin
	

	

	// Initial Values
	initial	in0			<= 7'b0;
	initial in1			<= 7'b0;
	initial valid		<= 2'b11;	
	initial #10 reset 	<= 0;

	// clock logic
	initial	clk	 		<= 0;			// Initial value to avoid indeterminations
	always	#10 clk 	<= ~clk;		// toggle every 10ns

	// Positive Transitions Counter
	initial count <= 0;
	always@(posedge out) begin
	count<=count+1;
	end	
endmodule
