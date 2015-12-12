//------------------------------------------------------------------------
// Encryptor
//------------------------------------------------------------------------
module encryptor
(
input [127:0] plaintext,
input [127:0] key,
input rst,
output reg [127:0] ciphertext,
output reg done
);

//The encryption module will perform AES encryption upon a 128 bit plaintext input. 
//It will also require a 128 bit key. The module is defined above. 
//The encryptor will begin on the first positive clock edge when rst is high. 
//When done goes high, the ciphertext output is ready to be read. 
reg [127:0] key1;
reg [127:0] key2;
reg [127:0] key3;
reg [127:0] key4;
reg [127:0] key5;
reg [127:0] key6;
reg [127:0] key7;
reg [127:0] key8;
reg [127:0] key9;
reg [127:0] key10;
reg [7:0] mkey1 [3:0][3:0];
reg [7:0] mkey2 [3:0][3:0];
reg [7:0] mkey3 [3:0][3:0];
reg [7:0] mkey4 [3:0][3:0];
reg [7:0] mkey5 [3:0][3:0];
reg [7:0] mkey6 [3:0][3:0];
reg [7:0] mkey7 [3:0][3:0];
reg [7:0] mkey8 [3:0][3:0];
reg [7:0] mkey9 [3:0][3:0];
reg [7:0] mkey10 [3:0][3:0];
reg [7:0] matrixifiedtext [3:0][3:0];
reg [7:0] matrixifiedkey [3:0][3:0];
reg [7:0] initialtext [3:0][3:0];
reg [7:0] round0output [3:0][3:0];
reg [7:0] round1output [3:0][3:0];
reg [7:0] round2output [3:0][3:0];
reg [7:0] round3output [3:0][3:0];
reg [7:0] round4output [3:0][3:0];
reg [7:0] round5output [3:0][3:0];
reg [7:0] round6output [3:0][3:0];
reg [7:0] round7output [3:0][3:0];
reg [7:0] round8output [3:0][3:0];
reg [7:0] round9output [3:0][3:0];
reg [7:0] round10output [3:0][3:0];
reg [127:0] textstart;
initial begin
if(rst==1 && done==1)begin
	
		assign textstart=plaintext;
		assign done = 0;
end
end

matrixify makematrix(textstart, matrixifiedtext);
matrixify makekey(key, matrixifiedkey);

key_expand makekeys(key, key1, key2, key3, key4, key5, key6, key7, key8, key9, key10);
matrixify makekey1(key1, mkey1);
matrixify makekey2(key2, mkey2);
matrixify makekey3(key3, mkey3);
matrixify makekey4(key4, mkey4);
matrixify makekey5(key5, mkey5);
matrixify makekey6(key6, mkey6);
matrixify makekey7(key7, mkey7);
matrixify makekey8(key8, mkey8);
matrixify makekey9(key9, mkey9);
matrixify makekey10(key10, mkey10);

addroundkey initialround(matrixifiedtext, matrixifiedkey, initialtext);
round round0(initialtext, mkey1, rst,  round0output);
round round1(round0output, mkey2, rst,  round1output);
round round2(round1output, mkey3, rst, round2output);
round round3(round2output, mkey4, rst, round3output);
round round4(round3output, mkey5, rst,  round4output);
round round5(round4output, mkey6, rst,  round5output);
round round6(round5output, mkey7, rst,  round6output);
round round7(round6output, mkey8, rst, round7output);
round round8(round7output, mkey9, rst,  round8output);
finalround round9(round8output, mkey10, rst,  round9output);
dematrixify finaloutput(round9output, ciphertext);
always @(ciphertext)begin
assign done =1;
end

endmodule
