# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\yiann\vivado23\testbench1\processor_project\sw\proc_1_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\yiann\vivado23\testbench1\processor_project\sw\proc_1_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {proc_1_wrapper}\
-hw {C:\Users\yiann\vivado23\testbench1\processor_project\proc_1_wrapper.xsa}\
-out {C:/Users/yiann/vivado23/testbench1/processor_project/sw}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {proc_1_wrapper}
platform generate -quick
bsp reload
platform generate
platform active {proc_1_wrapper}
platform config -updatehw {C:/Users/yiann/vivado23/testbench1/processor_project/proc_1_wrapper.xsa}
platform config -updatehw {C:/Users/yiann/vivado23/testbench1/processor_project/proc_1_wrapper.xsa}
bsp reload
catch {bsp regenerate}
platform generate -domains standalone_microblaze_0 
platform active {proc_1_wrapper}
platform config -updatehw {C:/Users/yiann/vivado23/testbench1/processor_project/proc_1_wrapper.xsa}
bsp reload
catch {bsp regenerate}
platform generate -domains standalone_microblaze_0 
platform active {proc_1_wrapper}
platform generate -domains standalone_microblaze_0 
