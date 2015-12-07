`include sbox_LUT.v
//module sbox_LUT_testbench
//(
// Test bench driver signal connections
//input	   		begintest,	// Triggers start of testing
//output reg 		endtest,	// Raise once test completes
//output reg 		dutpassed,	// Signal test result

// Register File DUT connections
//output reg [7:0] byte,

//input[7:0] sbyte
//);


module sbox_LUT_testbenchharness();
  wire [7:0] byte;
  wire [7:0] sbyte;
  reg		begintest;	// Set High to begin testing register file
  wire		dutpassed;	// Indicates whether register file passed tests

  sbox_LUT DUT
  (
    .byte(byte),
    .sbyte(sbyte)
  );



  // Instantiate test bench to test the DUT
  sbox_LUT_testbench tester
  (
    .begintest(begintest),
    .endtest(endtest), 
    .dutpassed(dutpassed),
    .byte(byte),
    .sbyte(sbyte)
  );

  // Initialize outputs from the test bench
  initial begin
  sbyte = 0;
  byte = 0;
  begintest = 0;
  #10
  begintest = 1;
  end


   // Display test results ('dutpassed' signal) once 'endtest' goes high
  always @(posedge endtest) begin
    $display("DUT passed?: %b", dutpassed);
  end


always @(posedge begintest) begin
    $display("Testing Sbox now...");
    endtest = 0;
    dutpassed = 1;
    #10
    
endmodule



module
//Test Case 0
  byte=00000000;
  #5
  // Verify expectations and report test result
  if((byte !== 00000000) || (sbyte !== 01100011)) begin //00 maps to 63(hex) 
    dutpassed = 0;  // Set to 'false' on failure
    $display("");
  end
  
#5
  if (dutpassed == 1) begin
      // $display("Register File passed!");
      endtest = 1;
  end

  endmodule


