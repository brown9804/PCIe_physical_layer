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
output reg [7:0] in2,
output reg [7:0] in3,
output reg [3:0] valid,
//output reg clk,
output reg clk1f,
output reg clk2f,
output reg clk4f,
output reg clk8f,
output reg clk16f,
output reg clk32f,
output reg reset,
	//INPUTS
input [7:0] outc,
input [7:0] outs,
input validout
);

	//Internal
reg [3:0] counts; 		// counters
reg [3:0] countc;
reg clk;

initial begin
		$dumpfile("muxy.vcd");									// "dump" file
		$dumpvars;												// "dumpping" variables	
		repeat (6) begin
		@(posedge clk1f);	
		#4 reset = 0;
		end		

		repeat (6) begin																							// Repeat the test 3 times
		@(posedge clk1f);																								// sync with clock																			 	
		#4 reset = 1;
		end


		//repeat (15) begin
		@(posedge clk1f);		
		{in0} <= 'hFF;
		{in1} <= 'hEE;															
		{in2} <= 'hDD;
		{in3} <= 'hCC;
		// end


		@(posedge clk1f);		
		{in0} <= 'hBB;
		{in1} <= 'hAA;															
		{in2} <= 'h99;
		{in3} <= 'h88;

		@(posedge clk1f);	
		{in2} <= 'h77;
		valid <= 4'b0010;
		
	
		repeat (5) begin
		@(posedge clk1f);				// testing static ins		
		valid = 4'b1111;
		end

       	$finish;													// save variables finish
		end																// initial begin
	

	

	// Initial Values
	initial	in0			<= 8'b0;
	initial in1			<= 8'b0;
	initial in2			<= 8'b0;
	initial in3			<= 8'b0;
	initial valid		<= 4'b1111;	
	initial #2 reset 		<= 0;

	// clock logic
	initial	clk	 			<= 0;			// Initial value to avoid indeterminations
	always	#5 clk			<= ~clk;		// toggle every 10ns

	// Positive Transitions Counters
	initial countc <= 0;
	always@(posedge outc) begin
	countc<=countc+1;
	end


	// Positive Transitions Counters
	initial counts <= 0;
	always@(posedge outs) begin
	counts<=counts+1;
	end

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






reg tester;

always@(posedge clk) begin
    if(outc != outs)
    begin
       tester <= 0;
     end // end display

     else begin
        tester <= 1;
      end //else
end // always checker

endmodule
