`timescale 1ns / 1ps
`include "mux4x2_behav.v"	 // than include the mux2x1 
`include "ff2in2o.v"	
`include "ff4in4o.v"
`include "ff1in1o.v"
`include "ff4in4ovalid.v"	

//////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R EIE
// Engineer: Brandon Esquivel Molina
// 
// Create Date: 19.05.2020
// Design Name: mux4x1_8bits+VALID with automatic selector
// Module Name: mux4x1 8BITS + VALID
// Project Name: PHY Layer PCIe
// Target Devices: PCIe
// Tool Versions: Yosys 0.9 Iverolg release at 2020
// Description: module Mux4x1 8bits+ valid with submodules mux2x1 & mux4x1 8bits + valid receives four 8-bit+valid inputs and selects one
// Dependencies: mux4x1_behav mux2x1_behav
// 
// Revision: 0.0
// Revision 0.01 - File Created
// Additional Comments: A conversion of MUX2X1 4bits
// 
//////////////////////////////////////////////////////////////////////////////////

module mux4x1_behav(                		// starts behavorial module
    
	//INPUTS
    input wire clk1f,
	input wire clk2f,						// clock in @2f
    input wire clk4f,						// clock in @4f
    input wire reset,        				// reset
	input wire [7:0] in0,					// datas in with valid at [0] pos
	input wire [7:0] in1,
	input wire [7:0] in2,
	input wire [7:0] in3,
	input wire [3:0] valid,					// valid bits, 4bits, 1 per in
    //OUTPUTS
	output reg [7:0] out,
	output reg validout						// valid data out
 );
    
    //AUXILIARY/INTERNAL NODES
	wire [7:0] n0, n1, n2, n3;				// Level 1 Internal Nodes
	wire [7:0] n4, n5, n6, n7;				// Level 2 Internal Nodes
	wire [7:0] wout;						// Final stage Nodes
	wire [7:0] w;
	wire [3:0] valid_n;
	wire [1:0] valid_21;
	wire [1:0] valid_out;
	wire v_out;
	wire valid_final;


// ConectioN IN L1 FF for data
ff4in4o ff4(				.in0(in0),
							.in1(in1),
							.in2(in2),
							.in3(in3),
							.out0(n0),
							.out1(n1),
							.out2(n2),
							.out3(n3),
							.clkf(clk1f),
							.reset(reset)

); 

ff4in4ovalid ffvalid42(		.in0(valid[0]),		// sincronizando valids
							.in1(valid[1]),
							.in2(valid[2]),
							.in3(valid[3]),
							.out0(valid_n[0]),
							.out1(valid_n[1]),
							.out2(valid_n[2]),
							.out3(valid_n[3]),
							.clkf(clk1f),
							.reset(reset)	



); 







mux4x2_behav mux_A(			.in0(n0),			//entrando valids y data sinronizados
							.in1(n1),
							.in2(n2),
							.in3(n3),
							.out0(n4),
							.out1(n5),
							.valid(valid_n),
							.clk(clk2f),
							.reset(reset),
							.validout(valid_out)

); 
 

ff2in2o ff42(				.in0(n4),
							.in1(n5),
							.out0(n6),
							.out1(n7),
							.clkf(clk2f),
							.reset(reset)
); 


ff4in4ovalid ffvalid21(		.in0(valid_out[0]),		// sincronizando valids, solo se usan 2/4 entradas
							.in1(valid_out[1]),
							.out0(valid_21[0]),
							.out1(valid_21[1]),
							.clkf(clk2f),
							.reset(reset)	
);






mux2x1_behav  mux_B(				
								.in0(n6),
                        		.in1(n7),
								.out(w),
								.valid(valid_21),	
								.reset(reset),
								.clk(clk4f),
								.validout(v_out)
);



ff1in1o ff21(					.in(w),		// sincronizando data final
								.out(wout),
								.clkf(clk4f),
								.reset(reset)
);


ff4in4ovalid ffvalidfinal(	
							.in0(v_out),		// sincronizando valids, solo se usa 1/4 entradas
							.out0(valid_final),
							.clkf(clk4f),
							.reset(reset)	
);



//spreading final signal

always @ (*) begin
	out =	wout;
	validout = valid_final;
end

endmodule                               // Mux4x1 behav
