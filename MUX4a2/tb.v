`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2020 00:56:45
// Design Name: 
// Module Name: bancoPruebas
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "mux4x2_behav.v"
`include "mux4x2_struct.v"
`include "cmos_cells.v"
`include "tester.v"

module bancoPruebas();
// conections


wire [7:0] out0c;		// Behavorial outs
wire [7:0] out1c;
wire [7:0] out0s;		// Struct outs
wire [7:0] out1s;

wire [3:0] valid;		// Valid, reset and valid out
wire [1:0] validout;	
wire reset;

wire [7:0] in0;			// input wires
wire [7:0] in1;			// input wires
wire [7:0] in2;			// input wires
wire [7:0] in3;			// input wires

wire clk;				// clock



mux4x2_behav	 	mux_behav(		                       
						.out0(out0c),
						.out1(out1c),
						.in0(in0),
                        .in1(in1),
						.in2(in2),
						.in3(in3),
						.reset(reset),
						.valid(valid),
						.validout(validout),
						.clk(clk)
);


mux4x2_struct	 	mux_struct(		 
						.out0(out0s),                      
						.out1(out1s),
						.in0(in0),
                        .in1(in1),
						.in2(in2),
						.in3(in3),
						.reset(reset),
						.valid(valid),
						.validout(validout),
						.clk(clk)
);



tester Tb(  			.out0c(out0c),
						.out1c(out1c),
						.out0s(out0s),                      
						.out1s(out1s),
						.in0(in0),
                        .in1(in1),
						.in2(in2),
						.in3(in3),
						.reset(reset),
						.valid(valid),
						.validout(validout),
						.clk(clk)
						
);

endmodule