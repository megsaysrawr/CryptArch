/*diffusion.v

Crypt Arch Project
part 1: shift rows
part 2: mix columns
All of this code implies that the matrix is constructed [row, column].
i.e. [3][3:0] will give you all of the top row and [3:0][3] will give you all of the first column
*/

module shift_rows(
	input	[7:0] shift_rows_in [3:0][3:0],			//square matrix with 8 bits in each element; width is four, depth is four
	output	[7:0] shift_rows_out [3:0][3:0]
);
	//push everything to the left and then wrap it around

	assign shift_rows_out [3][3:0] = shift_rows_in [3][3:0];		//1: all the same

	assign shift_rows_out [2][3:1] = shift_rows_in [2][2:0];		//2: keeps last three
	assign shift_rows_out [2][0] = shift_rows_in [2][3];			//2:	and shifts first one to last one

	assign shift_rows_out [1][3:2] = shift_rows_in [1][1:0];		//3: keeps last two
	assign shift_rows_out [1][1:0] = shift_rows_in [1][3:2];		//3:	and shifts first two to last two

	assign shift_rows_out [0][3] = shift_rows_in [0][0];			//4: keeps last one
	assign shift_rows_out [0][2:0] = shift_rows_in [0][3:1];		//4:	and shifts first three to last three


endmodule

module diffusion(
	input	[7:0] diffusion_in [3:0][3:0],			//square matrix with 8 bits in each element; width is four, depth is four
	output	[7:0] diffusion_out [3:0][3:0]
);
	wire	[7:0] srows_out [3:0][3:0];
	wire	[31:0] col_1_in;
	wire	[31:0] col_1_out;
	wire	[31:0] col_2_in;
	wire	[31:0] col_2_out;
	wire	[31:0] col_3_in;
	wire	[31:0] col_3_out;
	wire	[31:0] col_4_in;
	wire	[31:0] col_4_out;

	//make a shift_rows module
	shift_rows srows (.shift_rows_in(diffusion_in),
						.shift_rows_out(srows_out));

	//create temporary column wires from shift rows out
	assign col_1_in = {srows_out[3][3], srows_out[2][3], srows_out[1][3], srows_out[0][3]};
	assign col_2_in = {srows_out[3][2], srows_out[2][2], srows_out[1][2], srows_out[0][2]};
	assign col_3_in = {srows_out[3][1], srows_out[2][1], srows_out[1][1], srows_out[0][1]};
	assign col_4_in = {srows_out[3][0], srows_out[2][0], srows_out[1][0], srows_out[0][0]};

	//make a mix_columns module
	mix_cols col1 (.input_col(col_1_in), .final_col(col_1_out));
	mix_cols col2 (.input_col(col_2_in), .final_col(col_2_out));
	mix_cols col3 (.input_col(col_3_in), .final_col(col_3_out));
	mix_cols col4 (.input_col(col_4_in), .final_col(col_4_out));
	assign diffusion_out[3][3:0] = {col_1_out[31:24], col_2_out[31:24], col_3_out[31:24], col_4_out[31:24]};
	assign diffusion_out[2][3:0] = {col_1_out[23:16], col_2_out[23:16], col_3_out[23:16], col_4_out[23:16]};
	assign diffusion_out[1][3:0] = {col_1_out[15:8], col_2_out[15:8], col_3_out[15:8], col_4_out[15:8]};
	assign diffusion_out[0][3:0] = {col_1_out[7:0], col_2_out[7:0], col_3_out[7:0], col_4_out[7:0]};

endmodule
