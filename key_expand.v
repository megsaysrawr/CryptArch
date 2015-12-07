
module key_expand.v(
	input [127:0] aes_key,
	output [127:0] key1,
	output [127:0] key2,
	output [127:0] key3,
	output [127:0] key4,
	output [127:0] key5,
	output [127:0] key6,
	output [127:0] key7,
	output [127:0] key8,
	output [127:0] key9
);

wire [7:0] key_matrix [3:0] [3:0];
wire [7:0] key_col0 [3:0];
wire [7:0] key_col1 [3:0];
wire [7:0] key_col2 [3:0];
wire [7:0] key_col3 [3:0];
wire [7:0] shifted_byte;
wire [7:0] key_col0_shifted [3:0];
wire[7:0] key_col0_top_to_bottom [3:0];

make_key_matrix(aes_key, key_matrix, key_col0, key_col1, key_col2, key_col3)

shifted_byte = [7:0] [0] key_col0;
key_col0_shifted = key_col0 << 8; 
key_col0_top_to_bottom = key_col0_shifted + shifted_byte;

endmodule


module make_key_matrix(
	input [127:0] key,
	output [7:0] [3:0] [3:0] key_matrix,
	output [7:0] [3:0] key_col0,
	output [7:0] [3:0] key_col1,
	output [7:0] [3:0] key_col2,
	output [7:0] [3:0] key_col3
	);
	always @(key) begin
	[7:0] key_matrix [3] [3] = [127:120] key;
	[7:0] key_matrix [3] [2]  = [119:112] key;
	[7:0] key_matrix [3] [1]  = [111:104] key;
	[7:0] key_matrix [3] [0]  = [103:96] key;
	[7:0] key_matrix [2] [3]  = [95:88] key;
	[7:0] key_matrix [2] [2]  = [87:80] key;
	[7:0] key_matrix [2] [1]  = [79:72] key;
	[7:0] key_matrix [2] [0] = [71:64] key;
	[7:0] key_matrix [1] [3] = [63:56] key;
	[7:0] key_matrix [1] [2] = [55:48] key;
	[7:0] key_matrix [1] [1] = [47:40] key;
	[7:0] key_matrix [1] [0] = [39:32] key;
	[7:0] key_matrix [0] [3] = [31:24] key;
	[7:0] key_matrix [0] [2] = [23:16] key;
	[7:0] key_matrix [0] [1] = [15:8] key;
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



endmodule
