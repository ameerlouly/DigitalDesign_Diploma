onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal -radix binary /Q1/A
add wave -noupdate -format Literal -radix binary /Q1/B
add wave -noupdate -format Literal -radix binary /Q1/C
add wave -noupdate -format Literal -radix binary /Q1/D
add wave -noupdate -format Literal -radix binary /Q1/E
add wave -noupdate -format Literal -radix binary /Q1/F
add wave -noupdate -format Literal -radix binary /Q1/sel
add wave -noupdate -format Literal -radix binary /Q1/out
add wave -noupdate -format Literal -radix binary /Q1/out_bar
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0} {{Cursor 2} {829 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 126
configure wave -valuecolwidth 97
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
WaveRestoreZoom {0 ns} {840 ns}
