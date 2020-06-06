// Michelle Gutiérrez 
// Cicuitos Digitales 2 - Proyecto1
// Paralelltoserial con IDLE

// Dependiendo del valor de la señal de active, envia de forma serial 7C O BC

module paralelo_a_serial_IDLE(

input wire active,
input wire reset,
input wire clk32f,
output reg out  
);



reg idle0, idle1, idle2, idle3, idle4, idle5, idle6, idle7;
reg [2:0] selector;

// Si el dato es valido se llenan los paquetes de bits y sino se pasa BC
 always @ (*)
        if(active == 1)
        {idle0, idle1, idle2, idle3, idle4, idle5, idle6, idle7} = 'h7C;
        else begin
        {idle0, idle1, idle2, idle3, idle4, idle5, idle6, idle7} = 'hBC;
        end

always @(posedge clk32f)begin
        if (reset == 0) 
        begin
        out <= 0;
        selector <= 3'b111;
        end
        else begin 
        // Lógica para cuando reset == 1
        selector <= selector + 1;
        case ({selector})
        3'b000: out <= idle0;
        3'b001: out <= idle1;
        3'b010: out <= idle2;
        3'b011: out <= idle3;
        3'b100: out <= idle4;
        3'b101: out <= idle5;
        3'b110: out <= idle6;
        default: out <= idle7;

        endcase
    end
end

endmodule 
