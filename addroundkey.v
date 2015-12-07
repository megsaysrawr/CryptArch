//------------------------------------------------------------------------
// Add Round Key
//------------------------------------------------------------------------

module addroundkey
(
input 	    clk,            
input	    shiftrowsout,   // Output from shift rows
input	    roundkey,
output reg  addroundkeyout  // Conditioned output signal
);

assign addroundkeyout = shiftrowsout ^ roundkey;

endmodule
