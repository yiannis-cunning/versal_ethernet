# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\yiann\vivado23\testbench2\mrmac_hdl_384bv2\software\control_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\yiann\vivado23\testbench2\mrmac_hdl_384bv2\software\control_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {control_wrapper}\
-hw {C:\Users\yiann\vivado23\testbench2\mrmac_hdl_384bv2\control_wrapper.xsa}\
-out {C:/Users/yiann/vivado23/testbench2/mrmac_hdl_384bv2/software}

platform write
domain create -name {standalone_psv_cortexa72_0} -display-name {standalone_psv_cortexa72_0} -os {standalone} -proc {versal_cips_0_pspmc_0_psv_cortexa72_0} -runtime {cpp} -arch {64-bit} -support-app {hello_world}
platform generate -domains 
platform active {control_wrapper}
platform generate -quick
platform generate
