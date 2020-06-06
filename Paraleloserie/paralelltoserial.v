`timescale 1ns/1ps


module paralelo_a_serial (

input wire [7:0] in,
input wire in_valid,
input wire reset,
input wire clk32f,
output reg out
);

reg in0, in1, in2, in3, in4, in5, in6, in7; //dataflux1;
reg [2:0] selector;

// Si el dato es valido se llenan los bits del bus y sino se pasa BC
 always @ (*)
        if(in_valid == 1) begin
        {in0, in1, in2, in3, in4, in5, in6, in7} <= in;
        end else begin
        {in0, in1, in2, in3, in4, in5, in6, in7} <= 'hBC;
        end

always @(posedge clk32f)begin
        if (~reset) 
        begin
        out <= 0;
        selector <= 3'b000;
        //dataflux1 <= 0;
        end
        
        else begin 
        // Lógica para cuando reset == 1
        selector <= selector + 1;
        case ({selector})
        3'b000: out <= in0;
        3'b001: out <= in1;
        3'b010: out <= in2;
        3'b011: out <= in3;
        3'b100: out <= in4;
        3'b101: out <= in5;
        3'b110: out <= in6;
	default: out <= in7;
        endcase
 	   
    end
end

/*always @ (posedge clk32f) begin
out <= dataflux1;
end*/


endmodule 
