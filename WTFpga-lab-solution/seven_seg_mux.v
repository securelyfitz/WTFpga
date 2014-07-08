`timescale 1ns / 1ps

module seven_seg_mux(
    input clk,
	 input [7:0]seg0,seg1,seg2,seg3,seg4,seg5,seg6,seg7,
    output reg [7:0] seg,
    output [7:0] seg_sel
    );
	 
	reg [7:0] current;

	assign seg_sel=~current;

always @(posedge clk)
	case (current)
		8'b1:begin
			seg<=seg1;
			current <= 8'b10;
			end
		8'b10:begin
			seg<=seg2;
			current <= 8'b100;
			end
		8'b100:begin
			seg<=seg3;
			current <= 8'b1000;
			end
		8'b1000:begin
			seg<=seg4;
			current <= 8'b10000;
			end
		8'b10000:begin
			seg<=seg5;
			current <= 8'b100000;
			end
		8'b100000:begin
			seg<=seg6;
			current <= 8'b1000000;
			end
		8'b1000000:begin
			seg<=seg7;
			current <= 8'b10000000;
			end
		default:begin
			seg<=seg0;
			current <= 8'b1;
			end
	endcase
endmodule

