//------------------------------------------------------------------------
// Add Round Key
//------------------------------------------------------------------------

module addroundkey
(
input [7:0]	 shiftrowsout [3:0] [3:0],   // Output from shift rows
input [7:0] 	 roundkey [3:0] [3:0],
output[7:0] addroundkeyout [3:0] [3:0] // Conditioned output signal
);

assign addroundkeyout [3][3] = shiftrowsout [3][3] ^ roundkey [3][3];
assign addroundkeyout [2][3] = shiftrowsout [2][3] ^ roundkey [2][3];
assign addroundkeyout [1][3] = shiftrowsout [1][3] ^ roundkey [1][3];
assign addroundkeyout [0][3] = shiftrowsout [0][3] ^ roundkey [0][3];
assign addroundkeyout [3][2] = shiftrowsout [3][2] ^ roundkey [3][2];
assign addroundkeyout [2][2] = shiftrowsout [2][2] ^ roundkey [2][2];
assign addroundkeyout [1][2] = shiftrowsout [1][2] ^ roundkey [1][2];
assign addroundkeyout [0][2] = shiftrowsout [0][2] ^ roundkey [0][2];
assign addroundkeyout [3][1] = shiftrowsout [3][1] ^ roundkey [3][1];
assign addroundkeyout [2][1] = shiftrowsout [2][1] ^ roundkey [2][1];
assign addroundkeyout [1][1] = shiftrowsout [1][1] ^ roundkey [1][1];
assign addroundkeyout [0][1] = shiftrowsout [0][1] ^ roundkey [0][1];
assign addroundkeyout [3][0] = shiftrowsout [3][0] ^ roundkey [3][0];
assign addroundkeyout [2][0] = shiftrowsout [2][0] ^ roundkey [2][0];
assign addroundkeyout [1][0] = shiftrowsout [1][0] ^ roundkey [1][0];
assign addroundkeyout [0][0] = shiftrowsout [0][0] ^ roundkey [0][0];

endmodule
