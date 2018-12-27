`timescale 1ns / 1ps
//module name and inputs/outputs
module nibble_to_seven_seg(
    input [3:0] nibblein,
    output reg [6:0] segout
    );

//	 always block with sensitivitiy list. Triggered whenever something in the list changes
always @(nibblein)
    case (nibblein)
        4'h0: segout = ~7'b0111111;
        4'h1: segout = ~7'b0000110;
        4'h2: segout = ~7'b1011011;
        4'h3: segout = ~7'b1001111;
        4'h4: segout = ~7'b1100110;
        4'h5: segout = ~7'b1101101;
        4'h6: segout = ~7'b1111101;
        4'h7: segout = ~7'b0000111;
        4'h8: segout = ~7'b1111111;
        4'h9: segout = ~7'b1100111;
        4'hA: segout = ~7'b1110111;
        4'hB: segout = ~7'b1111100;
        4'hC: segout = ~7'b0111001;
        4'hD: segout = ~7'b1011110;
        4'hE: segout = ~7'b1111001;
        4'hF: segout = ~7'b1110001;
// default case happens whenever an undefined input occurs...
        default: segout = ~7'b1001001;
    endcase
endmodule
