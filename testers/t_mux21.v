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
// Additional Comments: 
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
input [7:0] out,
input  [7:0] outs,
input validout
);

reg [3:0] count;

initial begin
		$dumpfile("mux21.vcd");																						// "dump" file
		$dumpvars;																									// "dumpping" variables
		//$display ("clk,\tselector,\tin0,\tin1,\tout,\tcount,\treset");														// print onces
		//$monitor($time,"%b\t\t%b\t\t%b\t%b\t%b\t%b", clk, selector, in0, in1, out, count,reset); 							// print everytime	
		repeat (6) begin
		@(posedge clk);	
		reset = 0;
		end		

		repeat (6) begin																							// Repeat the test 3 times
		@(posedge clk);																								// sync with clock																			 	
		#4 reset = 1;
		end

		repeat (16) begin
		@(posedge clk);				
		{in1} <= {in1}+1;
		{in0} <= {in0}-1;													
		end

		repeat (4) begin
		@(posedge clk);				//testing valid	
		{in1} <= {in1}+1;
		{in0} <= {in0}-1;
		valid <= 2'b00;													
		end

		repeat (8) begin
		@(posedge clk);				
		{in1} <= {in1}+1;
		{in0} <= {in0}-1;
		valid <= 2'b11;													
		end

       	$finish;													// save variables finish
		end																// initial begin
	

	

	// Initial Values
	initial	in0			<= 8'b0;
	initial in1			<= 8'b0;
	initial valid 		<= 4'b1111;  	
	initial #2 reset 	<= 0;

	// clock logic
	initial	clk	 		<= 0;			// Initial value to avoid indeterminations
	always	#5 clk 	<= ~clk;		// toggle every 10ns

	// Positive Transitions Counter
	initial count <= 0;
	always@(posedge out) begin
	count<=count+1;
	end	

reg test;

always@(posedge clk) begin
    if(out != outs)
    begin
       test <= 0;
     end // end display

     else begin
        test <= 1;
      end //else
end // always checker


endmodule
