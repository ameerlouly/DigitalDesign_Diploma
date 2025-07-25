vlib work

vlog Seq.v Seq_tb.v

vsim -voptargs=+acc work.alsu_tb

add wave *
add wave seq11_tb/DUT/cs seq11_tb/DUT/ns

run -all

