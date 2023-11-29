.PHONY: clean

dump_name=main.dump
executable_name=result.elf
source_file=main.c

default: $(dump_name) $(executable_name)

$(executable_name): $(source_file)
	@echo "Compiling $< to $@"
	@riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 $< -o $@

$(dump_name): $(executable_name)
	@echo "Dumping $@ from $<"
	@riscv64-unknown-elf-objdump -D $< > $@

clean:
	@echo "Cleaning up"
	@rm -f $(dump_name)
	@rm -f $(executable_name)