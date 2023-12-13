`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 01:00:47 PM
// Design Name: 
// Module Name: pushbutton
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module pushbutton(
    input button, clk_in,
    output decounce_out
    );
    
    wire clk_out;
    wire Q1, Q2, Q2_bar;
    
    slow_clock utt(clk_in, clk_out);
    D_FF d1(clk_out, button, Q1);
    D_FF d2(clk_out, Q1, Q2);
    
    assign Q2_bar = ~Q2;
    assign decounce_out = Q1 & Q2_bar;
    
endmodule

