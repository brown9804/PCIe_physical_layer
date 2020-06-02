// Michelle Gutiérrez 
// Cicuitos Digitales 2 - Proyecto1
// Demux 1:2

module demuxf (
    
    input clk, 
    input reset, 
    input [7:0] in0,
    input in0_valid,
    output reg [7:0] out0,
    output reg [7:0] out1,
    output reg valid_out0,
    output reg valid_out1
);

reg selector;

  //Selector automático
always @(posedge clk)begin
        if (~reset) begin
          selector <= 0;
          end
        else begin 
        selector <= ~selector;
        end
    end 

    always @(posedge clk)begin
        
        if(reset == 0)begin
            out0 <= 0;
            out1 <= 0;
            valid_out0 <= 0;
            valid_out1 <= 0;
        end
        else begin
            //Caso selector == 0
            if(selector == 0)begin
                if(in0_valid == 1)begin
                    out0 <= in0;
                    valid_out0 <= 1;
                end
                else begin
                    out0 <= 0;
                    valid_out0 <= 0;
                end
            end

            //Caso selector == 1
            else begin
               if(in0_valid == 1)begin
                    out1 <= in0;
                    valid_out1 <= 1;
                end
                else begin
                    out1 <= 0;
                    valid_out1 <= 0;
                end 
            end

        end
    end

endmodule

















