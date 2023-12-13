`timescale 1ns / 1ps

module faster_clock_divider(
    input in_clk, 
    output reg out_clk);
	
	reg[32:0] count;

	initial begin
		// initialize everything to zero
		count <= 0;
        out_clk <= 0;
	end
	
	always @(negedge in_clk)
	begin
		// increment count by one
		count = count + 1;
		// if count equals to some big number (that you need to calculate),
		//   then flip the output clock,
		if (count == 100_000) begin
            out_clk <= ~out_clk;
            // Reset count to zero (use non-blocking assignment)
            count <= 0;
        end
	end
endmodule
