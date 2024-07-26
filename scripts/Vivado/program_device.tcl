puts "Opening hardware manager"
open_hw_manager

puts "Connecting to hardware server"
connect_hw_server -allow_non_jtag


puts "Opening device"
if { [info exists ::env(FPGA_SERIAL_NUMBER)]} {
    set DEVICE_SERIAL [$::env(FPGA_SERIAL_NUMBER)]
    puts "Opening indicated device $DEVICE_SERIAL"

    open_hw_target "localhost:3121/xilinx_tcf/Digilent/$DEVICE_SERIAL"
} else {
    set DEVICE_SERIAL [lindex [get_hw_targets] 0]
    
    puts "Opening first device $DEVICE_SERIAL"

    open_hw_target $DEVICE_SERIAL
}

set DEVICE_FPGA xc7k325t_0

puts "Setting probes and bitstream files"

set script_file [info script]
set origin_dir [file dirname [file normalize "$script_file"]]

set_property PROBES.FILE "$origin_dir/project/RVSoC.runs/impl_1/SoC_wrapper.ltx" [get_hw_devices $DEVICE_FPGA]
set_property FULL_PROBES.FILE "$origin_dir/project/RVSoC.runs/impl_1/SoC_wrapper.ltx" [get_hw_devices $DEVICE_FPGA]
set_property PROGRAM.FILE "$origin_dir/project/RVSoC.runs/impl_1/SoC_wrapper.bit" [get_hw_devices $DEVICE_FPGA]

puts "Programming device!"
program_hw_devices [get_hw_devices $DEVICE_FPGA]

