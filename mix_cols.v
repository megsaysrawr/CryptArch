/*
This module will take in 4 bytes, and will output the full column after 
being "mixed"
input should be 32 bit column where the most significant bits are the top "box" of the column
output will be another 32 bit column that has been "mixed" where the 8 most signinficant bits are 
the top box of the 
*/

module mix_cols(
input [31:0] input_col,
output reg [31:0] final_col
);

function automatic [7:0] xtime 
(input [7:0] b); 
return {b[6:0],1'b0}^(8'h1b&{8{b[7]}});

endfunction

function automatic [31:0] mix_col 
(input [7:0] s0,s1,s2,s3);
mix_col={xtime(s0)^xtime(s1)^s1^s2^s3,s0^xtime(s1)^xtime(s2)^s2^s3,

s0^s1^xtime(s2)^xtime(s3)^s3,xtime(s0)^s0^s1^s2^xtime(s3)};
endfunction 
assign final_col = mix_col(input_col[31:24], input_col[23:16], input_col[15:8], input_col [7:0]);

endmodule;