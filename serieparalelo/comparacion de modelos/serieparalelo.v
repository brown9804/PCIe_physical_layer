`timescale 1ns / 1ps
`include "cmos_cells.v" 

//////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R E.I.E
// Engineer: Brandon Esquivel Molina
// 
// Create Date: 26.05.2020
// Design Name: Serial to parallel Module 
// Module Name: Serial to parallel Module 
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


module serieparalelo(
    
    // INPUTS
    input wire in,                          // entradas de 1 bit a 32f
    input wire clk32f,                      // f max
    input wire clk4f,                       // f del paralelo 32f/8 datos = 4f
    input wire reset,
    // OUTPUTS
    output reg [7:0] out,
    output reg valid                            // salida dato valido
);   
    // INTERNAL/AUXILIARY
    reg [7:0] register;             // registro de datos de entrada a enviar
    reg [3:0] BC_counter;           // contador de Palabras BC 
    reg active;                     // indica comunicación activa entre los modulos
    reg valido;                      // valid del dato de salida
    
    always @( posedge clk32f ) begin
        if (~reset) begin
            register    <=  0;
        end else begin 
            register  <=  {register[6:0], in};  // registro desplazando bit a bit de entrada
        end
    end



    // POSEDGE CLKS
    always @(posedge clk4f) begin
        if (~reset) begin
            BC_counter   <=  0;          // condicion de reset para contador de BC
            valido       <=  0;          // set del valido de salida       
            out          <=  0;          // salida a cero 
        end else begin

        // contador de BC 
        if (register == 'hBC) begin
                if (~active) begin                  // si no hay active
                    BC_counter  <= BC_counter + 1;  // contador aumenta
                end
            end else begin
                BC_counter  <= BC_counter;          // se cumple la condicion de active, se mantiene BC = 4
            end

    // Condicional para valid
        if(active && register != 'hBC) begin        // si hay active y el registro indica una palabra diferente de BC
                valido = 1;                          // se valida el dato/palabra
            end else begin
                valido = 0;                          // en otro caso, no
            end

    // Salidas         
    if ( valido ) begin
        out <= register;                          // Trasegando dato
        valid <= 1;
        end else begin
            out <= out;                             // mantiene ultimo valor de salida en caso de valid = 0
            valid <= 0;
        end
    end
end

// inicia logica combinacional
always @(*) begin                   // logica para la senal de active
if(BC_counter >= 4) begin      // cuando se llega a 4 BC se activa active, en otro contador es cero, esto indica el control para el inicio de envio de palabras
    active = 1;
end else begin
     active = 0;
        end
    end

endmodule                   // serieparalelo
