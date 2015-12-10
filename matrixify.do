vdel - lib work - all
vlib work

vlog -reportprogress 300 -work work matrixify.v matrixify.t.v 
vsim -voptargs="+acc" testmatrixify

add wave -position insertpoint  \
sim:/testmatrixify/rawstring \
sim:/testmatrixify/matrix \
sim:/testmatrixify/begintest \
sim:/testmatrixify/endtest \
sim:/testmatrixify/dutpassed
run -all

wave zoom full