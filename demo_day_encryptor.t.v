//------------------------------------------------------------------------
// Encryption test bench
//------------------------------------------------------------------------
module testencryptor();	
	wire [127:0] ciphertext;	
	wire         done;
	wire [127:0] plaintext;
	wire [127:0] key;
	wire rst; 

	reg	begintest;
	wire dutpassed;

	encryptor dut(.ciphertext(ciphertext),
			.done(done),
			.plaintext(plaintext),
			.key(key),
			.rst(rst));

	encryptortestbench test(.begintest(begintest),
							.endtest(endtest),
							.dutpassed(dutpassed),
							.ciphertext(ciphertext),
			        .done(done),
			        .plaintext(plaintext),
        			.key(key),
        			.rst(rst));

	initial begin
        begintest = 1;
    	end
	
endmodule

module encryptortestbench (
	input begintest,
	output reg endtest,
	output reg dutpassed,

	output reg [127:0] plaintext,
	output reg [127:0] key,
	output reg rst, 
	input [127:0] ciphertext,
	input done
);

	always@(begintest) begin
		$display("--------------------------------------------------------------------");
		// Paste your hex message from the output of user_encryption.py
		plaintext=128'h69206c6f766520636f6d706172636821;
		// Paste your hex key from the output of user_encryption.py
		key=128'h6d65677361797372617772746f796f75;
		rst=1; #10
			$display("Your plain hex input = %h", plaintext);
			$display("Your key hex input = %h", key);
			$display("Encrypting...");
			$display("Your encrypted hex output = %h", ciphertext);
		$display("--------------------------------------------------------------------");

		end

endmodule
