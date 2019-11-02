module top (
	input  CLK,
	input BTN_N, BTN1, BTN2, BTN3,
	output LED1, LED2, LED3, LED4, LED5,
	output P1A1, P1A2, P1A3, P1A4, P1A7, P1A8, P1A9, P1A10,
	output P1B1, P1B2, P1B3, P1B4, P1B7, P1B8, P1B9, P1B10
);
	wire [7:0] ss_top, ss_bot;
	reg [7:0] disp_top = 0, disp_bot = 0;
	reg [7:0] lap_top = 0, lap_bot = 0;
	reg [7:0] lap_timeout = 0;

	wire [7:0] disp_top_inc, disp_bot_inc;
	
	assign { P1A10, P1A9, P1A8, P1A7, P1A4, P1A3, P1A2, P1A1 } = ss_top;
	assign { P1B10, P1B9, P1B8, P1B7, P1B4, P1B3, P1B2, P1B1 } = ss_bot;

	reg [20:0] clkdiv = 0;
	reg clkdiv_pulse = 0;

	reg running = 0;

	always @(posedge CLK) begin
		if (clkdiv == 120000) begin
			clkdiv <= 0;
			clkdiv_pulse <= 1;
		end else begin
			clkdiv <= clkdiv + 1;
			clkdiv_pulse <= 0;
		end

		if (clkdiv_pulse && running) begin
			{disp_top, disp_bot} <= {disp_top_inc, disp_bot_inc};
		end

		if (clkdiv_pulse && lap_timeout) begin
			lap_timeout <= lap_timeout - 1;
		end

		// left button: start
		if (BTN3) begin
			running <= 1;
		end

		// center button: lap
		if (BTN2) begin
			lap_top <= disp_top;
			lap_bot <= disp_bot;
			lap_timeout <= 200;
		end

		// right button: stop
		if (BTN1) begin
			running <= 0;
		end

		// reset
		if (!BTN_N) begin
			{disp_top, disp_bot} <= 0;
			running <= 0;
		end
	end

	seven_seg_ctrl ss_ctrl_top (
		.CLK(CLK),
		.din(lap_timeout ? lap_top : disp_top),
		.dout(ss_top)
	);

	seven_seg_ctrl ss_ctrl_bot (
		.CLK(CLK),
		.din(lap_timeout ? lap_bot : disp_bot),
		.dout(ss_bot)
	);

	bcd16_increment bot_inc (
		.din({disp_top, disp_bot}),
		.dout({disp_top_inc, disp_bot_inc})
	);
endmodule

module bcd16_increment (
	input [15:0] din,
	output reg [15:0] dout
);
	always @* begin
		case (1'b1)
			din[15:0] == 16'h 9999:
				dout = 0;
			din[11:0] == 12'h 999:
				dout = {din[15:12] + 4'd 1, 12'h 000};
			din[7:0] == 8'h 99:
				dout = {din[15:12], din[11:8] + 4'd 1, 8'h 00};
			din[3:0] == 4'h 9:
				dout = {din[15:8], din[7:4] + 4'd 1, 4'h 0};
			default:
				dout = {din[15:4], din[3:0] + 4'd 1};
		endcase
	end
endmodule

module seven_seg_ctrl (
	input CLK,
	input [7:0] din,
	output reg [7:0] dout
);
	wire [6:0] lsb_digit;
	wire [6:0] msb_digit;

	seven_seg_hex msb_nibble (
		.din(din[7:4]),
		.dout(msb_digit)
	);

	seven_seg_hex lsb_nibble (
		.din(din[3:0]),
		.dout(lsb_digit)
	);

	reg [9:0] clkdiv = 0;
	reg clkdiv_pulse = 0;
	reg msb_not_lsb = 0;

	always @(posedge CLK) begin
		clkdiv <= clkdiv + 1;
		clkdiv_pulse <= &clkdiv;
		msb_not_lsb <= msb_not_lsb ^ clkdiv_pulse;

		if (clkdiv_pulse) begin
			if (msb_not_lsb) begin
				dout[6:0] <= ~msb_digit;
				dout[7] <= 0;
			end else begin
				dout[6:0] <= ~lsb_digit;
				dout[7] <= 1;
			end
		end
	end
endmodule

module seven_seg_hex (
	input [3:0] din,
	output reg [6:0] dout
);
	always @*
		case (din)
			4'h0: dout = 7'b 0111111;
			4'h1: dout = 7'b 0000110;
			4'h2: dout = 7'b 1011011;
			4'h3: dout = 7'b 1001111;
			4'h4: dout = 7'b 1100110;
			4'h5: dout = 7'b 1101101;
			4'h6: dout = 7'b 1111101;
			4'h7: dout = 7'b 0000111;
			4'h8: dout = 7'b 1111111;
			4'h9: dout = 7'b 1101111;
			4'hA: dout = 7'b 1110111;
			4'hB: dout = 7'b 1111100;
			4'hC: dout = 7'b 0111001;
			4'hD: dout = 7'b 1011110;
			4'hE: dout = 7'b 1111001;
			4'hF: dout = 7'b 1110001;
		endcase
endmodule
