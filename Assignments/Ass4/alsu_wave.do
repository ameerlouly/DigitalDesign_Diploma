onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alsu_tb/A
add wave -noupdate /alsu_tb/B
add wave -noupdate /alsu_tb/opcode
add wave -noupdate /alsu_tb/out_expected
add wave -noupdate /alsu_tb/out
add wave -noupdate /alsu_tb/leds
add wave -noupdate /alsu_tb/cin
add wave -noupdate /alsu_tb/serial_in
add wave -noupdate /alsu_tb/direction
add wave -noupdate /alsu_tb/red_op_A
add wave -noupdate /alsu_tb/red_op_B
add wave -noupdate /alsu_tb/bypass_A
add wave -noupdate /alsu_tb/bypass_B
add wave -noupdate /alsu_tb/clk
add wave -noupdate /alsu_tb/rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1957 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1914 ns} {1944 ns}
