# SD Card constraints
# from Ariane project
set_property -dict {PACKAGE_PIN R28 IOSTANDARD LVCMOS33} [get_ports spi_clk_o]
set_property -dict {PACKAGE_PIN T30 IOSTANDARD LVCMOS33} [get_ports spi_ss]
set_property -dict {PACKAGE_PIN R26 IOSTANDARD LVCMOS33} [get_ports spi_miso]
set_property -dict {PACKAGE_PIN R29 IOSTANDARD LVCMOS33} [get_ports spi_mosi]

## To use FTDI FT2232 JTAG
set_property -dict {PACKAGE_PIN Y29 IOSTANDARD LVCMOS33} [get_ports jtag_trst_n]
set_property -dict {PACKAGE_PIN AD27 IOSTANDARD LVCMOS33} [get_ports jtag_tck]
set_property -dict {PACKAGE_PIN W27 IOSTANDARD LVCMOS33} [get_ports jtag_tdi]
set_property -dict {PACKAGE_PIN W28 IOSTANDARD LVCMOS33} [get_ports jtag_tdo]
set_property -dict {PACKAGE_PIN W29 IOSTANDARD LVCMOS33} [get_ports jtag_tms]

# 2FF synchronizer
set_max_delay -datapath_only -from [get_cells SoC_i/interrupt_sync_0/inst/irq_q_reg] -to [get_cells SoC_i/interrupt_sync_0/inst/irq_q1_reg] 4.000
