// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

//            Checker for two output vs another two
// As we need to verify that the structural
// outputs agree with those of the behavioral ones in different parts of
// the project, a file is printed which will be included in all the testers
// that require it.

//CHECKER
module checker2to2(
    // Outputs from the strctural description
    input  out_s0,
    input  out_s1,
    // Outputs from the behavioral description
    input  out_b0,
    input  out_b1,
    input clk,
);

// If we compare out0 from each module and it doesn't match at the same time
// the test result is that the both file don't match

reg test;

always@(posedge clk) begin
    if(out_b0 != out_s0 or out_b1 != out_s1)
    begin
       $display ("ERROR behavioral file and structural file are not the same");
       test <= 1;
     end // end display

     else begin
        test <= 0;
      end //else
end // always checker

endmodule
