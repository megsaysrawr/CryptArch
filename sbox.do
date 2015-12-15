vdel - lib work - all
vlib work


vlog -reportprogress 300 -work work sbox_LUT.t.v
vsim -voptargs="+acc" sbox_LUT_testbenchharness

add wave -position insertpoint  \
sim:/sbox_LUT_testbenchharness/byte_in \
sim:/sbox_LUT_testbenchharness/sbyte \
sim:/sbox_LUT_testbenchharness/begintest \
sim:/sbox_LUT_testbenchharness/endtest \
sim:/sbox_LUT_testbenchharness/dutpassed
run -all

wave zoom full