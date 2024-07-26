all: fpga

project:
	./create_project.sh

project/RVSoC.runs/impl_1/SoC_wrapper.bit: project
	./create_bitstream.sh

project/ariane.bit: project/RVSoC.runs/impl_1/SoC_wrapper.bit
	cp -v $< $@

project/ariane.ltx: project/RVSoC.runs/impl_1/SoC_wrapper.ltx
	cp -v $< $@ 

fpga: project/ariane.bit project/ariane.ltx

program-device:
	./program_device.sh

clean:
	$(RM) -rf project
	make -C ../../hardware/include/cva6 clean

.PHONY: fpga project/RVSoC.runs/impl_1/SoC_wrapper.bit project/RVSoC.runs/impl_1/SoC_wrapper.ltx clean program-device