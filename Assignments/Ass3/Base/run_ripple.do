vlib work

vlog ripple.v ripple_tb.v

vsim -voptargs=+acc work.ripple_counter_tb

add wave *

run -all

#quit -sim

