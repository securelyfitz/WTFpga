`timescale 1ns / 1ps
//define our module and it's inputs/outputs
module WTFpga(
	input clk,
	input [7:0] sw,
	input [3:0] key,
	output [7:0] led,
	output [7:0] seg,
	output [7:0] seg_sel
    );

//define wires and registers here
	wire [7:0] seg0,seg1,seg2,seg3,seg4,seg5,seg6,seg7;
	
//parallel assignments can go here
	assign led=8'b0;

//always @ blocks can go here
//	always @(sensitivity list)
//		commmands-to-run-when-triggered;

//instantiate modules here
	nibble_to_seven_seg nibbleLow(
		.nibblein(),
		.segout()
	);	 
	 
	clkdiv displayClockGen(
		.clk(clk),
		.clkout(displayClock)
	);

	seven_seg_mux display(
		.clk(displayClock),
		.seg0(seg0),
		.seg1(seg1),
		.seg2(seg2),
		.seg3(seg3),
		.seg4(seg4),
		.seg5(seg5),
		.seg6(seg6),
		.seg7(seg7),
		.seg(seg),
		.seg_sel(seg_sel)
	);


endmodule
