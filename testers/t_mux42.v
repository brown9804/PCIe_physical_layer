`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R E.I.E
// Engineer: Brandon Esquivel Molina
// 
// Create Date: 19.05.2020
// Design Name: mux4x2_8bits+VALID with automatic selector
// Module Name: Tester for mux4x2 8BITS + VALID
// Project Name: PHY Layer PCIe
// Target Devices: PCIe
// Tool Versions: Yosys 0.9 Iverolg release at 2020
// Description: tester for module Mux4x2 8bits+ valid
// Dependencies: mux2x1_behav
// 
// Revision: 0.0
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////


module tester(

	//OUTPUTS
output reg [7:0] in0,
output reg [7:0] in1,
output reg [7:0] in2,
output reg [7:0] in3,
 
output reg [3:0] valid,
output reg clk,
output reg reset,

	//INPUTS
input [7:0] out0c,
input [7:0] out1c,
input [7:0] out0s,
input [7:0] out1s,
input [1:0] validout

);

// Internal counters

reg [3:0] countc0;
reg [3:0] countc1;
reg [3:0] counts0;
reg [3:0] counts1;

initial begin
		$dumpfile("muxy.vcd");									// "dump" file
		$dumpvars;												// "dumpping" variables	
		repeat (6) begin
		@(posedge clk);	
		reset = 0;
		end		

		repeat (6) begin																							// Repeat the test 3 times
		@(posedge clk);																								// sync with clock																			 	
		#4 reset = 1;
		end

		repeat (32) begin
		@(posedge clk);				
		{in1} <= {in1}+1;
		{in0} <= {in0}-1;
		{in2} <= {in2}+2;
		{in3} <= {in3}-2;													
		end

		repeat (12) begin						// testing VAlid
		@(posedge clk);				
		valid <= {valid} + 1;												
		end
       	$finish;													// save variables finish
		end																// initial begin
	

	

	// Initial Values
	initial	in0			<= 8'b0;
	initial in1			<= 8'b0;
	initial	in2			<= 8'b0;
	initial in3			<= 8'b0;

	initial valid 		<= 4'b1111;  	
	initial #2 reset 	<= 0;

	// clock logic
	initial	clk	 		<= 0;			// Initial value to avoid indeterminations
	always	#5 clk 		<= ~clk;		// toggle every 10ns

	// Positive Transitions Counter
	initial countc0 <= 0;
	initial countc1 <= 0;
	initial counts0 <= 0;
	initial counts1 <= 0;
	
	always@(posedge out0c) begin
	countc0 <= countc0+1;
	end	

	always@(posedge out1c) begin
	countc1 <= countc1+1;
	end	

	always@(posedge out0s) begin
	counts0 <= counts0+1;
	end	

	always@(posedge out1s) begin
	counts1 <= counts1+1;
	end	



// Checker

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


endmodule
