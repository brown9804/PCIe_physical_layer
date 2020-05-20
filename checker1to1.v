// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

//            Checker for one output vs another one
// As we need to verify that the structural
// outputs agree with those of the behavioral ones in different parts of
// the project, a file is printed which will be included in all the testers
// that require it.

//CHECKER
module checker1to1 (
    input  out_s,
    input  out_b,
    input clk,
);

reg tester;

always@(posedge clk) begin
    if(out_b != out_s)
    begin
       $display ("ERROR behavioral file and structural file are not the same");
       test <= 1;
     end // end display

     else begin
        test <= 0;
      end //else
end // always checker

endmodule
