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
`include "demux1x2_behav.v"
`include "demux1x2_struct.v"
`include "cmos_cells.v"
`include "tester.v"

module bancoPruebas();


wire [7:0] in;
wire clk;
wire valid;


wire [7:0] out0c;
wire [7:0] out1c;
wire [7:0] out0s;
wire [7:0] out1s;

wire [1:0] validoutc;
wire [1:0] validouts;
// conexiones e instanciado

demux1x2_behav	 	demux_behav(	
						.out0	(out0c),
                        .out1	(out1c),
						.validout (validoutc),	                       
						.in		(in),
						.valid	(valid),
						.reset	(reset),
						.clk    (clk4f)
						
);

demux1x2_struct	 	demux_struct(		
						.out0	(out0s),
                        .out1	(out1s),
						.validout	(validouts),
						.reset	(reset),
						.in	    (in),
						.valid	(valid),
						.clk    (clk4f)
						
						
);




tester Tb(       		.out0c(out0c),
						.out1c(out1c),
						.out0s(out0s),
						.out1s(out1s),
						.validoutc(validoutc),
						.validouts(validouts),
						.in(in),
						.valid(valid),
						.reset(reset),
						.clk1f(clk1f),
						.clk2f(clk2f),
						.clk4f(clk4f)
);

endmodule