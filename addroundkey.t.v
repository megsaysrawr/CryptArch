//------------------------------------------------------------------------
// Add Round Key test bench
//------------------------------------------------------------------------
module testaddroundkey();	
	wire [7:0] shiftrowsout [3:0] [3:0];	
	wire [7:0] roundkey [3:0] [3:0];
	wire [7:0] addroundkeyout [3:0] [3:0];

	reg	begintest;
	wire dutpassed;

	addroundkey dut(.shiftrowsout(shiftrowsout),
			.roundkey(roundkey),
			.addroundkeyout(addroundkeyout));

	addroundkeytestbench test(.begintest(begintest),
				.endtest(endtest),
				.dutpassed(dutpassed),
				.shiftrowsout(shiftrowsout),
			        .roundkey(roundkey),
			        .addroundkeyout(addroundkeyout));

	initial begin
        begintest = 0;
        #10;
        begintest = 1;
        #100;
    end

    always @(endtest) begin
        $display("DUT passed: ", dutpassed);
    end
	
endmodule

module addroundkeytestbench (
	input begintest,
	output reg endtest,
	output reg dutpassed,

	output reg [7:0]	 shiftrowsout [3:0] [3:0],
	output reg [7:0] 	 roundkey [3:0] [3:0],
	input [7:0] addroundkeyout [3:0] [3:0]
);

	always @(begintest) begin
		endtest = 0;
		dutpassed = 1;

		shiftrowsout[3][3] = 8'd28; roundkey[3][3] = 8'd74; #10;
		if (addroundkeyout[3][3] != 8'b1010110) begin
			dutpassed = 0;
			$display("Add Round Key [3][3] Broken");
		end

		shiftrowsout[2][2] = 8'd6; roundkey[2][2] = 8'd127; #10;
		if (addroundkeyout[2][2] != 8'b1111001) begin
			dutpassed = 0;
			$display("Add Round Key Broken");
		end

		shiftrowsout[1][1] = 8'd195; roundkey[1][1] = 8'd13; #10;
		if (addroundkeyout[1][1] != 8'b11001110) begin
			dutpassed = 0;
			$display("Add Round Key Broken");
		end

		endtest = 1;

	end

endmodule
