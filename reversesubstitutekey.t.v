//------------------------------------------------------------------------
// Reverse Substitute Key test bench
//------------------------------------------------------------------------
`include "reversesubstitutekey.v"

module testreversesubstitutekey();	
	wire [7:0] subkeyout [3:0] [3:0];	
	wire [7:0] subkeyin [3:0] [3:0];

	reg begintest;
	wire dutpassed;

	reversesubstitutekey dut(.subkeyin(subkeyin),
			.subkeyout(subkeyout));

	reversesubstitutekeytestbench test(.begintest(begintest),
				.endtest(endtest),
				.dutpassed(dutpassed),
				.subkeyin(subkeyin),
				.subkeyout(subkeyout));
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

module reversesubstitutekeytestbench (
	input begintest,
	output reg endtest,
	output reg dutpassed,

	output reg [7:0] subkeyin [3:0] [3:0],
	input [7:0] subkeyout [3:0] [3:0]
);

	always @(begintest) begin
		endtest = 0;
		dutpassed = 1;

		subkeyin[3][3] = 8'hc9; #10;
		if (subkeyout[3][3] != 8'h12) begin
			dutpassed = 0;
			$display("Substitute Key [3][3] Broken");
		end

		subkeyin[2][2] = 8'hda; #10;
		if (subkeyout[2][2] != 8'h7a) begin
			dutpassed = 0;
			$display("Substitute Key [2][2]Broken");
		end

		subkeyin[1][1] = 8'hd7; #10;
		if (subkeyout[1][1] != 8'h0d) begin
			dutpassed = 0;
			$display("Substitute Key [1][1] Broken");
		end

		subkeyin[0][0] = 8'h6a; #10;
		if (subkeyout[0][0] != 8'h58) begin
			dutpassed = 0;
			$display("Substitute Key [0][0] Broken");
		end

		endtest = 1;

	end

endmodule