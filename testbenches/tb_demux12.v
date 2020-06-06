// Brown Ramírez,  Belinda
// Mayo, 2020
// timna.brown@ucr.ac.cr

// 						&


/////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R EIE
// Engineer:  Esquivel Molina, Brandon
//
//////////////////////////////////////////////////////////////////////////////////

`include "./src/demux1x2_behav.v"
`include "./syn/demux1x2_behav_syn.v"
`include "./lib/cmos_cells.v"
`include "./testers/t_demux12.v"

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
						.valid_out (validoutc),
						.in		(in),
						.valid	(valid),
						.reset	(reset),
						.clk    (clk4f)

);

demux1x2_behav_syn	 	demux_syn(
						.out0	(out0s),
                        .out1	(out1s),
						.valid_out	(validouts),
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
