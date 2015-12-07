vlog -reportprogress 500 -work work diffusion.s.v diffusion.t.v
vsim -voptargs="+acc" diffusion_test_bench_harness

run 2000