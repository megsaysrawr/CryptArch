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

		plaintext=128'h636f6d7061726368636f6d7061726368; 
		key=128'h6772696666696e746772696666696e74; 
		rst=1; #100
		if (ciphertext !== 128'h27a15792bba1cb6cba23475fdaa1cb1a)begin
			dutpassed = 0;
			//$display ("Round0Text - %h:, round4output);
			$display("Cipher Text = %h", ciphertext);
			$display("3-Encrptor Broken");
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
