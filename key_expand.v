`include "sbox_LUT.v"
module key_expand(
	input [127:0] aes_key,
	output [127:0] key1,
	output [127:0] key2,
	output [127:0] key3,
	output [127:0] key4,
	output [127:0] key5,
	output [127:0] key6,
	output [127:0] key7,
	output [127:0] key8,
	output [127:0] key9,
	output [127:0] key10
);



	key_expand_round(4'b0001, aes_key, key1);
	key_expand_round(4'b0010, key1, key2);
	key_expand_round(4'b0011, key2, key3);
	key_expand_round(4'b0100, key3, key4);
	key_expand_round(4'b0101, key4, key5);
	key_expand_round(4'b0110, key5, key6);
	key_expand_round(4'b0111, key6, key7);
	key_expand_round(4'b1000, key7, key8);
	key_expand_round(4'b1001, key8, key9);
	key_expand_round(4'b1010, key9, key10);

endmodule


module key_expand_round(
	input [3:0] i,
	input [127:0] key,
	output [127:0] new_key
	
	);

reg [7:0] key_matrix [3:0] [3:0];
wire [7:0] key_col0 [3:0];
wire [7:0] key_col1 [3:0];
wire [7:0] key_col2 [3:0];
wire [7:0] key_col3 [3:0];
reg [7:0] shifted_byte;
wire [7:0] key_col0_shifted [3:0];
wire[7:0] key_col0_top_to_bottom [3:0];
reg [7:0] rcon [3:0];
wire [7:0] xor_col [3:0];
wire [7:0] key_col_0_sboxed [3:0];
wire [7:0] new_col0 [3:0];
wire [7:0] new_col1 [3:0];
wire [7:0] new_col2 [3:0];
wire [7:0] new_col3 [3:0];
wire [7:0] new_key_matrix [3:0] [3:0];
wire [127:0] new_key;

always @(i) begin
case(i)
4'b0001: rcon = {8'h01, 8'h00, 8'h00, 8'h00};
4'b0010: rcon = {8'h02, 8'h00, 8'h00, 8'h00};
4'b0011: rcon = {8'h04, 8'h00, 8'h00, 8'h00};
4'b0100: rcon = {8'h08, 8'h00, 8'h00, 8'h00};
4'b0101: rcon = {8'h10, 8'h00, 8'h00, 8'h00};
4'b0110: rcon = {8'h20, 8'h00, 8'h00, 8'h00};
4'b0111: rcon = {8'h40, 8'h00, 8'h00, 8'h00};
4'b1000: rcon = {8'h80, 8'h00, 8'h00, 8'h00};
4'b1001: rcon = {8'h1b, 8'h00, 8'h00, 8'h00};
4'b1010: rcon = {8'h36, 8'h00, 8'h00, 8'h00};
endcase
end

always@(rcon)begin
make_key_matrix(key, key_matrix, key_col0, key_col1, key_col2, key_col3);
shifted_byte = [7:0]key_col0 [3];
key_col0_shifted = key_col0 << 8; 
key_col0_top_to_bottom = key_col0_shifted + shifted_byte;
sbox_4byte(key_col0_top_to_bottom, key_col0_sboxed);
XOR(xor_col, key_col0_sboxed, rcon);
XOR(new_col3, key_col3, xor_col);
XOR(new_col2, new_col3, key_col2);
XOR(new_col1, new_col2, key_col1);
XOR(new_col0, new_col1, key_col0);

new_key_matrix ={new_col3, new_col2, new_col1, new_col0};
new_key = new_key_matrix;
end
endmodule


module make_key_matrix(
	input [127:0] key,
	output [7:0] key_matrix [3:0] [3:0],
	output [7:0] key_col0 [3:0],
	output [7:0] key_col1 [3:0] ,
	output [7:0] key_col2 [3:0] ,
	output [7:0] key_col3 [3:0] 
	);
	always @(key) begin
	key_matrix [3] [3] = [127:120] key;
	key_matrix [2] [3]  = [119:112] key;
	key_matrix [1] [3]  = [111:104] key;
	key_matrix [0] [3]  = [103:96] key;
	[7:0] key_matrix [3] [2]  = [95:88] key;
	[7:0] key_matrix [2] [2]  = [87:80] key;
	[7:0] key_matrix [1] [2]  = [79:72] key;
	[7:0] key_matrix [0] [2] = [71:64] key;
	[7:0] key_matrix [3] [1] = [63:56] key;
	[7:0] key_matrix [2] [1] = [55:48] key;
	[7:0] key_matrix [1] [1] = [47:40] key;
	[7:0] key_matrix [0] [1] = [39:32] key;
	[7:0] key_matrix [3] [0] = [31:24] key;
	[7:0] key_matrix [2] [0] = [23:16] key;
	[7:0] key_matrix [1] [0] = [15:8] key;
	[7:0] key_matrix [0] [0] = [7:0] key;
	[7:0] key_col3 [3:0] = [127:96] key;
	[7:0] key_col2 [3:0] = [95:64] key;
	[7:0] key_col1 [3:0] = [63:32] key;
	[7:0] key_col0 [3:0] = [31:0] key;
	end
endmodule




module sbox_4byte(
	input [7:0] col_4byte [3:0],
	output [7:0] col_4byte_sbox [3:0]
	);

sbox_LUT(col_4byte[0], byte0new);
sbox_LUT(col_4byte[1], byte1new);
sbox_LUT(col_4byte[2], byte2new);
sbox_LUT(col_4byte[3], byte3new);

assign col_4byte_sbox = {byte3new,byte2new,byte1new,byte0new};

endmodule
