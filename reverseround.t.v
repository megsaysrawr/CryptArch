//------------------------------------------------------------------------
// Reverse Round test bench
//------------------------------------------------------------------------
module testreverseround();	
	wire [7:0] roundout [3:0] [3:0];	
	wire [7:0] roundin [3:0][3:0];
	wire [7:0] key [3:0][3:0];
	wire rst;

	reg begintest;
	wire dutpassed;

	reverseround dut(.roundout(roundout),
			.roundin(roundin),
			.key(key),
			.rst(rst));

	reverseroundtestbench test(.begintest(begintest),
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

module reverseroundtestbench (
	input begintest,
	output reg endtest,
	output reg dutpassed,

	output reg [7:0] roundin [3:0][3:0],
	output reg [7:0] key [3:0] [3:0],
	output reg rst,
	input [7:0] roundout [3:0] [3:0]
);

	always @(posedge begintest) begin
		$display("Testing reverse round now...");
		endtest = 0;
		dutpassed = 1;
		#10

		//test case 0
		$display("---------------------------------");
		$display("Testing case 0...");
		roundin[3][3:0] = {8'h72, 8'hba, 8'hcb, 8'h04};
		roundin[2][3:0] = {8'h1e, 8'h06, 8'hd4, 8'hfa};
		roundin[1][3:0] = {8'hb2, 8'h20, 8'hbc, 8'h65};
		roundin[0][3:0] = {8'h00, 8'h6d, 8'he7, 8'h4e};
		key[3][3:0] = {8'h58, 8'hfd, 8'h0f, 8'h4c};
		key[2][3:0] = {8'h9d, 8'hee, 8'hcc, 8'h40};
		key[1][3:0] = {8'h36, 8'h38, 8'h9b, 8'h46};
		key[0][3:0] = {8'heb, 8'h7d, 8'hed, 8'hbd};
		#10

		$display("roundout");
		$display("%h %h %h %h", roundout[3][3], roundout[3][2], roundout[3][1], roundout[3][0]);
		$display("%h %h %h %h", roundout[2][3], roundout[2][2], roundout[2][1], roundout[2][0]);
		$display("%h %h %h %h", roundout[1][3], roundout[1][2], roundout[1][1], roundout[1][0]);
		$display("%h %h %h %h", roundout[0][3], roundout[0][2], roundout[0][1], roundout[0][0]);		
		
		if (roundout[3][3] != 8'hf8) begin
			dutpassed = 0;
			$display("Round[3][3] Broken");
		end
		
		if (roundout[3][0] != 8'h4c) begin
			dutpassed = 0;
			$display("Round[3][0] Broken");
		end

		if (roundout[2][2] != 8'h37) begin
			dutpassed = 0;
			$display("Round[2][2] Broken");
		end

		if (roundout[2][1] != 8'h24) begin
			dutpassed = 0;
			$display("Round[2][1] Broken");
		end

		if (roundout[1][1] != 8'hc1) begin
			dutpassed = 0;
			$display("Round[1][1] Broken");
		end

		if (roundout[0][0] != 8'hbc) begin
			dutpassed = 0;
			$display("Round[0][0] Broken");
		end

		endtest = 1;
		// $finish;
	end
endmodule
