//------------------------------------------------------------------------
// Round test bench
//------------------------------------------------------------------------
`include "round.v"
module testround();	
	wire [7:0] roundout [3:0] [3:0];	
	wire [7:0] roundin [3:0][3:0];
	wire [7:0] key [3:0][3:0];
	wire rst, clk;

	reg begintest;
	wire dutpassed;

	round dut(.roundout(roundout),
			.roundin(roundin),
			.key(key),
			.rst(rst),
			.clk(clk));

	roundtestbench test(.begintest(begintest),
			.endtest(endtest),
			.dutpassed(dutpassed),
			.roundout(roundout),
			.roundin(roundin),
			.key(key),
			.rst(rst),
			.clk(clk));

	initial begin
        begintest = 0;
        #10;
        begintest = 1;
        #1000;
    end

    always @(endtest) begin
        if (dutpassed == 1) begin
            $display("\n\033[32mDUT passed: %b\033[37m\n", dutpassed);
        end else begin
            $display("\n\033[31mDUT passed: %b\033[37m\n", dutpassed);
        end
    end
	
endmodule

module roundtestbench (
	input begintest,
	output reg endtest,
	output reg dutpassed,

	output reg [7:0] roundin [3:0][3:0],
	output reg [7:0] key [3:0] [3:0],
	output reg rst, 
	output reg clk,
	input [7:0] roundout [3:0] [3:0]
);

	always @(begintest) begin
		endtest = 0;
		dutpassed = 1;

		roundin = 8'd28; key = 8'd74; #10;
		if (roundout != 8'b1010110) begin
			dutpassed = 0;
			$display("Round Broken);
		end

		shiftrowsout = 8'd6; roundkey = 8'd127; #10;
		if (roundout != 8'b1010110) begin
			dutpassed = 0;
			$display("Round Broken);
		end

		shiftrowsout = 8'd195; roundkey = 8'13; #10;
		if (roundout != 8'b1010110) begin
			dutpassed = 0;
			$display("Round Broken);
		end

		endtest = 1;
		$finish;
	end

endmodule
