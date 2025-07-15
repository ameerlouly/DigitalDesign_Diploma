# ==========================================================================
# Status Commands 
# Version 2021.1 4558100 win64 28-Jan-2021
# Timestamp     : 2025-07-15 11:53:32
# Description   : Provides list of commands associated with the status(s) that are exported from GUI.
# Design        : bcd_counter
# Database      : D:/Github/DigitalDesign_Diploma/Assignments/Ass3/Base/Linting/
# ==========================================================================


lint report item  -arg module=bcd_counter  -arg file=D:/Github/DigitalDesign_Diploma/Assignments/Ass3/Base/bcd_counter.v  -check {multi_ports_in_single_line} -status {waived}
lint report item  -arg module=bcd_counter  -arg reset=rst  -arg file=D:/Github/DigitalDesign_Diploma/Assignments/Ass3/Base/bcd_counter.v  -check {async_reset_active_high} -status {waived}

# Completed writing status commands 
# ==========================================================================

