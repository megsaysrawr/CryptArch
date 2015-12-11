//------------------------------------------------------------------------
// Encrption test bench
//------------------------------------------------------------------------
module testencryptor();	
	wire [127:0] ciphertext;	
	wire         done;
	wire [127:0] plaintext;
	wire [127:0] key;
	wire rst, clk;

	reg	begintest;
	wire dutpassed;

	encryptor dut(.ciphertext(ciphertext),
			.done(done),
			.plaintext(plaintext),
			.key(key),
			.rst(rst),
			.clk(clk));

	encryptortestbench test(.begintest(begintest),
							.endtest(endtest),
							.dutpassed(dutpassed),
							.ciphertext(ciphertext),
			        .done(done),
			        .plaintext(plaintext),
        			.key(key),
        			.rst(rst),
        			.clk(clk));

	initial begin
        begintest = 0;
        #10;
        begintest = 1;
        #1000;
    end

    always @(posedge endtest) begin
        $display("DUT passed: %b", dutpassed);
    end
	
endmodule

module encryptortestbench (
	input begintest,
	output reg endtest,
	output reg dutpassed,

	output reg [127:0] plaintext,
	output reg [127:0] key,
	output reg rst, clk,
	input [127:0] ciphertext,
	input done
);

	always begin
        #5 clk = !clk;
    end

	always @(posedge begintest) begin
		endtest = 0;
		dutpassed = 1;
		clk = 0;

		plaintext=128'd1407; key=128'd25; rst=1; #10;
		if (done != 1'b1) begin
			dutpassed = 0;
			$display("1-Done Signal Broken: Not done when should be.");
		end
		if (rst != 1'b1) begin
			dutpassed = 0;
			$display("2-Reset Signal Broken: Not reset when should be.");
		end
		if (ciphertext != 128'd00) begin
			dutpassed = 0;
			$display("3-Encrptor Broken");
		end
		
		#4000
		if (done != 1'b0) begin
			dutpassed = 0;
			$display("4-Timing Broken: Done when should not be.");
		end
		if (rst != 1'b0) begin
			dutpassed = 0;
			$display("5-Reset Signal Broken: Reset when should not be.");
		end

		plaintext=128'd285; key=128'd1293; rst=1; #5
		if (ciphertext != 128'd00) begin
			dutpassed = 0;
			$display("6-Encrptor Broken");
		end

		endtest = 1;
		//$finish;
	end

endmodule
