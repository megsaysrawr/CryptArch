vdel - lib work - all
vlib work

vlog -reportprogress 300 -work work reversesubstitutekey.v reversediffusion.v addroundkey.v reverseround.v reverseround.t.v 
vsim -voptargs="+acc" testreverseround

add wave -position insertpoint  \
sim:/testreverseround/roundin \
sim:/testreverseround/key \
sim:/testreverseround/rst \
sim:/testreverseround/roundout \
sim:/testreverseround/begintest \
sim:/testreverseround/endtest \
sim:/testreverseround/dutpassed
run -all

wave zoom full