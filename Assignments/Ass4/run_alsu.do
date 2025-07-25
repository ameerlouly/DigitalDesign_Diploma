vlib work

vlog ALSU.v ALSU.v

vsim -voptargs=+acc work.alsu_tb

add wave *

run -all

quit -sim
