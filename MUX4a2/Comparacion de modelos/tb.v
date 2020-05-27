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
`include "tester.v"

module bancoPruebas();
// conexiones de salidas

wire [7:0] in0;			// cable de entrada 1
wire [7:0] in1;			// cable de entrada 2
wire [7:0] in2;			// cable de entrada 3
wire [7:0] in3;			// cable de entrada 4

wire clk;				// reloj
wire [7:0] outc0;		// salida conductual 0
wire [7:0] outs0;		// salida estructural 0 
wire [7:0] outc1;		// salida conductual 1
wire [7:0] outs1;		// salida estructural 1

wire reset;				// reset
wire [3:0] valid;		// valid para cada entrada
// conexiones e instanciado

mux4x2_behav	 	mux_behav(		                       
						.out0(outc0),
						.out1(outc1),
						.in0(in0),
                        .in1(in1),
						.in2(in2),
						.in3(in3),
						.valid(valid),
						.reset(reset),
						.clk(clk)
);


mux4x2_struct 		mux_struct (
						.out0(outs0),
						.out1(outs1),
						.in0(in0),
                        .in1(in1),
						.in2(in2),
						.in3(in3),
						.valid(valid),
						.reset(reset),
						.clk(clk)
);



tester Tb(       	.outc0(outc0),
					.outc1(outc1),
					.outs0(outs0),
					.outs1(outs1),
					.in0(in0),
                    .in1(in1),
					.in2(in2),
					.in3(in3),
					.valid(valid),
					.reset(reset),
					.clk(clk)
);

endmodule