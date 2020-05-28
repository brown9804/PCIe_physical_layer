`timescale 1ns / 1ps
`include "mux4x2_behav.v"	 // than include the mux2x1 
`include "ff2in2o.v"	
`include "ff4in4o.v"
`include "ff1in1o.v"	

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
    input wire clk1f,
	input wire clk2f,						// clock in @2f
    input wire clk4f,						// clock in @4f
    input wire reset,        				// reset
	input wire [7:0] in0,					// datas in with valid at [0] pos
	input wire [7:0] in1,
	input wire [7:0] in2,
	input wire [7:0] in3,
	input wire [3:0] valid,					// valid bits, 4bits, 1 per in
    //OUTPUTS
	output reg [7:0] out					// data out
 );
    
    //AUXILIARY/INTERNAL NODES
	wire [7:0] n0, n1, n2, n3;				// Level 1 Internal Nodes
	wire [7:0] n4, n5, n6, n7;				// Level 2 Internal Nodes
	wire [7:0] wout;						// Final stage Nodes
	wire [7:0] w;
	wire [1:0] v;
	wire vv;
	wire wv;
	wire [1:0] validout;

// Conection
ff4in4o ff4(				.in0(in0),
							.in1(in1),
							.in2(in2),
							.in3(in3),
							.out0(n0),
							.out1(n1),
							.out2(n2),
							.out3(n3),
							.clk(clk1f),
							.reset(reset)

); 

mux4x2_behav mux_A(			.in0(n0),
							.in1(n1),
							.in2(n2),
							.in3(n3),
							.out0(n4),
							.out1(n5),
							.valid(valid),
							.clk(clk2f),
							.reset(reset),
							.validout(validout)

); 
 

ff2in2o ff2(				.in0(n4),
							.in1(n5),
							.out0(n6),
							.out1(n7),
							.clk(clk2f),
							.reset(reset)
); 

ff2in2o ff2v(				.in0(validout[0]),			// sincronizando valid
							.in1(validout[1]),
							.out0(v[0]),
							.out1(v[1]),
							.clk(clk2f),
							.reset(reset)
); 




mux2x1_behav mux_B(				.out(w),
								.in0(n6),
                        		.in1(n7),
								.valid(v),	
								.reset(reset),
								.clk(clk4f),
								.validout(vv)
);



ff2in2o ff22(					.in0(w),
								.in1(vv)
								.out0(wout),
								.out1(wv),
								.clk(clk4f),
								.reset(reset)
);



//spreading final signal
always @ (*) begin
	out <=	wout;
end

endmodule                               // Mux4x2