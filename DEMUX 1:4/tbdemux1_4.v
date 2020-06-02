`timescale 	100ns				/ 100ns
`include "cmos_cells.v"
`include "demux1_4.v"
`include "t_demux1_4.v"




module testbench1_4;

//INPUTS

wire [7:0] in0;
wire clk1f;			
wire clk2f;           
wire clk4f;           
wire reset;
wire valid_in0;

//OUTPUTS
wire [7:0] out0;
wire valid_out0;
wire [7:0] out1;
wire valid_out1;
wire [7:0] out2;
wire valid_out2;
wire [7:0] out3;
wire valid_out3;

demux1_4 demux (
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
	      .clk1f			(clk1f),
          .clk2f            (clk2f),
          .clk4f            (clk4f),
	      .reset			(reset),
	      .in0			(in0[7:0]),
	      .valid_in0		(valid_in0)
);


t_demux1_4 tester (/*AUTOINST*/
	
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
	      .clk1f			(clk1f),
          .clk2f            (clk2f),
          .clk4f            (clk4f),
	      .reset			(reset),
	      .in0			(in0[7:0]),
	      .valid_in0		(valid_in0)
);

endmodule