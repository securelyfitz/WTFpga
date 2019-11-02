module top (
	input  CLK,

	output LED1,
	output LED2,
	output LED3,
	output LED4,
	output LED5,

	input BTN_N,
	input BTN1,
	input BTN2,
	input BTN3
);

	localparam BITS = 5;
	localparam LOG2DELAY = 22;

	reg [BITS+LOG2DELAY-1:0] counter = 0;
	reg [BITS-1:0] outcnt;

	always @(posedge CLK) begin
		counter <= counter + {!BTN_N, BTN1, BTN2, BTN3} + 1;
		outcnt <= counter >> LOG2DELAY;
	end

	assign {LED1, LED2, LED3, LED4, LED5} = outcnt ^ (outcnt >> 1);
endmodule
