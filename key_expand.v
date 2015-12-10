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
	
	key_expand_round key_round1(4'b0001, aes_key, key1);
	#10
	key_expand_round key_round2(4'b0010, key1, key2);
	##10
	key_expand_round key_round3(4'b0011, key2, key3);

	key_expand_round key_round4(4'b0100, key3, key4);
	key_expand_round key_round5(4'b0101, key4, key5);
	key_expand_round key_round6(4'b0110, key5, key6);
	key_expand_round key_round7(4'b0111, key6, key7);
	key_expand_round key_round8(4'b1000, key7, key8);
	key_expand_round key_round9(4'b1001, key8, key9);
	key_expand_round key_round10(4'b1010, key9, key10);
	

endmodule


module key_expand_round(
	input [3:0] i,
	input [127:0] key,
	output [127:0] new_key
	
	);

//reg [7:0]key_matrix [3:0] [3:0];
reg [31:0] key_col0;
reg [31:0] key_col1;
reg [31:0] key_col2;
reg [31:0] key_col3;
reg [7:0] shifted_byte;
reg [31:0]key_col0_shifted;
reg [23:0]key_col0_shiftedms;
reg [31:0] key_col0_top_to_bottom;
reg [31:0] rcon;
reg [31:0] xor_col;
reg [31:0] key_col0_sboxed;
reg [31:0] new_col0;
reg [31:0] new_col1;
reg [31:0] new_col2;
reg [31:0] new_col3;
//reg [31:0] new_key_matrix [3:0] [3:0];


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

make_key_matrix keymatrix(key, key_col0, key_col1, key_col2, key_col3);
assign shifted_byte = key_col0[31:24];
assign key_col0_shifted = key_col0 << 8; 
assign key_col0_shiftedms = key_col0_shifted[31:8];
assign key_col0_top_to_bottom = {key_col0_shiftedms, shifted_byte};
//assign key_col0_top_to_bottom = {key_col0_shifted + shifted_byte;
//key_col0_top_to_bottom = {matrixbyte20, matrixbyte10, matrixbyte00, matrixbyte30};
sbox_4byte sboxcol0(key_col0_top_to_bottom, key_col0_sboxed);
assign xor_col = key_col0_sboxed ^ rcon;
assign new_col3 = key_col3 ^ xor_col;
assign new_col2 = new_col3 ^ key_col2;
assign new_col1 = new_col2 ^ key_col1;
assign new_col0 = new_col1 ^ key_col0;
//$display("col3= %h", new_col3);
//assign new_key= {new_col3, new_col2, new_col1, new_col0};
//assign new_key = new_key_matrix;
assign new_key [127:96] =  new_col3;
assign new_key [95:64] = new_col2;
assign new_key [63:32] = new_col1;
assign new_key [31:0] = new_col0;


//XORCOL does not work
//KEYCOL's do not work
endmodule


module make_key_matrix(
	input [127:0] key,
	output reg [31:0] key_col0,
	output reg [31:0] key_col1,
	output reg [31:0] key_col2,
	output reg [31:0] key_col3 
	);
	
	
	assign key_col3  =  key[127:96];
	assign key_col2  = key[95:64];
	assign key_col1 =  key[63:32];
	assign key_col0 =  key[31:0];
	
endmodule




module sbox_4byte(
	input [31:0] col_4byte,
	output reg [31:0] col_4byte_sbox
	);
reg [7:0] byte0new;
reg [7:0] byte1new;
reg [7:0] byte2new;
reg [7:0] byte3new;
sbox_LUT sboxlut0(col_4byte[7:0], byte0new);
sbox_LUT sboxlut1(col_4byte[15:8], byte1new);
sbox_LUT sboxlut2(col_4byte[23:16], byte2new);
sbox_LUT sboxlut3(col_4byte[31:24], byte3new);

assign col_4byte_sbox = {byte3new,byte2new,byte1new,byte0new};

endmodule
