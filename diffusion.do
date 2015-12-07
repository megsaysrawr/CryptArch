vlog -reportprogress 500 -work work diffusion.s.v
vsim -voptargs="+acc" diffusion

run -all