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
	wire wire0;
	wire [7:0] result;
	reg [7:0] storedValue;
//parallel assignments can go here
	assign led[7:0]=sw[7:0];
	assign wire0=key[0];
	assign result = key[0]?sw-storedValue:sw+storedValue;
	assign seg5=key[0]?8'b10111111:8'b10111001;
	assign seg2=8'b10110111;

//always @ blocks can go here
	always @(posedge key[3])
		storedValue<=sw;

//instantiate modules here
	nibble_to_seven_seg nibbleHigh(
		.nibblein(sw[7:4]),
		.segout(seg7)
	);	 
	nibble_to_seven_seg nibbleLow(
		.nibblein(sw[3:0]),
		.segout(seg6)
	);	 
	nibble_to_seven_seg nibbleHighResult(
		.nibblein(result[7:4]),
		.segout(seg1)
	);	 
	nibble_to_seven_seg nibbleLowResult(
		.nibblein(result[3:0]),
		.segout(seg0)
	);	 
	nibble_to_seven_seg nibbleHighStored(
		.nibblein(storedValue[7:4]),
		.segout(seg4)
	);	 
	nibble_to_seven_seg nibbleLowStored(
		.nibblein(storedValue[3:0]),
		.segout(seg3)
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
