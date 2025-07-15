vlib work

vlog shift_reg.v shift_reg_tb.v

vsim -voptargs=+acc work.shift_reg_tb

add wave *

run -all

#quit -sim

