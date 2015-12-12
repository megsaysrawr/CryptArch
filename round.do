vdel - lib work - all
vlib work

vlog -reportprogress 300 -work work substitutekey.v diffusion.v addroundkey.v round.v round.t.v 
vsim -voptargs="+acc" testround

add wave -position insertpoint  \
sim:/testround/roundin \
sim:/testround/key \
sim:/testround/rst \
sim:/testround/begintest \
sim:/testround/endtest \
sim:/testround/dutpassed
run -all

wave zoom full