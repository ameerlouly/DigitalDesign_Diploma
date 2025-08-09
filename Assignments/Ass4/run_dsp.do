vlib work

vlog simple_dsp.v simple_dsp_tb.v

vsim -voptargs=+acc work.simple_dsp_tb

add wave *

run -all

quit -sim
