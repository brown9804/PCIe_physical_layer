`timescale 	100ns				/ 100ns
`include "cmos_cells.v"
`include "demux2_4.v"
`include "t_demux2_4.v"




module testbench2_4;

//INPUTS

wire [7:0] in0;
wire  clk;
wire reset;
wire valid_in0;
wire [7:0] in1;
wire valid_in1;

//OUTPUTS
wire [7:0] out0;
wire valid_out0;
wire [7:0] out1;
wire valid_out1;
wire [7:0] out2;
wire valid_out2;
wire [7:0] out3;
wire valid_out3;

demux2_4 demux (
/*AUTOINST*/
	      // Outputs
	      .out0			(out0[7:0]),
	      .out1			(out1[7:0]),
	      .valid_out0		(valid_out0),
	      .valid_out1		(valid_out1),
          .out2			(out2[7:0]),
	      .out3			(out3[7:0]),
	      .valid_out2		(valid_out2),
	      .valid_out3		(valid_out3),
	      // Inputs
	      .clk			(clk),
	      .reset			(reset),
	      .in0			(in0[7:0]),
	      .valid_in0		(valid_in0),
          .in1			(in1[7:0]),
	      .valid_in1		(valid_in1)
);


t_demux2_4 tester (/*AUTOINST*/
	
		 // Outputs
	      .out0			(out0[7:0]),
	      .out1			(out1[7:0]),
	      .valid_out0		(valid_out0),
	      .valid_out1		(valid_out1),
          .out2			(out2[7:0]),
	      .out3			(out3[7:0]),
	      .valid_out2		(valid_out2),
	      .valid_out3		(valid_out3),
	      // Inputs
	      .clk			(clk),
	      .reset			(reset),
	      .in0			(in0[7:0]),
	      .valid_in0		(valid_in0),
          .in1			(in1[7:0]),
	      .valid_in1		(valid_in1)
);

endmodule