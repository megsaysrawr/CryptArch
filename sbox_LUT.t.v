module sbox_LUT_testbenchharness();
  wire [7:0] byte_in;
  wire [7:0] sbyte;
  reg		begintest;	// Set High to begin testing register file
  wire		dutpassed;	// Indicates whether register file passed tests

  sbox_LUT DUT
  (
    .byte_in(byte_in),
    .sbyte(sbyte)
  );



  // Instantiate test bench to test the DUT
  sbox_LUT_testbench tester
  (
    .begintest(begintest),
    .endtest(endtest), 
    .dutpassed(dutpassed),
    .byte_in(byte_in),
    .sbyte(sbyte)
  );

  // Initialize outputs from the test bench
  initial begin
 
  begintest = 0;
  #10
  begintest = 1;
  end


   // Display test results ('dutpassed' signal) once 'endtest' goes high
  always @(posedge endtest) begin
    $display("DUT passed?: %b", dutpassed);
  end



    
endmodule



module sbox_LUT_testbench(
// Test bench driver signal connections
input	   		begintest,	// Triggers start of testing
output reg 		endtest,	// Raise once test completes
output reg 		dutpassed,	// Signal test result
// DUT connections
input reg[7:0]		sbyte,
output reg[7:0]		byte_in
);

initial begin
	byte_in = 0;
	
end

  always @(posedge begintest) begin
  	$display("Testing SBOX now...");
    endtest = 0;
    dutpassed = 1;
    #10


//Test Case 0
  byte_in=00000000;
  #5

  // Verify expectations and report test result
  if(sbyte != 8'b01100011) begin //00 maps to 63(hex) 
    dutpassed = 0;  // Set to 'false' on failure
    $display("Failed Test 0");
    $display("byte_in = %b", byte_in);
    $display("sbyte = %b",sbyte);
  end


//Test Case 1
  byte_in=8'b11111111;
  #5
  // Verify expectations and report test result
  if(sbyte != 8'b00010110) begin //00 maps to 63(hex) 
    dutpassed = 0;  // Set to 'false' on failure
    $display("Failed Test 1");
    $display("byte_in = %b", byte_in);
    $display("sbyte = %b",sbyte);
  end



//Test Case 2
  byte_in=8'b10101010;
  #5
  // Verify expectations and report test result
  if(sbyte != 8'hac) begin //00 maps to 63(hex) 
    dutpassed = 0;  // Set to 'false' on failure
    $display("Failed Test 2");
    $display("byte_in = %b", byte_in);
    $display("sbyte = %b",sbyte);
  end



  //Test Case 3
  byte_in=8'b10101010;
  #5
  // Verify expectations and report test result
  if(sbyte != 8'hac) begin //00 maps to 63(hex) 
    dutpassed = 0;  // Set to 'false' on failure
    $display("Failed Test 3");
    $display("byte_in = %b", byte_in);
    $display("sbyte = %b",sbyte);
  end



  //Test Case 4
  byte_in=8'b11110000;
  #5
  // Verify expectations and report test result
  if(sbyte != 8'h8c) begin //00 maps to 63(hex) 
    dutpassed = 0;  // Set to 'false' on failure
    $display("Failed Test 4");
    $display("byte_in = %b", byte_in);
    $display("sbyte = %b",sbyte);
  end



  //Test Case 5
  byte_in=8'b00001111;
  #5
  // Verify expectations and report test result
  if(sbyte != 8'h76) begin //00 maps to 63(hex) 
    dutpassed = 0;  // Set to 'false' on failure
    $display("Failed Test 5");
    $display("byte_in = %b", byte_in);
    $display("sbyte = %b",sbyte);
  end



#5
  if (dutpassed == 1) begin
       $display("SBOX passed! Great!");
      endtest = 1;
  end
end
  endmodule


