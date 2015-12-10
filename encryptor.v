`include 'key_expand.v', 'addroundkey.v', 'diffusion.v'

module encryptor
(
input [127:0] plaintext,
input [127:0] key,
input rst,
input clk,
output reg [127:0] ciphertext,
output done
);

//The encryption module will perform AES encryption upon a 128 bit plaintext input. 
//It will also require a 128 bit key. The module is defined above. 
//The encryptor will begin on the first positive clock edge when start_aes is high. 
//When encryptor_done goes high, the ciphertext output is ready to be read. 
reg key1;
reg key2;
reg key3;
reg key4;
reg key5;
reg key6;
reg key7;
reg key8;
reg key9;
reg [7:0] matrixifiedtext [3:0][3:0]
reg [7:0] matrixifiedkey [3:0][3:0]
reg [7:0] initialtext [3:0][3:0]
reg [7:0] round0output [3:0][3:0]
reg [7:0] round1output [3:0][3:0]
reg [7:0] round2output [3:0][3:0]
reg [7:0] round3output [3:0][3:0]
reg [7:0] round4output [3:0][3:0]
reg [7:0] round5output [3:0][3:0]
reg [7:0] round6output [3:0][3:0]
reg [7:0] round7output [3:0][3:0]
reg [7:0] round8output [3:0][3:0]
reg [7:0] round9output [3:0][3:0]
reg [7:0] round10output [3:0][3:0]

matrixify makematrix(plaintext, matrixifiedtext);
matrixify makematrix(key, matrixifiedkey);

key_expand makekeys(key, key1, key2, key3, key4, key5, key6, key7, key8, key9, key10);
addroundkey initialround(matrixifiedtext, matrixifiedkey, initialtext);
round round0(initialtext, key1, rst, clk, round0output);
round round1(round0output, key2, rst, clk, round1output);
round round2(round1output, key3, rst, clk, round2output);
round round3(round2output, key4, rst, clk, round3output);
round round4(round3output, key5, rst, clk, round4output);
round round5(round4output, key6, rst, clk, round5output);
round round6(round5output, key7, rst, clk, round6output);
round round7(round6output, key8, rst, clk, round7output);
round round8(round8output, key9, rst, clk, round9output);
finalround round9(round9output, key10, rst, clk, round10output);
done = 1;
dematrixify finaloutput(round10output, ciphertext);

endmodule
