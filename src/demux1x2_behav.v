`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R EIE
// Engineer: Brandon Esquivel Molina
// 
// Create Date: 19.05.2020
// Design Name: demux1x2_8bits+VALID with automatic selector
// Module Name: demux1x2 8BITS + VALID
// Project Name: PHY Layer PCIe
// Target Devices: PCIe
// Tool Versions: Yosys 0.9 Iverolg release at 2020
// Description: module deMux1x2 8bits+ valid a submodule in mux1x2 8bits + valid
// Dependencies: 
// 
// Revision: 0.0
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module demux1x2_behav (
    // Inputs
    input wire [7:0] in,
    input wire clk,
    input wire reset,
    input wire valid,

    // Outputs
    output reg [7:0] out0,
    output reg [7:0] out1,
    output reg [1:0] validout

);
   
    reg selector;
    reg [7:0] node0;
    reg [7:0] node1;


    always @ (posedge clk) begin
        if(~reset) begin
          selector <= 0;
        end else begin
          selector <= ~selector;
        end
    end

    always @(posedge clk) begin
        if (~reset) begin
            node0 <= 0;
            node1 <= 0;
        end else begin
            if (selector) begin
                if (valid) begin
                    node0 <= in;
                    validout[0] <= valid;
                end else begin
                    node0 <= node0;
                    validout[0] <= valid;
                end
            end else begin
                if (valid) begin
                    node1 <= in;
                    validout[1] <= 1;
                end else begin
                    node1 <= node1;
                    validout[1] <= 0;
                end
            end
        end
    end
    

    always @(posedge clk) begin
        out0 <= node0;
        out1 <= node1;
    end

endmodule
