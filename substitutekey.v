//------------------------------------------------------------------------
// Substitute Key
//------------------------------------------------------------------------
`include 'sbox_LUT.v'

module substitutekey
(
input [7:0] subkeyin [3:0][3:0],
output reg [7:0] subkeyout [3:0][3:0],
);

sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);
sbox_LUT byte0 (subkeyin[3][3], subkeyout[3][3]);

endmodule
