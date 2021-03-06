vdel - lib work - all
vlib work

vlog -reportprogress 300 -work work substitutekey.v diffusion.v addroundkey.v finalround.v finalround.t.v 
vsim -voptargs="+acc" testfinalround

add wave -position insertpoint  \
sim:/testfinalround/roundin \
sim:/testfinalround/key \
sim:/testfinalround/rst \
sim:/testfinalround/begintest \
sim:/testfinalround/endtest \
sim:/testfinalround/dutpassed
run -all

wave zoom full