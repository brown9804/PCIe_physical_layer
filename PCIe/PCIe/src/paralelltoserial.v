// Michelle Gutiérrez
// Cicuitos Digitales 2 - Proyecto1
// Paralelltoserial

// Recibe bus de 8 bits (clk4k) y devuelve bits del bus (clk32f)

module paralelo_a_serial (

input wire [7:0] in,
input wire in_valid,
input wire reset,
input wire clk32f,
output reg out
);



reg in0, in1, in2, in3, in4, in5, in6, in7;
reg dataflux1, dataflux2;
reg [2:0] selector;

// Si el dato es valido se llenan los bits del bus y sino se pasa BC
 always @ (*)
        if(in_valid == 1)
        {in0, in1, in2, in3, in4, in5, in6, in7} = in;
        else begin
        {in0, in1, in2, in3, in4, in5, in6, in7} = 'hBC;
        end

always @(posedge clk32f)begin
        if (reset == 0)
        begin
        out <= 0;
        selector <= 3'b111;
        dataflux1 <= 0;
        dataflux2 <= 0;
        end
        else begin
        // Lógica para cuando reset == 1
        selector <= selector + 1;
        case (selector)
        3'b000: dataflux1 <= in0;
        3'b001: dataflux1 <= in1;
        3'b010: dataflux1 <= in2;
        3'b011: dataflux1 <= in3;
        3'b100: dataflux1 <= in4;
        3'b101: dataflux1 <= in5;
        3'b110: dataflux1 <= in6;
        3'b111: dataflux1 <= in7;
        endcase
        dataflux2 <= dataflux1;
        out <= dataflux2;
    end
end

endmodule 
