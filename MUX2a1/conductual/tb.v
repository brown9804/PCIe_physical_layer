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
`include "mux2x1_behav.v"
`include "tester.v"

module bancoPruebas();
// conexiones de salidas

wire [7:0] in0;			// cable de entrada 1
wire [7:0] in1;			// cable de entrada 2
wire clk;				// reloj
wire [7:0] out;			// salida conductual
wire reset;				// reset
wire [1:0] valid;		// valid 
// conexiones e instanciado

mux2x1_behav	 	mux_behav(		                       
						.out(out),
						.in0(in0),
                        .in1(in1),
						.valid(valid),
						.reset(reset),
						.clk(clk)
);



tester Tb(       	.out(out),
					.in0(in0),
                    .in1(in1),
					.valid(valid),
					.reset(reset),
					.clk(clk)
);

endmodule