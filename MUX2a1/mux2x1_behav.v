`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R EIE
// Engineer: Brandon Esquivel Molina
// 
// Create Date: 19.05.2020
// Design Name: mux2x1_8bits+VALID with automatic selector
// Module Name: mux2x1 8BITS + VALID
// Project Name: PHY Layer PCIe
// Target Devices: PCIe
// Tool Versions: Yosys 0.9 Iverolg release at 2020
// Description: module Mux2x1 8bits+ valid a submodule in mux4x2 8bits + valid first level L1
// Dependencies: 
// 
// Revision: 0.0
// Revision 0.01 - File Created
// Additional Comments: A conversion of MUX2X1 4bits
// 
//////////////////////////////////////////////////////////////////////////////////

module mux2x1_behav(                 		// starts behavorial module
    
	//INPUTS
	input wire clk,         				// clock in @f
	input wire [8:0] in0,					// datas in with valid at [0] pos
	input wire [8:0] in1,
	input reset,							// reset in

	//OUTPUTS
	output reg [8:0] out					// data out
 );
    
	//AUXILIARY
	reg selector;
    
    // AUTOMATIC SELECTOR LOGIC
	always @(posedge clk) begin					// triggered at clk or by pressing the reset button
		if(~reset) begin
			selector <= 0;						// reset condition default
        end	else begin
			selector <= ~selector;				// make toggle at posedge clock
        	end
    	end


	// SEQUENTIAL LOGIC START
	always @ (posedge clk) begin         	
		if (~reset) begin
            out <= 0;
		end else begin
			if(selector) begin								// MUX select in1 
				if(in1[0]) begin							// checking valid bit for in1
					out <= in1;								// spreading signal in1
				end else begin
							out <= {out[8:1], in1[0]};		// if valid=0 keep the last dataout, rewriting valid bit, just in case.
						end
			end else begin									// MUX select in0
				if (in0[0]) begin							// checking valid bit for in0
					out <= in0;								// spreading signal in0
				end 
				else begin
					out <= {out[8:1], in0[0]};		// if valid=0 keep the last dataout, rewriting valid bit, just in case.
				end
			end 
		end
	end

endmodule                               // FIN
