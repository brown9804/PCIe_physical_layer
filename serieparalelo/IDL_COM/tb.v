`include "tester.v"
`include "serieparalelo.v"

module bancoPruebas();
    wire in;
    wire out;
    wire outs;
    wire reset;
    wire clk4f;
    wire clk32f;

tester Probador(
                    .out(out),
 		    .outs(outs),
                    .in(in),
                    .clk4f(clk4f),
                    .clk32f(clk32f),
                    .reset(reset)
              
    );

serieparaleloIDL spc (
                    .in(in),
                    .clk32f(clk32f),
                    .clk4f(clk4f),
                    .reset(reset),
                    .valido(out)
            
);

serieparaleloIDL sps (
                    .in(in),
                    .clk32f(clk32f),
                    .clk4f(clk4f),
                    .reset(reset),
                    .valido(outs)
                
);
endmodule
