// Michelle Gutiérrez 
// Cicuitos Digitales 2 - Proyecto1
// Demux 1:4


// Flip flops para entradas y salidas de 7 bits y de 1 bit (para los valids)
`include "demux2_4.v"
`include "ff1in1o.v"
`include "ff1in1om.v"
`include "ff2in2o.v"
`include "ff2in2om.v"
`include "ff4in4o.v"
`include "ff4in4om.v"

module demux1_4 (

 input wire reset,
 input wire clk1f,
 input wire clk2f,
 input wire clk4f,
 input wire [7:0] in0,
 input wire valid_in0,
 output reg  [7:0] out3,
 output reg valid_out3,
 output reg [7:0] out2,
 output reg valid_out2,
 output reg [7:0] out1,
 output reg valid_out1,
 output reg [7:0] out0,
 output reg valid_out0);

wire [7:0] in0sin; // Señal de entrada después del primer ff
wire valid_in0sin; //Señal de valid de la entrada despúes del primer ff
// Tanto la señal de entrada como el valid de la misma, se pasan por un ff 


// Primer etapa de flip-flops clk4f
ff1in1o ff1e (   .clk     (clk4f),
                 .reset   (reset),
                 .in      (in0),
                 .out     (in0sin)
);

ff1in1om ff1 (  .clk      (clk4f),
                .reset    (reset),
                .in       (valid_in0),
                .out      (valid_in0sin)
);
// Cables para salidas del primer demux 1:2
wire [7:0] dato0;
wire [7:0] dato1;
wire [7:0] valid_dato0;
wire [7:0] valid_dato1;

demuxf demuxf1P (  .clk  (clk4f),  
                   .reset (reset), 
                   .in0   (in0),
                   .in0_valid (valid_in0),
                   .out0  (dato0),
                   .out1  (dato1),
                   .valid_out0 (valid_dato0),
                   .valid_out1 (valid_dato1)
);

// Cables para salidas de la segunda etapa de flip-flops
wire [7:0] dato0d;
wire [7:0] dato1d;
wire valid_dato0d;
wire valid_dato1d;
// Segunda etapa de flip-flops clk2f

ff2in2o ff2e (    .clk   (clk2f),
                  .reset (reset),
                  .in0   (dato0),
                  .in1   (dato1),
                  .out0  (dato0d),
                  .out1  (dato1d)
);

ff2in2om ff2 (    .clk   (clk2f),
                  .reset (reset),
                  .in0   (valid_dato0),
                  .in1   (valid_dato1),
                  .out0  (valid_dato0d),
                  .out1  (valid_dato1d)
);

//Cables para salidas del demux 2:4 y pasarlas por los últimos flip-flops

wire [7:0] out3p, out2p, out1p, out0p;
wire valid_out0p, valid_out1p, valid_out2p, valid_out3p;


// Segundo demux 2:4

demux2_4 demux2_42P (
                       .reset (reset),
                       .clk   (clk2f),
                       .in0   (dato0d),
                       .valid_in0 (valid_dato0d),
                       .in1   (dato1d),
                       .valid_in1 (valid_dato1d),
                       .out3  (out3p),
                       .valid_out3  (valid_out3p),
                       .out2  (out2p),
                       .valid_out2  (valid_out2p),
                       .out1  (out1p),
                       .valid_out1 (valid_out1p),
                       .out0 (out0p),
                       .valid_out0 (valid_out0p)
);

// Cables de salida de flip flops
wire [7:0] out3pp, out2pp, out1pp, out0pp;
wire valid_out0pp, valid_out1pp, valid_out2pp, valid_out3pp;

//Última etapa de flip-flops clk1f

ff4in4o ff3e (    .clk   (clk1f),
                  .reset (reset),
                  .in0   (out0p),
                  .in1   (out1p),
                  .in2   (out2p),
                  .in3   (out3p),
                  .out0  (out0pp),
                  .out1  (out1pp),
                  .out2  (out2pp),
                  .out3  (out3pp)
);

ff4in4om ff3 (    .clk   (clk1f),
                  .reset (reset),
                  .in0   (valid_out0p),
                  .in1   (valid_out1p),
                  .in2   (valid_out2p),
                  .in3   (valid_out3p),
                  .out0  (valid_out0pp),
                  .out1  (valid_out1pp),
                  .out2  (valid_out2pp),
                  .out3  (valid_out3pp)
);



always @ (*) begin
  out0 = out0pp;
  out1 = out1pp;
  out2 = out2pp;
  out3 = out3pp;
  valid_out0 = valid_out0pp;
  valid_out1 = valid_out1pp;
  valid_out2 = valid_out2pp;
  valid_out3 = valid_out3pp;
end


endmodule