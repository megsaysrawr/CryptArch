// diffusion.t.v
module diffusion_test_bench_harness();

	//wires for the diffusion
	wire	[7:0] diffusion_in [3:0][3:0];
	wire	[7:0] diffusion_out [3:0][3:0];
	wire	[7:0] srows_out [3:0][3:0];

	//wires for the tester
	reg begintest;
	wire dutpassed;

	//instantiate the diffusion module

	diffusion DUT
	(	
		.diffusion_in(diffusion_in),
		.diffusion_out(diffusion_out),
		.srows_out(srows_out)
	);

	diffusion_test_bench tester
	(
		.begintest(begintest),
		.endtest(endtest),
		.dutpassed(dutpassed),
		.diffusion_in(diffusion_in),
		.diffusion_out(diffusion_out),
		.srows_out(srows_out)
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

module diffusion_test_bench(
	input begintest,
	output reg endtest,
	output reg dutpassed,
	output reg [7:0] diffusion_in [3:0][3:0],
	input [7:0] diffusion_out [3:0][3:0],
	input [7:0] srows_out [3:0][3:0]
);

	always@(posedge begintest) begin
		$display("Testing diffusion now...");
		endtest = 0;
		dutpassed = 1;
		#20

		//test case 0--shift rows check
		$display("Testing case 0...");
		diffusion_in[3][3:0] = {8'd1, 8'd2, 8'd3, 8'd4};
		diffusion_in[2][3:0] = {8'd1, 8'd2, 8'd3, 8'd4};
		diffusion_in[1][3:0] = {8'd1, 8'd2, 8'd3, 8'd4};
		diffusion_in[0][3:0] = {8'd1, 8'd2, 8'd3, 8'd4};
		#20

		$display("%p", diffusion_in);
		$display("%p", diffusion_out);
		$display("srows");
		$display("%p", srows_out);
		#20

		//NOTE: yes, this works, but we need to code the if statement check to set dutPassed

		//test case 1--using the example given in the cartoon
		$display("Testing case 1...");
		diffusion_in[3][3:0] = {8'hc9, 8'hf8, 8'h92, 8'hf5};
		diffusion_in[2][3:0] = {8'haf, 8'hda, 8'haa, 8'h6b};
		diffusion_in[1][3:0] = {8'hd4, 8'hc9, 8'hd7, 8'h43};
		diffusion_in[0][3:0] = {8'hf2, 8'hb6, 8'h59, 8'h6a};
		#20
		$display("%p", diffusion_in);
		$display("%h", diffusion_out[0][3]);
		$display("%p", diffusion_out);
	#5
	endtest = 1;
	end

endmodule