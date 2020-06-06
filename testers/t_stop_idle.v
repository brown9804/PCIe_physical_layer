//////////////////////////////////////////////////////////////////////////////////
// Company: U.C.R, EIE
// Engineer: Brandon Esquivel Molina
// 
// Create Date: 26.05.2020
// Design Name: Serial to parallel Module 
// Project Name: PHY Layer PCIe
// Target Devices: PCIe
// Tool Versions: Yosys 0.9 Iverolg release at 2020
// Description: tester for Serial to parallel module
// Dependencies: 
// 
// Revision: 1.0  All good
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////


module tester(
    input wire outc,           // salida paralela de bus de 8 bits + valid
    input wire outs,  
    input wire valid,               // + valid
    output reg in,                  // entrada bit a bit serial
    output reg reset,               // reset
    output reg clk32f,              // frecuencia mas rapida, de recepcion
    output reg clk4f                // frecuencia de envio

);
    
    // AUXILIARES
    reg clk16f;
    reg clk8f;
    reg clk2f;
    reg clk1f;
    reg clk;
    
    initial begin
		$dumpfile("stop_idle.vcd");																						// "dump" file
	$dumpvars;
	
        // reset 
        repeat(2) begin
        @(posedge clk32f);
        end
        @(posedge clk32f);
        reset = 1;                                
        repeat(2) begin
        @(posedge clk32f);
        end

        // pruebas 

        repeat(3) begin         // 01010101  -> NO HAY ACTIVE YA QUE BC < 4
        @(posedge clk32f);
        in  <=  ~in;
        end


        repeat(4) begin         // BC = 10 1111 00        
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  0;
        end
        
        // EN ESTE PUNTO SE TIENEN 4 BC > ACTIVE = 1 Y SE RECIBE UNA PALABRA valida
        repeat(16) begin         // 10101010 -> AA 
        @(posedge clk32f);
        in  <=  ~in;
        end

        // Nueva palabra a enviar  -> EE -> 11101110
      @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;


            // Nueva palabra a enviar FF 11111111
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
	


        repeat(4) begin         // BC = 10 1111 00        
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  1;
        @(posedge clk32f);
        in  <=  0;
        @(posedge clk32f);
        in  <=  0;
        end


        $finish;
    end


	// Initial Values
	initial in			= 1'b0;	
	initial reset 		= 0;

	// clock logic
	initial	clk	 	    = 0;			// Initial value to avoid indeterminations
	always	#1 clk	    = ~clk;		// toggle every 1ns

	// clks 

	initial clk32f <= 0;
    initial clk16f <= 0;
    initial clk8f <= 0;
    initial clk4f <= 0;
    initial clk2f <= 0;
    initial clk1f <= 0;

	

	// checker
reg test;

always@(posedge clk) begin
    if(outc != outs)
    begin
       test <= 0;
     end // end display

     else begin
        test <= 1;
      end //else
end // always checker



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

endmodule // t_mux42
