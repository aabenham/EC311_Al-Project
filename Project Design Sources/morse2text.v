`timescale 1ns / 1ps

module morse2text(
    input clock,
    input btn1,
    input btn2,
    input btn3,
    input btn4, //reset button
    input btn5,
    output reg [31:0] fsm_in,
    output reg [23:0] bits
);

    reg [3:0] temp_fsm_in;
    reg [1:0] ii;
    reg [2:0] temp_bits;
    
    reg [31:0] all;
    reg [23:0] all_bits; 
    
    reg [2:0] btn3_num; 

    // Previous state registers
    reg prev_btn1, prev_btn2, prev_btn3, prev_btn4, prev_btn5;

    // Initial block to initialize the previous state registers
    initial begin
        prev_btn1 = 0;
        prev_btn2 = 0;
        prev_btn3 = 0;
        prev_btn4 = 0;
        prev_btn4 = 5;
        ii = 0;
        temp_bits = 3'b000;
        temp_fsm_in = 4'b0000;
        all = 0;
        all_bits = 0;
        btn3_num = 3'b000;
    end
    
    always @(posedge clock) begin
        // Update the previous state registers
        prev_btn1 <= btn1;
        prev_btn2 <= btn2;
        prev_btn3 <= btn3;
        prev_btn4 <= btn4;
        prev_btn5 <= btn5;

        if (btn4 && !prev_btn4) begin // Reset on posedge of btn4
            // Reset logic
            ii = 0;
            temp_bits = 3'b000;
            temp_fsm_in = 4'b0000;
            all = 0;
            all_bits = 0;
            btn3_num = 3'b000;
            bits = 0; // so reset clears out anodes visually
        end

        if ((btn1 && !prev_btn1) || (btn2 && !prev_btn2)) begin
            temp_bits = temp_bits + 1;
        end
        
        //acounting for clicking over the limit
        if (temp_bits > 4)begin
            temp_bits = 1;
        end
        
        //accounting for going past the right most anode
        if (btn3_num == 0)begin
            all = 0; all_bits = 0; 
        end
        
        
        //encoding the dots and dashes to 0's and 1's
        if (btn1 && !prev_btn1) begin
            temp_fsm_in[ii] = 0;
            ii = ii + 1;
        end else if (btn2 && !prev_btn2) begin
            temp_fsm_in[ii] = 1;
            ii = ii + 1;
        end else if (btn3 && !prev_btn3) begin 
                
                case (btn3_num)
                    0:begin all[3:0] = temp_fsm_in; all_bits[2:0] = temp_bits;end
                    1:begin all[7:4] = temp_fsm_in; all_bits[5:3] = temp_bits; end
                    2:begin all[11:8] = temp_fsm_in; all_bits[8:6] = temp_bits; end
                    3:begin all[15:12] = temp_fsm_in; all_bits[11:9] = temp_bits; end
                    4:begin all[19:16] = temp_fsm_in; all_bits[14:12] = temp_bits; end
                    5:begin all[23:20] = temp_fsm_in; all_bits[17:15] = temp_bits; end
                    6:begin all[27:24] = temp_fsm_in; all_bits[20:18] = temp_bits; end
                    7:begin all[31:28] = temp_fsm_in; all_bits[23:21] = temp_bits; end
                endcase
                
                
                btn3_num = btn3_num + 1; //increment population index
                
                //assign output to temp registers
                fsm_in = all;
                bits = all_bits;
                
                //re-initialize index variables
                temp_bits = 3'b000;
                temp_fsm_in = 4'b0000;
                ii = 0;

                
                
        end
        
        if(btn5 && !prev_btn5) begin
            if(btn3_num > 0) begin
                btn3_num = btn3_num - 1;
                
                case (btn3_num)
                    0:begin all[3:0] = 0; all_bits[2:0] = 0;end
                    1:begin all[7:4] = 0; all_bits[5:3] = 0; end
                    2:begin all[11:8] = 0; all_bits[8:6] = 0; end
                    3:begin all[15:12] = 0; all_bits[11:9] = 0; end
                    4:begin all[19:16] = 0; all_bits[14:12] = 0; end
                    5:begin all[23:20] = 0; all_bits[17:15] = 0; end
                    6:begin all[27:24] = 0; all_bits[20:18] = 0; end
                    7:begin all[31:28] = 0; all_bits[23:21] = 0; end
                endcase
            
                fsm_in = all;
                bits = all_bits;
            end
        end
    end
endmodule
