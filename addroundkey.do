vlog -reportprogress 500 -work work addroundkey.v
vsim -voptargs="+acc" addroundkey

run -all
