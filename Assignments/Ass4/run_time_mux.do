vlib work

vlog time_mux.v time_mux_tb.v

vsim -voptargs=+acc work.time_mux_tb

add wave *

run -all

# quit -sim
