`timescale 1ns / 1ps

module clkdiv(
    input clk,
    output clkout
    );

reg [15:0] counter;
assign clkout = counter[15];

always @(posedge clk)
	counter <= counter+1;
endmodule
