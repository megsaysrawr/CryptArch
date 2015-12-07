vlog -reportprogress 500 -work work diffusion.v
vsim -voptargs="+acc" diffusion

run -all