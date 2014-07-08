`timescale 1ns / 1ps
//module name and inputs/outputs
module nibble_to_seven_seg(
    input [3:0] nibblein,
    output reg [7:0] segout
    );

//	 always block with sensitivitiy list. Triggered whenever something in the list changes
always @(nibblein)
    case (nibblein)
      4'h0: segout = ~8'b00111111;
      4'h1: segout = ~8'b00000110;
      4'h2: segout = ~8'b01011011;
      4'h3: segout = ~8'b01001111;
      4'h4: segout = ~8'b01100110;
      4'h5: segout = ~8'b01101101;
      4'h6: segout = ~8'b01111101;
      4'h7: segout = ~8'b00000111;
      4'h8: segout = ~8'b01111111;
      4'h9: segout = ~8'b01100111;
      4'hA: segout = ~8'b01110111;
      4'hB: segout = ~8'b01111100;
      4'hC: segout = ~8'b00111001;
      4'hD: segout = ~8'b01011110;
      4'hE: segout = ~8'b01111001;
      4'hF: segout = ~8'b01110001;
      default: segout = ~8'b01001001;
    endcase
endmodule
