vdel - lib work - all
vlib work


vlog -reportprogress 300 -work work key_expand.v key_expand.t.v sbox_LUT.v

vsim -voptargs="+acc" key_expand_testbenchharness

add wave -position insertpoint  \
sim:/key_expand_testbenchharness/aes_key \
sim:/key_expand_testbenchharness/key1 \
sim:/key_expand_testbenchharness/key2 \
sim:/key_expand_testbenchharness/key3 \
sim:/key_expand_testbenchharness/key4 \
sim:/key_expand_testbenchharness/key5 \
sim:/key_expand_testbenchharness/key6 \
sim:/key_expand_testbenchharness/key7 \
sim:/key_expand_testbenchharness/key8 \
sim:/key_expand_testbenchharness/key9 \
sim:/key_expand_testbenchharness/key10 \
sim:/key_expand_testbenchharness/begintest \
sim:/key_expand_testbenchharness/endtest \
sim:/key_expand_testbenchharness/dutpassed
run -all

wave zoom full