vdel - lib work - all
vlib work

vlog -reportprogress 300 -work work substitutekey.v substitutekey.t.v
vsim -voptargs="+acc" testsubstitutekey

add wave -position insertpoint  \
sim:/testsubstitutekey/subkeyout \
sim:/testsubstitutekey/subkeyin \
sim:/testsubstitutekey/begintest \
sim:/testsubstitutekey/endtest \
sim:/testsubstitutekey/dutpassed
run -all

wave zoom full