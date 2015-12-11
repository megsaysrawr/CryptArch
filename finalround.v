//------------------------------------------------------------------------
// Final Round
//------------------------------------------------------------------------
module finalround
(
input [7:0] roundin [3:0][3:0],
input [7:0] key [3:0][3:0],
input rst,
input clk,
output reg [7:0] roundout [3:0][3:0]
);

wire [7:0] substitutekeyout [3:0][3:0];
wire [7:0] diffusionout [3:0][3:0];

// always @(posedge clk) begin
  substitutekey subkey(roundin, substitutekeyout); 
  shift_rows shift (substitutekeyout, diffusionout); 
  addroundkey addrk (diffusionout, key, roundout); 
// end

endmodule
