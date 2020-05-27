// Demux 1:2 9 bits ( 8 bits + valid)


module demux1_2f (
    //parameter DATA = 8 // parametrización

    input clk, 
    input reset, 
    input [8:0] in0,
    output reg [8:0] out0,
    output reg [8:0] out1
);

reg selector;
    always @(posedge clk)begin

    selector <= selector + 1;
        
        if(reset == 0)begin
            out0 <= 0;
            out1 <= 0;
            selector <= 0;
        end
        else begin
            //Caso selector == 0
            if(selector == 0)begin
                if(in0[0] == 1)begin
                    out0 <= in0;
                end
                else begin
                    out0 <= 0;
                end
            end

            //Caso selector == 1
            else begin
               if(in0[0] == 1)begin
                    out1 <= in0;
                end
                else begin
                    out1 <= 0;
                end 
            end

        end
    end

endmodule