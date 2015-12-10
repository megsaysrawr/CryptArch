//------------------------------------------------------------------------
// Reverse Round
//------------------------------------------------------------------------
`include "substitutekey.v" 
`include "diffusion.v" 
`include "addroundkey.v"

module reverseround
(
input [7:0] roundin [3:0][3:0],
input [7:0] key [3:0][3:0],
input rst,
input clk,
output reg [7:0] roundout [3:0][3:0]
);

wire [7:0] addroundkeyout [3:0][3:0];
wire [7:0] diffusionout [3:0][3:0];

// always @(posedge clk) begin
  addroundkey addrk (roundin, key, addroundkeyout); 
  reversediffusion dif (addroundkeyout, diffusionout); 
  reversesubstitutekey subkey(diffusionout, roundout); 
// end

endmodule