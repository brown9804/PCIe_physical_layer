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
`include "tester.v"

module bancoPruebas();


wire [8:0] in0;	
wire [8:0] in1;
wire [8:0] in2;
wire [8:0] in3;
wire reset;	
wire clk;						
wire [8:0] out0;
wire [8:0] out1;


// conexiones e instanciado

mux4x2_behav	 	mux_behav(		                       
						.out0(out0),
						.out1(out1),
						.in0(in0),
                        .in1(in1),
						.in2(in2),
						.in3(in3),
						.reset(reset),
						.clk(clk)
);



tester Tb(       		.out0(out0),
						.out1(out1),
						.in0(in0),
                        .in1(in1),
						.in2(in2),
						.in3(in3),
						.reset(reset),
						.clk(clk)
);

endmodule