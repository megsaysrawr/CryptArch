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
        #1000;
    	end

    always @(endtest) begin
        $display("DUT passed: %b", dutpassed);
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


	always @(begintest) begin
		endtest = 0;
		dutpassed = 1;

		plaintext=128'h636f6d7061726368636f6d7061726368; 
		key=128'h6772696666696e746772696666696e74; 
		rst=1; #10
		if (ciphertext !== 128'h27a15792bba1cb6cba23475fdaa1cb1a)begin
			dutpassed = 0;
			$display("Cipher Text = %h", ciphertext);
			$display("3-Encryptor Broken");
		end
		#10

		plaintext=128'h0123456789abcdeffedcba9876543210;
		key=128'h0f1571c947d9e8590cb7add6af7f6798; 
		rst=1; #10
		if (ciphertext !== 128'hff0b844a0853bf7c6934ab4364148fb9)begin
			dutpassed = 0;
			$display("Cipher Text = %h", ciphertext);
			$display("Encryptor Broken");
		end
		
		endtest = 1;

	end

endmodule
