
module t_active(

    output reg in_rx_tx                 // entrada bit a bit serial

);
reg clk;
reg clk32f;    
reg reset;


    initial begin
   
 // reset 
        repeat(8) begin
        @(posedge clk32f);
        #4 reset <= 1;               
        end
        
        
        repeat(4) begin         // BC = 10 1111 00        
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  0;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  0;
        @(posedge clk32f);
        in_rx_tx  <=  0;
        end
        
        repeat(8) begin        
        @(posedge clk32f);
         in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  0;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  0;
        @(posedge clk32f);
        in_rx_tx  <=  0;
        end

        // Nueva palabra a enviar  -> EE -> 11101110
      repeat(64) begin 
      @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  0;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  0;


            // Nueva palabra a enviar FF 11111111
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
	
        end

     // BC = 10 1111 00 --> NOW VALIDO OFF
     repeat(2) begin         
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  0;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  1;
        @(posedge clk32f);
        in_rx_tx  <=  0;
        @(posedge clk32f);
        in_rx_tx  <=  0;
        end


        $finish;
    end


	// Initial Values
	initial in_rx_tx			<= 1'b0;	
    initial #4 reset               <= 0;
	// clock logic
	initial	clk	 	    <= 0;			// Initial value to avoid indeterminations
	always	#5 clk	    <= ~clk;		// toggle every 1ns

	// clks 

	initial clk32f <= 0;






    // Faster frequency
    always @(posedge clk) begin
		clk32f <= ~clk32f; // if was LOW change to HIGH
        end 
 

endmodule // t_mux42