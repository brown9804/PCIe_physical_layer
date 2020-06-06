// Michelle Gutiérrez 
// Cicuitos Digitales 2 - Proyecto1
// Tester paralelltoserial_IDLE



module t_ptos_idle (
   
  
output reg active,
output reg reset,
output reg clk32f,
input wire outc,
input wire outs

);
reg clk4f, clk8f, clk16f, clk;


initial begin
		$dumpfile("ptos_IDLE.vcd");	
		$dumpvars;						
	    	
		active <= 0;

		repeat (8) begin			// checking reset
		@(posedge clk4f);
		#4 reset <= 0; 
		end
		
		@(posedge clk4f);
		#10 reset <= 1;

		repeat (4) begin			// insert BC 10111100 x4 because Valid = 0	
       		 @(posedge clk4f);	
			active <= 1;
		end
	
		@(posedge clk4f);	
		    	active <= 0;
	

        	repeat (4) begin			// 1110 1110
		@(posedge clk4f);	
		    active <= 1;
	
		end
    
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

