vlib work

vlog ff.v ff_tb.v

vsim -voptargs=+acc work.dff_tb

add wave *

run -all

#quit -sim
