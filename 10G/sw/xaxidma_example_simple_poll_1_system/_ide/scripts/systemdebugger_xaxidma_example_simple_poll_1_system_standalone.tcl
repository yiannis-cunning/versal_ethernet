# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\yiann\vivado23\testbench1\processor_project\sw\xaxidma_example_simple_poll_1_system\_ide\scripts\systemdebugger_xaxidma_example_simple_poll_1_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\yiann\vivado23\testbench1\processor_project\sw\xaxidma_example_simple_poll_1_system\_ide\scripts\systemdebugger_xaxidma_example_simple_poll_1_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/yiann/vivado23/testbench1/processor_project/sw/proc_1_wrapper/export/proc_1_wrapper/hw/proc_1_wrapper.xsa -mem-ranges [list {0x80000000 0x9fffffff} {0xa4000000 0xafffffff} {0xb0000000 0xbfffffff} {0x20000000000 0x3FFFFFFFFFF}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~ "*microblaze*#0"}
rst -processor
dow C:/Users/yiann/vivado23/testbench1/processor_project/sw/xaxidma_example_simple_poll_1/Debug/xaxidma_example_simple_poll_1.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*microblaze*#0"}
con
