# repair_hold_violations repair_hold4 for sky130
source helpers.tcl
read_liberty sky130/sky130_tt.lib
read_lef sky130/sky130_tech.lef
read_lef sky130/sky130_std_cell.lef
read_def repair_hold4.def

create_clock -period 2 clk
set_propagated_clock clk

set_wire_rc -layer met1
estimate_parasitics -placement

report_checks -path_delay min -format full_clock -digits 3 -group_count 3

repair_hold_violations -buffers sky130_fd_sc_hs__dlygate4sd1_1

report_checks -path_delay min -format full_clock -digits 3 -group_count 3
