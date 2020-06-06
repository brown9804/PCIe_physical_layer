// Michelle Gutiérrez 
// Cicuitos Digitales 2 - Proyecto1
// Tester paralelltoserial



module t_ptos (
   
output reg [7:0] in,
output reg in_valid,
output reg reset,
output reg clk,
output reg clk4f,
output reg clk32f,
input wire outc,
input wire outs

);
reg clk8f, clk16f;

initial begin
		$dumpfile("ptos.vcd");	
		$dumpvars;			
	    	
		 in_valid = 0;
		 reset <= 0;

		repeat (5) begin			// checking reset
		@(posedge clk4f);
		in <= 'hFF;		
		#4 reset <= 0;
		 
		end
		
		@(posedge clk4f);
		#10 reset <= 1;

		repeat (4) begin			// insert BC 10111100 x4 because Valid = 0	
       		 @(posedge clk4f);	
			in <= 8'hFF;
		end
	

		@(posedge clk4f);	
		    in <= 8'hAA;
			in_valid <= 1;	
	

        	repeat (2) begin			// 1110 1110
		@(posedge clk4f);	
		    in <= 8'hEE;
	
		end
    
		@(posedge clk4f);	
		    in <= 8'hCC;
			in_valid <= 0;	
		

		@(posedge clk4f);	
		    in <= 8'hBB;	
			in_valid <= 1;			
        		
		$finish;		
	end

// clks 

	initial clk32f <= 0;
    initial clk16f <= 0;
    initial clk8f <= 0;
    initial clk4f <= 0;
    


    // Faster frequency
    always @(posedge clk) begin
		clk32f <= ~clk32f; // if was LOW change to HIGH
        end 
    //////////////////////////////
    // For 16 Hz
    always @(posedge clk32f) begin
        clk16f <= ~clk16f; // if was LOW change to HIGH
        end
    //////////////////////////////
    // For 8 Hz
    always @(posedge clk16f) begin
            clk8f <= ~clk8f; // if was LOW change to HIGH
    end
    //////////////////////////////
    // For 4 Hz
    always @(posedge clk8f) begin
        clk4f <= ~clk4f; // if was LOW change to HIGH
        end
   

  
	 // clock logic
	
	initial	clk	 				<= 0;			// Initial value to avoid indeterminations
	always	#5 	clk			<= ~clk;		// toggle every 2ns
	

endmodule
