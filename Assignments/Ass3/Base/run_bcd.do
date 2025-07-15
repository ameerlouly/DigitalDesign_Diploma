vlib work

vlog bcd_counter_tb.v bcd_counter.v

vsim -voptargs=+acc work.bcd_counter_tb

add wave *

run -all

#quit -sim

