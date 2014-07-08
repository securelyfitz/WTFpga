`timescale 1ns / 1ps
//module name and inputs/outputs
module nibble_to_seven_seg(
    input [3:0] nibblein,
    output reg [7:0] segout
    );

//	 always block with sensitivitiy list. Triggered whenever something in the list changes
//always @(nibblein)
//    case (nibblein)
//      4'h0: segout = 8'b11000000;
//      4'h1: segout = 8'b11111001;
//      4'h2: segout =
//      4'h3: segout =
//      4'h4: segout =
//      4'h5: segout =
//      4'h6: segout =
//      4'h7: segout =
//      4'h8: segout =
//      4'h9: segout =
//      4'hA: segout =
//      4'hB: segout =
//      4'hC: segout =
//      4'hD: segout =
//      4'hE: segout =
//      4'hF: segout = 
// default case happens whenever an undefined input occurs...
//      default: segout = ~8'b01001001;
//    endcase
endmodule
