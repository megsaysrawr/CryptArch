//------------------------------------------------------------------------
// Reverse Diffusion test bench
//------------------------------------------------------------------------
`include "reversediffusion.v"
module reverse_diffusion_test_bench_harness();

	//wires for the diffusion
	wire	[7:0] diffusion_in [3:0][3:0];
	wire	[7:0] diffusion_out [3:0][3:0];

	//wires for the tester
	reg begintest;
	wire dutpassed;

	//instantiate the diffusion module

	reversediffusion DUT
	(	
		.diffusion_in(diffusion_in),
		.diffusion_out(diffusion_out)
	);

	reverse_diffusion_test_bench tester
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

module reverse_diffusion_test_bench(
	input begintest,
	output reg endtest,
	output reg dutpassed,
	output reg [7:0] diffusion_in [3:0][3:0],
	input [7:0] diffusion_out [3:0][3:0]
);

	always@(posedge begintest) begin
		$display("Testing reverse diffusion now...");
		endtest = 0;
		dutpassed = 1;
		#20

		//test case 0--check to see if what is inputted gets stored properly
		$display("---------------------------------");
		$display("Testing case 0...");
		diffusion_in[3][3:0] = {8'h7b, 8'h05, 8'h42, 8'h4a};
		diffusion_in[2][3:0] = {8'h1e, 8'hd0, 8'h20, 8'h40};
		diffusion_in[1][3:0] = {8'h94, 8'h83, 8'h18, 8'h52};
		diffusion_in[0][3:0] = {8'h94, 8'hc4, 8'h43, 8'hfb};
		#20

		if (diffusion_out[3][3] != 40) begin
		dutpassed = 0;
		$display("diffusion_in");
		$display("%d %d %d %d", diffusion_in[3][3], diffusion_in[3][2], diffusion_in[3][1], diffusion_in[3][0]);
		$display("%d %d %d %d", diffusion_in[2][3], diffusion_in[2][2], diffusion_in[2][1], diffusion_in[2][0]);
		$display("%d %d %d %d", diffusion_in[1][3], diffusion_in[1][2], diffusion_in[1][1], diffusion_in[1][0]);
		$display("%d %d %d %d", diffusion_in[0][3], diffusion_in[0][2], diffusion_in[0][1], diffusion_in[0][0]);
		$display("Reverse diffusion [3][3] broken");
		end

		if (diffusion_out[2][1] != 48) begin
		dutpassed = 0;
		$display("diffusion_in");
		$display("%d %d %d %d", diffusion_in[3][3], diffusion_in[3][2], diffusion_in[3][1], diffusion_in[3][0]);
		$display("%d %d %d %d", diffusion_in[2][3], diffusion_in[2][2], diffusion_in[2][1], diffusion_in[2][0]);
		$display("%d %d %d %d", diffusion_in[1][3], diffusion_in[1][2], diffusion_in[1][1], diffusion_in[1][0]);
		$display("%d %d %d %d", diffusion_in[0][3], diffusion_in[0][2], diffusion_in[0][1], diffusion_in[0][0]);
		$display("Reverse diffusion [2][1] broken");
		end

		if (diffusion_out[0][3] != 42f) begin
		dutpassed = 0;
		$display("diffusion_in");
		$display("%d %d %d %d", diffusion_in[3][3], diffusion_in[3][2], diffusion_in[3][1], diffusion_in[3][0]);
		$display("%d %d %d %d", diffusion_in[2][3], diffusion_in[2][2], diffusion_in[2][1], diffusion_in[2][0]);
		$display("%d %d %d %d", diffusion_in[1][3], diffusion_in[1][2], diffusion_in[1][1], diffusion_in[1][0]);
		$display("%d %d %d %d", diffusion_in[0][3], diffusion_in[0][2], diffusion_in[0][1], diffusion_in[0][0]);
		$display("Reverse diffusion [0][3] broken");
		end

		//NOTE: yes, this works, but we need to code the if statement check to set dutPassed

		//test case 1--test diffusion out using the example given in the cartoon
		$display("Testing case 1...");
		diffusion_in[3][3:0] = {8'hc9, 8'hfb, 8'h92, 8'hf5};
		diffusion_in[2][3:0] = {8'haf, 8'hda, 8'haa, 8'h6b};
		diffusion_in[1][3:0] = {8'hd4, 8'hc9, 8'hd7, 8'h43};
		diffusion_in[0][3:0] = {8'hf2, 8'hb6, 8'h59, 8'h6a};
		#20

		$display("diffusion_in");
		$display("%h %h %h %h", diffusion_in[3][3], diffusion_in[3][2], diffusion_in[3][1], diffusion_in[3][0]);
		$display("%h %h %h %h", diffusion_in[2][3], diffusion_in[2][2], diffusion_in[2][1], diffusion_in[2][0]);
		$display("%h %h %h %h", diffusion_in[1][3], diffusion_in[1][2], diffusion_in[1][1], diffusion_in[1][0]);
		$display("%h %h %h %h", diffusion_in[0][3], diffusion_in[0][2], diffusion_in[0][1], diffusion_in[0][0]);

		$display("diffusion_out");
		$display("%h %h %h %h", diffusion_out[3][3], diffusion_out[3][2], diffusion_out[3][1], diffusion_out[3][0]);
		$display("%h %h %h %h", diffusion_out[2][3], diffusion_out[2][2], diffusion_out[2][1], diffusion_out[2][0]);
		$display("%h %h %h %h", diffusion_out[1][3], diffusion_out[1][2], diffusion_out[1][1], diffusion_out[1][0]);
		$display("%h %h %h %h", diffusion_out[0][3], diffusion_out[0][2], diffusion_out[0][1], diffusion_out[0][0]);


	#5
	endtest = 1;
	end

endmodule
