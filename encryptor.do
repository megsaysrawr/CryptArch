vdel - lib work - all
vlib work

vlog -reportprogress 300 -work work sbox_LUT.v substitutekey.v key_expand.v addroundkey.v  mix_cols.v diffusion.v finalround.v matrixify.v round.v dematrixify.v encryptor.v encryptor.t.v 
vsim -voptargs="+acc" testencryptor

add wave -position insertpoint  \
sim:/testencryptor/plaintext \
sim:/testencryptor/key \
sim:/testencryptor/rst \
sim:/testencryptor/ciphertext \
sim:/testencryptor/begintest \
sim:/testencryptor/endtest \
sim:/testencryptor/dutpassed
run -all

wave zoom full