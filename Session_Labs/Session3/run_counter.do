vlib work
vlog counter.v counter_tb.v
vsim -voptargs=+acc work.counter_tb
add wave *
run -all
#quit -sim