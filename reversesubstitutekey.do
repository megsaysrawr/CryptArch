vdel - lib work - all
vlib work


vlog -reportprogress 300 -work work sbox_LUT_decrypt.v reversesubstitutekey.v reversesubstitutekey.t.v

vsim -voptargs="+acc" testreversesubstitutekey

add wave -position insertpoint  \
sim:/testreversesubstitutekey/subkeyout \
sim:/testreversesubstitutekey/subkeyin \
sim:/testreversesubstitutekey/begintest \
sim:/testreversesubstitutekey/endtest \
sim:/testreversesubstitutekey/dutpassed
run -all

wave zoom full