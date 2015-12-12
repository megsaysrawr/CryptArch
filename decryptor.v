//------------------------------------------------------------------------
// Decryptor
//------------------------------------------------------------------------
`include 'key_expand.v', 'addroundkey.v', 'diffusion.v'

module encryptor
(
input [127:0] ciphertext,
input [127:0] key,
input rst,
output reg [127:0] plaintext,
output done
);

//The decryption module will perform AES encryption upon a 128 bit ciphertext input. 
//It will also require a 128 bit key. The module is defined above. 
//The decryptor will begin on the first positive clock edge when rst is high. 
//When done goes high, the plaintext output is ready to be read. 
reg key1;
reg key2;
reg key3;
reg key4;
reg key5;
reg key6;
reg key7;
reg key8;
reg key9;
reg key10;
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

matrixify makematrix(ciphertext, matrixifiedtext);
matrixify makematrix(key, matrixifiedkey);

key_expand makekeys(key, key1, key2, key3, key4, key5, key6, key7, key8, key9, key10);
firstround initialround(matrixifiedtext, key10, rst, initialtext);
reverseround round0(initialtext, key9, rst, round0output);
reverseround round1(round0output, key8, rst, round1output);
reverseround round2(round1output, key7, rst, round2output);
reverseround round3(round2output, key6, rst, round3output);
reverseround round4(round3output, key5, rst, round4output);
reverseround round5(round4output, key4, rst, round5output);
reverseround round6(round5output, key3, rst, round6output);
reverseround round7(round6output, key2, rst, round7output);
reverseround round8(round8output, key1, rst, round9output);
addroundkey lastround(round9output, matrixifiedkey, round10output);
dematrixify finaloutput(round10output, plaintext);
done = 1;

endmodule
