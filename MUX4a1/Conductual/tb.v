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
`include "mux4x1_behav.v"
`include "tester.v"
//`include "clks.v"

module bancoPruebas();


wire [7:0] in0;	
wire [7:0] in1;
wire [7:0] in2;
wire [7:0] in3;
wire reset;	
wire clk1f;			// slowest
wire clk2f;
wire clk4f;	
//wire clk32f;		// faster
wire clk;			// root clock
wire [3:0] valid;					
wire [7:0] out;


// conexiones e instanciado

mux4x1_behav	 	mux_behav(		                       
						.out(out),
						.in0(in0),
                        .in1(in1),
						.in2(in2),
						.in3(in3),
						.valid(valid),
						.reset(reset),
						.clk4f(clk4f),
						.clk2f(clk2f),
						.clk1f(clk1f)
						
);



tester Tb(       		.outc(out),
						.in0(in0),
                        .in1(in1),
						.in2(in2),
						.in3(in3),
						.valid(valid),
						.reset(reset),
						.clk(clk),
						.clk1f(clk1f),
						.clk2f(clk2f),
						.clk4f(clk4f)
);



/*
clks clocks (
				.clk(clk),
				.clk1f(clk1f),
				.clk2f(clk2f),
				.clk4f(clk4f),
				.reset(reset)

);*/

endmodule