module key_expand_testbenchharness();
  wire [127:0] aes_key;
  wire [127:0] key1;
  wire [127:0] key2;
  wire [127:0] key3;
  wire [127:0] key4;  
  wire [127:0] key5;
  wire [127:0] key6;
  wire [127:0] key7;
  wire [127:0] key8;
  wire [127:0] key9;
  wire [127:0] key10;
  reg		begintest;	// Set High to begin testing register file
  wire		dutpassed;	// Indicates whether register file passed tests

  key_expand DUT
  (
    .aes_key(aes_key),
    .key1(key1),
    .key2(key2),
    .key3(key3),
    .key4(key4),
    .key5(key5),
    .key6(key6),
    .key7(key7),
    .key8(key8),
    .key9(key9),
    .key10(key10)
  );



  // Instantiate test bench to test the DUT
  key_expand_testbench tester
  (
    .begintest(begintest),
    .endtest(endtest), 
    .dutpassed(dutpassed),
    .aes_key(aes_key),
    .key1(key1),
    .key2(key2),
    .key3(key3),
    .key4(key4),
    .key5(key5),
    .key6(key6),
    .key7(key7),
    .key8(key8),
    .key9(key9),
    .key10(key10)
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



module key_expand_testbench(
// Test bench driver signal connections
input	   		begintest,	// Triggers start of testing
output reg 		endtest,	// Raise once test completes
output reg 		dutpassed,	// Signal test result
// DUT connections
input reg[127:0]	key1,
input reg[127:0]	key2,
input reg[127:0]	key3,
input reg[127:0]	key4,
input reg[127:0]	key5,
input reg[127:0]	key6,
input reg[127:0]	key7,
input reg[127:0]	key8,
input reg[127:0]	key9,
input reg[127:0]	key10,
output reg[127:0]	aes_key
);

initial begin
	aes_key = 0;
	
end

  always @(posedge begintest) begin
  	$display("Testing KEY EXPAND now...");
    endtest = 0;
    dutpassed = 1;
    #10


//Test Case 0
	aes_key = 128'h534f4d452031323820424954204b4559;
 #5

  // Verify expectations and report test result
  if(key1 != 128'he12186f2c110b4cae152fd9ec119b8c7 || key10 != 128'h3ea222a7987a5f4a38dc254fec19fc49) begin //00 maps to 63(hex) 
    dutpassed = 0;  // Set to 'false' on failure
    $display("Failed Test 0");
    $display("key1 = %h", key1);
    $display("key2 = %h", key2);	
    $display("key3 = %h", key3);
    $display("key4 = %h", key4);
    $display("key5 = %h", key5);
    $display("key6 = %h", key6);
    $display("key7 = %h", key7);
    $display("key8 = %h", key8);
    $display("key9 = %h", key9);
    $display("key10 =%h", key10);
  end

//Test 1
	aes_key = 128'h0f1571c947d9e8590cb7ad00af7f6798; 

#50
if(key1 != 128'hdc9037b09b49dfe997fe723f388115a7) begin //00 maps to 63(hex) 
    dutpassed = 0;  // Set to 'false' on failure
    $display(" ");
    $display("Failed Test 1");
    $display("key1 = %h", key1);
    $display("key2 = %h", key2);	
    $display("key3 = %h", key3);
    $display("key4 = %h", key4);
    $display("key5 = %h", key5);
    $display("key6 = %h", key6);
    $display("key7 = %h", key7);
    $display("key8 = %h", key8);
    $display("key9 = %h", key9);
    $display("key10 =%h", key10);
  end



  if (dutpassed == 1) begin
       $display("KEY EXPAND passed! Great!");

	$display("key1 = %h", key1);
	$display("key2 = %h", key2);
	$display("key3 = %h", key3);
	$display("key4 = %h", key4);
	$display("key5 = %h", key5);
	$display("key6 = %h", key6);
	$display("key7 = %h", key7);
	$display("key8 = %h", key8);
	$display("key9 = %h", key9);
	$display("key10 =%h", key10);


	endtest = 1;
  end
end
  endmodule

