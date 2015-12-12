//------------------------------------------------------------------------
// Round
//------------------------------------------------------------------------
module round
(
input [7:0] roundin [3:0][3:0],
input [7:0] key [3:0][3:0],
input rst,
output reg [7:0] roundout [3:0][3:0]
);

wire [7:0] substitutekeyout [3:0][3:0];
wire [7:0] diffusionout [3:0][3:0];

  substitutekey subkey(roundin, substitutekeyout); 
  diffusion dif (substitutekeyout, diffusionout); 
  addroundkey addrk (diffusionout, key, roundout); 

endmodule
