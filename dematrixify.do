vdel - lib work - all
vlib work

vlog -reportprogress 300 -work work dematrixify.v dematrixify.t.v 
vsim -voptargs="+acc" testdematrixify

add wave -position insertpoint  \
sim:/testdematrixify/matrix \
sim:/testdematrixify/rawstring \
sim:/testdematrixify/begintest \
sim:/testdematrixify/endtest \
sim:/testdematrixify/dutpassed
run -all

wave zoom full