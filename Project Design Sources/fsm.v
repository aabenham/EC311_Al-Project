`timescale 1ns / 1ps


module fsm(
        input clock,
        input [31:0] fsm_in,
        input [23:0] bits,
        output [6:0] out,
        output reg [7:0] anode       
    );
      
    //these go into decoder
    reg [3:0] four_bit_number;
    reg [2:0] mux_in;
    
    // instantiate decoder that decodes the four bit number into the cathode
    decoder fsm_decoder1(.fsm_in(four_bit_number),.bits(mux_in),.out(out));
       
    reg [2:0] state; // stores state of FSM , up to 8 states for 8 anodes
    initial begin
		state = 0;
		anode = 8'b11111111;
	end
    
    always @(posedge clock)
	begin
		
		state = state + 1;
		
		case (state)
            0: anode = 8'b11111110; 
            1: anode = 8'b11111101; 
            2: anode = 8'b11111011; 
            3: anode = 8'b11110111;   
            4: anode = 8'b11101111; 
            5: anode = 8'b11011111; 
            6: anode = 8'b10111111; 
            7: anode = 8'b01111111; //left most
            default: anode = 8'b11111111; //all off
        endcase
		
		case (state) //responsible for value into decoder
            7: four_bit_number = fsm_in[3:0]; // out of leftmost if first inputed
            6: four_bit_number = fsm_in[7:4]; //   
            5: four_bit_number = fsm_in[11:8]; // 
            4: four_bit_number = fsm_in[15:12];// 
            3: four_bit_number = fsm_in[19:16]; //
            2: four_bit_number = fsm_in[23:20]; //
            1: four_bit_number = fsm_in[27:24]; //
            0: four_bit_number = fsm_in[31:28]; //       
            
            default: four_bit_number = 4'b0000; 
        endcase
        
        case (state) //responsible for changing how decoder works
            7: mux_in = bits[2:0];
            6: mux_in = bits[5:3];
            5: mux_in = bits[8:6];
            4: mux_in = bits[11:9];
            3: mux_in = bits[14:12];
            2: mux_in = bits[17:15];
            1: mux_in = bits[20:18];
            0: mux_in = bits[23:21];
        endcase     
              
	end
    
endmodule
