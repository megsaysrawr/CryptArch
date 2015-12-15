//------------------------------------------------------------------------
// Matrixify
//------------------------------------------------------------------------

module matrixify
(
input [127:0] rawstring,
output reg [7:0] matrix [3:0][3:0]
);

assign matrix[3][3] = rawstring[127:120];
assign matrix[2][3] = rawstring[119:112];
assign matrix[1][3] = rawstring[111:104];
assign matrix[0][3] = rawstring[103:96];
assign matrix[3][2] = rawstring[95:88];
assign matrix[2][2] = rawstring[87:80];
assign matrix[1][2] = rawstring[79:72];
assign matrix[0][2] = rawstring[71:64];
assign matrix[3][1] = rawstring[63:56];
assign matrix[2][1] = rawstring[55:48];
assign matrix[1][1] = rawstring[47:40];
assign matrix[0][1] = rawstring[39:32];
assign matrix[3][0] = rawstring[31:24];
assign matrix[2][0] = rawstring[23:16];
assign matrix[1][0] = rawstring[15:8];
assign matrix[0][0] = rawstring[7:0];

endmodule
