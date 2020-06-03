

module selector(
        input clk,
        input reset,
        output reg sel
    );



    // AUTOMATIC SELECTOR LOGIC
	always @(posedge clk) begin					// triggered at clk or by pressing the reset button

    if (~reset) begin
            sel <= 0;
		end else begin
			sel <= ~sel;				// make toggle at posedge clock
		end
	end  // posedge clock

endmodule