vdel - lib work - all
vlib work

vlog -reportprogress 500 -work work reverse_mix_cols.v reverse_mix_cols.t.v
vsim -voptargs="+acc" reverse_mix_cols_test_bench_harness

run -all