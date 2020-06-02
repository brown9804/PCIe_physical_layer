module t_demuxf( 
//INPUTS 
output reg [7:0] in0,
output reg clk,
output reg reset,
output reg in0_valid,

//OUTPUTS
input wire [7:0] out0,
input wire [7:0] out1,
input wire valid_out0,
input wire valid_out1,
input wire [7:0] out0s,
input wire [7:0] out1s,
input wire valid_out0s,
input wire valid_out1s
);
   


	initial begin
		$dumpfile("demuxf.vcd");	
		$dumpvars;			
	
		in0 = 7'b0; 
		#3reset = 0;
		in0_valid = 0;
		repeat (2) begin		
        @(posedge clk);	
			in0 <= 7'b1;
			reset <= 0;	
			in0_valid <= 0;	
		end
		repeat (2) begin
		@(posedge clk);	
		    in0 <= 7'b0;
			reset <= 0;	
			in0_valid <= 1;	
		end
        repeat (2) begin
		@(posedge clk);	
		    in0 <= 7'b0;
			reset <= 1;	
			in0_valid <= 1;		
		end
        repeat (3) begin
		@(posedge clk);	
		    in0 <= 7'b1;
			reset <= 1;
			in0_valid <= 1;	
		end
        repeat (2) begin
		@(posedge clk);	
		    in0 <= 7'b0;
			reset <= 1;	
			in0_valid <= 1;			
		end
        repeat (2) begin
		@(posedge clk);	
		    in0 <= 7'b1;
			reset <= 1;	
			in0_valid <= 1;			
		end
        repeat (2) begin
		@(posedge clk);	
		    in0 <= 7'b0;
			reset <= 1;	
			in0_valid <= 1;			
		end
        repeat (2) begin
		@(posedge clk);	
		    in0 <= 7'b1;
			reset <= 1;	
			in0_valid <= 1;			
		end
		$finish;		
	end

 // Reloj
	initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre sera indeterminado
	always	#2 clk 	<= ~clk;		// Hace "toggle" cada 2*10ns


 endmodule