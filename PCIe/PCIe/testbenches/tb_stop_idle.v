
//////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R E.I.E
// Engineer: Brandon Esquivel Molina
//
// Create Date: 26.05.2020
// Design Name: Serial to parallel IDLE TESTBENCH
// Module Name: Serial to parallel IDLE TESTBENCH 
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



`include "./testers/t_stop_idle.v"
`include "./src/serie_paralelo_idle.v"
`include "./syn/serie_paralelo_idle_syn.v"

module bancoPruebas();
    wire in;
    wire out;
    wire out_s;
    wire outs;
    wire reset;
    wire clk4f;
    wire clk32f;

tester Probador(
                    .out(out),
 		    .outs(outs),
                    .in(in),
                    .clk4f(clk4f),
                    .clk32f(clk32f),
                    .reset(reset)

    );

serieparaleloIDL spc (
                    .in(in),
                    .clk32f(clk32f),
                    .clk4f(clk4f),
                    .reset(reset),
                    .valido(out)

);

serieparaleloIDL sps (
                    .in(in),
                    .clk32f(clk32f),
                    .clk4f(clk4f),
                    .reset(reset),
                    .valido(outs)

);
endmodule
