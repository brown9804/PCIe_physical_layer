// Michelle Gutiérrez
// Cicuitos Digitales 2 - Proyecto1
// Tester paralelltoserial_IDLE



module t_ptos_idle (


output reg active,
output reg reset,
output reg clk,
output reg clk1f,
output reg clk2f,
output reg clk4f,
output reg clk8f,
output reg clk16f,
output reg clk32f,
input wire out,
input wire out_s

);


initial begin
		$dumpfile("ptos_idle.vcd");
		$dumpvars;
	    active = 0;
		repeat (3) begin
		@(posedge clk4f);
		reset <= 0;
		end

		@(posedge clk4f);
		reset <= 1;

		repeat (2) begin
        @(posedge clk4f);
			active <= 0;
		end
		repeat (2) begin
		@(posedge clk4f);
			active <= 0;
		end
        repeat (2) begin
		@(posedge clk4f);
			active <= 1;
		end
        repeat (3) begin
		@(posedge clk4f);
			active <= 1;
		end
        repeat (2) begin
		@(posedge clk4f);
			active <= 1;
		end
        repeat (2) begin
		@(posedge clk4f);
			active <= 1;
		end
        repeat (2) begin
		@(posedge clk4f);
			active <= 1;
		end
        repeat (2) begin
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
