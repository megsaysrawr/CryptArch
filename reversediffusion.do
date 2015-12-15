vdel - lib work - all
vlib work

vlog -reportprogress 500 -work work reverse_mix_cols.v reversediffusion.v reversediffusion.t.v
vsim -voptargs="+acc" reverse_diffusion_test_bench_harness

run -all