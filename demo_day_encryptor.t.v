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
		// input hex message
		plaintext=128'h636f6d7061726368636f6d7061726368;
		//input hex key 
		key=128'h737570657220736563726574206b6579;
		rst=1; #10
			$display("Your plain hex input = %h", plaintext);
			$display("Your key hex input = %h", key);
			$display("Encrypting...");
			$display("Your encrypted hex output = %h", ciphertext);
		end

endmodule
