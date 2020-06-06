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
`include "./src/mux2x1_behav.v"
`include "./syn/mux2x1_syn.v"
`include "./lib/cmos_cells.v"
`include "./testers/t_mux21.v"

module bancoPruebas();
// conexiones


wire [7:0] out;		// salida conductual
wire [7:0] outs;
wire [1:0] valid;
wire validout;
wire reset;
wire [7:0] in0;			// cable de entrada 1
wire [7:0] in1;			// cable de entrada 2
wire clk;				// reloj
// conexiones e instanciado

mux2x1_behav	 	mux_behav(
						.out(out),
						.in0(in0),
                        .in1(in1),
						.reset(reset),
						.valid(valid),
						.validout(validout),
						.clk(clk)
);


mux2x1_struct	 	mux_struct(
						.out(outs),
						.in0(in0),
                        .in1(in1),
						.reset(reset),
						.valid(valid),
						.validout(validout),
						.clk(clk)
);



tester Tb(  		.out(out),
					.outs(outs),
					.in0(in0),
                	.in1(in1),
					.reset(reset),
					.valid(valid),
					.validout(validout),
					.clk(clk)

);

endmodule
