
module top_module_tb;
  reg clock;
  reg btn1, btn2, btn3, btn4,btn5;
  wire [7:0] anode;
  wire [6:0] out;

  // Instantiate the top module
  
  /* Note: When running this test bench, change the clock of the fsm from fsm_clock to clock.
   Also change the input of the morse2text to be btn1, btn2, btn3, btn4, btn5 instead of db_out1, 
   db_out2, db_out3, db_out4, db_out5. We do this since it is hard to have multiple speed clocks
   in our testbench and hard to simulate debouncing of a button, so we do this to make the simulation
   simple and easier to read
  
  */
  top_module uut (
    .clock(clock),
    .btn1(btn1),
    .btn2(btn2),
    .btn3(btn3),
    .btn4(btn4),
    .btn5(btn5),
    .anode(anode),
    .out(out)
  );

  // Clock generation
  always begin
    #5 clock = ~clock; // Toggle the clock every 5 time units
  end

  // Stimulus
  initial begin
    clock = 0;
    btn1 = 0;
    btn2 = 0;
    btn3 = 0;
    btn4 = 1;
    btn5 = 0;
    
    

    // Apply some inputs
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0; 
    #10 btn1 = 0; btn2 = 1; btn3 = 0; btn4 = 0;
    #10 btn1 = 0; btn2 = 0; btn3 = 1; btn4 = 0; //expected to be cathode of A
    
    #10 btn1 = 0; btn2 = 1; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 0; btn2 = 0; btn3 = 1; btn4 = 0; //expected to be cathode of B
    
    #10 btn1 = 0; btn2 = 1; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 0; btn2 = 1; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 0; btn2 = 0; btn3 = 1; btn4 = 0; //expected to be cathode of C
    
    #10 btn1 = 0; btn2 = 1; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 0; btn2 = 0; btn3 = 1; btn4 = 0; //expected to be cathode of D
    
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 0; btn2 = 0; btn3 = 1; btn4 = 0; //expected to be cathode of E
    
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 0; btn2 = 1; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 0; btn2 = 0; btn3 = 1; btn4 = 0; //expected to be cathode of F
    
    #10 btn1 = 0; btn2 = 1; btn3 = 0; btn4 = 0;
    #10 btn1 = 0; btn2 = 1; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 0; btn2 = 0; btn3 = 1; btn4 = 0; //expected to be cathode of G
    
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 0; btn2 = 0; btn3 = 1; btn4 = 0; //expected to be cathode of H
    
  
    
    //now checking for once it goes over
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 1; btn2 = 0; btn3 = 0; btn4 = 0;
    #10 btn1 = 0; btn2 = 0; btn3 = 1; btn4 = 0; //we want H to be on the far left anode and everything else empty or "7f"
    
    #10 btn3 =0;
    
    
    #10
    #10
    #10
    #10
    #10
    #10
    #10
    //testing backspace
    #10
    btn5 = 1;
    #10
    btn5 = 0; //this should delete "H"  or "30" in the tb, so basically the next cycle
    //should be all "7f"
    //this works as intended
    
    
    
    #10 btn1 = 0; btn2 = 0; btn3 = 0; btn4 = 0; btn5 = 0;
  

    // Add more test scenarios as needed

    #100 $finish; // Finish the simulation after 100 time units
  end

  
endmodule
