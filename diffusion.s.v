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

module mix_columns(
	input	[7:0] mix_col_in [3:0][3:0],
	output	[7:0] mix_col_out [3:0][3:0]
);
	//each column gets its bits mixed up and then spit back out
	reg [7:0] mixer [3:0][3:0];

	//filling in the mixer matrix row by row (can also be done column by column or element by element if needed)
	//row 1
	assign mixer [3][3:0] = {8'd2, 8'd1, 8'd1, 8'd3};

	//row 2
	assign mixer [2][3:0] = {8'd3, 8'd2, 8'd1, 8'd1};

	//row 3
	assign mixer [1][3:0] = {8'd1, 8'd3, 8'd2, 8'd1};

	//row 4
	assign mixer [0][3:0] = {8'd1, 8'd1, 8'd3, 8'd2};

	//matrix multiplication the linearity way--by hand: one element = add each element in the row times each element in the column
	//first column
	assign mix_col_out [3][3] = mixer[3][3] * mix_col_in[3][3] + mixer[3][2] * mix_col_in[2][3] + mixer[3][1] * mix_col_in[1][3] + mixer[3][0] * mix_col_in[0][3];
	assign mix_col_out [2][3] = mixer[2][3] * mix_col_in[3][3] + mixer[2][2] * mix_col_in[2][3] + mixer[2][1] * mix_col_in[1][3] + mixer[2][0] * mix_col_in[0][3];
	assign mix_col_out [1][3] = mixer[1][3] * mix_col_in[3][3] + mixer[1][2] * mix_col_in[2][3] + mixer[1][1] * mix_col_in[1][3] + mixer[1][0] * mix_col_in[0][3];
	assign mix_col_out [0][3] = mixer[0][3] * mix_col_in[3][3] + mixer[0][2] * mix_col_in[2][3] + mixer[0][1] * mix_col_in[1][3] + mixer[0][0] * mix_col_in[0][3];
	//second column
	assign mix_col_out [3][2] = mixer[3][3] * mix_col_in[3][2] + mixer[3][2] * mix_col_in[2][2] + mixer[3][1] * mix_col_in[1][2] + mixer[3][0] * mix_col_in[0][2];
	assign mix_col_out [2][2] = mixer[2][3] * mix_col_in[3][2] + mixer[2][2] * mix_col_in[2][2] + mixer[2][1] * mix_col_in[1][2] + mixer[2][0] * mix_col_in[0][2];
	assign mix_col_out [1][2] = mixer[1][3] * mix_col_in[3][2] + mixer[1][2] * mix_col_in[2][2] + mixer[1][1] * mix_col_in[1][2] + mixer[1][0] * mix_col_in[0][2];
	assign mix_col_out [0][2] = mixer[0][3] * mix_col_in[3][2] + mixer[0][2] * mix_col_in[2][2] + mixer[0][1] * mix_col_in[1][2] + mixer[0][0] * mix_col_in[0][2];
	//third column
	assign mix_col_out [3][1] = mixer[3][3] * mix_col_in[3][1] + mixer[3][2] * mix_col_in[2][1] + mixer[3][1] * mix_col_in[1][1] + mixer[3][0] * mix_col_in[0][1];
	assign mix_col_out [2][1] = mixer[2][3] * mix_col_in[3][1] + mixer[2][2] * mix_col_in[2][1] + mixer[2][1] * mix_col_in[1][1] + mixer[2][0] * mix_col_in[0][1];
	assign mix_col_out [1][1] = mixer[1][3] * mix_col_in[3][1] + mixer[1][2] * mix_col_in[2][1] + mixer[1][1] * mix_col_in[1][1] + mixer[1][0] * mix_col_in[0][1];
	assign mix_col_out [0][1] = mixer[0][3] * mix_col_in[3][1] + mixer[0][2] * mix_col_in[2][1] + mixer[0][1] * mix_col_in[1][1] + mixer[0][0] * mix_col_in[0][1];
	//fourth column
	assign mix_col_out [3][0] = mixer[3][3] * mix_col_in[3][0] + mixer[3][2] * mix_col_in[2][0] + mixer[3][1] * mix_col_in[1][0] + mixer[3][0] * mix_col_in[0][0];
	assign mix_col_out [2][0] = mixer[2][3] * mix_col_in[3][0] + mixer[2][2] * mix_col_in[2][0] + mixer[2][1] * mix_col_in[1][0] + mixer[2][0] * mix_col_in[0][0];
	assign mix_col_out [1][0] = mixer[1][3] * mix_col_in[3][0] + mixer[1][2] * mix_col_in[2][0] + mixer[1][1] * mix_col_in[1][0] + mixer[1][0] * mix_col_in[0][0];
	assign mix_col_out [0][0] = mixer[0][3] * mix_col_in[3][0] + mixer[0][2] * mix_col_in[2][0] + mixer[0][1] * mix_col_in[1][0] + mixer[0][0] * mix_col_in[0][0];
endmodule

module diffusion(
	wire	[7:0] diffusion_in [3:0][3:0],			//square matrix with 8 bits in each element; width is four, depth is four
	wire	[7:0] diffusion_out [3:0][3:0]
);
	reg [7:0] srows_out [3:0][3:0];

	//make a shift_rows module
	shift_rows srows (.shift_rows_in(diffusion_in),
						.shift_rows_out(srows_out));

	//make a mix_columns module
	mix_columns mcols (.mix_col_in(srows_out),
						.mix_col_out(diffusion_out));
endmodule