//------------------------------------------------------------------------
// Round test bench
//------------------------------------------------------------------------
module testround();	
	wire [7:0] roundout [3:0] [3:0];	
	wire [7:0] roundin [3:0][3:0];
	wire [7:0] key [3:0][3:0];
	wire rst;

	reg begintest;
	wire dutpassed;

	round dut(.roundout(roundout),
			.roundin(roundin),
			.key(key),
			.rst(rst));

	roundtestbench test(.begintest(begintest),
			.endtest(endtest),
			.dutpassed(dutpassed),
			.roundout(roundout),
			.roundin(roundin),
			.key(key),
			.rst(rst));

	initial begin
        begintest = 0;
        #10;
        begintest = 1;
        #100;
    end

    always @(endtest) begin
        $display("DUT passed: ", dutpassed);
    end
	
endmodule

module roundtestbench (
	input begintest,
	output reg endtest,
	output reg dutpassed,

	output reg [7:0] roundin [3:0][3:0],
	output reg [7:0] key [3:0] [3:0],
	output reg rst,
	input [7:0] roundout [3:0] [3:0]
);

	always @(posedge begintest) begin
		$display("Testing round now...");
		endtest = 0;
		dutpassed = 1;
		#10

		//test case 0
		$display("---------------------------------");
		$display("Testing case 0...");
		roundin[3][3:0] = {8'h12, 8'h63, 8'h74, 8'h77};
		roundin[2][3:0] = {8'h1b, 8'h7a, 8'h62, 8'h05};
		roundin[1][3:0] = {8'h19, 8'h12, 8'h0d, 8'h64};
		roundin[0][3:0] = {8'h04, 8'h79, 8'h15, 8'h58};
		key[3][3:0] = {8'he1, 8'hc1, 8'he1, 8'hc1};
		key[2][3:0] = {8'h21, 8'h10, 8'h52, 8'h19};
		key[1][3:0] = {8'h86, 8'h64, 8'hfd, 8'hb8};
		key[0][3:0] = {8'hf2, 8'hca, 8'h9e, 8'hc7};
		#10

		$display("roundout");
		$display("%h %h %h %h", roundout[3][3], roundout[3][2], roundout[3][1], roundout[3][0]);
		$display("%h %h %h %h", roundout[2][3], roundout[2][2], roundout[2][1], roundout[2][0]);
		$display("%h %h %h %h", roundout[1][3], roundout[1][2], roundout[1][1], roundout[1][0]);
		$display("%h %h %h %h", roundout[0][3], roundout[0][2], roundout[0][1], roundout[0][0]);		
		
		if (roundout[3][3] != 8'ha0) begin
			dutpassed = 0;
			$display("Round[3][3] Broken");
		end
		
		if (roundout[3][0] != 8'h4a) begin
			dutpassed = 0;
			$display("Round[3][0] Broken");
		end

		if (roundout[2][2] != 8'h93) begin
			dutpassed = 0;
			$display("Round[2][2] Broken");
		end

		if (roundout[2][1] != 8'hc7) begin
			dutpassed = 0;
			$display("Round[2][1] Broken");
		end

		if (roundout[1][1] != 8'h76) begin
			dutpassed = 0;
			$display("Round[1][1] Broken");
		end

		if (roundout[0][0] != 8'h17) begin
			dutpassed = 0;
			$display("Round[0][0] Broken");
		end

		endtest = 1;

	end

endmodule
