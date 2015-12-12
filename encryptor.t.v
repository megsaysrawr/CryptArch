//------------------------------------------------------------------------
// Encrption test bench
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
       // #100;
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

	//always begin
       // #5 clk = !clk;
   // end

	always @(begintest) begin
		endtest = 0;
		dutpassed = 1;
		//clk = 0;

		plaintext=128'h0123456789abcdeffedcba9876543210; 
		key=128'h12121212121212121212121212121212; 
		rst=1; #100
		if (ciphertext !== 0)begin
			dutpassed = 0;
			//$display ("Round0Text - %h:, round4output);
			$display("Cipher Text = %b", ciphertext);
			$display("3-Encrptor Broken");
		end
		if (ciphertext == 0)begin
			dutpassed = 0;
			$display("Cipher Text = %h", ciphertext);
		end
	
		if (ciphertext==128'd1928 && done != 1'b1) begin
			dutpassed = 0;
			$display("1-Done Signal Broken: Not done when should be.");
		end


		plaintext=128'd285; key=128'd1293; rst=1; #10
		if (ciphertext != 128'd00) begin
			dutpassed = 0;
			$display("6-Encrptor Broken");
		end

		endtest = 1;
		//$finish;
	end

endmodule
