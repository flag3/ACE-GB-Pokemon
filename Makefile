.PHONY: all clean

# Find all ASM source files (exclude directories and included files)
ASM_SRC := $(filter-out gen-1/constants/% gen-1/ram/% gen-1/version/%,$(wildcard gen-1/*.asm))

# Generate output object file paths (same directory as source)
OBJ_FILES := $(ASM_SRC:.asm=.o)

# Generate GB file paths (same directory as source)
GB_FILES := $(ASM_SRC:.asm=.gb)

# Main target
all: $(GB_FILES)

# Rule for creating object files
%.o: %.asm
	rgbasm -i gen-1/ -o $@ $<

# Generic rule for creating ROM files
%.gb: %.o
	rgblink -o $@ $^

# Clean build files
clean:
	rm -f $(OBJ_FILES) $(GB_FILES)
