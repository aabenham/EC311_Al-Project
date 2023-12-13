`timescale 1ns / 1ps



module top_module(
    input clock,
    input btn1,
    input btn2,
    input btn3,
    input btn4,
    input btn5,
    output[7:0] anode,
    output[6:0] out

    );
    
       wire fsm_clock;
       wire [31:0]fsm_in;
       wire [23:0] bits;
       
       
       wire db_out1;
       wire db_out2;
       wire db_out3;
       wire db_out4;
       wire db_out5;
       
       pushbutton db1(
       .button(btn1),
       .clk_in(clock),
       .decounce_out(db_out1)
       );
       
       pushbutton db2(
       .button(btn2),
       .clk_in(clock),
       .decounce_out(db_out2)
       );
       
       pushbutton db3(
       .button(btn3),
       .clk_in(clock),
       .decounce_out(db_out3)
       );
       
       pushbutton db4(
       .button(btn4),
       .clk_in(clock),
       .decounce_out(db_out4)
       );
       
       pushbutton db5(
       .button(btn5),
       .clk_in(clock),
       .decounce_out(db_out5)
       );
      
        
    
     morse2text M2T (
        .clock(clock),
        .btn1(db_out1), 
        .btn2(db_out2), 
        .btn3(db_out3),
        .btn4(db_out4), 
        .btn5(db_out5),
        .fsm_in(fsm_in),
        .bits(bits)
     );
     
     faster_clock_divider faster_clock_divider (
            .in_clk(clock),
            .out_clk(fsm_clock)
        );
     
     fsm fsm1 (
        .clock(fsm_clock),
        .fsm_in(fsm_in),
        .bits(bits),
        .out(out),
        .anode(anode)
    );

endmodule
