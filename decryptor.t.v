//------------------------------------------------------------------------
// Decryption test bench
//------------------------------------------------------------------------
module testdecryptor();	
	wire [127:0] plaintext;	
	wire         done;
	wire [127:0] ciphertext;
	wire [127:0] key;
	wire rst; 

	reg begintest;
	wire dutpassed;

	decryptor dut(.plaintext(plaintext),
			.done(done),
			.ciphertext(ciphertext),
			.key(key),
			.rst(rst));

	decryptortestbench test(.begintest(begintest),
				.endtest(endtest),
				.dutpassed(dutpassed),
				.plaintext(plaintext),
				.done(done),
				.ciphertext(ciphertext),
				.key(key),
				.rst(rst));

	initial begin
        begintest = 1;
        #1000;
    	end

    always @(endtest) begin
        $display("DUT passed: %b", dutpassed);
    end
	
endmodule

module decryptortestbench (
	input begintest,
	output reg endtest,
	output reg dutpassed,

	output reg [127:0] ciphertext,
	output reg [127:0] key,
	output reg rst, 
	input [127:0] plaintext,
	input done
);

	always @(begintest) begin
		endtest = 0;
		dutpassed = 1;

		//Begin test 0
		ciphertext=128'h27a15792bba1cb6cba23475fdaa1cb1a;
		key=128'h6772696666696e746772696666696e74; 
		rst=1; #100
		if (plaintext !== 128'h636f6d7061726368636f6d7061726368)begin
			dutpassed = 0;
			$display("Plain Text = %h", ciphertext);
			$display("Decryptor Broken Test 0");
		end
		#30

		//Begin test 1
		ciphertext=128'hff0b844a0853bf7c6934ab4364148fb9;
		key=128'h0f1571c947d9e8590cb7add6af7f6798; 
		rst=1; #100
		if (plaintext !== 128'h0123456789abcdeffedcba9876543210)begin
			dutpassed = 0;
			$display("Plain Text = %h", ciphertext);
			$display("Decryptor Broken Test 1");
		end

		endtest = 1;

	end

endmodule
