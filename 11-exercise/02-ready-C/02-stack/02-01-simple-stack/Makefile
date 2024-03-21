PROJECT_PATH := $(shell dirname $(shell pwd))

TARGET_NAME := target

#########################################################################################
CROSS_TOOLCHAINS_PATH := /home/rbt/wch32v/wch-package/MRS_Toolchain_Linux_x64_V1.90

CROSS_COMPILER_PATH := $(CROSS_TOOLCHAINS_PATH)/RISC-V_Embedded_GCC/bin
CROSS_COMPILER := $(CROSS_COMPILER_PATH)/riscv-none-embed-gcc
CROSS_ASSEMBLER := $(CROSS_COMPILER_PATH)/riscv-none-embed-as
CROSS_LINKER := $(CROSS_COMPILER_PATH)/riscv-none-embed-ld
CROSS_OBJDUMP := $(CROSS_COMPILER_PATH)/riscv-none-embed-objdump
CROSS_READELF := $(CROSS_COMPILER_PATH)/riscv-none-embed-readelf
CROSS_OBJCOPY := $(CROSS_COMPILER_PATH)/riscv-none-embed-objcopy
CROSS_GDB	:= $(CROSS_COMPILER_PATH)/riscv-none-embed-gdb

#########################################################################################
OPENOCD := $(CROSS_TOOLCHAINS_PATH)/OpenOCD/bin/openocd 
OPENOCD_ARGS := -f $(CROSS_TOOLCHAINS_PATH)/OpenOCD/bin/wch-riscv.cfg
# tips:  = and := difference
OPENOCD_FLASH_COMMANDS = -c "program $(HEX_FILE) verify reset exit"
#########################################################################################
GDB_ARGS := -x .gdbinit
# GDB_INIT_COMMANDS := target extended-remote localhost:3333
# --eval-command="$(GDB_INIT_COMMANDS)"
#########################################################################################
# c file
C_SOURCE :=	$(wildcard ./*.c)
# asm file
ASM_SOURCE := $(wildcard ./*.S)
# header file
INCLUDE_PATH := $(CROSS_COMPILER_PATH)/riscv-none-embed/include/ $(CROSS_COMPILER_PATH)/lib/gcc/riscv-none-embed/8.2.0/include/

#########################################################################################
# ARCH := -march=rv32imafc -mabi=ilp32f

# ARCH := -march=rv32imac -mabi=ilp32

# ARCH := -march=rv32ec -mabi=ilp32e
# Machine-Dependent Options
CROSS_COMPILER_CFLAG := -march=rv32ec -mabi=ilp32e
# C standard
CROSS_COMPILER_CFLAG +=	-std=gnu99 -fno-builtin -fno-builtin-* -fsigned-char
# warning info
CROSS_COMPILER_CFLAG +=	-Wall -Wextra
# debug option
CROSS_COMPILER_CFLAG +=	-g
# optimize option
CROSS_COMPILER_CFLAG += -O0 -ffunction-sections -fdata-sections
# preprocessor option
CROSS_COMPILER_CFLAG +=	-MMD
# Assembler  option
# CROSS_COMPILER_CFLAG +=

# linker options
CROSS_COMPILER_CFLAG += -Wl,–gc-sections
# -T $(script.ld),-Map,target.map
CROSS_COMPILER_CFLAG += -nostartfiles -nodefaultlibs
# -nolibc  don't have this option
# -nostdlib 
# directory search
CROSS_COMPILER_CFLAG += $(addprefix -I,$(INCLUDE_PATH))
CROSS_COMPILER_CFLAG += -L$(CROSS_COMPILER_PATH)/riscv-none-embed/lib/rv32ec/ilp32e
# code generation
CROSS_COMPILER_CFLAG += -fno-common 


#########################################################################################
# Machine-Dependent Options
CROSS_ASSEMBLER_CFLAG := -march=rv32ec -mabi=ilp32e
# warning info
# CROSS_ASSEMBLER_CFLAG +=	--no-warning
# debug option
CROSS_ASSEMBLER_CFLAG	+=	-g --gdwarf-2
# preprocessor option
# CROSS_ASSEMBLER_CFLAG +=

# directory search for .include directives
# CROSS_ASSEMBLER_CFLAG += $(addprefix -I, ???? )


#########################################################################################
# linker script
LINKER_SCRIPT := script.ld
# linker option
CROSS_LINKER_LDFLAG := -script=$(LINKER_SCRIPT) -Map=$(TARGET_NAME).map
# CROSS_LINKER_LDFLAG += -L$(CROSS_COMPILER_PATH)/riscv-none-embed/lib/rv32ec/ilp32e

C_SOURCE_OBJ_FILE := $(subst .c,.c.o,$(C_SOURCE))
ASM_OBJ_FILE += $(subst .S,.S.o,$(ASM_SOURCE))
ALL_OBJ_FILE := $(C_SOURCE_OBJ_FILE) $(ASM_OBJ_FILE)

EXECUABLE_FILE := $(TARGET_NAME).elf

HEX_FILE := $(TARGET_NAME).hex

BIN_FILE := $(TARGET_NAME).bin
.PHONY: all flash debug  clean hello cflag
#
all: $(HEX_FILE) $(BIN_FILE)
$(BIN_FILE) : $(EXECUABLE_FILE)
	${CROSS_OBJCOPY} $^ -O binary $@

$(HEX_FILE) : $(EXECUABLE_FILE)
	$(CROSS_OBJCOPY) $^ -O ihex $@

$(EXECUABLE_FILE) : $(ALL_OBJ_FILE)
	$(CROSS_LINKER) $(CROSS_LINKER_LDFLAG) $^ -o $@

$(C_SOURCE_OBJ_FILE) : $(C_SOURCE)
	$(CROSS_COMPILER) $(CROSS_COMPILER_CFLAG) -c $^ -o $@

$(ASM_OBJ_FILE) : $(ASM_SOURCE)
	$(CROSS_ASSEMBLER) $(CROSS_ASSEMBLER_CFLAG) $^ -o $@

flash: $(HEX_FILE)
	$(OPENOCD) $(OPENOCD_ARGS) $(OPENOCD_FLASH_COMMANDS)

debug: $(EXECUABLE_FILE)
	$(CROSS_GDB) $^ $(GDB_ARGS)

openocd:
	$(OPENOCD) $(OPENOCD_ARGS)
clean:
	rm -f $(EXECUABLE_FILE) $(BIN_FILE) $(HEX_FILE)
	rm -f $(ALL_OBJ_FILE)
	rm -f $(TARGET_NAME).map
hello:$(EXECUABLE_FILE)
	echo $(OPENOCD_FLASH_COMMANDS)
	echo $(EXECUABLE_FILE)
cflag:
	echo $(CROSS_COMPILER_CFLAG)