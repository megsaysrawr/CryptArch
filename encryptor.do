vdel - lib work - all
vlib work


vlog -reportprogress 300 -work work encryptor.v encryptor.t.v key_expand.v addroundkey.v diffusion.v finalround.v matrixify.v round.v dematrixify.v
vsim -voptargs="+acc" testencryptor

add wave -position insertpoint  \
sim:/testencryptor/plaintext \
sim:/testencryptor/key \
sim:/testencryptor/rst \
sim:/testencryptor/clk \
sim:/testencryptor/ciphertext \
sim:/testencryptor/begintest \
sim:/testencryptor/endtest \
sim:/testencryptor/dutpassed
run 6000

wave zoom full