ASM     = nasm
LD      = ld
ASMFLAGS= -f elf32
LDFLAGS = -m elf_i386

TARGET  = hello-world
SRC     = hello-world.asm
OBJ     = $(SRC:.asm=.o)
LST     = $(SRC:.asm=.lst)
PREPROC = $(SRC:.asm=.i)

all: $(TARGET)

$(OBJ): $(SRC) makefile
	$(ASM) $(ASMFLAGS) $< -o $@ -l $(LST)

$(TARGET): $(OBJ)
	$(LD) $(LDFLAGS) $< -o $@

preproc: $(SRC)
	$(NASM) -E $< > $(PREPROC)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(OBJ) $(TARGET)
