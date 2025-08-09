vlib work

vlog ALSU.v ALSU_tb.v

vsim -voptargs=+acc work.alsu_tb

add wave *
add wave alsu_tb/DUT.A_reg
add wave alsu_tb/DUT.red_op_A_reg
add wave alsu_tb/DUT.Invalid_Case

run -all

quit -sim
