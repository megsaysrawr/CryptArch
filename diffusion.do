vlog -reportprogress 500 -work work diffusion.v diffusion.t.v mix_cols.v
vsim -voptargs="+acc" diffusion_test_bench_harness

run -all