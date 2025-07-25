vlib work

vlog vending_machine.v vending_tb.v

vsim -voptargs=+acc work.vending_tb

add wave *
add wave vending_tb/DUT/cs vending_tb/DUT/ns

run -all

quit -sim
