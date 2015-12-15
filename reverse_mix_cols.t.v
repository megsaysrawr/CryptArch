module reverse_mix_cols_test_bench_harness();

	//wires for the test bench
	wire	[31:0] input_col;
	wire 	[31:0] final_col;

	//wires for the tester
	reg begintest;
	wire dutpassed;

	reverse_mix_cols DUT
	(	
		.input_col(input_col),
		.final_col(final_col)
	);

	reverse_mix_cols_test_bench tester
	(
		.begintest(begintest),
		.endtest(endtest),
		.dutpassed(dutpassed),
		.input_col(input_col), 
		.final_col(final_col)
	);

	initial begin
		begintest = 0;
		#10;
		begintest = 1;
		#1000;
	end

	always @(posedge endtest) begin
		$display("DUT passed?: %b", dutpassed);
	end

endmodule

module reverse_mix_cols_test_bench(
	input begintest,
	output reg endtest,
	output reg dutpassed,
	output reg [31:0] input_col,
	input [31:0] final_col
);

	always@(posedge begintest) begin
		$display("Testing reverse mix cols now...");
		endtest = 0;
		dutpassed = 1;
		#20

		//test case 0
		$display("---------------------------------");
		$display("Testing case 0...");
		input_col = 32'h416e1899;
		#20
		if (final_col != 32'hc9dad76a) begin
		$display("answer should be c9dad76a");
		$display("the answer is %h",final_col);
		dutpassed = 0;
		end


		//test case 1
		$display("---------------------------------");
		$display("Testing case 1...");
		input_col = 32'he0958b65;
		#20
		if (final_col != 32'h926bd4b6) begin
		$display("answer should be 926bd4b6");
		$display("the answer is %h",final_col);
		dutpassed = 0;
		end
	
	endtest = 1;
	end

endmodule
