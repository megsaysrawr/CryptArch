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
       // #100;
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

		ciphertext=128'h27a15792bba1cb6cba23475fdaa1cb1a;
		key=128'h6772696666696e746772696666696e74; 
		rst=1; #100
		if (plaintext !== 128'h636f6d7061726368636f6d7061726368)begin
			dutpassed = 0;
			//$display ("Round0Text - %h:, round4output);
			$display("Plain Text = %h", ciphertext);
			$display("Decryptor Broken");
		end
		#10

		ciphertext=128'hff0b844a0853bf7c6934ab4364148fb9;
		key=128'h0f1571c947d9e8590cb7add6af7f6798; 
		rst=1; #100
		if (plaintext !== 128'h0123456789abcdeffedcba9876543210)begin
			dutpassed = 0;
			//$display ("Round0Text - %h:, round4output);
			$display("Plain Text = %h", ciphertext);
			$display("Decryptor Broken");
		end
		
		//if (ciphertext==128'd1928 && done != 1'b1) begin
		//	dutpassed = 0;
		//	$display("1-Done Signal Broken: Not done when should be.");
		//end


		//plaintext=128'd285; key=128'd1293; rst=1; #10
		//if (ciphertext != 128'd00) begin
		//	dutpassed = 0;
		//	$display("6-Encrptor Broken");
		//end
		
		endtest = 1;
		//$finish;
	end

endmodule