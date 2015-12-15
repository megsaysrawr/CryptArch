//------------------------------------------------------------------------
// Matrixify test bench
//------------------------------------------------------------------------
module testmatrixify();	
	wire [7:0] matrix [3:0] [3:0];	
	wire [127:0] rawstring;

	reg begintest;
	wire dutpassed;

	matrixify dut(.matrix(matrix),
			.rawstring(rawstring));

	matrixifytestbench test(.begintest(begintest),
			.endtest(endtest),
			.dutpassed(dutpassed),
			.matrix(matrix),
			.rawstring(rawstring));

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

module matrixifytestbench (
	input begintest,
	output reg endtest,
	output reg dutpassed,

	output reg [127:0] rawstring,
	input [7:0] matrix [3:0] [3:0]
);


	always @(posedge begintest) begin
		$display("Testing matrixify now...");
		endtest = 0;
		dutpassed = 1;
		#10

		$display("---------------------------------");
		$display("Testing case 0...");
		rawstring = {8'h12, 8'h1b, 8'h19, 8'h04, 8'h63, 8'h7a, 8'h12, 8'h79, 8'h74, 8'h62, 8'h0d, 8'h15, 8'h77, 8'h05, 8'h64, 8'h58};
		#10

		$display("matrix:");
		$display("%h %h %h %h", matrix[3][3], matrix[3][2], matrix[3][1], matrix[3][0]);
		$display("%h %h %h %h", matrix[2][3], matrix[2][2], matrix[2][1], matrix[2][0]);
		$display("%h %h %h %h", matrix[1][3], matrix[1][2], matrix[1][1], matrix[1][0]);
		$display("%h %h %h %h", matrix[0][3], matrix[0][2], matrix[0][1], matrix[0][0]);	
	
		
		if (matrix[3][3] != 8'h12) begin
			dutpassed = 0;
			$display("Matrixify[3][3] Broken");
		end
		
		if (matrix[2][2] != 8'h7a) begin
			dutpassed = 0;
			$display("Matrixify[2][2] Broken");
		end

		if (matrix[2][0] != 8'h05) begin
			dutpassed = 0;
			$display("Matrixify[2][0] Broken");
		end

		if (matrix[1][3] != 8'h19) begin
			dutpassed = 0;
			$display("Matrixify[1][3] Broken");
		end

		if (matrix[1][1] != 8'h0d) begin
			dutpassed = 0;
			$display("Matrixify[1][1] Broken");
		end

		if (matrix[0][0] != 8'h58) begin
			dutpassed = 0;
			$display("Matrixify[0][0] Broken");
		end

		endtest = 1;
		// $finish;
	end

endmodule