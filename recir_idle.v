// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

// Recirculation block if not IDLE

// After an exhaustive search for information, the behavior of the
// idle_stand recirculation block is analyzed, which if we make a finite
// tester machine (FSM), such as a semaphore, the status of two reqs
// is expected. A input from serial parallel where it is contemplated that
// if the reset is active, the tester to be implemented is assigned
// (by means of a non-blocking assignment), the idle_stand which is known
// as a standard signal. If you consider four outputs for the ff 8buts + 1 valid block

module recir_idle (
  input  clk,
  input reset,
  // Serial Parallel
  input wire sp,
  // For ff 8buts + 1 valid
  output reg ff0,
  output reg ff1,
  output reg ff2,
  output reg ff3
  );

 reg [8:0] recirblock;
 reg [8:0] go;

 // Assign standar singnals
 idle_stand = 9'b001
 ff0_stand = 9'b010
 ff1_stand = 9'b011
 ff2_stand = 9'b100
 ff3_stand = 9'b101  

always @ (recirblock or sp)
 begin
    go = 9'b000;

    case(recirblock)
      idle_stand: begin
          if (sp == 1)
            begin
              go = ff0_stand;
            end // end if

          else begin
             go = idle_stand;
           end // end else
        end // end case idle_stand

      ff0_stand: begin
        if (sp == 1)
          begin
            go = ff0_stand;
          end // end if

        else begin
            go = idle_stand;
        end // end else
       end // end ff0_stand

       ff1_stand: begin
        if (sp == 1)
          begin
            go = ff1_stand;
          end // end if

          else begin
            go = idle_stand;
          end // end else
        end // end ff1_stand

        ff2_stand: begin
          if (sp == 1)
            begin
              go = ff2_stand;
            end // end if

          else begin
              go = idle_stand;
          end // end else
         end // end ff2_stand

         ff3_stand: begin
          if (sp == 1)
            begin
              go = ff3_stand;
            end // end if

            else begin
              go = idle_stand;
            end // end else
          end // end ff3_stand

      // Because we use case we need a default case
      default: begin
        go = idle_stand;
      end // end default
    endcase
  end // end always @ (recirblock or sp) block

always @ (posedge clock)
  begin
    if (reset == 1)
      begin
        recirblock <=  #1 idle_stand;
      end // end if

      else begin
        recirblock <=  #1  go;
      end // end else
  end // end always @ (posedge clock)

always @ (posedge clock)
  begin
    if (reset == 1)
    begin
      ff0 <=  #1  0;
      ff1 <=  #1  0;
      ff2 <=  #1  0;
      ff3 <=  #1  0;
    end // end if

    else begin
    case(recirblock)
      idle_stand: begin
          ff0 <=  #1  0;
          ff1 <=  #1  0;
          ff2 <=  #1  0;
          ff3 <=  #1  0;
      end // end case idle

      ff0_stand : begin
          ff0 <=  #1  1;
          ff1 <=  #1  0;
          ff2 <=  #1  0;
          ff3 <=  #1  0;
      end // end case ff0

      ff1_stand : begin
          ff0 <=  #1  0;
          ff1 <=  #1  1;
          ff2 <=  #1  0;
          ff3 <=  #1  0;
      end // end case gnt1

      ff2_stand : begin
          ff0 <=  #1  0;
          ff1 <=  #1  0;
          ff2 <=  #1  1;
          ff3 <=  #1  0;
      end // end case gnt1

      ff3_stand : begin
          ff0 <=  #1  0;
          ff1 <=  #1  0;
          ff2 <=  #1  0;
          ff3 <=  #1  1;
      end // end case gnt1


    // Same as upsters, if we use case we need a default statemnet
    default : begin
       ff0 <= #1 0;
       ff1 <= #1 0;
       ff2 <= #1 0;
       ff3 <= #1 0;
    end // end default
    endcase // else case(recirblock)
  end // end reset == 0
 end // always  @ (posedge clock)

endmodule
