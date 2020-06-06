`include "./testers/tester.v"
`include "./src/serie_paralelo_IDLE.v"
`include "./syn/serie_paralelo_IDLE_syn.v"
`include "./lib/cmos_cells.v"

module bancoPruebas();
    wire in;
    wire outc;
    wire outs;
    wire reset;
    wire clk4f;
    wire clk32f;

tester Probador(
                    .outc(outc),
 		    .outs(outs),
                    .in(in),
                    .clk4f(clk4f),
                    .clk32f(clk32f),
                    .reset(reset)
              
 );

serieparalelo_IDLE spc (
                    .in(in),
                    .clk32f(clk32f),
                    .clk4f(clk4f),
                    .reset(reset),
                    .valido(outc)
            
);

serieparalelo_IDLE_struct sps (
                    .in(in),
                    .clk32f(clk32f),
                    .clk4f(clk4f),
                    .reset(reset),
                    .valido(outs)
                
);
endmodule
