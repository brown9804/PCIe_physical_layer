`timescale 1ns / 1ps
`include "mux2x1_behav.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R EIE
// Engineer: Brandon Esquivel Molina
// 
// Create Date: 19.05.2020
// Design Name: mux4x2_8bits+VALID with automatic selector
// Module Name: mux4x2 8BITS + VALID
// Project Name: PHY Layer PCIe
// Target Devices: PCIe
// Tool Versions: Yosys 0.9 Iverolg release at 2020
// Description: module Mux4x2 8bits+ valid with submodule mux2x1 8bits + valid receives four 8-bit+valid inputs and selects two
// Dependencies: mux2x1_behav
// 
// Revision: 0.0
// Revision 0.01 - File Created
// Additional Comments: A conversion of MUX2X1 4bits
// 
//////////////////////////////////////////////////////////////////////////////////

module mux4x2_behav(                	 // starts behavorial module
    
	//INPUTS
	input wire clk,         				// clock in @f
	input wire [8:0] in0,					// datas in with valid at [0] pos
	input wire [8:0] in1,
	input wire [8:0] in2,
	input wire [8:0] in3,
	input reset,							// reset in

    //OUTPUTS
	output reg [8:0] out0,					// data out0
	output reg [8:0] out1					// data out1
 );
    
    //AUXILIARY/INTERNAL NODES
	wire [8:0] wout0;
	wire [8:0] wout1;

// Conection
mux2x1_behav mux_A(				.out(wout0),
								.in0(in0),
                        		.in1(in1),
								.reset(reset),
								.clk(clk)
);
 
mux2x1_behav mux_B(				.out(wout1),
								.in0(in2),
                        		.in1(in3),
								.reset(reset),
								.clk(clk)
);

//spreading final signal
always @ (*) begin
	out0 <=	wout0;
	out1 <=	wout1;
end

endmodule                               // Mux4x2