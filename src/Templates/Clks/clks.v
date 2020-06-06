// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

//            Clocks at different frequency
// Needed clk at 1 Hz, clk at 2 Hz, clk at 4 Hz and clk 32 Hz

module clks(
    output reg clk1f,
    output reg clk2f,
    output reg clk4f,
    output reg clk32f,
    input clk,
    input reset);

    // Considering that we need a clock at 32 times the original frequency,
    // we start from a clk to a frequency, twice the clk2f will go, twice t
    // he clk2f frequency goes the 4f clock and so on until we obtain a frequency
    // of 32 Hz for this reason we have two regs that allow these sequences to be
    // performed. One for clk at 8 Hz and one for 16 Hz
    reg clk8f;
    reg clk16f;

    // Faster frequency
    always @(posedge clk) begin
        if (reset == 0) begin
            clk32f <= 0;
        end // end reset == 0

        else begin // reset == 1
            clk32f <= ~clk32f; // if was LOW change to HIGH
        end // end reset == 1
    end
    //////////////////////////////
    // For 16 Hz
    always @(posedge clk32f) begin
        if (reset == 0) begin
            clk16f <= 0;
        end // end reset == 0

        else begin // reset == 1
            clk16f <= ~clk16f; // if was LOW change to HIGH
        end // end reset == 1
    end
    //////////////////////////////
    // For 8 Hz
    always @(posedge clk16f) begin
        if (reset == 0) begin
            clk8f <= 0;
        end // end reset == 0

        else begin // reset == 1
            clk8f <= ~clk8f; // if was LOW change to HIGH
        end // end reset == 1
    end
    //////////////////////////////
    // For 4 Hz
    always @(posedge clk8f) begin
        if (reset == 0) begin
            clk4f <= 0;
        end // end reset == 0

        else begin // reset == 1
            clk4f <= ~clk4f; // if was LOW change to HIGH
        end // end reset == 1
    end
    //////////////////////////////
    // At 2 Hz
    always @(posedge clk4f) begin
        if (reset == 0) begin
            clk2f <= 0;
        end // end reset == 0

        else begin // reset == 1
            clk2f <= ~clk2f; // if was LOW change to HIGH
        end // end reset == 1
    end

    //////////////////////////////
    // At 1 HZ
    always @(posedge clk2f) begin
        if (reset == 0) begin
            clk1f <= 0;
        end // end reset == 0

        else begin // reset == 1
            clk1f <= ~clk1f; // if was LOW change to HIGH
        end // end reset == 1
    end

endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
