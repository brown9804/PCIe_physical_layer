/////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R EIE
// Engineer: Brandon Esquivel Molina
// 
// Create Date: 19.05.2020
// Design Name: demux1x4_8bits+VALID with automatic selector
// Module Name: demux1x4 8BITS + VALID
// Project Name: PHY Layer PCIe
// Target Devices: PCIe
// Tool Versions: Yosys 0.9 Iverolg release at 2020
// Description: module deMux1x4 8bits+ 
// Dependencies: 
// 
// Revision: June 2020
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
    output reg [3:0] validout
);

    // Internal auxilliary


    wire [7:0] n0, n1;
    wire [1:0] valid_12, valid_24;
    wire [7:0] n2, n3;
    wire [7:0] n4, n5, n6, n7;
    wire [3:0] valid_out24, v_out;
    wire [7:0] pre_out0, pre_out1, pre_out2, pre_out3;


    demux1x2_behav  demux12(
                    .in    (in),
                    .clk   (clk4f),
                    .reset (reset),
                    .out0  (n0),
                    .out1  (n1),
                    .valid (valid),
                    .validout(valid_12)
    );


    ff2in2o flops1_2(
                        .clk     (clk2f),
                        .reset   (reset),
                        .in0     (n0),
                        .in1     (n1),
                        .out0    (n2),
                        .out1    (n3)
    );  


ff4in4ovalid ffvalid21(		.in0(valid_12[0]),		
							.in1(valid_12[1]),
							.out0(valid_24[0]),
							.out1(valid_24[1]),
							.clk(clk2f),
							.reset(reset)	
);





  // To out 4

    demux2x4_behav demux_24(
        .in0      (n2),
        .in1      (n3),
        .clk      (clk2f),
        .reset    (reset),
        .out0     (n4),
        .out1     (n5),
        .out2     (n6),
        .out3     (n7),
        .valid      (valid_24),
        .validout   (valid_out24)
    );
//Data FF 44
    ff4in4o flops14(
        .clk     (clk1f),       
        .reset   (reset),
        .in0     (n4),
        .in1     (n5),
        .in2     (n6),
        .in3     (n7),
        .out0    (pre_out0),
        .out1    (pre_out1),
        .out2    (pre_out2),
        .out3    (pre_out3)
    );


// Sincronizar valid con datos
    ff4in4ovalid flops2_4valid(
                        .clk     (clk1f),
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


    always @(*) begin
        out0 = pre_out0;
        out1 = pre_out1;
        out2 = pre_out2;
        out3 = pre_out3;
        validout = v_out;
    end

endmodule