// Michelle Gutiérrez 
// Cicuitos Digitales 2 - Proyecto1
// Demux 2:4



`include "demuxf.v"

module demux2_4 (
input wire reset,
input wire clk,
input wire [7:0] in0,
input wire valid_in0,
input wire [7:0] in1,
input wire valid_in1,
output  [7:0] out3,
output  valid_out3,
output  [7:0] out2,
output  valid_out2,
output  [7:0] out1,
output  valid_out1,
output  [7:0] out0,
output  valid_out0
);

demuxf demux1 (
     .in0    (in0),
     .in0_valid (valid_in0),
     .out0    (out0),
     .valid_out0 (valid_out0),
     .out1    (out1),
     .valid_out1 (valid_out1),
     .clk     (clk),
     .reset   (reset)
 );

demuxf demux2 (
     .in0    (in1),
     .in0_valid (valid_in1),
     .out0    (out2),
     .valid_out0 (valid_out2),
     .out1    (out3),
     .valid_out1 (valid_out3),
     .clk     (clk),
     .reset   (reset)
 );


endmodule 