# XSA files contain information required for generating device tree and bootloaders
# They link hardware projects in Vivado and software projects in Vitis

set script_file [info script]
set script_dir [file dirname [file normalize "$script_file"]]

open_project project/RVSoC.xpr

puts "Generating block design output products"

generate_target all [get_files  $script_dir/project/RVSoC.srcs/sources_1/bd/SoC/SoC.bd]

puts "Creating .xsa hardware handoff file for Vitis"
write_hw_platform -fixed -force -file "$script_dir/project/SoC_wrapper.xsa"