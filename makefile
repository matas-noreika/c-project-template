# Compiler
CC= gcc

# Debug flag to enable/disable debug prints
DEBUG=

# Compiler flags
ifeq($(DEBUG),)
CCFLAGS= -Wall -O3
else
# define DEBUG macro and enable gdb object data for debugger
CCFLAGS= -Wall -O3 -D DEBUG -g
endif

# Main build target of project
TARGET= # (add your target here)

# Local directories

SRC=./src
# We grab all the source files except for the target
SRCS=$(filter-out $(SRC)/$(TARGET).c,$(wildcard $(SRC)/*.c))

OBJ=./obj
OBJS=$(SRCS:$(SRC)/%.c=$(OBJ)/%.o)


# Generic command to provide details of available commands
all:
  @echo "\[32mclean\e[m - remove all generated files"
  @echo "\[32mrun\e[m - runs the target application"
  @echo "\[32mbuild\e[m - generate build target and intermediate files"

# Generic command to clean all build intermediate files and build target
clean:

# Build command to compile the final executable of TARGET
build: $(TARGET)

# run command to execute the target executable
run:
  $(BUILD)/$(TARGET)

# test command to execute test scripts
test:
  # execute and evalulate the return of scripts

# static pattern rule to generate all objs from source c files
$(OBJS): (OBJ)/%.o: $(SRC)/%.c
  $(CC) $(CCFLAGS) -c $< -o $@

# static pattern rule to generate target
$(TARGET): %:$(SRC)/%.c
  $(CC) $(CCFLAGS) $(OBJS) $< -o $@
