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
`include "demux1x4_behav.v"
`include "demux1x4_struct.v"
`include "tester.v"
//`include "clks.v"

module bancoPruebas();


wire [7:0] in;
wire clk1f;			// slowest
wire clk2f;
wire clk4f;	
// wire clk32f;		// faster
// wire clk;			// root clock
wire valid;


wire [7:0] out0c;
wire [7:0] out1c;
wire [7:0] out2c;
wire [7:0] out3c;

wire [7:0] out0s;
wire [7:0] out1s;
wire [7:0] out2s;
wire [7:0] out3s;

wire [3:0] valid_outc;
wire [3:0] valid_outs;
// conexiones e instanciado

demux1x4_behav	 	demux_behav(	
						.out0	(out0c),
                        .out1	(out1c),
						.out2	(out2c),
						.out3	(out3c),
						.valid_out	(valid_outc),	                       
						.in	(in),
						.valid	(valid),
						.reset	(reset),
						.clk4f	(clk4f),
						.clk2f	(clk2f),
						.clk1f	(clk1f)
						
);

demux1x4_struct	 	demux_struct(		
						.out0	(out0s),
                        .out1	(out1s),
						.out2	(out2s),
						.out3	(out3s),
						.valid_out	(valid_outs),
						.reset	(reset),
						.in	(in),
						.valid	(valid),
						.clk4f	(clk4f),
						.clk2f	(clk2f),
						.clk1f	(clk1f)
						
						
);




tester Tb(       		.out0c(out0c),
						.out1c(out1c),
						.out2c(out2c),
						.out3c(out3c),
						.out0s(out0s),
						.out1s(out1s),
						.out2s(out2s),
						.out3s(out3s),
						.valid_outc(valid_outc),
						.valid_outs(valid_outs),
						.in(in),
						.valid(valid),
						.reset(reset),
						//.clk(clk),
						.clk1f(clk1f),
						.clk2f(clk2f),
						.clk4f(clk4f)
);

endmodule