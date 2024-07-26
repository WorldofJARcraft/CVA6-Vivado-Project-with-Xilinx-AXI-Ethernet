all: fpga images

fpga:
	$(MAKE) -C scripts/Vivado fpga

flash-sdcard:
	$(MAKE) -C software/include/cva6-sdk flash-sdcard

images: 
	$(MAKE) -C software/include/cva6-sdk images

program-device:
	make -C scripts/Vivado program-device

clean:
	$(MAKE) -C scripts/Vivado clean
	$(MAKE) -C software/include/cva6-sdk clean

.PHONY: fpga images clean flash-sdcard program-device