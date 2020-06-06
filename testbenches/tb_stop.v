//////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R E.I.E
// Engineer: Brandon Esquivel Molina
//
// Create Date: 26.05.2020
// Design Name: Serial to parallel TESTBENCH
// Module Name: Serial to parallel TESTBENCH 
// Project Name: PHY Layer PCIe
// Target Devices: PCIe
// Tool Versions: Yosys 0.9 Iverolg release at 2020
// Description:
// Dependencies:
//
// Revision: 1.0  all good
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////



`include "./testers/t_stop.v"
`include "./src/serieparalelo.v"
`include "./lib/cmos_cells.v"

module bancoPruebas();
    wire in;
    wire [7:0] out;
    wire [7:0] outs;
    wire reset;
    wire clk4f;
    wire valid;
    wire clk32f;

tester Probador(
                    .out(out),
 		            .outs(outs),
                    .in(in),
                    .clk4f(clk4f),
                    .clk32f(clk32f),
                    .reset(reset),
                    .valid(valid)
    );

serieparalelo spc (
                    .in(in),
                    .clk32f(clk32f),
                    .clk4f(clk4f),
                    .reset(reset),
                    .out(out),
                    .valid(valid)
);

serieparalelo sps (
                    .in(in),
                    .clk32f(clk32f),
                    .clk4f(clk4f),
                    .reset(reset),
                    .out(outs),
                    .valid(valid)
);
endmodule
