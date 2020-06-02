`include "demux1x2_behav.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R EIE
// Engineer: Brandon Esquivel Molina
// 
// Create Date: 19.05.2020
// Design Name: demux2x4_8bits+VALID with automatic selector
// Module Name: demux2x4 8BITS + VALID
// Project Name: PHY Layer PCIe
// Target Devices: PCIe
// Tool Versions: Yosys 0.9 Iverolg release at 2020
// Description: module deMux2x4 8bits+ valid a submodule in mux4x2 8bits + valid first level L1
// Dependencies: 
// 
// Revision: 0.0
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module demux2x4_behav (
    
    input wire clk,
    input wire reset,
    //INPUTS
    
    input wire [7:0] in0,
    input wire [7:0] in1,
    input wire [1:0] valid,
    
    //OUTPUTS

    output reg [7:0] out0,
    output reg [7:0] out1,
    output reg [7:0] out2,
    output reg [7:0] out3,
    output reg [3:0] valid_out
    );

    //Internal, Auxilliary
    wire [7:0] pre_out0;
    wire [7:0] pre_out1;
    wire [7:0] pre_out2;
    wire [7:0] pre_out3;
    
    wire [1:0] v_out0;
    wire [1:0] v_out1;

    // NOW, conection Demux 1x2_behav 1
    demux1x2_behav demux12_0(
        .in       (in0),
        .clk      (clk),
        .out0     (pre_out0),
        .out1     (pre_out1),
        .valid    (valid[0]),
        .valid_out(v_out0),
        .reset    (reset)
    );

  // Demux 1x2_behav 1
   demux1x2_behav demux12_1(
        .in       (in1),
        .clk      (clk),
        .out0     (pre_out2),
        .out1     (pre_out3),
        .valid    (valid[1]),
        .reset    (reset),
        .valid_out(v_out1)
    );

    always @(*) begin
        out0 = pre_out0;
        out1 = pre_out1;
        out2 = pre_out2;
        out3 = pre_out3;
        valid_out[0] = v_out0[0];
        valid_out[1] = v_out0[1];
        valid_out[2] = v_out1[0];
        valid_out[3] = v_out1[1];

    end


endmodule 