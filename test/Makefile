RISCV := riscv64-unknown-elf
RCCFLAGS := -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -static -T ./link.ld

all: hello.bin

hello.bin: hello.elf
	$(RISCV)-objcopy -S ./c/$< -O binary $@
	$(RISCV)-readelf -h ./c/$<

hello.elf: ./c/hello.c ../user/user.c ../user/user.h ../user/start.S ../user/call_to_emu.S
	$(RISCV)-gcc ${RCCFLAGS} ./c/hello.c ../user/user.c ../user/cd../user/call_to_emu.S -o ./c/$@ -lgcc

.PHONY = clean
clean:
	-@$(RM) -rvf hello.bin ./c/hello.elf