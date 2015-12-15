//------------------------------------------------------------------------
// First Round test bench
//------------------------------------------------------------------------
module testfirstround();	
	wire [7:0] roundout [3:0] [3:0];	
	wire [7:0] roundin [3:0][3:0];
	wire [7:0] key [3:0][3:0];
	wire rst;

	reg begintest;
	wire dutpassed;

	firstround dut(.roundout(roundout),
			.roundin(roundin),
			.key(key),
			.rst(rst));

	firstroundtestbench test(.begintest(begintest),
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

module firstroundtestbench (
	input begintest,
	output reg endtest,
	output reg dutpassed,

	output reg [7:0] roundin [3:0][3:0],
	output reg [7:0] key [3:0] [3:0],
	output reg rst,
	input [7:0] roundout [3:0] [3:0]
);

	always @(posedge begintest) begin
		$display("Testing first round now...");
		endtest = 0;
		dutpassed = 1;
		#10

		//test case 0
		$display("---------------------------------");
		$display("Testing case 0...");
		roundin[3][3:0] = {8'hcc, 8'h3e, 8'hff, 8'h3b};
		roundin[2][3:0] = {8'ha1, 8'h67, 8'h59, 8'haf};
		roundin[1][3:0] = {8'h04, 8'h85, 8'h02, 8'haa};
		roundin[0][3:0] = {8'ha1, 8'h00, 8'h5f, 8'h34};
		key[3][3:0] = {8'hb4, 8'h8e, 8'hf3, 8'h52};
		key[2][3:0] = {8'hba, 8'h98, 8'h13, 8'h4e};
		key[1][3:0] = {8'h7f, 8'h4d, 8'h59, 8'h20};
		key[0][3:0] = {8'h86, 8'h26, 8'h18, 8'h76};
		#10

		$display("roundout");
		$display("%h %h %h %h", roundout[3][3], roundout[3][2], roundout[3][1], roundout[3][0]);
		$display("%h %h %h %h", roundout[2][3], roundout[2][2], roundout[2][1], roundout[2][0]);
		$display("%h %h %h %h", roundout[1][3], roundout[1][2], roundout[1][1], roundout[1][0]);
		$display("%h %h %h %h", roundout[0][3], roundout[0][2], roundout[0][1], roundout[0][0]);		
		
		if (roundout[3][3] != 8'hff) begin
			dutpassed = 0;
			$display("Round[3][3] Broken");
		end
		
		if (roundout[3][0] != 8'hb0) begin
			dutpassed = 0;
			$display("Round[3][0] Broken");
		end

		if (roundout[2][2] != 8'h53) begin
			dutpassed = 0;
			$display("Round[2][2] Broken");
		end

		if (roundout[2][1] != 8'h6a) begin
			dutpassed = 0;
			$display("Round[2][1] Broken");
		end

		if (roundout[1][1] != 8'hab) begin
			dutpassed = 0;
			$display("Round[1][1] Broken");
		end

		if (roundout[0][0] != 8'hb9) begin
			dutpassed = 0;
			$display("Round[0][0] Broken");
		end

		endtest = 1;

	end

endmodule
