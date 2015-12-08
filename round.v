//------------------------------------------------------------------------
// Round
//------------------------------------------------------------------------
`include "substitutekey.v" 
`include "diffusion.v" 
`include "addroundkey.v"

module round
(
input [7:0] roundin [3:0][3:0],
input [7:0] key [3:0][3:0],
input rst,
input clk,
output reg [7:0] roundout [3:0][3:0]
);

wire substitutekeyout;
wire diffusionout;

always @(posedge clk) begin
  substitutekey subkey(roundin, substitutekeyout);
  diffusion dif (substitutekeyout, diffusionout);
  addroundkey addrk (diffusionout, roundout);
end

endmodule
