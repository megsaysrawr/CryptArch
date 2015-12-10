//------------------------------------------------------------------------
// Dematrixify
//------------------------------------------------------------------------

module dematrixify
(
input [7:0] matrix [3:0][3:0],
output reg [127:0] rawstring
);

assign rawstring[127:120] = matrix[3][3];
assign rawstring[119:112] = matrix[2][3];
assign rawstring[111:104] = matrix[1][3];
assign rawstring[103:96] = matrix[0][3];
assign rawstring[95:88] = matrix[3][2];
assign rawstring[87:80] = matrix[2][2];
assign rawstring[79:72] = matrix[1][2];
assign rawstring[71:64] = matrix[0][2];
assign rawstring[63:56] = matrix[3][1];
assign rawstring[55:48] = matrix[2][1];
assign rawstring[47:40] = matrix[1][1];
assign rawstring[39:32] = matrix[0][1];
assign rawstring[31:24] = matrix[3][0];
assign rawstring[23:16] = matrix[2][0];
assign rawstring[15:8] = matrix[1][0];
assign rawstring[7:0] = matrix[0][0];

endmodule
