//------------------------------------------------------------------------
// Add Round Key test bench
//------------------------------------------------------------------------
`include "addroundkey.v"
module testaddroundkey();	
	wire [7:0]	 shiftrowsout [3:0] [3:0];	
	wire [7:0] 	 roundkey [3:0] [3:0];
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
        if (dutpassed == 1) begin
            $display("\n\033[32mDUT passed: %b\033[37m\n", dutpassed);
        end else begin
            $display("\n\033[31mDUT passed: %b\033[37m\n", dutpassed);
        end
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

		shiftrowsout = 8'd28; roundkey = 8'd74; #10;
		if (addroundkeyout != 8'b1010110) begin
			dutpassed = 0;
			$display("Add Round Key Broken);
		end

		shiftrowsout = 8'd6; roundkey = 8'd127; #10;
		if (addroundkeyout != 8'b1111001) begin
			dutpassed = 0;
			$display("Add Round Key Broken);
		end

		shiftrowsout = 8'd195; roundkey = 8'13; #10;
		if (addroundkeyout != 8'b11001110) begin
			dutpassed = 0;
			$display("Add Round Key Broken);
		end

		endtest = 1;
		$finish;
	end

endmodule
