`timescale 1ns / 1ps
//module name and inputs/outputs
module nibble_to_seven_seg(
    input [3:0] nibblein,
    output reg [6:0] segout
    );

//always @*
//    case (nibblein)
//      4'h0: segout = ~7'b0111111;
//      4'h1: segout = ~7'b0000110;
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
//      default: segout = ~7'b1001001;
//    endcase
endmodule
