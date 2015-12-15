# vdel - lib work - all
# vlib work

vlog -reportprogress 300 -work work addroundkey.v addroundkey.t.v
vsim -voptargs="+acc" testaddroundkey

add wave -position insertpoint  \
sim:/testaddroundkey/shiftrowsout \
sim:/testaddroundkey/roundkey \
sim:/testaddroundkey/addroundkeyout \
sim:/testaddroundkey/begintest \
sim:/testaddroundkey/endtest \
sim:/testaddroundkey/dutpassed
run -all

wave zoom full
