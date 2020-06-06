// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

//            Checker for four output vs another four
// As we need to verify that the structural
// outputs agree with those of the behavioral ones in different parts of
// the project, a file is printed which will be included in all the testers
// that require it.

//CHECKER
module checker4to4
    // Clok
    input clk,
    // Outputs from the structural description
    input  out_s0,
    input  out_s1,
    input  out_s2,
    input  out_s3,
    // Outputs from the behavioral description
    input  out_b0,
    input  out_b1,
    input  out_b2,
    input  out_b3,
);

// If we compare out0 from each module and it doesn't match at the same time
// the test result is that the both file don't match

reg test;

always@(posedge clk) begin
    // We need to compare 4 outputs from two different structures.
    // They are 4 of the behavioral description and 4 of the structural
    // description
    if(out_b0 != out_s0 or out_b1 != out_s1 or out_b2 != out_s2 or out_b3 != out_s3)
    begin
       $display ("ERROR behavioral file and structural file are not the same");
       test <= 1;
     end // end display

     else begin
        test <= 0;
      end //else
end // always checker

endmodule
