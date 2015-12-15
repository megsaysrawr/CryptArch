module mix_cols_test_bench_harness();

	//wires for the test bench
	wire	[31:0] input_col;
	wire 	[31:0] final_col;

	//wires for the tester
	reg begintest;
	wire dutpassed;

	//instantiate the diffusion module

	mix_cols DUT
	(	
		.input_col(input_col),
		.final_col(final_col)
	);

	mix_cols_test_bench tester
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

module mix_cols_test_bench(
	input begintest,
	output reg endtest,
	output reg dutpassed,
	output reg [31:0] input_col,
	input [31:0] final_col
);

	always@(posedge begintest) begin
		$display("Testing diffusion now...");
		endtest = 0;
		dutpassed = 1;
		#20

		//test case 0--check to see if the column f5,af,c9,59 gets mixed to 8b,a9,38,d0 like in the comic
		$display("---------------------------------");
		$display("Testing case 0...");
		input_col = 32'hf5afc959;
		#20
		$display("answer should be 8ba938d0");
		$display("the answer is %h",final_col);

$display("Testing diffusion now...");
		endtest = 0;
		dutpassed = 1;
		#20

		//test case 1--check to see if the column fb,aa,43,f2 gets mixed to b9,83,da,00 like in the comic
		$display("---------------------------------");
		$display("Testing case 1...");
		input_col = 32'hfbaa43f2;
		#20
		$display("answer should be b983da00");
		$display("the answer is %h",final_col);

	
	#5
	endtest = 1;
	end

endmodule
