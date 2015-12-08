//------------------------------------------------------------------------
// Encrption test bench
//------------------------------------------------------------------------
`include "encrptor.v"

module testencrptor();	
	wire [127:0] ciphertext;	
	wire         done;
	wire [127:0] plaintext;
	wire [127:0] key;
	wire rst, clk;

	reg	begintest;
	wire dutpassed;

	encrptor dut(.ciphertext(ciphertext),
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
        #10000;
    end

    always @(posedge endtest) begin
        if (dutpassed == 1) begin
            $display("\n\033[32mDUT passed: %b\033[37m\n", dutpassed);
        end else begin
            $display("\n\033[31mDUT passed: %b\033[37m\n", dutpassed);
        end
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
			$display("Done Signal Broken: Not done when should be.");
		end
		if (rst != 1'b1) begin
			dutpassed = 0;
			$display("Reset Signal Broken: Not reset when should be.");
		end
		if (ciphertext != 128'd00) begin
			dutpassed = 0;
			$display("Encrptor Broken");
		end
		
		#5
		if (done != 1'b0) begin
			dutpassed = 0;
			$display("Timing Broken: Done when should not be.");
		end
		if (rst != 1'b0) begin
			dutpassed = 0;
			$display("Reset Signal Broken: Reset when should not be.");
		end

		plaintext=128'd285; key=128'd1293; rst=1; #5
		if (ciphertext != 128'd00) begin
			dutpassed = 0;
			$display("Encrptor Broken");
		end

		endtest = 1;
		$finish;
	end

endmodule
