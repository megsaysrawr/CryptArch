//------------------------------------------------------------------------
// Substitute Key
//------------------------------------------------------------------------
`include "sbox_LUT.v"

module substitutekey
(
input [7:0] subkeyin [3:0][3:0],
output reg [7:0] subkeyout [3:0][3:0]
);

sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte1 (subkeyin[2][3], subkeyout[2][3]);
sbox_LUT byte2 (subkeyin[1][3], subkeyout[1][3]);
sbox_LUT byte3 (subkeyin[0][3], subkeyout[0][3]);
sbox_LUT byte4 (subkeyin[3][2], subkeyout[3][2]);
sbox_LUT byte5 (subkeyin[2][2], subkeyout[2][2]);
sbox_LUT byte6 (subkeyin[1][2], subkeyout[1][2]);
sbox_LUT byte7 (subkeyin[0][2], subkeyout[0][2]);
sbox_LUT byte8 (subkeyin[3][1], subkeyout[3][1]);
sbox_LUT byte9 (subkeyin[2][1], subkeyout[2][1]);
sbox_LUT byte10 (subkeyin[1][1], subkeyout[1][1]);
sbox_LUT byte11 (subkeyin[0][1], subkeyout[0][1]);
sbox_LUT byte12 (subkeyin[3][0], subkeyout[3][0]);
sbox_LUT byte13 (subkeyin[2][0], subkeyout[2][0]);
sbox_LUT byte14 (subkeyin[1][0], subkeyout[1][0]);
sbox_LUT byte15 (subkeyin[0][0], subkeyout[0][0]);

endmodule
