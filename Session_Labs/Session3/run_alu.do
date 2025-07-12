vlib work
vlog 4BitALU.v alu_seq_tb.v
vsim -voptargs=+acc work.alu_seq_tb
add wave *
run -all
#quit -sim