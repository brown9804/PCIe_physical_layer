`timescale 	100ns				/ 100ns
`include "cmos_cells.v"
`include "demuxf.v"
`include "t_demuxf.v"
`include "demuxfsynth.v"



module testbenchf;

wire [7:0] out0;
wire [7:0] out0s;
wire [7:0] out1;
wire [7:0] out1s;
wire [7:0] in0;
wire reset;
wire clk ;
wire in0_valid; 
wire valid_out0;
wire valid_out0s;
wire valid_out1;
wire valid_out1s;


demuxf demux (
/*AUTOINST*/
	      // Outputs
	      .out0			(out0[7:0]),
	      .out1			(out1[7:0]),
	      .valid_out0		(valid_out0),
	      .valid_out1		(valid_out1),
	      // Inputs
	      .clk			(clk),
	      .reset			(reset),
	      .in0			(in0[7:0]),
	      .in0_valid		(in0_valid));


t_demuxf tester (/*AUTOINST*/
		 // Outputs
		 .in0			(in0[7:0]),
		 .clk			(clk),
		 .reset			(reset),
		 .in0_valid		(in0_valid),
		 // Inputs
		 .out0			(out0[7:0]),
         .out0s			(out0s[7:0]),
		 .out1			(out1[7:0]),
         .out1s			(out1s[7:0]),
		 .valid_out0		(valid_out0),
         .valid_out0s		(valid_out0s),
		 .valid_out1		(valid_out1),
         .valid_out1s		(valid_out1s)
         );

demuxfsynth demuxs (
    /*AUTOINST*/
		    // Outputs
		    .out0		(out0s[7:0]),
		    .out1		(out1s[7:0]),
		    .valid_out0		(valid_out0s),
		    .valid_out1		(valid_out1s),
		    // Inputs
		    .clk		(clk),
		    .in0		(in0[7:0]),
		    .in0_valid		(in0_valid),
		    .reset		(reset)
            );

endmodule 


