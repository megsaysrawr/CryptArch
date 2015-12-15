//------------------------------------------------------------------------
// First Round - Decrypt
//------------------------------------------------------------------------

module firstround
(
input [7:0] roundin [3:0][3:0],
input [7:0] key [3:0][3:0],
input rst,
output reg [7:0] roundout [3:0][3:0]
);

wire [7:0] addroundkeyout [3:0][3:0];
wire [7:0] diffusionout [3:0][3:0];

  addroundkey addrk (roundin, key, addroundkeyout); 
  reverseshift_rows shift (addroundkeyout, diffusionout); 
  reversesubstitutekey subkey (diffusionout, roundout); 

endmodule
