// diffusion.t.v
module diffusion_test_bench_harness();

	//wires for the diffusion
	wire	[7:0] diffusion_in [3:0][3:0];
	wire	[7:0] diffusion_out [3:0][3:0];

	//wires for the tester
	reg begintest;
	wire dutpassed;

	//instantiate the diffusion module

	diffusion DUT
	(	
		.diffusion_in(diffusion_in),
		.diffusion_out(diffusion_out)
	);

	diffusion_test_bench tester
	(
		.begintest(begintest),
		.endtest(endtest),
		.dutpassed(dutpassed),
		.diffusion_in(diffusion_in),
		.diffusion_out(diffusion_out)
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
	input [7:0] diffusion_out [3:0][3:0]
);

	initial begin
		diffusion_in[3][3:0] = {8'd1, 8'd1, 8'd1, 8'd1};
		diffusion_in[2][3:0] = {8'd2, 8'd2, 8'd2, 8'd2};
		diffusion_in[1][3:0] = {8'd3, 8'd3, 8'd3, 8'd3};
		diffusion_in[0][3:0] = {8'd4, 8'd4, 8'd4, 8'd4};
	end

	always@(posedge begintest) begin
		$display("Testing diffusion now...");
		endtest = 0;
		dutpassed = 1;
		#20
		$display("display");
		$display("%p", diffusion_in);
		$display("%p", diffusion_out);

	#5
	endtest = 1;
	end

endmodule