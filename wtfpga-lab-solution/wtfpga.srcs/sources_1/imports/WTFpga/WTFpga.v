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
	reg [15:0] storedValue;
    wire [15:0] dispValue,sum,diff;

//parallel assignments can go here
    assign led[15:0]=sw[15:0];
    assign sum=storedValue+sw;
    assign diff=storedValue-sw;
    assign dispValue=btnL?diff:
                     btnR?sum:
                     btnC?storedValue:
                     sw;

//always @ blocks can go here
    always @(posedge btnU)
//              commmands-to-run-when-triggered;
        storedValue<=sw;

//instantiate modules here

	nibble_to_seven_seg nibble0(
		.nibblein(dispValue[3:0]),
		.segout(disp0)
	);	 
	
	nibble_to_seven_seg nibble1(
		.nibblein(dispValue[7:4]),
		.segout(disp1)
	);	
	 
	nibble_to_seven_seg nibble2(
		.nibblein(dispValue[11:8]),
		.segout(disp2)
	);	 
	
	nibble_to_seven_seg nibble3(
		.nibblein(dispValue[15:12]),
		.segout(disp3)
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
