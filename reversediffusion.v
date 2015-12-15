/*diffusion.v

Crypt Arch Project
part 1: shift rows
part 2: mix columns
All of this code implies that the matrix is constructed [row, column].
i.e. [3][3:0] will give you all of the top row and [3:0][3] will give you all of the first column
*/

`include "reverse_mix_cols.v"

module reverseshift_rows(
	input	[7:0] shift_rows_in [3:0][3:0],			//square matrix with 8 bits in each element; width is four, depth is four
	output	[7:0] shift_rows_out [3:0][3:0]
);
	//push everything to the left and then wrap it around

	assign shift_rows_out [0][3:1] = shift_rows_in [0][2:0];		//1: all the same
	assign shift_rows_out [0][0] = shift_rows_in [0][3];	

	assign shift_rows_out [2][2:0] = shift_rows_in [2][3:1];		//2: keeps last three
	assign shift_rows_out [2][3] = shift_rows_in [2][0];			//2:	and shifts first one to last one

	assign shift_rows_out [1][1:0] = shift_rows_in [1][3:2];		//3: keeps last two
	assign shift_rows_out [1][3:2] = shift_rows_in [1][1:0];		//3:	and shifts first two to last two

	assign shift_rows_out [3][3:0] = shift_rows_in [3][3:0];			//4: keeps last one
	//assign shift_rows_out [3][3:2] = shift_rows_in [3][1:0];		//4:	and shifts first three to last three


endmodule

module reversediffusion(
	input	[7:0] diffusion_in [3:0][3:0],			//square matrix with 8 bits in each element; width is four, depth is four
	output	[7:0] diffusion_out [3:0][3:0]
);
	wire	[7:0] mixcol_out [3:0][3:0];
	wire	[31:0] col_1_in;
	wire	[31:0] col_1_out;
	wire	[31:0] col_2_in;
	wire	[31:0] col_2_out;
	wire	[31:0] col_3_in;
	wire	[31:0] col_3_out;
	wire	[31:0] col_4_in;
	wire	[31:0] col_4_out;

	//create temporary column wires from shift rows out
	assign col_1_in = {diffusion_in[3][3], diffusion_in[2][3], diffusion_in[1][3], diffusion_in[0][3]};
	assign col_2_in = {diffusion_in[3][2], diffusion_in[2][2], diffusion_in[1][2], diffusion_in[0][2]};
	assign col_3_in = {diffusion_in[3][1], diffusion_in[2][1], diffusion_in[1][1], diffusion_in[0][1]};
	assign col_4_in = {diffusion_in[3][0], diffusion_in[2][0], diffusion_in[1][0], diffusion_in[0][0]};

	//make a mix_columns module
	reverse_mix_cols col1 (.input_col(col_1_in), .final_col(col_1_out));
	reverse_mix_cols col2 (.input_col(col_2_in), .final_col(col_2_out));
	reverse_mix_cols col3 (.input_col(col_3_in), .final_col(col_3_out));
	reverse_mix_cols col4 (.input_col(col_4_in), .final_col(col_4_out));

	assign mixcol_out[3][3:0] = {col_1_out[31:24], col_2_out[31:24], col_3_out[31:24], col_4_out[31:24]};
	assign mixcol_out[2][3:0] = {col_1_out[23:16], col_2_out[23:16], col_3_out[23:16], col_4_out[23:16]};
	assign mixcol_out[1][3:0] = {col_1_out[15:8], col_2_out[15:8], col_3_out[15:8], col_4_out[15:8]};
	assign mixcol_out[0][3:0] = {col_1_out[7:0], col_2_out[7:0], col_3_out[7:0], col_4_out[7:0]};

	//make a reverseshift_rows module
	reverseshift_rows srows (.shift_rows_in(mixcol_out),
						.shift_rows_out(diffusion_out));

endmodule
