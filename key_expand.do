vdel - lib work - all
vlib work

vlog -reportprogress 300 -work work key_expand.t.v
vsim -voptargs="+acc" key_expand_testbenchharness

add wave -position insertpoint  \
sim:/key_expand_testbenchharness/byte \
sim:/key_expand_testbenchharness/sbyte \
sim:/key_expand_testbenchharness/begintest \
sim:/key_expand_testbenchharness/endtest \
sim:/key_expand_testbenchharness/dutpassed
run -all

wave zoom full