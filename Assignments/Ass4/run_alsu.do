vlib work

vlog ALSU.v ALSU.v

vsim -voptargs=+acc work.alsu_tb

add wave *
add wave alsu_tb/DUT.A_reg
add wave alsu_tb/DUT.red_op_A_reg

run -all

quit -sim
