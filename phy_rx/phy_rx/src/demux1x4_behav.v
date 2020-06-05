/////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R EIE
// Engineer: Brandon Esquivel Molina
//
// Create Date: 19.05.2020
// Design Name: demux2x4_8bits+VALID with automatic selector
// Module Name: demux2x4 8BITS + VALID
// Project Name: PHY Layer PCIe
// Target Devices: PCIe
// Tool Versions: Yosys 0.9 Iverolg release at 2020
// Description: module deMux2x4 8bits+ valid a submodule in mux4x2 8bits + valid
// Dependencies:
//
// Revision: 0.0
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`include "./src/demux2x4_behav.v"
`include "./src/ff2in2o.v"
`include "./src/ff4in4o.v"
`include "./src/ff4in4ovalid.v"


module demux1x4_behav (
    input wire clk1f,
    input wire clk2f,
    input wire clk4f,
    input wire reset,

    //INPUTS
    input wire [7:0] in,
    input wire valid,

    //OUTPUTS
    output reg [7:0] out0,
    output reg [7:0] out1,
    output reg [7:0] out2,
    output reg [7:0] out3,
    output reg [3:0] valid_out
);

    // Internal auxilliary


    wire [7:0] x_0, x_1;
    wire [1:0] valid_12, valid_24;
    wire [7:0] x_2, x_3;
    wire [7:0] x_4, x_5, x_6, x_7;
    wire [3:0] valid_out24, v_out;
    wire [7:0] pre_out0, pre_out1, pre_out2, pre_out3;


    demux1x2_behav  demux12(
                    .in    (in),
                    .clk   (clk4f),
                    .reset (reset),
                    .out0  (x_0),
                    .out1  (x_1),
                    .valid (valid),
                    .valid_out(valid_12)
    );

    // del demux12, al demux24

    ff2in2o flops1_2(
                        .clkf     (clk2f),
                        .reset   (reset),
                        .in0     (x_0),
                        .in1     (x_1),
                        .out0    (x_2),
                        .out1    (x_3)
    );

// Sincronizar valid con datos
    ff4in4ovalid flops1_2valid(
                        .clkf     (clk2f),
                        .reset   (reset),
                        .in0     (valid_12[0]),
                        .in1     (valid_12[1]),
                        .out0    (valid_24[0]),
                        .out1    (valid_24[1])
    );





  //hacia etapa flops de salida

    demux2x4_behav demux_24(
        .in0      (x_2),
        .in1      (x_3),
        .clk      (clk2f),
        .reset    (reset),
        .out0     (x_4),
        .out1     (x_5),
        .out2     (x_6),
        .out3     (x_7),
        .valid (valid_24),
        .valid_out(valid_out24)
    );

    /* Segunda etapa de flops o flops de salida. Sincronizan las
     salidas del demux24 y los envian a la salida del demux14*/
    ff4in4o flops14(
        .clkf           (clk1f), //*************************
        .reset         (reset),
        .in0     (x_4),
        .in1     (x_5),
        .in2     (x_6),
        .in3     (x_7),
        .out0    (pre_out0),
        .out1    (pre_out1),
        .out2    (pre_out2),
        .out3    (pre_out3)
    );


// Sincronizar valid con datos
    ff4in4ovalid flops2_4valid(
                        .clkf     (clk1f),
                        .reset   (reset),
                        .in0     (valid_out24[0]),
                        .in1     (valid_out24[1]),
                        .in2     (valid_out24[2]),
                        .in3     (valid_out24[3]),
                        .out0    (v_out[0]),
                        .out1    (v_out[1]),
                        .out2    (v_out[2]),
                        .out3    (v_out[3])

    );


    /* Se conectan las salidas de la ultima etapa de flops a la
    salida del mux14 */
    always @(*) begin
        out0 = pre_out0;
        out1 = pre_out1;
        out2 = pre_out2;
        out3 = pre_out3;
        valid_out = v_out;

    end

endmodule
