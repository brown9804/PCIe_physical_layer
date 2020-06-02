module t_demux2_4( 
//INPUTS 
output reg  [7:0] in0,
output reg  clk,
output reg  reset,
output reg  valid_in0,
output reg  [7:0] in1,
output reg  valid_in1,

//OUTPUTS
input wire [7:0] out0,
input wire valid_out0,
input wire [7:0] out1,
input wire valid_out1,
input wire [7:0] out2,
input wire valid_out2,
input wire [7:0] out3,
input wire valid_out3
);
   


	initial begin
		$dumpfile("demux2_4.vcd");	
		$dumpvars;			
	
		in0 = 7'b0; 
		#3reset = 0;
		valid_in0 = 0;
		repeat (2) begin		
        @(posedge clk);	
			in0 <= 7'b1;
			reset <= 0;	
			valid_in0 <= 0;	
            in1 <= 7'b1;
			valid_in1 <= 0;	

		end
		repeat (2) begin
		@(posedge clk);	
		    in0 <= 7'b0;
			reset <= 0;	
			valid_in0 <= 1;	
            in1 <= 7'b1;
			valid_in1 <= 0;	
		end
        repeat (2) begin
		@(posedge clk);	
		    in0 <= 7'b0;
			reset <= 1;	
			valid_in0 <= 1;	
            in1 <= 7'b1;
			valid_in1 <= 1;		
		end
        repeat (3) begin
		@(posedge clk);	
		    in0 <= 7'b1;
			reset <= 1;
			valid_in0 <= 1;	
            in1 <= 7'b0;
			valid_in1 <= 1;	
		end
        repeat (2) begin
		@(posedge clk);	
		    in0 <= 7'b0;
			reset <= 1;	
			valid_in0 <= 1;
            in1 <= 7'b1;
			valid_in1 <= 1;				
		end
        repeat (2) begin
		@(posedge clk);	
		    in0 <= 7'b1;
			reset <= 1;	
			valid_in0 <= 1;
            in1 <= 7'b1;
			valid_in1 <= 1;				
		end
        repeat (2) begin
		@(posedge clk);	
		    in0 <= 7'b0;
			reset <= 1;	
			valid_in0 <= 1;	
            in1 <= 7'b1;
			valid_in1 <= 1;			
		end
        repeat (2) begin
		@(posedge clk);	
		    in0 <= 7'b1;
			reset <= 1;	
			valid_in0 <= 1;	
            in1 <= 7'b1;
			valid_in1 <= 0;			
		end
		$finish;		
	end

 // Reloj
	initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre sera indeterminado
	always	#2 clk 	<= ~clk;		// Hace "toggle" cada 2*10ns


 endmodule