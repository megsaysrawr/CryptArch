//------------------------------------------------------------------------
// Add Round Key
//------------------------------------------------------------------------

module addroundkey
(
input [7:0]	 shiftrowsout [3:0] [3:0],   // Output from shift rows
input [7:0] 	 roundkey [3:0] [3:0],
output reg [7:0] addroundkeyout [3:0] [3:0] // Conditioned output signal
);

assign addroundkeyout = shiftrowsout ^ roundkey;

endmodule
