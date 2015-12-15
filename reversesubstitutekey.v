//------------------------------------------------------------------------
// Reverse Substitute Key
//------------------------------------------------------------------------

module reversesubstitutekey
(
input [7:0] subkeyin [3:0][3:0],
output reg [7:0] subkeyout [3:0][3:0]
);

sbox_LUT_decrypt byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT_decrypt byte1 (subkeyin[2][3], subkeyout[2][3]);
sbox_LUT_decrypt byte2 (subkeyin[1][3], subkeyout[1][3]);
sbox_LUT_decrypt byte3 (subkeyin[0][3], subkeyout[0][3]);
sbox_LUT_decrypt byte4 (subkeyin[3][2], subkeyout[3][2]);
sbox_LUT_decrypt byte5 (subkeyin[2][2], subkeyout[2][2]);
sbox_LUT_decrypt byte6 (subkeyin[1][2], subkeyout[1][2]);
sbox_LUT_decrypt byte7 (subkeyin[0][2], subkeyout[0][2]);
sbox_LUT_decrypt byte8 (subkeyin[3][1], subkeyout[3][1]);
sbox_LUT_decrypt byte9 (subkeyin[2][1], subkeyout[2][1]);
sbox_LUT_decrypt byte10 (subkeyin[1][1], subkeyout[1][1]);
sbox_LUT_decrypt byte11 (subkeyin[0][1], subkeyout[0][1]);
sbox_LUT_decrypt byte12 (subkeyin[3][0], subkeyout[3][0]);
sbox_LUT_decrypt byte13 (subkeyin[2][0], subkeyout[2][0]);
sbox_LUT_decrypt byte14 (subkeyin[1][0], subkeyout[1][0]);
sbox_LUT_decrypt byte15 (subkeyin[0][0], subkeyout[0][0]);

endmodule
