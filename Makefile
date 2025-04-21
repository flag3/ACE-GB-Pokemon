.PHONY: all clean help

# All available versions
GEN1_VERSIONS := red red11 blue green green11 yellow yellow13
GEN2_VERSIONS := gold crystal

# Version file paths
GEN1_VERSION_INCLUDE = gen-1/version/_current.asm

# Find all ASM source files (exclude directories and included files)
GEN1_ASM_SRC := $(filter-out gen-1/constants/% gen-1/ram/% gen-1/version/%,$(wildcard gen-1/*.asm))
GEN2_ASM_SRC := $(filter-out gen-2/constants/% gen-2/ram/% gen-2/version/%,$(wildcard gen-2/*.asm))

# Generate base names without directory and extension
GEN1_BASE_NAMES := $(notdir $(basename $(GEN1_ASM_SRC)))
GEN2_BASE_NAMES := $(notdir $(basename $(GEN2_ASM_SRC)))

# Generate versioned GB file paths for each version
RED_FILES := $(foreach base,$(GEN1_BASE_NAMES),gen-1/$(base)_red.gb)
RED11_FILES := $(foreach base,$(GEN1_BASE_NAMES),gen-1/$(base)_red11.gb)
GREEN_FILES := $(foreach base,$(GEN1_BASE_NAMES),gen-1/$(base)_green.gb)
GREEN11_FILES := $(foreach base,$(GEN1_BASE_NAMES),gen-1/$(base)_green11.gb)
BLUE_FILES := $(foreach base,$(GEN1_BASE_NAMES),gen-1/$(base)_blue.gb)
YELLOW_FILES := $(foreach base,$(GEN1_BASE_NAMES),gen-1/$(base)_yellow.gb)
YELLOW13_FILES := $(foreach base,$(GEN1_BASE_NAMES),gen-1/$(base)_yellow13.gb)

# Gen 2 GB files
GEN2_FILES := $(foreach base,$(GEN2_BASE_NAMES),gen-2/$(base).gb)

# All GB files
ALL_FILES := $(RED_FILES) $(RED11_FILES) $(GREEN_FILES) $(GREEN11_FILES) $(BLUE_FILES) $(YELLOW_FILES) $(YELLOW13_FILES) $(GEN2_FILES)

# Main target - build all versions by default
all: check-all-versions $(ALL_FILES)

# Check all version files exist
check-all-versions:
	@for ver in $(GEN1_VERSIONS); do \
		if [ ! -f gen-1/version/$$ver.asm ]; then \
			echo "Error: Version file gen-1/version/$$ver.asm not found"; \
			exit 1; \
		fi \
	done
	@for ver in $(GEN2_VERSIONS); do \
		if [ ! -f gen-2/version/$$ver.asm ]; then \
			echo "Error: Version file gen-2/version/$$ver.asm not found"; \
			exit 1; \
		fi \
	done

# Pattern rule for building GB files
gen-1/%_red.gb: gen-1/%.asm gen-1/version/red.asm
	@echo "Building $< for version red..."
	@cp gen-1/version/red.asm $(GEN1_VERSION_INCLUDE)
	@rgbasm -i gen-1/ -o gen-1/$*.o $<
	@rgblink -o $@ gen-1/$*.o
	@rm -f gen-1/$*.o

gen-1/%_red11.gb: gen-1/%.asm gen-1/version/red11.asm
	@echo "Building $< for version red11..."
	@cp gen-1/version/red11.asm $(GEN1_VERSION_INCLUDE)
	@rgbasm -i gen-1/ -o gen-1/$*.o $<
	@rgblink -o $@ gen-1/$*.o
	@rm -f gen-1/$*.o

gen-1/%_blue.gb: gen-1/%.asm gen-1/version/blue.asm
	@echo "Building $< for version blue..."
	@cp gen-1/version/blue.asm $(GEN1_VERSION_INCLUDE)
	@rgbasm -i gen-1/ -o gen-1/$*.o $<
	@rgblink -o $@ gen-1/$*.o
	@rm -f gen-1/$*.o

gen-1/%_green.gb: gen-1/%.asm gen-1/version/green.asm
	@echo "Building $< for version green..."
	@cp gen-1/version/green.asm $(GEN1_VERSION_INCLUDE)
	@rgbasm -i gen-1/ -o gen-1/$*.o $<
	@rgblink -o $@ gen-1/$*.o
	@rm -f gen-1/$*.o

gen-1/%_green11.gb: gen-1/%.asm gen-1/version/green11.asm
	@echo "Building $< for version green11..."
	@cp gen-1/version/green11.asm $(GEN1_VERSION_INCLUDE)
	@rgbasm -i gen-1/ -o gen-1/$*.o $<
	@rgblink -o $@ gen-1/$*.o
	@rm -f gen-1/$*.o

gen-1/%_yellow.gb: gen-1/%.asm gen-1/version/yellow.asm
	@echo "Building $< for version yellow..."
	@cp gen-1/version/yellow.asm $(GEN1_VERSION_INCLUDE)
	@rgbasm -i gen-1/ -o gen-1/$*.o $<
	@rgblink -o $@ gen-1/$*.o
	@rm -f gen-1/$*.o

gen-1/%_yellow13.gb: gen-1/%.asm gen-1/version/yellow13.asm
	@echo "Building $< for version yellow13..."
	@cp gen-1/version/yellow13.asm $(GEN1_VERSION_INCLUDE)
	@rgbasm -i gen-1/ -o gen-1/$*.o $<
	@rgblink -o $@ gen-1/$*.o
	@rm -f gen-1/$*.o

# Gen 2 pattern rules
gen-2/%.gb: gen-2/%.asm
	@echo "Building $< for version gen-2..."
	@rgbasm -i gen-2/ -o gen-2/$*.o $<
	@rgblink -o $@ gen-2/$*.o
	@rm -f gen-2/$*.o

# Individual version targets
.PHONY: $(GEN1_VERSIONS) $(GEN2_VERSIONS)
$(GEN1_VERSIONS):
	$(MAKE) $(foreach base,$(GEN1_BASE_NAMES),gen-1/$(base)_$@.gb)

$(GEN2_VERSIONS):
	$(MAKE) $(foreach base,$(GEN2_BASE_NAMES),gen-2/@.gb)

# Clean build files
clean:
	rm -f gen-1/*.o gen-1/*_*.gb $(GEN1_VERSION_INCLUDE)
	rm -f gen-2/*.o gen-2/*.gb

# Show available versions
help:
	@echo "Usage:"
	@echo "  make          - Build for all versions"
	@echo "  make red      - Build for Red v1.0"
	@echo "  make red11    - Build for Red v1.1"
	@echo "  make green    - Build for Green v1.0"
	@echo "  make green11  - Build for Green v1.1"
	@echo "  make blue     - Build for Blue"
	@echo "  make yellow   - Build for Yellow v1.0"
	@echo "  make yellow13 - Build for Yellow v1.1, v1.2, v1.3"
	@echo "  make gold     - Build for Gold"
	@echo "  make crystal  - Build for Crystal"
	@echo "  make clean    - Clean all built files"
