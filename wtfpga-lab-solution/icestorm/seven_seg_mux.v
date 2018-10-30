`timescale 1ns / 1ps

module seven_seg_mux(
	input clk,
	input [6:0] disp0, disp1,
	output reg [6:0] segout,
	output disp_sel
);
	 
	reg current;

	assign disp_sel=current;

always @(posedge clk)
	case (current)
		1:begin
			segout<=disp1;
			current <= 0;
			end
		0:begin
			segout<=disp0;
			current <= 1;
			end
	endcase
endmodule

