#!/bin/bash

TOPDIR=$(realpath $(dirname $0)/../..)
echo "Assuming topdir $TOPDIR"

echo "Removing old project"
rm -r project 2>/dev/null

echo "Generating cva6 source list"
export HAS_ETHERNET=1 
export HAS_ETHERNET_XLNX=1
make -C ../../hardware/include/cva6 fpga-source-list src/bootrom/bootrom_64.sv || exit 1
sed -i "s|src/bootrom/bootrom|$TOPDIR/hardware/include/cva6/corev_apu/fpga/src/bootrom/bootrom|g" $TOPDIR/hardware/include/cva6/corev_apu/fpga/scripts/add_sources.tcl

if [ -d vivado-library ];
then
    echo "Digilent pmod library exists";
else
    echo "Retrieving digilent pmods"
    git clone -b master --depth 1 https://github.com/Digilent/vivado-library.git || exit 1
fi

if [ -d vivado-boards ];
then
    echo "Digilent boards exist!";
else
    echo "Retrieving digilent boards!";
    git clone -b master --depth 1 https://github.com/Digilent/vivado-boards.git || exit 1
fi

echo "Creating Vivado project"
/opt/Xilinx/Vivado/2023.2/bin/vivado -mode batch -source create_project.tcl || exit 1
