#!/bin/sh

echo "Programming board!"
/opt/Xilinx/Vivado/2023.2/bin/vivado -mode batch -source program_device.tcl || exit 1
