`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R E.I.E
// Engineer: Brandon ESquivel Molina
// 
// Create Date: 19.05.2020
// Design Name: mux2x1_8bits+VALID with automatic selector
// Module Name: Tester for mux4x2 8BITS + VALID
// Project Name: PHY Layer PCIe
// Target Devices: PCIe
// Tool Versions: Yosys 0.9 Iverolg release at 2020
// Description: tester for module Mux4x2 8bits+ valid
// Dependencies: mux2x1_behav
// 
// Revision: 0.0
// Revision 0.01 - File Created
// Additional Comments: A conversion of MUX2X1 4bits
// 
//////////////////////////////////////////////////////////////////////////////////


module tester(
	//OUTPUTS
	output reg [8:0] in0,					// datas in with valid at [0] pos
	output reg [8:0] in1,
	output reg [8:0] in2,
	output reg [8:0] in3,
	output reg reset,							// reset in
	output reg clk,							// clock
    //INPUTS
	input wire [8:0] out0,					// data out0
	input wire [8:0] out1					// data out1
 );

reg [3:0] count0;		// posedge Trans counter
reg [3:0] count1;

initial begin
		$dumpfile("muxy.vcd");																						// "dump" file
		$dumpvars;																									// "dumpping" variables
		$display ("clk,\tin0,\tin1,\tin2,\tin3,\tout0,\tout1,\tcount0,\tcount1,\treset");														// print onces
		$monitor($time,"%b\t\t%b\t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", clk, in0, in1,in2, in3, out0, out1, count0, count1,reset); 							// print everytime	
		repeat (2) begin																							// Repeat the test 3 times
		
		@(posedge clk);																								// sync with clock
		in0 <= 9'b111111110;																					// change the inputs	 	
		reset = 1;				// testing reset

		@(posedge clk);			// testing valid		
		{in1} <= {in1}-1;		// all signal with valid 0, so, memory dt out
		{in0} <= 9'b01010100;
		{in2} <= 9'b01010100;
		{in3} <= 9'b00010000;													
		
		@(posedge clk);			// checking auto select - All signals constant

		{in0} <= 9'b10000001;		// all signal with valid 1, so, out can change
		{in1} <= 9'b01000001;
		{in2} <= 9'b00100001;
		{in3} <= 9'b00010001;	

		@(posedge clk);			// checking auto select - All signals constant 2nd cycle

		{in0} <= 9'b10000001;		// all signal with valid 1, so, out can change
		{in1} <= 9'b01000001;
		{in2} <= 9'b00100001;
		{in3} <= 9'b00010001;	


		@(posedge clk);			// checking auto select - All signals constant 3rd cycle

		{in0} <= 9'b10000001;		// all signal with valid,1, so, out can change
		{in1} <= 9'b01000001;
		{in2} <= 9'b00100001;
		{in3} <= 9'b00010001;	

		@(posedge clk);			// checking auto select - All signals constant 4nd cycle

		{in0} <= 9'b10000001;		// all signal with valid 1, so, out can change
		{in1} <= 9'b01000001;
		{in2} <= 9'b00100001;
		{in3} <= 9'b00010001;	

		end

       	$finish;													// save variables finish
		end															// initial begin
	

	

	// Initial Values - all with valid 1
	initial	in0			<= 9'b011111111;
	initial in1			<= 9'b1;
	initial in2			<= 9'b010101011;
	initial in3			<= 9'b1;	
	initial #2 reset 	<= 0;

	// clock logic
	initial	clk	 		<= 0;			// Initial value to avoid indeterminations
	always	#10 clk 	<= ~clk;		// toggle every 10ns

	// Positive Transitions Counter
	initial count0 <= 0;
	always@(posedge out0) begin
	count0<=count0+1;
	end	

	// Positive Transitions Counter
	initial count1 <= 0;
	always@(posedge out1) begin
	count1<=count1+1;
	end	

endmodule