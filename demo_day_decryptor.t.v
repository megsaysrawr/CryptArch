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
		$display("--------------------------------------------------------------------");
		//Paste your encrypted hex output from running do demo_day_encryptor.do here
		ciphertext=128'h7d98af48b3c1e41cc809736f9ccf67c3;
		//Paste your key hex output here (it's the same key from running do demo_day_encryptor.do or user_encryption.py)
		key=128'h6d65677361797372617772746f796f75; 
		rst=1; #10
		$display("Your encrypted hex input = %h", ciphertext);
		$display("Your key hex input = %h", key);
		$display("Decrypting...");
		$display("Your decrypted hex message = %h", plaintext);
		$display("--------------------------------------------------------------------");
		end

endmodule
