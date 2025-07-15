vlib work

vlog q2.v q2_tb.v

vsim -voptargs=+acc work.dff_en_pre_tb

add wave *

run -all

#quit -sim
