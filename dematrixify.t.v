//------------------------------------------------------------------------
// Dematrixify test bench
//------------------------------------------------------------------------
`include "dematrixify.v"
module testdematrixify();
	wire [127:0] rawstring;
	wire [7:0] matrix [3:0] [3:0];	

	reg begintest;
	wire dutpassed;

	dematrixify dut(.rawstring(rawstring),
			.matrix(matrix));

	dematrixifytestbench test(.begintest(begintest),
			.endtest(endtest),
			.dutpassed(dutpassed),
			.rawstring(rawstring),
			.matrix(matrix));

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

module dematrixifytestbench (
	input begintest,
	output reg endtest,
	output reg dutpassed,

	output reg [7:0] matrix [3:0] [3:0],
	input [127:0] rawstring
);

	always @(posedge begintest) begin
		$display("Testing matrixify now...");
		endtest = 0;
		dutpassed = 1;
		#10

		//test case 0--check to see if what is inputted gets stored properly
		$display("---------------------------------");
		$display("Testing case 0...");
		matrix[3][3:0] = {8'h12, 8'h63, 8'h74, 8'h77};
		matrix[2][3:0] = {8'h1b, 8'h7a, 8'h62, 8'h05};
		matrix[1][3:0] = {8'h19, 8'h12, 8'h0d, 8'h64};
		matrix[0][3:0] = {8'h04, 8'h79, 8'h15, 8'h58};
		#10

		$display("rawstring:");
		$display("%h %h %h %h", rawstring[127:120], rawstring[95:88], rawstring[63:56], rawstring[31:24]);
		$display("%h %h %h %h", rawstring[119:112], rawstring[87:80], rawstring[55:48], rawstring[23:16]);
		$display("%h %h %h %h", rawstring[111:104], rawstring[79:72], rawstring[47:40], rawstring[15:8]);
		$display("%h %h %h %h", rawstring[103:96], rawstring[71:64], rawstring[39:32], rawstring[7:0]);		
		
		if (rawstring[127:120] != 8'h12) begin
			dutpassed = 0;
			$display("Dematrixify[3][3] Broken");
		end
		
		if (rawstring[87:80] != 8'h7a) begin
			dutpassed = 0;
			$display("Dematrixify[2][2] Broken");
		end

		if (rawstring[23:16] != 8'h05) begin
			dutpassed = 0;
			$display("Dematrixify[2][0] Broken");
		end

		if (rawstring[111:104] != 8'h19) begin
			dutpassed = 0;
			$display("Dematrixify[1][3] Broken");
		end

		if (rawstring[47:40] != 8'h0d) begin
			dutpassed = 0;
			$display("Dematrixify[1][1] Broken");
		end

		if (rawstring[7:0] != 8'h58) begin
			dutpassed = 0;
			$display("Dematrixify[0][0] Broken");
		end

		endtest = 1;
		// $finish;
	end

endmodule