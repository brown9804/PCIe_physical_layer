// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

// 						&


/////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R EIE
// Engineer: Brandon Esquivel Molina
//
//////////////////////////////////////////////////////////////////////////////////




module tester(
//INPUTS
output reg [7:0] in,
output reg clk,
output reg reset,
output reg valid,

//OUTPUTS
input wire [7:0] out0,
input wire [7:0] out1,
input wire [7:0] out0s,
input wire [7:0] out1s,
input wire [1:0] valid_out
);



	initial begin
		$dumpfile("demux12.vcd");
		$dumpvars;


		$finish;
	end



 endmodule
