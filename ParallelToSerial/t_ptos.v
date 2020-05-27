// Michelle Gutiérrez 
// Cicuitos Digitales 2 - Proyecto1
// Tester paralelltoserial



module t_ptos (
   
output reg [7:0] in,
output reg in_valid,
output reg reset,
output reg clk,
output reg clk1f,
output reg clk2f,
output reg clk4f,
output reg clk8f,
output reg clk16f,
output reg clk32f,
input wire out
);


initial begin
		$dumpfile("ptos.vcd");	
		$dumpvars;			
	    in_valid = 0;
		in = 'hFF; 
		repeat (3) begin
		@(posedge clk4f);
		reset <= 0;
		end
		
		@(posedge clk4f);
		reset <= 1;

		repeat (2) begin		
        @(posedge clk4f);	
			in <= 8'hFF;
			in_valid <= 0;	
		end
		repeat (2) begin
		@(posedge clk4f);	
		    in <= 8'hDD;
			in_valid <= 0;	
		end
        repeat (2) begin
		@(posedge clk4f);	
		    in <= 8'hEE;
			in_valid <= 1;		
		end
        repeat (3) begin
		@(posedge clk4f);	
		    in <= 8'hCC;
			in_valid <= 1;	
		end
        repeat (2) begin
		@(posedge clk4f);	
		    in <= 8'hBB;	
			in_valid <= 1;			
		end
        repeat (2) begin
		@(posedge clk4f);	
		    in <= 8'h99;
			in_valid <= 1;			
		end
        repeat (2) begin
		@(posedge clk4f);	
		    in <= 8'hAA;
			in_valid <= 1;			
		end
        repeat (2) begin
		@(posedge clk4f);	
		    in <= 8'h88;
			in_valid <= 1;			
		end
		$finish;		
	end

// clks 

	initial clk32f <= 0;
    initial clk16f <= 0;
    initial clk8f <= 0;
    initial clk4f <= 0;
    initial clk2f <= 0;
    initial clk1f <= 0;


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
    //////////////////////////////
    // At 2 Hz
    always @(posedge clk4f) begin
        clk2f <= ~clk2f; // if was LOW change to HIGH
        end

    //////////////////////////////
    // At 1 HZ
    always @(posedge clk2f) begin
    clk1f <= ~clk1f; // if was LOW change to HIGH
 	end

	 // clock logic
	
	initial	clk	 				<= 0;			// Initial value to avoid indeterminations
	always	#2 	clk			<= ~clk;		// toggle every 2ns
	

endmodule
