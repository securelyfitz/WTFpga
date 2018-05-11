`timescale 1ns / 1ps

module seven_seg_mux(
    input clk,
	input [6:0]disp0,disp1,disp2,disp3,
    output reg [6:0] segout,
    output [3:0] disp_sel
    );
	 
	reg [3:0] current;

	assign disp_sel=~current;

always @(posedge clk)
	case (current)
		4'b1:begin
			segout<=disp1;
			current <= 4'b10;
			end
		4'b10:begin
			segout<=disp2;
			current <= 4'b100;
			end
		4'b100:begin
			segout<=disp3;
			current <= 4'b1000;
			end
		default:begin
			segout<=disp0;
			current <= 4'b1;
			end
	endcase
endmodule

