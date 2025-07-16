vlib work

vlog SLE.v SLE_tb.v

vsim -voptargs=+acc work.sle_tb

add wave *

run -all

#quit -sim

