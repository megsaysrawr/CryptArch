`include key_expand.v

module high_level_encryptor
(
input [127:0] text,
input [127:0] aes_key,
input start_aes,
input clk,
output reg [127:0] ciphertext,
output reg encryptor_done
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

key_expand (aes_key, key1, key2, key3, key4, key5, key6, key7, key8, key9);


endmodule
