`timescale 1ns / 1ps
//define our module and it's inputs/outputs
module WTFpga(
	input clk,
	input btnU,
    input btnD,
    input btnL,
    input btnR,
    input btnC,
	input [15:0] sw,
	output [15:0] led,
	output [6:0] seg,
	output [3:0] an
    );

//define wires and registers here
	wire [7:0] disp0,disp1,disp2,disp3;
	wire displayClock;
	wire wire1, wire2;
	
//parallel assignments can go here
	assign led[14:01]=14'b0;
    assign led[00]=wire1;
    assign led[15]=wire2;
    assign wire1=btnU;
    assign wire2=btnD;

//always @ blocks can go here
//	always @(sensitivity list)
//		commmands-to-run-when-triggered;

//instantiate modules here
	nibble_to_seven_seg nibble0(
		.nibblein(),
		.segout()
	);	 
	 
	clkdiv displayClockGen(
		.clk(clk),
		.clkout(displayClock)
	);

	seven_seg_mux display(
		.clk(displayClock),
		.disp0(disp0),
		.disp1(disp1),
		.disp2(disp2),
		.disp3(disp3),
		.segout(seg),
		.disp_sel(an)
	);

endmodule
