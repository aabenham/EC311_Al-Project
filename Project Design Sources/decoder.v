`timescale 1ns / 1ps

module decoder(
    input [3:0]fsm_in,
    input [2:0]bits,
    output reg[6:0] out //this is connected to the 7-seg display.

    );
            
       always @(*)
        begin 
            case(bits)
            
                 0:case(fsm_in)
                    4'b0000: out = 7'b1111111; //this is a special case where fsm_in is 0 and bits is 0, we turn all segments off
                    default: out = 7'b1111111;
                    endcase
                 
                 1:case(fsm_in)   // Level 0  dot = 0, dash = 1        
                     4'b0001: out = 7'b1110000; // T or DASH or 1
                     4'b0000: out = 7'b0110000; // E or Dot or          
                     default: out = 7'b1111111; // ALL SEGMENTS OFF
                 endcase
                 2: case(fsm_in)   // Level 1      
                     4'b0011: out = 7'b0010101; // M               
                     4'b0001: out = 7'b0001001; // N 
                     4'b0010: out = 7'b0001000; // "A" ABCEFG(segments A,B,C,E,F,G are ON )  
                     4'b0000: out = 7'b1111001; // I                
                     default: out = 7'b1111111; // ALL SEGMENTS OFF
                 endcase
                 3: case(fsm_in)   // Level 2      
                         4'b0111: out = 7'b0000001; // O               
                         4'b0011: out = 7'b0100001; // G 
                         4'b0101: out = 7'b0101000; // K  
                         4'b0001: out = 7'b1000010; // D                         
                         4'b0000: out = 7'b0100100; // S               
                         4'b0100: out = 7'b1000001; // U
                         4'b0010: out = 7'b1111010; // R 
                         4'b0110: out = 7'b1010101; // W
                         default: out = 7'b1111111; // ALL SEGMENTS OFF
                 endcase
                 4: case(fsm_in)   // Level 3      
                         4'b1011: out = 7'b0001100; // Q               
                         4'b0011: out = 7'b0010010; // Z 
                         4'b1101: out = 7'b1000100; // Y  
                         4'b0101: out = 7'b0110001; // C                         
                         4'b1001: out = 7'b0110110; // X               
                         4'b0001: out = 7'b1100000; // B  //flipped
                         4'b1110: out = 7'b1000111; // J 
                         4'b0110: out = 7'b0011000; // P   
                         4'b0010: out = 7'b1110001; // L               
                         4'b0100: out = 7'b0111000; // F 
                         4'b1000: out = 7'b1100111; // V  
                         4'b0000: out = 7'b1001000; // H                         
                        default: out = 7'b1111111; // ALL SEGMENTS OFF
                 endcase    
             endcase
         end
endmodule
