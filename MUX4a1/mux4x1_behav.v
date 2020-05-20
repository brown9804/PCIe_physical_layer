`timescale 1ns / 1ps
`include "mux4x2_behav.v" // than include the mux2x1 
//////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R EIE
// Engineer: Brandon Esquivel Molina
// 
// Create Date: 19.05.2020
// Design Name: mux4x1_8bits+VALID with automatic selector
// Module Name: mux4x1 8BITS + VALID
// Project Name: PHY Layer PCIe
// Target Devices: PCIe
// Tool Versions: Yosys 0.9 Iverolg release at 2020
// Description: module Mux4x1 8bits+ valid with submodules mux2x1 & mux4x1 8bits + valid receives four 8-bit+valid inputs and selects one
// Dependencies: mux4x1_behav mux2x1_behav
// 
// Revision: 0.0
// Revision 0.01 - File Created
// Additional Comments: A conversion of MUX2X1 4bits
// 
//////////////////////////////////////////////////////////////////////////////////

module mux4x1_behav(                		// starts behavorial module
    
	//INPUTS
    input wire clk,							// clock in @f
    input wire clk2f,						// clock in @2f
    input wire clk4f,						// clock in @4f
    input wire reset,        				// reset
	input wire [8:0] in0,					// datas in with valid at [0] pos
	input wire [8:0] in1,
	input wire [8:0] in2,
	input wire [8:0] in3,
	input reset,							// reset in

    //OUTPUTS
	output reg [8:0] out,					// data out
 );
    
    //AUXILIARY/INTERNAL NODES
	wire [8:0] n0, n1, n2, n3;				// Level 1 Internal Nodes
	wire [8:0] n4, n5, n6, n7;				// Level 2 Internal Nodes
	wire [8:0] wout0;						// Final stage Nodes

// Conection
flipflop4 ff4(				.in0(in0),
							.in1(in1),
							.in2(in2),
							.in3(in3),
							.out0(n0),
							.out1(n1),
							.out2(n2),
							.out3(n3),
							.clk(clk),
							.reset(reset)

); 

mux4x2_behav mux_A(			.in0(n0),
							.in1(n1),
							.in2(n2),
							.in3(n3),
							.out0(n4),
							.out1(n5),
							.clk(clk2f),
							.reset(reset)

); 
 

flipflop2 ff2(				.in0(n4),
							.in1(n5),
							.out0(n6),
							.out1(n7),
							.clk(clk2f),
							.reset(reset)

); 



mux2x1_behav mux_B(				.out(wout0),
								.in0(n6),
                        		.in1(n7),
								.reset(reset),
								.clk(clk4f)
);




//spreading final signal
always @ (*) begin
	out0 <=	wout0;
end

endmodule                               // Mux4x2