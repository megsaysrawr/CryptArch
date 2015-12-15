vdel - lib work - all
vlib work

vlog -reportprogress 500 -work work mix_cols.v mix_cols.t.v
vsim -voptargs="+acc" mix_cols_test_bench_harness

run -all