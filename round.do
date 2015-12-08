vdel - lib work - all
vlib work

vlog -reportprogress 300 -work work round.t.v substitutekey.v diffusion.v addroundkey.v round.v
vsim -voptargs="+acc" testround

add wave -position insertpoint  \
sim:/testround/roundin \
sim:/testround/key \
sim:/testround/rst \
sim:/testround/clk \
sim:/testround/begintest \
sim:/testround/endtest \
sim:/testround/dutpassed
run -all

wave zoom full