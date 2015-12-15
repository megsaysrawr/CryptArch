vdel - lib work - all
vlib work

vlog -reportprogress 300 -work work sbox_LUT.v sbox_LUT_decrypt.v reversesubstitutekey.v key_expand.v addroundkey.v  firstround.v mix_cols.v reversediffusion.v finalround.v matrixify.v reverseround.v dematrixify.v decryptor.v decryptor.t.v 
vsim -voptargs="+acc" testdecryptor

add wave -position insertpoint  \
sim:/testdecryptor/plaintext \
sim:/testdecryptor/key \
sim:/testdecryptor/rst \
sim:/testdecryptor/ciphertext \
sim:/testdecryptor/begintest \
sim:/testdecryptor/endtest \
sim:/testdecryptor/dutpassed
run -all

wave zoom full